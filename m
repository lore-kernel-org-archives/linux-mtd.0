Date: Fri, 12 Oct 2007 15:50:13 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: linux-mtd@lists.infradead.org, Nico@cam.org
Subject: Re: Recursion in CFI driver. Is it really necessary to have.
Message-ID: <Pine.LNX.4.64.0710121547550.21455@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas,

> 
> Please be more clear about your problem first.
> 
The problem I've found is kernel deadlock on JFFF2 simultaneous operations.
Also debugging showed that the issue is caused by tons of recursions in 
get_chip call. This is the stack dump I could catch before the deadlock.

124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c0124c24>] (get_chip+0x1e0/0x808)
[<c0124a44>] (get_chip+0x0/0x808) from [<c01276d0>] 
(do_erase_oneblock+0x3c/0x70
0)
[<c0127694>] (do_erase_oneblock+0x0/0x700) from [<c0123eb8>] 
(cfi_varsize_frob+0
x1e4/0x274)
[<c0123cd4>] (cfi_varsize_frob+0x0/0x274) from [<c0127dc4>] 
(cfi_intelext_erase_
varsize+0x30/0x60)
[<c0127d94>] (cfi_intelext_erase_varsize+0x0/0x60) from [<c011de54>] 
(part_erase
+0x54/0x84)
  r5:c3ecd5e4 r4:c3c8d7a0
[<c011de00>] (part_erase+0x0/0x84) from [<c00c4da8>] 
(jffs2_erase_pending_blocks
+0x514/0x634)
  r5:c38a4b78 r4:c3ecd5e4
[<c00c4894>] (jffs2_erase_pending_blocks+0x0/0x634) from [<c00bd6cc>] 
(jffs2_do_
reserve_space+0x1e0/0x2ac)
[<c00bd4ec>] (jffs2_do_reserve_space+0x0/0x2ac) from [<c00bd978>] 
(jffs2_reserve
_space+0x18c/0x1e4)
[<c00bd7ec>] (jffs2_reserve_space+0x0/0x1e4) from [<c00c02ec>] 
(jffs2_write_inod
e_range+0x60/0x36c)
[<c00c028c>] (jffs2_write_inode_range+0x0/0x36c) from [<c00bb3f0>] 
(jffs2_commit
_write+0x134/0x270)
[<c00bb2bc>] (jffs2_commit_write+0x0/0x270) from [<c0056540>] 
(generic_file_buff
ered_write+0x41c/0x610)
[<c0056128>] (generic_file_buffered_write+0x4/0x610) from [<c0056ee0>] 
(__generi
c_file_aio_write_nolock+0x4fc/0x52c)
[<c00569e4>] (__generic_file_aio_write_nolock+0x0/0x52c) from [<c0056f94>] 
(gene
ric_file_aio_write+0x84/0x100)
[<c0056f14>] (generic_file_aio_write+0x4/0x100) from [<c007437c>] 
(do_sync_write
+0xc0/0x110)
[<c00742bc>] (do_sync_write+0x0/0x110) from [<c0074498>] (vfs_write+0xcc/0x100)
[<c00743cc>] (vfs_write+0x0/0x100) from [<c007458c>] (sys_write+0x4c/0x74)
  r7:0011216f r6:c3767f78 r5:c3c3aca0 r4:c3c3acc0
[<c0074540>] (sys_write+0x0/0x74) from [<c001cda0>] (ret_fast_syscall+0x0/0x2c)

I think that the recursion caused stack overflow in kernel. Thanks,
Alexey
