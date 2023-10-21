//
//  UploadImage.swift
//  BeginingIphone
//
//  Created by Student Account on 10/9/23.
//

import SwiftUI

struct UploadImageView: View {
    @State private var images: [(image: Image, caption: String)] = []
    @State private var inputImage: UIImage?
    @State private var caption: String = ""
    @State private var showingImagePicker = false

    var body: some View {
        VStack {
            Button("Upload Image") {
                showingImagePicker = true
            }

            TextField("Caption for the image", text: $caption)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)

            Button("Add Image") {
                if let inputImage = inputImage {
                    images.insert((image: Image(uiImage: inputImage), caption: caption), at: 0)
                    self.caption = ""
                    self.inputImage = nil
                }
            }
            .padding()

            ScrollView {
                ForEach(images, id: \.caption) { image in
                    VStack {
                        image.image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                        Text(image.caption)
                            .padding()
                    }
                }
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: $inputImage)
        }
    }

    func loadImage() {
      
    }
}


struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct UploadImageView_Previews: PreviewProvider {
    static var previews: some View {
        UploadImageView()
    }
}

