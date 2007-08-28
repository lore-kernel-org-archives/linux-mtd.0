Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IQ3GG-0002pz-7L
	for linux-mtd@lists.infradead.org; Tue, 28 Aug 2007 11:45:51 -0400
Subject: [PATCH] MTD: nandsim: avoid deadlocking FS
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Aug 2007 18:45:40 +0300
Message-Id: <1188315941.3741.33.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Tue, 28 Aug 2007 20:33:32 +0300
Subject: [PATCH] MTD: nandsim: avoid deadlocking FS

Make nandsim use GFP_NOFS when allocating memory, because it might
be used by a file-system (e.g. UBIFS2) which means, if we are short
of memory, we may deadlock. Indee, UBIFS is holding a lock, writes
to the media, reaches this place in NANDsim, kmalloc does not find
the requested amount of RAM, calls memory shrinker, which decides
to writeback inodes, calls FS, and it deadlocks on the lock which
is already being held. Below is the UBIFS backtrace which
demonstrates that:

[<c03717dc>] __mutex_lock_slowpath+0xc8/0x2e6
[<c0371a16>] mutex_lock+0x1c/0x1f
[<f8b9d076>] reserve_space+0x3d/0xa9 [ubifs]
[<f8b9d1bd>] make_one_reservation+0x2b/0x86 [ubifs]
[<f8b9d3fc>] ubifs_jrn_write_block+0xda/0x12f [ubifs]
[<f8b9ff3a>] ubifs_writepage+0x11d/0x1ec [ubifs]
[<c015d6ab>] shrink_inactive_list+0x7fa/0x969
[<c015d8c8>] shrink_zone+0xae/0x10c
[<c015e3b4>] try_to_free_pages+0x159/0x251
[<c015980a>] __alloc_pages+0x125/0x2f0
[<c016ff6a>] cache_alloc_refill+0x380/0x6ba
[<c01703f3>] __kmalloc+0x14f/0x157
[<f885722a>] do_state_action+0xab7/0xc74 [nandsim]
[<f885760c>] switch_state+0x225/0x402 [nandsim]
[<f8857e7e>] ns_hwcontrol+0x3e2/0x620 [nandsim]
[<f8862f53>] nand_command+0x2e/0x1a5 [nand]
[<f8861ad8>] nand_write_page+0x4a/0x9a [nand]
[<f88617b4>] nand_do_write_ops+0x1cf/0x343 [nand]
[<f8861a70>] nand_write+0x88/0xa6 [nand]
[<f8850b0e>] part_write+0x72/0x8b [mtd]
[<f88e19c5>] ubi_io_write+0x189/0x29c [ubi]
[<f88dfb98>] ubi_eba_write_leb+0xb6/0x699 [ubi]
[<f88def93>] ubi_leb_write+0xe4/0xe9 [ubi]
[<f8ba3b82>] ubifs_wbuf_write_nolock+0x333/0x4c9 [ubifs]
[<f8b9d28c>] write_node+0x74/0x8e [ubifs]
[<f8b9d422>] ubifs_jrn_write_block+0x100/0x12f [ubifs]
[<f8b9ff3a>] ubifs_writepage+0x11d/0x1ec [ubifs]
[<c0159e5b>] __writepage+0xb/0x26
[<c015a318>] write_cache_pages+0x203/0x2d9
[<c015a411>] generic_writepages+0x23/0x2d
[<c015a452>] do_writepages+0x37/0x39
[<c018e24a>] __writeback_single_inode+0x96/0x399
[<c018e903>] sync_sb_inodes+0x1a3/0x274
[<c018ebf3>] writeback_inodes+0xa6/0xd8
[<c015a9dd>] background_writeout+0x86/0x9e
[<c015ae9c>] pdflush+0xfb/0x1b6
[<c01387d7>] kthread+0x37/0x59
[<c0104dc3>] kernel_thread_helper+0x7/0x14

The deadlock is funny because it starts in pdflush/writeback,
and comes back to writeback, then deadlocks. It seems we should look
carefully for other places in UBI and MTD and use GFP_NOFS instead
of GFP_KERNEL.

Caught-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/nand/nandsim.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 205df0f..0b1823c 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -1272,7 +1272,13 @@ static int prog_page(struct nandsim *ns, int num)
 	mypage =3D NS_GET_PAGE(ns);
 	if (mypage->byte =3D=3D NULL) {
 		NS_DBG("prog_page: allocating page %d\n", ns->regs.row);
-		mypage->byte =3D kmalloc(ns->geom.pgszoob, GFP_KERNEL);
+		/*
+		 * We allocate memory with GFP_NOFS because a flash FS may
+		 * utilize this. If it is holding an FS lock, then gets here,
+		 * then kmalloc runs writeback which goes to the FS again
+		 * and deadlocks. This was seen in practice.
+		 */
+		mypage->byte =3D kmalloc(ns->geom.pgszoob, GFP_NOFS);
 		if (mypage->byte =3D=3D NULL) {
 			NS_ERR("prog_page: error allocating memory for page %d\n", ns->regs.row=
);
 			return -1;
--=20
1.5.0.6

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
