const std = @import("std");
const Point = struct {
    x: f32,
    y: f32,
};

pub fn main() !void {
    var p = Point{ .x = 1.0, .y = 2.0 };
    const fields = std.meta.fields(Point);
    const rx = fields[0];
    const ry = fields[1];

    @field(p, rx.name) = 3;
    @field(p, ry.name) = 4;

    std.debug.print("{} {}", .{ p, @TypeOf(rx) });
}
