package hxmath;

@:forward(x, y, z)
abstract Vector3(Vector3Shape) from Vector3Shape to Vector3Shape
{
    public static var zero(get, never):Vector3;
    public static var xAxis(get, never):Vector3;
    public static var yAxis(get, never):Vector3;
    public static var zAxis(get, never):Vector3;
    
    public var length(get, never):Float;
    public var lengthSq(get, never):Float;
    
    public function new(x:Float, y:Float, z:Float)
    {
        this = {x: x, y: y, z: z};
    }
    
    @:op(A * B)
    public static inline function dot(a:Vector3, b:Vector3):Float
    {
        return
            a.x * b.x +
            a.y * b.y +
            a.z * b.z;
    }
    
    @:op(A ^ B)
    public static inline function cross(a:Vector3, b:Vector3):Vector3
    {
        return new Vector3(
            a.y * b.z - a.z * b.y,
            a.z * b.x - a.x * b.z,
            a.x * b.y - a.y * b.x);
    }
    
    @:op(A * B)
    public static inline function scalarMultiply(s:Float, a:Vector3):Vector3
    {
        return new Vector3(
            s * a.x,
            s * a.y,
            s * a.z);
    }
    
    @:op(A + B)
    public static inline function add(a:Vector3, b:Vector3):Vector3
    {
        return new Vector3(
            a.x + b.x,
            a.y + b.y,
            a.z + b.z);
    }
    
    @:op(A += B)
    public static inline function addWith(a:Vector3, b:Vector3):Vector3
    {
        a.x += b.x;
        a.y += b.y;
        a.z += b.z;
        return a;
    }
    
    @:op(A - B)
    public static inline function subtract(a:Vector3, b:Vector3):Vector3
    {
        return new Vector3(
            a.x - b.x,
            a.y - b.y,
            a.z - b.z);
    }
    
    @:op(A -= B)
    public static inline function subtractWith(a:Vector3, b:Vector3):Vector3
    {
        a.x -= b.x;
        a.y -= b.y;
        a.z -= b.z;
        return a;
    }
    
    @:op(A == B)
    public static inline function equals(a:Vector3, b:Vector3):Bool
    {
        return a.x == b.x && a.y == b.y && a.z == b.z;
    }
    
    public static inline function lerp(a:Vector3, b:Vector3, t:Float):Vector3
    {
        return t*a + (1.0 - t)*b;
    }
    
    public inline function clone():Vector3
    {
        var self:Vector3 = this;
        return new Vector3(self.x, self.y, self.z);
    }
    
    private inline function get_length():Float
    {
        var self:Vector3 = this;
        return Math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z);
    }
    
    private inline function get_lengthSq():Float
    {
        var self:Vector3 = this;
        return self.x * self.x + self.y * self.y + self.z * self.z;
    }
    
    private static inline function get_zero():Vector3
    {
        return new Vector3(0.0, 0.0, 0.0);
    }
    
    private static inline function get_xAxis():Vector3
    {
        return new Vector3(1.0, 0.0, 0.0);
    }
    
    private static inline function get_yAxis():Vector3
    {
        return new Vector3(0.0, 1.0, 0.0);
    }
    
    private static inline function get_zAxis():Vector3
    {
        return new Vector3(0.0, 0.0, 1.0);
    }
}
