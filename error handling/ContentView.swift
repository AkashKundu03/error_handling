import SwiftUI

struct LoominoteErrorView: View {
    let title: String
    let message: String
    let primaryAction: () -> Void
    var owlAssetName: String = "owl_sad"
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Top bar
                HStack {
                    Button(action: primaryAction) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.primary)
                            .frame(width: 32, height: 32)
                            .background(Color(.systemBackground).opacity(0.95))
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)
                
                // Content
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        // Hero image
                        Image(owlAssetName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 130, height: 130)
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.05), radius: 16, y: 8)
                            .padding(.top, 12)
                        
                        // Small pill with SF Symbol
                        Label {
                            Text("Recording couldn’t be processed")
                                .font(.caption.weight(.semibold))
                        } icon: {
                            Image(systemName: "waveform.badge.exclamationmark")
                                .font(.caption.weight(.semibold))
                        }
                        .padding(.horizontal, 14)
                        .padding(.vertical, 6)
                        .background(
                            Capsule(style: .continuous)
                                .fill(Color(.systemBackground).opacity(0.65))
                        )
                        .foregroundColor(.orange)
                        
                        // Title
                        Text(title)
                            .font(.system(.title2, weight: .semibold))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 24)
                        
                        // Main message
                        Text(message)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 32)
                        
                        // Add space before helper bullets
                        Spacer().frame(height: 24)
                        
                        // Helper lines (bulleted)
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(alignment: .top, spacing: 6) {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 5))
                                    .foregroundColor(.secondary)
                                    .padding(.top, 5)
                                Text("This looks like a temporary issue on our side.")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                            }
                            
                            HStack(alignment: .top, spacing: 6) {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 5))
                                    .foregroundColor(.secondary)
                                    .padding(.top, 5)
                                Text("If this keeps happening, please check your internet or record again.")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .frame(maxWidth: 340)
                        .padding(.horizontal, 16)
                    }
                    .padding(.bottom, 80)
                    .frame(maxWidth: .infinity)
                }
                
                // Bottom CTA
                VStack(spacing: 10) {
                    Divider()
                        .padding(.horizontal, -16)
                    
                    Button(action: primaryAction) {
                        Text("Back to Notes")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 15)
                            .background(
                                RoundedRectangle(cornerRadius: 18, style: .continuous)
                                    .fill(Color.accentColor)
                            )
                            .foregroundColor(.white)
                    }
                    
                    Text("Your other conversations are safe.")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 4)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
                .background(Color(.systemGray6).ignoresSafeArea(edges: .bottom))
            }
        }
    }
}

#Preview {
    LoominoteErrorView(
        title: "We couldn’t analyze this note",
        message: "Please go back to your notes and try again.",
        primaryAction: {}
    )
}
