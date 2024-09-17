import Foundation
let ball = OvalShape(width: 40, height: 40)


var barriers: [Shape] = []



var targets: [Shape] = []


 
let funnelPoints = [
    Point(x: 0, y: 50),
    Point(x: 80, y: 50),
    Point(x: 60, y: 0),
    Point(x: 20, y: 0)
]
let funnel = PolygonShape(points: funnelPoints)



func addTarget(at position: Point) {
    let targetPoints = [
        Point(x: 10, y: 0),
        Point(x: 0, y: 10),
        Point(x: 10, y: 20),
        Point(x: 20, y: 10)
    ]
    let target = PolygonShape(points:
       targetPoints)
    targets.append(target)
    target.isDraggable = false
    target.position = position
    target.hasPhysics = true
    target.isImmobile = true
    target.isImpermeable = false
    target.fillColor = .yellow
    target.name = "target"
    scene.add(target)

}
fileprivate func addBarrier(at position:
   Point, width: Double, height: Double,
   angle: Double) {
    let barrierPoints = [
        Point(x: 0, y: 0),
        Point(x: 0, y: height),
        Point(x: width, y: height),
        Point(x: width, y: 0)
    ]
    let barrier = PolygonShape(points:
       barrierPoints)
    barriers.append(barrier)
                    barrier.position = Point(x: 200, y: 150)
                    barrier.hasPhysics = true
                    scene.add(barrier)
                    barrier.isImmobile = true
                    barrier.angle = 0.1
                }

fileprivate func Setupcircle() {
    ball.onCollision
    ball.onCollision = circleCollided(with:)
    ball.isDraggable = false
    ball.onTapped = resetgame
    ball.bounciness = 0.6
}

fileprivate func Setupfunnel() {
    funnel.position = Point(x: 200,
                            y: scene.height - 25)
    scene.add(funnel)
    funnel.onTapped = dropcircle
    funnel.isDraggable = false
}

func setup() {
    ball.position = Point(x: 250, y: 400)
        scene.add(ball)
    ball.hasPhysics = true
    ball.fillColor = .blue
    Setupcircle()
    Setupfunnel()
    addTarget(at: Point(x: 184, y: 563))
    addTarget(at: Point(x: 238, y: 624))
    addTarget(at: Point(x: 269, y: 453))
    addTarget(at: Point(x: 213, y: 348))
    addTarget(at: Point(x: 113, y: 267))
    addBarrier(at: Point(x: 175, y: 100), width: 80,
       height: 25, angle: 0.1)
    addBarrier(at: Point(x: 100, y: 150), width: 30,
               height: 15, angle: -0.5)
    addBarrier(at: Point(x: 325, y: 150), width: 100,
       height: 25, angle: 0.3)
    resetgame()
}

func dropcircle() {
    ball.position = funnel.position
    ball.stopAllMotion()
    for barrier in barriers {
        barrier.isDraggable = false
    }
}
func circleCollided(with otherShape: Shape) {
    if otherShape.name != "target" { return }
    otherShape.fillColor = .green
}
func circleexitedscene() {
    scene.trackShape(ball)
    ball.onExitedScene = circleexitedscene
    for barrier in barriers {
        barrier.isDraggable = true
    }
}
func resetgame() {
    ball.position = Point(x: 0, y: -80)
}
