Received: from na3sys009aog110.obsmtp.com ([74.125.149.203])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QR7dV-0002tu-UH
	for linux-mtd@lists.infradead.org; Mon, 30 May 2011 18:56:22 +0000
Received: by yxd5 with SMTP id 5so2192312yxd.7
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 May 2011 11:56:19 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Artem Bityutskiy <dedekind1@gmail.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
Subject: [PATCH 0/3] fix-up free space earlier in mount_ubifs()
Date: Mon, 30 May 2011 14:56:13 -0400
Message-Id: <cover.1306780983.git.bengardiner@nanometrics.ca>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Matthew L. Creech" <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In testing Mattew Creech's free-space-fixup flag series I found that was unable
to boot a da850evm which had flashed to it's NAND a ubinized image containing a
UBIFS that has the free-space-fixup flag set.

The cause of the problem was found to be the call to ubifs_write_master() from
mount_ubifs() as is evidenced the backtrace produced by the assertion
introduced in the first patch of this series; where the assertion introduced is
that c->space_fixup is false when ubifs_write_node() is called.

UBIFS assert failed in ubifs_write_node at 766 (pid 1)
Backtrace:
[<c002dd8c>] (dump_backtrace+0x0/0x10c) from [<c02ecb8c>] (dump_stack+0x18/0x1c)
 r7:00000001 r6:c782c000 r5:c781f000 r4:c03fb468
[<c02ecb74>] (dump_stack+0x0/0x1c) from [<c015cd68>] (ubifs_write_node+0x20c/0x230)
[<c015cb5c>] (ubifs_write_node+0x0/0x230) from [<c0162930>] (ubifs_write_master+0xbc/0x228)
[<c0162874>] (ubifs_write_master+0x0/0x228) from [<c0158108>] (ubifs_fill_super+0x1d54/0x1ed8)
 r6:0001e5a0 r5:00000000 r4:00000000
[<c01563b4>] (ubifs_fill_super+0x0/0x1ed8) from [<c01584fc>] (ubifs_mount+0x270/0x3a4)
[<c015828c>] (ubifs_mount+0x0/0x3a4) from [<c00afe5c>] (mount_fs+0x1c/0xe8)
[<c00afe40>] (mount_fs+0x0/0xe8) from [<c00cc8c0>] (vfs_kern_mount+0x58/0x94)
 r6:00008000 r5:c780c780 r4:c7a6e9e0
[<c00cc868>] (vfs_kern_mount+0x0/0x94) from [<c00cc958>] (do_kern_mount+0x3c/0xd4)
 r9:c782dee8 r8:c03ebaa8 r7:c7a6ea00 r6:00000000 r5:c7a6e9e0
r4:00008000
[<c00cc91c>] (do_kern_mount+0x0/0xd4) from [<c00ccb3c>] (do_mount+0x14c/0x734)
 r9:c782dee8 r8:00000020 r7:c7a6ea00 r6:c7a6e9e0 r5:00008000
r4:00000000
[<c00cc9f0>] (do_mount+0x0/0x734) from [<c00cd1c4>] (sys_mount+0xa0/0xd0)
[<c00cd124>] (sys_mount+0x0/0xd0) from [<c0008dd4>] (mount_block_root+0x98/0x2c8)
 r7:c0023e88 r6:c781b000 r5:00008000 r4:c781b000
[<c0008d3c>] (mount_block_root+0x0/0x2c8) from [<c00090f0>] (prepare_namespace+0x80/0x1c4)
[<c0009070>] (prepare_namespace+0x0/0x1c4) from [<c0008480>] (kernel_init+0x110/0x158)
 r7:00000013 r6:c0023300 r5:c0023668 r4:c0023668
[<c0008370>] (kernel_init+0x0/0x158) from [<c0043d58>] (do_exit+0x0/0x750)
 r7:00000013 r6:c0043d58 r5:c0008370 r4:00000000

Moving the free-space-fixup to before the call to ubifs_write_master() requires that the
LPT be initialiazed first; therefore the second patch of this series moves the 
ubifs_lpt_init() call to before the call to ubifs_write_master() in preparation of moving
the free-space fixup. 

Finally, the free-space fixup is moved to earlier in the mounting process -- in testing this
has resulted in a bootable da850evm and no assertion errors.

Ben Gardiner (3):
  UBIFS: assert no fixup when writing a node
  UBIFS: intialize the LPT earlier
  UBIFS: fix-up free space earlier

 fs/ubifs/io.c    |    2 ++
 fs/ubifs/super.c |   24 ++++++++++++------------
 2 files changed, 14 insertions(+), 12 deletions(-)

-- 
1.7.4.1
