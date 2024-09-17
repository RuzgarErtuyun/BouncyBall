import Foundation
let circle = OvalShape(width: 150, height: 150)

let barrierWidth = 300.0

let barrierHeight = 25.0
 
let barrierPoints = [
    Point(x: 0, y: 0),
    Point(x: 0, y: barrierHeight),
    Point(x: barrierWidth,
       y: barrierHeight),
    Point(x: barrierWidth, y: 0)
]
 
let barrier = PolygonShape(points:
   barrierPoints)
let funnelPoints = [
    Point(x: 0, y: 50),
    Point(x: 80, y: 50),
    Point(x: 60, y: 0),
    Point(x: 20, y: 0)
]
let funnel = PolygonShape(points: funnelPoints)



func setup() {
    circle.position = Point(x: 250, y: 400)
        scene.add(circle)
    circle.hasPhysics = true
    barrier.position = Point(x: 200, y: 150)
    barrier.hasPhysics = true
    scene.add(barrier)
    barrier.isImmobile = true
    funnel.onTapped = dropBall
    
}

func dropBall() {
    circle.position = funnel.position
}
