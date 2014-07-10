import vtgmath.Quaternion;
import vtgmath.Vector2;
import vtgmath.Vector3;

class Test {
    static function main() {
        var p = new Vector2(1.0, 2.0);
        var q = new Vector2(1.0, 4.0);
        trace(Vector2.dot(p, q));
		trace(p*q);
		trace(2 * p);
        
        var x = new Vector3(1, 0, 0);
        var y = new Vector3(0, 1, 0);
        var z = x ^ y;
        trace(z);
        var none = (x ^ y) ^ z;
        trace(none);
        trace(Vector2.xAxis);
        
        var q = new Quaternion(1, Vector3.xAxis);
        var p = new Quaternion(1, Vector3.yAxis);
        
        trace(q * p);
        
        #if sys
        Sys.stdin().readLine();
        #end
    }
}