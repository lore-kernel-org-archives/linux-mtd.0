Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OUF9F-0008TY-NG
	for linux-mtd@lists.infradead.org; Thu, 01 Jul 2010 08:29:30 +0000
Received: from ONYX.xi-lite.lan (unknown [193.34.35.243])
	by co202.xi-lite.net (Postfix) with ESMTPS id 2C9312602B0
	for <linux-mtd@lists.infradead.org>;
	Thu,  1 Jul 2010 10:29:25 +0200 (CEST)
Message-ID: <4C2C51E2.7030308@parrot.com>
Date: Thu, 1 Jul 2010 10:29:22 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [UBIFS] 2.6.27-backport bug
Content-Type: multipart/mixed; boundary="------------070804070209080304070902"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------070804070209080304070902
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I know 2.6.27-backport is not supported anymore, but I found a bug, and 
I post it for the record.

The bug happen with a kernel oops [1].

After investigation it happens because of programming a timer that is 
already programmed (we don't check wbuf->no_timer in new_wbuf_timer_nolock)

Matthieu

[1]
Unable to handle kernel NULL pointer dereference at virtual address 
00000008
pgd = c71b0000 

[00000008] *pgd=47853031, *pte=00000000, *ppte=00000000 

Internal error: Oops: 17 [#1] 

CPU: 0    Not tainted  (2.6.27.44-parrot-01137-gbf2d001-dirty #13) 

PC is at rb_insert_color+0x34/0x148 

LR is at enqueue_hrtimer+0x80/0xa8 

pc : [<c00faa54>]    lr : [<c0049ab8>]    psr: 60000093 

sp : c7073c80  ip : c7073ca0  fp : c7073c9c 

r10: c01f6ad8  r9 : 00000000  r8 : 00000013 

r7 : c01f6b08  r6 : c7fd5cb8  r5 : 00000000  r4 : c7fd5c38 

r3 : c7fd5c38  r2 : 00000005  r1 : c7fd5c38  r0 : 00000000 

Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user 

Control: 0005317f  Table: 471b0000  DAC: 00000015 

Process plop (pid: 270, stack limit = 0xc7072268) 

Stack: (0xc7073c80 to 0xc7074000) 

3c80: c7fd5cb8 c01f6b08 c01f6b00 c7fd5cb8 c7073cb4 c7073ca0 c0049ab8 
c00faa30
3ca0: 276d198c 00000134 c7073cfc c7073cb8 c0049d50 c0049a48 276d198c 
0000012f
3cc0: 276d198c 00000134 276d198c 0000012f c74850d0 00000000 00000000 
c7fd5c80
3ce0: 000001c8 00000000 00000005 c7fd5200 c7073d4c c7073d00 c00cd9c0 
c0049ce4
3d00: 00000001 c0100eb4 c01573d0 00000000 00000000 00000000 00000000 
00000012
3d20: c7073d64 00000000 c7fd5c80 00000000 c7fd5200 c712f000 c74850d0 
c74850b8
3d40: c7073d64 c7073d50 c00c2df0 c00cd870 c7fd5288 000001c8 c7073dfc 
c7073d68
3d60: c00c40d0 c00c2db0 c7073dcc c7073dc8 00000000 c7073e38 00000000 
c753a308
3d80: c753a1a8 00000088 0000003c 00000045 00000000 c7491ca8 00000000 
00000040
3da0: 00000048 00000000 00000001 00000000 c7498df0 00000303 00000007 
00000000
3dc0: c008c4f4 c0046de0 0001e800 000002ed c008c514 00000250 00000000 
c753a1a8
3de0: 00000000 c753a308 c7491ca8 00000000 c7073e94 c7073e00 c00c6e58 
c00c3d80
3e00: c7498dd8 00000000 c7498dd8 c74850b8 00000000 00000000 00000048 
00000000
3e20: c0089cdc c712f000 00000001 00000000 00000040 0000012f 00100000 
00000000
3e40: 00000000 00000000 000000a0 00300030 00000000 000000c0 00000138 
000003b8
3e60: c74850b8 c753a308 00000003 00000000 c7498dd8 00000000 c74850b8 
c753a308
3e80: c7498dd8 c753a1a8 c7073ebc c7073e98 c0081cc8 c00c6bb8 00000000 
c75473b8
3ea0: c74850b8 c7073f10 c7073ec0 c748b898 c7073f94 c7073ec0 c00832e4 
c0081aa0
3ec0: c780c2a0 c748b898 00295e98 00000003 c78f6005 00000010 00000000 
00000000
3ee0: c01193b4 c011e58c c0094164 c011b2bc c6ffc810 00000001 0000012f 
00000000
3f00: c7073f24 c02184e4 0000a3d9 00000001 c780c2a0 c75473b8 6cd8e514 
0000000c
3f20: c7aac00c 00000010 00000000 00000000 c7816e00 c712e460 0000a3d9 
c7073f78
3f40: 00000000 c0023d84 c7073f74 c7073f58 c0079d10 c0119400 c7073f84 
c712e460
3f60: c78f6000 c7aac000 c7073fa4 00000025 004a2ce6 0003a73c 00000026 
c0023d84
3f80: c7072000 40068008 c7073fa4 c7073f98 c008331c c008313c 00000000 
c7073fa8
3fa0: c0023c00 c0083308 00000025 004a2ce6 4016804c 0000a33c 0000003d 
00000002
3fc0: 00000025 004a2ce6 0003a73c 00000026 4016804c 4016804c 40068008 
000000c8
3fe0: 00012d6c bece3d78 00009000 4001bd04 20000010 4016804c ffffffff 
ffffffff
Backtrace: 

[<c00faa20>] (rb_insert_color+0x0/0x148) from [<c0049ab8>] 
(enqueue_hrtimer+0x8)
  r7:c7fd5cb8 r6:c01f6b00 r5:c01f6b08 r4:c7fd5cb8 

[<c0049a38>] (enqueue_hrtimer+0x0/0xa8) from [<c0049d50>] 
(hrtimer_start+0x7c/0)
  r5:00000134 r4:276d198c 

[<c0049cd4>] (hrtimer_start+0x0/0xdc) from [<c00cd9c0>] 
(ubifs_wbuf_write_noloc)
[<c00cd860>] (ubifs_wbuf_write_nolock+0x0/0x2d0) from [<c00c2df0>] 
(write_head+)
[<c00c2da0>] (write_head+0x0/0x80) from [<c00c40d0>] 
(ubifs_jnl_rename+0x360/0x)
  r5:000001c8 r4:c7fd5288 

[<c00c3d70>] (ubifs_jnl_rename+0x0/0x70c) from [<c00c6e58>] 
(ubifs_rename+0x2b0)
[<c00c6ba8>] (ubifs_rename+0x0/0x5e4) from [<c0081cc8>] 
(vfs_rename+0x238/0x270)
[<c0081a90>] (vfs_rename+0x0/0x270) from [<c00832e4>] 
(sys_renameat+0x1b8/0x1cc)
[<c008312c>] (sys_renameat+0x0/0x1cc) from [<c008331c>] 
(sys_rename+0x24/0x28)
[<c00832f8>] (sys_rename+0x0/0x28) from [<c0023c00>] 
(ret_fast_syscall+0x0/0x2c)
Code: e1a01004 e3100001 1a000014 e3c05003 (e5952008) 

---[ end trace ecb46e62aac9d5bf ]---

--------------070804070209080304070902
Content-Type: text/x-diff; name="ubifs_2.6.27.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="ubifs_2.6.27.diff"

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 05471ee..dfbd859 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -313,7 +313,7 @@ static void new_wbuf_timer_nolock(struct ubifs_wbuf *wbuf)
 {
 	ubifs_assert(!hrtimer_active(&wbuf->timer));
 
-	if (!ktime_to_ns(wbuf->hardlimit))
+	if (wbuf->no_timer)
 		return;
 
 	dbg_io("set timer for jhead %s, %llu millisecs", dbg_jhead(wbuf->jhead),

--------------070804070209080304070902--
