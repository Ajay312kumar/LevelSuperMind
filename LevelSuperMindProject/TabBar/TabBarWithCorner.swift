import UIKit

@IBDesignable class TabBarWithCorners: UITabBar {
    
    @IBInspectable var color: UIColor?
    @IBInspectable var radii: CGFloat = 0
    
    private var shapeLayer: CALayer?
    
    override func draw(_ rect: CGRect) {
        addShape()
    }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.fillColor = color?.cgColor ?? AppColor.app_colour.cgColor
        
        // Add white stroke ONLY at the top
        let borderLayer = CALayer()
        borderLayer.backgroundColor = UIColor.white.cgColor
        borderLayer.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 1) // White top border
        
        if let oldShapeLayer = self.shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }
        
        // Remove old top border if it exists
        layer.sublayers?.removeAll(where: { $0.name == "TopBorderLayer" })
        
        borderLayer.name = "TopBorderLayer"
        layer.addSublayer(borderLayer)
        
        self.shapeLayer = shapeLayer
    }
    
    private func createPath() -> CGPath {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: radii, height: radii))
        return path.cgPath
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let window = UIApplication.shared.windows.first else { return }
        
        let bottomSafeArea = window.safeAreaInsets.bottom
        self.isTranslucent = true
        
        var tabFrame = self.frame
        tabFrame.size.height = 45 + bottomSafeArea
        tabFrame.origin.y = self.frame.origin.y + self.frame.height - tabFrame.size.height
        self.layer.cornerRadius = 2
        self.frame = tabFrame
        self.items?.forEach({ $0.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -5.0) })
    }
}
