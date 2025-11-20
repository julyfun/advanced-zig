const std = @import("std");
const Point = struct { x: i32, y: i32 };

pub fn main() !void {
    const point = Point{ .x = 1, .y = 2 };

    // var buf: [200]u8 = undefined;
    // var string = std.ArrayList(u8).initBuffer(&buf);
    std.json.fmt(point, .{}).format(std.fs.File.stdout());

    // std.debug.print("{s}\n", .{a});

    // const test_allocator = std.heap.page_allocator;
    // const parsed = try std.json.parseFromSlice(Point, test_allocator, string.items, .{});
    // defer parsed.deinit();

    // const user = parsed.value;

    // std.debug.print("{?}\n", .{user});
}
