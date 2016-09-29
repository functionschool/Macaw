
import Foundation

class AnimationUtils {
	class func absolutePosition(_ node: Node) -> Transform {
		return AnimationUtils.absoluteTransform(node, pos: node.place)
	}

	class func absoluteTransform(_ node: Node, pos: Transform) -> Transform {
		var transform = pos
		var parent = nodesMap.parents(node).first
		while parent != .none {
			transform = GeomUtils.concat(t1: parent!.place, t2: transform)
			parent = nodesMap.parents(parent!).first
		}

		return transform
	}
}
