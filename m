Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Idp8e-0001e7-Ao
	for linux-mtd@lists.infradead.org; Fri, 05 Oct 2007 16:30:55 +0100
Subject: [PATCH] Revert "[JFFS2] Reduce time for which erase_free_sem is
	held during erase."
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Oct 2007 18:26:29 +0300
Message-Id: <1191597989.4586.16.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org,
	Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From e1d782add3a72421eb637a119c594a6d9b774727 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Fri, 5 Oct 2007 20:09:45 +0300
Subject: [PATCH] Revert "[JFFS2] Reduce time for which erase_free_sem is he=
ld during erase."

This reverts commit d364fb18cd991734eb54aa8840e70030b0c9f699.

This patch locks up the system because it takes the 'erase_free_sem' in
the erase callback function, which is in turn called from NAND/OneNAND
driver with NAND/OneNAND chip locked. Obviously, another process which
holds 'erase_free_sem' and calls an I/O function will deadlock at the
NAND/OneNAND chip lock. Below is the backtrace of this deadlock which
we observed in practice:

Task A: locks OneNAND chip in onenand_erase(), calls mtd_erase_callback()
without unlocking it and goes sleep on the 'erase_free_sem' semaphore.

[157760.562500] pdflush       D C0252BF0     0   115      6 (L-TLB)
[157760.562500] [<c0252700>] (schedule+0x0/0x5bc) from [<c025256c>] (__down=
+0x9c/0xe8)
[157760.562500] [<c02524d0>] (__down+0x0/0xe8) from [<c025246c>] (__down_fa=
iled+0xc/0x20)
[157760.562500]  r8 =3D C7DBD410  r7 =3D 00000000  r6 =3D C2C31DE0  r5 =3D =
C2C31E10
[157760.562500]  r4 =3D C001E200
[157760.562500] [<c00f134c>] (jffs2_erase_callback+0x0/0xcc) from [<c0176fd=
0>] (mtd_erase_callback+0x54/0x5c)
[157760.562500]  r6 =3D 0AAE0000  r5 =3D C2C31DE0  r4 =3D 00000000
[157760.562500] [<c0176f7c>] (mtd_erase_callback+0x0/0x5c) from [<c017c1c0>=
] (onenand_erase+0x224/0x24c)
[157760.562500] [<c017bf9c>] (onenand_erase+0x0/0x24c) from [<c0176f4c>] (p=
art_erase+0x54/0x84)
[157760.562500] [<c0176ef8>] (part_erase+0x0/0x84) from [<c00f1ba0>] (jffs2=
_erase_pending_blocks+0x65c/0x7c4)
[157760.562500]  r5 =3D C07F0E28  r4 =3D C2C31DE0
[157760.562500] [<c00f1544>] (jffs2_erase_pending_blocks+0x0/0x7c4) from [<=
c00f2df8>] (jffs2_write_super+0x38/0x48)
[157760.562500] [<c00f2dc0>] (jffs2_write_super+0x0/0x48) from [<c009e9b0>]=
 (sync_supers+0x84/0xc0)
[157760.562500]  r5 =3D C001E040  r4 =3D C001E000
[157760.562500] [<c009e92c>] (sync_supers+0x0/0xc0) from [<c0082600>] (wb_k=
update+0x54/0x13c)
[157760.562500]  r6 =3D C02F9B18  r5 =3D C02FA7B8  r4 =3D C053DF8C
[157760.562500] [<c00825ac>] (wb_kupdate+0x0/0x13c) from [<c0083564>] (pdfl=
ush+0x128/0x1e8)
[157760.562500]  r8 =3D C02F9B18  r7 =3D C053DF80  r6 =3D C053C000  r5 =3D =
C02FA7B8
[157760.562500]  r4 =3D C053DF8C
[157760.562500] [<c008343c>] (pdflush+0x0/0x1e8) from [<c006df0c>] (kthread=
+0xe0/0x114)
[157760.562500]  r8 =3D 00000001  r7 =3D C008343C  r6 =3D C0461F30  r5 =3D =
C053C000
[157760.562500]  r4 =3D 00000000

Task B: locks the 'erase_free_sem' semaphore, calls 'onenand_read()' and tr=
ies
to lock the OneNAND chip. This is a deadlock. The whle system subsiquently
deadlocks.

[157760.562500] matchbox-wind D C0252BF0     0   824    327 (NOTLB)
[157760.562500] [<c0252700>] (schedule+0x0/0x5bc) from [<c017ae6c>] (onenan=
d_get_device+0xa4/0xc8)
[157760.562500] [<c017adc8>] (onenand_get_device+0x0/0xc8) from [<c017b248>=
] (onenand_read+0x24/0x64)
[157760.562500]  r8 =3D 00000002  r7 =3D 00000000  r6 =3D C7DBD410  r5 =3D =
00000000
[157760.562500]  r4 =3D 0293A264
[157760.562500] [<c017b224>] (onenand_read+0x0/0x64) from [<c01769f0>] (par=
t_read+0xa8/0xdc)
[157760.562500]  r6 =3D C7DCDCE0  r5 =3D 00000000  r4 =3D 024BA264
[157760.562500] [<c0176948>] (part_read+0x0/0xdc) from [<c00f5818>] (jffs2_=
flash_read+0x94/0x238)
[157760.562500]  r6 =3D 024BA264  r5 =3D C06CDB10  r4 =3D C6B67CA4
[157760.562500] [<c00f5784>] (jffs2_flash_read+0x0/0x238) from [<c00e84f0>]=
 (jffs2_read_dnode+0x64/0x44c)
[157760.562500] [<c00e848c>] (jffs2_read_dnode+0x0/0x44c) from [<c00e89f8>]=
 (jffs2_read_inode_range+0x120/0x168)
[157760.562500] [<c00e88d8>] (jffs2_read_inode_range+0x0/0x168) from [<c00e=
68fc>] (jffs2_do_readpage_nolock+0x6c/0xf4)
[157760.562500] [<c00e6890>] (jffs2_do_readpage_nolock+0x0/0xf4) from [<c00=
e6998>] (jffs2_do_readpage_unlock+0x14/0x28)
[157760.562500]  r4 =3D C034F7C0
[157760.562500] [<c00e6984>] (jffs2_do_readpage_unlock+0x0/0x28) from [<c00=
e69f4>] (jffs2_readpage+0x48/0x6c)
[157760.562500]  r5 =3D C034F7C0  r4 =3D C6492B88
[157760.562500] [<c00e69ac>] (jffs2_readpage+0x0/0x6c) from [<c008390c>] (_=
_do_page_cache_readahead+0x1a8/0x234)
[157760.562500]  r4 =3D C034F7F8
[157760.562500] [<c0083764>] (__do_page_cache_readahead+0x0/0x234) from [<c=
0083a90>] (do_page_cache_readahead+0x64/0x70)
[157760.562500] [<c0083a2c>] (do_page_cache_readahead+0x0/0x70) from [<c007=
da9c>] (filemap_nopage+0x154/0x3a8)
[157760.562500]  r7 =3D 00000015  r6 =3D C6897760  r5 =3D 00000000  r4 =3D =
00000000
[157760.562500] [<c007d948>] (filemap_nopage+0x0/0x3a8) from [<c008acdc>] (=
__handle_mm_fault+0x148/0x990)
[157760.562500] [<c008ab94>] (__handle_mm_fault+0x0/0x990) from [<c002e68c>=
] (do_page_fault+0xdc/0x20c)
[157760.562500] [<c002e5b0>] (do_page_fault+0x0/0x20c) from [<c002e8a8>] (d=
o_DataAbort+0x3c/0xa4)
[157760.562500] [<c002e86c>] (do_DataAbort+0x0/0xa4) from [<c0027b80>] (ret=
_from_exception+0x0/0x10)
[157760.562500]  r8 =3D 0001D554  r7 =3D 0000003B  r6 =3D 00000000  r5 =3D =
BEC96228
[157760.562500]  r4 =3D FFFFFFFF
---
 fs/jffs2/erase.c |   22 ++--------------------
 1 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index a1db918..9858529 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -50,14 +50,12 @@ static void jffs2_erase_block(struct jffs2_sb_info *c,
 	instr =3D kmalloc(sizeof(struct erase_info) + sizeof(struct erase_priv_st=
ruct), GFP_KERNEL);
 	if (!instr) {
 		printk(KERN_WARNING "kmalloc for struct erase_info in jffs2_erase_block =
failed. Refiling block for later\n");
-		down(&c->erase_free_sem);
 		spin_lock(&c->erase_completion_lock);
 		list_move(&jeb->list, &c->erase_pending_list);
 		c->erasing_size -=3D c->sector_size;
 		c->dirty_size +=3D c->sector_size;
 		jeb->dirty_size =3D c->sector_size;
 		spin_unlock(&c->erase_completion_lock);
-		up(&c->erase_free_sem);
 		return;
 	}
=20
@@ -84,14 +82,12 @@ static void jffs2_erase_block(struct jffs2_sb_info *c,
 	if (ret =3D=3D -ENOMEM || ret =3D=3D -EAGAIN) {
 		/* Erase failed immediately. Refile it on the list */
 		D1(printk(KERN_DEBUG "Erase at 0x%08x failed: %d. Refiling on erase_pend=
ing_list\n", jeb->offset, ret));
-		down(&c->erase_free_sem);
 		spin_lock(&c->erase_completion_lock);
 		list_move(&jeb->list, &c->erase_pending_list);
 		c->erasing_size -=3D c->sector_size;
 		c->dirty_size +=3D c->sector_size;
 		jeb->dirty_size =3D c->sector_size;
 		spin_unlock(&c->erase_completion_lock);
-		up(&c->erase_free_sem);
 		return;
 	}
=20
@@ -118,7 +114,6 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info *c=
, int count)
 			jeb =3D list_entry(c->erase_complete_list.next, struct jffs2_eraseblock=
, list);
 			list_del(&jeb->list);
 			spin_unlock(&c->erase_completion_lock);
-			up(&c->erase_free_sem);
 			jffs2_mark_erased_block(c, jeb);
=20
 			if (!--count) {
@@ -139,7 +134,6 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info *c=
, int count)
 			jffs2_free_jeb_node_refs(c, jeb);
 			list_add(&jeb->list, &c->erasing_list);
 			spin_unlock(&c->erase_completion_lock);
-			up(&c->erase_free_sem);
=20
 			jffs2_erase_block(c, jeb);
=20
@@ -149,24 +143,22 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info =
*c, int count)
=20
 		/* Be nice */
 		yield();
-		down(&c->erase_free_sem);
 		spin_lock(&c->erase_completion_lock);
 	}
=20
 	spin_unlock(&c->erase_completion_lock);
-	up(&c->erase_free_sem);
  done:
 	D1(printk(KERN_DEBUG "jffs2_erase_pending_blocks completed\n"));
+
+	up(&c->erase_free_sem);
 }
=20
 static void jffs2_erase_succeeded(struct jffs2_sb_info *c, struct jffs2_er=
aseblock *jeb)
 {
 	D1(printk(KERN_DEBUG "Erase completed successfully at 0x%08x\n", jeb->off=
set));
-	down(&c->erase_free_sem);
 	spin_lock(&c->erase_completion_lock);
 	list_move_tail(&jeb->list, &c->erase_complete_list);
 	spin_unlock(&c->erase_completion_lock);
-	up(&c->erase_free_sem);
 	/* Ensure that kupdated calls us again to mark them clean */
 	jffs2_erase_pending_trigger(c);
 }
@@ -180,26 +172,22 @@ static void jffs2_erase_failed(struct jffs2_sb_info *=
c, struct jffs2_eraseblock
 		   failed too many times. */
 		if (!jffs2_write_nand_badblock(c, jeb, bad_offset)) {
 			/* We'd like to give this block another try. */
-			down(&c->erase_free_sem);
 			spin_lock(&c->erase_completion_lock);
 			list_move(&jeb->list, &c->erase_pending_list);
 			c->erasing_size -=3D c->sector_size;
 			c->dirty_size +=3D c->sector_size;
 			jeb->dirty_size =3D c->sector_size;
 			spin_unlock(&c->erase_completion_lock);
-			up(&c->erase_free_sem);
 			return;
 		}
 	}
=20
-	down(&c->erase_free_sem);
 	spin_lock(&c->erase_completion_lock);
 	c->erasing_size -=3D c->sector_size;
 	c->bad_size +=3D c->sector_size;
 	list_move(&jeb->list, &c->bad_list);
 	c->nr_erasing_blocks--;
 	spin_unlock(&c->erase_completion_lock);
-	up(&c->erase_free_sem);
 	wake_up(&c->erase_wait);
 }
=20
@@ -456,7 +444,6 @@ static void jffs2_mark_erased_block(struct jffs2_sb_inf=
o *c, struct jffs2_eraseb
 		jffs2_link_node_ref(c, jeb, jeb->offset | REF_NORMAL, c->cleanmarker_siz=
e, NULL);
 	}
=20
-	down(&c->erase_free_sem);
 	spin_lock(&c->erase_completion_lock);
 	c->erasing_size -=3D c->sector_size;
 	c->free_size +=3D jeb->free_size;
@@ -469,28 +456,23 @@ static void jffs2_mark_erased_block(struct jffs2_sb_i=
nfo *c, struct jffs2_eraseb
 	c->nr_erasing_blocks--;
 	c->nr_free_blocks++;
 	spin_unlock(&c->erase_completion_lock);
-	up(&c->erase_free_sem);
 	wake_up(&c->erase_wait);
 	return;
=20
 filebad:
-	down(&c->erase_free_sem);
 	spin_lock(&c->erase_completion_lock);
 	/* Stick it on a list (any list) so erase_failed can take it
 	   right off again.  Silly, but shouldn't happen often. */
 	list_add(&jeb->list, &c->erasing_list);
 	spin_unlock(&c->erase_completion_lock);
-	up(&c->erase_free_sem);
 	jffs2_erase_failed(c, jeb, bad_offset);
 	return;
=20
 refile:
 	/* Stick it back on the list from whence it came and come back later */
 	jffs2_erase_pending_trigger(c);
-	down(&c->erase_free_sem);
 	spin_lock(&c->erase_completion_lock);
 	list_add(&jeb->list, &c->erase_complete_list);
 	spin_unlock(&c->erase_completion_lock);
-	up(&c->erase_free_sem);
 	return;
 }
--=20
1.5.0.6


--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
