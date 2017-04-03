import UIKit
import PlaygroundSupport

let canvasWidth: CGFloat = 350        // the width of the main canvas
let canvasHeight: CGFloat = 300       // the height of the main canvas
let baseLine: CGFloat = 250           // the location of the line

let pinColour = UIColor(red: 0xF6/0xFF, green: 0x41/0xFF, blue: 0x45/0xFF, alpha: 1)
let dotColour = UIColor(red: 0xE2/0xFF, green: 0xE2/0xFF, blue: 0xE2/0xFF, alpha: 1)
let dotRadius1: CGFloat = 9.0         // small dot
let dotRadius2: CGFloat = 15.0        // large dot

// ---------------------------------------------------------------------------------------------------------
// Pin management
// ---------------------------------------------------------------------------------------------------------

// the SVG paths were sourced from (https://gist.githubusercontent.com/nickbutcher/c25b44448dcec3b61d971ecab4f1e9c4/raw/3f7872600fd48d9a74e8632cda429b798af23ace/endless-pin-jump.iconanim)
// however, the hard-coded coordinates assume that the animation is running on a much larger canvas. 
// I want them on a small canvas so need to adjust accordingly. Strictly speaking, this is not needed to
// perform the animation; it is purely required in order to compensate for the raw data that we have
// to work with (in theory, I could manully adjust each and every coordinate in the input paths but that
// is error prone), so we simple apply the transform once per path.
let pinTransform = CGAffineTransform(translationX: -240, y: -159)

func makePin1Path() -> UIBezierPath {
	let shape = UIBezierPath()
	shape.move(to: CGPoint(x: 412.7, y: 238.9))
	shape.addCurve(to: CGPoint(x: 356.8, y: 294.6), controlPoint1: CGPoint(x: 381, y: 238.9), controlPoint2: CGPoint(x: 356.8, y: 261.8))
	shape.addCurve(to: CGPoint(x: 409.2, y: 408.8), controlPoint1: CGPoint(x: 356.8, y: 329.7), controlPoint2: CGPoint(x: 407.7, y: 408.7))
	shape.addCurve(to: CGPoint(x: 469.4, y: 294.6), controlPoint1: CGPoint(x: 410.7, y: 408.9), controlPoint2: CGPoint(x: 469.4, y: 328.1))
	shape.addCurve(to: CGPoint(x: 412.7, y: 238.9), controlPoint1: CGPoint(x: 469.4, y: 261.8), controlPoint2: CGPoint(x: 444.5, y: 238.9))
	shape.close()
	shape.move(to: CGPoint(x: 412.7, y: 324.3))
	shape.addCurve(to: CGPoint(x: 384.7, y: 295.3), controlPoint1: CGPoint(x: 397.2, y: 324.3), controlPoint2: CGPoint(x: 384.7, y: 311.3))
	shape.addCurve(to: CGPoint(x: 412.7, y: 266.3), controlPoint1: CGPoint(x: 384.7, y: 279.3), controlPoint2: CGPoint(x: 397.2, y: 266.3))
	shape.addCurve(to: CGPoint(x: 440.8, y: 295.3), controlPoint1: CGPoint(x: 428.2, y: 266.3), controlPoint2: CGPoint(x: 440.8, y: 279.3))
	shape.addCurve(to: CGPoint(x: 412.7, y: 324.3), controlPoint1: CGPoint(x: 440.8, y: 311.3), controlPoint2: CGPoint(x: 428.2, y: 324.3))
	shape.close()
	shape.apply(pinTransform)
	return shape
}

func makePin2Path() -> UIBezierPath {
	let shape = UIBezierPath()
	shape.move(to: CGPoint(x: 406.7, y: 247.6))
	shape.addCurve(to: CGPoint(x: 350.4, y: 303.4), controlPoint1: CGPoint(x: 374.9, y: 247.6), controlPoint2: CGPoint(x: 350.4, y: 270.5))
	shape.addCurve(to: CGPoint(x: 406.1, y: 408.7), controlPoint1: CGPoint(x: 350.4, y: 335.9), controlPoint2: CGPoint(x: 406.9, y: 400.5))
	shape.addCurve(to: CGPoint(x: 463.4, y: 303.4), controlPoint1: CGPoint(x: 416, y: 408.7), controlPoint2: CGPoint(x: 463.4, y: 339.3))
	shape.addCurve(to: CGPoint(x: 406.7, y: 247.6), controlPoint1: CGPoint(x: 463.4, y: 270.5), controlPoint2: CGPoint(x: 438.4, y: 247.6))
	shape.close()
	shape.move(to: CGPoint(x: 406.7, y: 329.7))
	shape.addCurve(to: CGPoint(x: 378.6, y: 302.4), controlPoint1: CGPoint(x: 391.2, y: 329.7), controlPoint2: CGPoint(x: 378.6, y: 317.5))
	shape.addCurve(to: CGPoint(x: 406.7, y: 275), controlPoint1: CGPoint(x: 378.6, y: 287.2), controlPoint2: CGPoint(x: 391.2, y: 275))
	shape.addCurve(to: CGPoint(x: 434.8, y: 302.4), controlPoint1: CGPoint(x: 422.2, y: 275), controlPoint2: CGPoint(x: 434.8, y: 287.2))
	shape.addCurve(to: CGPoint(x: 406.7, y: 329.7), controlPoint1: CGPoint(x: 434.8, y: 317.5), controlPoint2: CGPoint(x: 422.2, y: 329.7))
	shape.close()
	shape.apply(pinTransform)
	return shape
}
func makePin3Path() -> UIBezierPath {
	let shape = UIBezierPath()
	shape.move(to: CGPoint(x: 414.2, y: 238.1))
	shape.addCurve(to: CGPoint(x: 357.9, y: 293.8), controlPoint1: CGPoint(x: 382.4, y: 238.1), controlPoint2: CGPoint(x: 357.9, y: 261))
	shape.addCurve(to: CGPoint(x: 403.9, y: 408.3), controlPoint1: CGPoint(x: 357.9, y: 326.3), controlPoint2: CGPoint(x: 402.5, y: 408.3))
	shape.addCurve(to: CGPoint(x: 471.4, y: 293.8), controlPoint1: CGPoint(x: 405.3, y: 408.3), controlPoint2: CGPoint(x: 471.4, y: 330.5))
	shape.addCurve(to: CGPoint(x: 414.2, y: 238.1), controlPoint1: CGPoint(x: 471.4, y: 261), controlPoint2: CGPoint(x: 445.9, y: 238.1))
	shape.close()
	shape.move(to: CGPoint(x: 414.2, y: 323.8))
	shape.addCurve(to: CGPoint(x: 386.1, y: 294.6), controlPoint1: CGPoint(x: 398.7, y: 323.8), controlPoint2: CGPoint(x: 386.1, y: 310.7))
	shape.addCurve(to: CGPoint(x: 414.2, y: 265.4), controlPoint1: CGPoint(x: 386.1, y: 278.5), controlPoint2: CGPoint(x: 398.7, y: 265.4))
	shape.addCurve(to: CGPoint(x: 442.3, y: 294.6), controlPoint1: CGPoint(x: 429.7, y: 265.4), controlPoint2: CGPoint(x: 442.3, y: 278.5))
	shape.addCurve(to: CGPoint(x: 414.2, y: 323.8), controlPoint1: CGPoint(x: 442.3, y: 310.7), controlPoint2: CGPoint(x: 429.7, y: 323.8))
	shape.close()
	shape.apply(pinTransform)
	return shape
}
func makePin4Path() -> UIBezierPath {
	let shape = UIBezierPath()
	shape.move(to: CGPoint(x: 411.5, y: 270.7))
	shape.addCurve(to: CGPoint(x: 354.7, y: 322.3), controlPoint1: CGPoint(x: 375.4, y: 270.7), controlPoint2: CGPoint(x: 354.7, y: 289.4))
	shape.addCurve(to: CGPoint(x: 402.3, y: 409.6), controlPoint1: CGPoint(x: 354.7, y: 341), controlPoint2: CGPoint(x: 392.2, y: 409.6))
	shape.addCurve(to: CGPoint(x: 468.3, y: 322.3), controlPoint1: CGPoint(x: 415.5, y: 409.6), controlPoint2: CGPoint(x: 468.3, y: 350.4))
	shape.addCurve(to: CGPoint(x: 411.5, y: 270.7), controlPoint1: CGPoint(x: 468.3, y: 289.4), controlPoint2: CGPoint(x: 439.4, y: 270.7))
	shape.close()
	shape.move(to: CGPoint(x: 411.5, y: 345.4))
	shape.addCurve(to: CGPoint(x: 382.2, y: 320), controlPoint1: CGPoint(x: 396, y: 345.4), controlPoint2: CGPoint(x: 382.2, y: 333.7))
	shape.addCurve(to: CGPoint(x: 411.5, y: 295.9), controlPoint1: CGPoint(x: 382.2, y: 306.4), controlPoint2: CGPoint(x: 393.6, y: 294))
	shape.addCurve(to: CGPoint(x: 440.3, y: 321.7), controlPoint1: CGPoint(x: 428.7, y: 297.7), controlPoint2: CGPoint(x: 440.3, y: 308))
	shape.addCurve(to: CGPoint(x: 411.5, y: 345.4), controlPoint1: CGPoint(x: 440.3, y: 335.3), controlPoint2: CGPoint(x: 429.6, y: 345.4))
	shape.close()
	shape.apply(pinTransform)
	return shape
}
func makePin5Path() -> UIBezierPath {
	let shape = UIBezierPath()
	shape.move(to: CGPoint(x: 452.8, y: 211))
	shape.addCurve(to: CGPoint(x: 398, y: 253.2), controlPoint1: CGPoint(x: 418, y: 208.7), controlPoint2: CGPoint(x: 398, y: 240.4))
	shape.addCurve(to: CGPoint(x: 384.1, y: 360.4), controlPoint1: CGPoint(x: 398, y: 298.3), controlPoint2: CGPoint(x: 401.3, y: 343.7))
	shape.addCurve(to: CGPoint(x: 508.3, y: 269.2), controlPoint1: CGPoint(x: 465, y: 355.9), controlPoint2: CGPoint(x: 508.3, y: 297.4))
	shape.addCurve(to: CGPoint(x: 452.8, y: 211), controlPoint1: CGPoint(x: 508.3, y: 230.3), controlPoint2: CGPoint(x: 477.4, y: 212.7))
	shape.close()
	shape.move(to: CGPoint(x: 452.5, y: 297))
	shape.addCurve(to: CGPoint(x: 423.8, y: 262), controlPoint1: CGPoint(x: 431.6, y: 297), controlPoint2: CGPoint(x: 423.8, y: 275.7))
	shape.addCurve(to: CGPoint(x: 452.8, y: 236.3), controlPoint1: CGPoint(x: 423.8, y: 248.4), controlPoint2: CGPoint(x: 439.3, y: 236.3))
	shape.addCurve(to: CGPoint(x: 481.6, y: 262), controlPoint1: CGPoint(x: 466.2, y: 236.3), controlPoint2: CGPoint(x: 481.6, y: 248.4))
	shape.addCurve(to: CGPoint(x: 452.5, y: 297), controlPoint1: CGPoint(x: 481.6, y: 275.7), controlPoint2: CGPoint(x: 473.4, y: 297))
	shape.close()
	shape.apply(pinTransform)
	return shape
}

/**
 * Creates initial pin layer
 */
func makePin() -> CAShapeLayer {
	let layer = CAShapeLayer()
	layer.fillColor = pinColour.cgColor
	layer.path = makePin1Path().cgPath
	return layer
}

// ---------------------------------------------------------------------------------------------------------
// Dot management
// ---------------------------------------------------------------------------------------------------------

/**
 * Creates a dot of a certain colour and radius located at position
 */
func makeDot(position: CGPoint, colour: UIColor, radius: CGFloat) -> CAShapeLayer {
	let dot = CAShapeLayer()
	dot.position = position
	dot.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: radius*2, height: radius*2), cornerRadius: radius).cgPath
	dot.fillColor = colour.cgColor
	return dot
}

/**
 * Creates a layer (using the passed frame) that contains four dots
 * spaced at 25%, 50%, 75% and 100%. eg. |  o  O  o  o|
 */
func makeDots(frame: CGRect) -> CALayer {
	let dots = CALayer()
	dots.frame = frame
	dots.addSublayer(makeDot(position: CGPoint(x: frame.width*0.25, y: frame.height/2-dotRadius1), colour: dotColour, radius: dotRadius1))
	dots.addSublayer(makeDot(position: CGPoint(x: frame.width*0.5, y: frame.height/2-dotRadius2), colour: pinColour, radius: dotRadius2))
	dots.addSublayer(makeDot(position: CGPoint(x: frame.width*0.75, y: frame.height/2-dotRadius1), colour: dotColour, radius: dotRadius1))
	dots.addSublayer(makeDot(position: CGPoint(x: frame.width, y: frame.height/2-dotRadius1), colour: dotColour, radius: dotRadius1))
	return dots
}

/**
 * Creates the animation for the dots
 */
func makeDotAnimation(dots: CALayer, to: CGPoint, duration: TimeInterval) -> CAAnimation {
	let animation = CABasicAnimation(keyPath: "position")
	animation.fromValue = dots.frame
	animation.toValue = to
	animation.duration = duration
	animation.repeatCount = Float.infinity
	return animation
}

// ---------------------------------------------------------------------------------------------------------
// Fade management
// ---------------------------------------------------------------------------------------------------------

/**
 * Creates the fade for the left-hand side
 */
func makeLeftFade() -> CAGradientLayer {
	let fade = CAGradientLayer()
	fade.frame = CGRect(x: 0, y: 0, width: 50, height: canvasHeight)
	fade.colors = [
		UIColor.white.withAlphaComponent(0).cgColor,
		UIColor.white.withAlphaComponent(1).cgColor
	]
	fade.startPoint = CGPoint(x: 1, y: 1)
	fade.endPoint = CGPoint(x: 0, y: 1)
	return fade
}

/**
 * Creates the fade for the right-hand side
 */
func makeRightFade() -> CAGradientLayer {
	let fade = CAGradientLayer()
	fade.frame = CGRect(x: canvasWidth-50, y: 0, width: 50, height: canvasHeight)
	fade.colors = [
		UIColor.white.withAlphaComponent(0).cgColor,
		UIColor.white.withAlphaComponent(1).cgColor
	]
	fade.startPoint = CGPoint(x: 0, y: 1)
	fade.endPoint = CGPoint(x: 1, y: 1)
	return fade
}

// ---------------------------------------------------------------------------------------------------------
// Pulling it all together
// ---------------------------------------------------------------------------------------------------------

PlaygroundPage.current.needsIndefiniteExecution = true

let canvas = UIView(frame: CGRect(x: 0.0, y: 0.0, width: canvasWidth, height: canvasHeight))
canvas.backgroundColor = .white
let mainLayer = canvas.layer

let line = CAShapeLayer()
line.path = UIBezierPath(rect: CGRect(x: 0, y: baseLine, width: canvasWidth, height: 1)).cgPath
line.strokeColor = dotColour.cgColor
mainLayer.addSublayer(line)

let dots = makeDots(frame: CGRect(x: canvasWidth, y: baseLine, width: canvasWidth*2, height: dotRadius2*2))
mainLayer.addSublayer(dots)
let moveDots = makeDotAnimation(dots: dots, to: CGPoint(x: -dots.frame.width*0.25, y: baseLine), duration: 3.0)
dots.add(moveDots, forKey: "move dots from right to left")

let pin = makePin()
mainLayer.addSublayer(pin)
let pinJump = CAKeyframeAnimation(keyPath: "path")
pinJump.values = [
	makePin1Path().cgPath,
	makePin2Path().cgPath,
	makePin3Path().cgPath,
	makePin4Path().cgPath,
	makePin5Path().cgPath,
	makePin1Path().cgPath,
]
pinJump.duration = 1.0
pinJump.beginTime = CACurrentMediaTime() + 0.35
pinJump.repeatCount = Float.infinity
pin.add(pinJump, forKey: "jump")

mainLayer.addSublayer(makeLeftFade())
mainLayer.addSublayer(makeRightFade())

PlaygroundPage.current.liveView = canvas


