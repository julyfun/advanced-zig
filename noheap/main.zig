const std = @import("std");

// 1. 定义一块静态内存（在单片机上这通常位于 RAM 的 .bss 段）
var memory_pool: [4096]u8 = undefined;

pub fn main() !void {
    // 2. 初始化固定缓冲区分配器
    var fba = std.heap.FixedBufferAllocator.init(&memory_pool);
    const allocator = fba.allocator();

    // 3. 像平时一样使用 alloc
    const slice = try allocator.alloc(u32, 10);
    defer allocator.free(slice); // 注意：对于 FBA 来说，free 其实是“假”的，它不会真正回收中间的碎片

    for (slice, 0..) |*item, i| {
        item.* = @intCast(i * 10);
    }

    std.debug.print("Static Allocated: {any}\n", .{slice});
}
