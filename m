Received: from rrcs-nys-24-97-130-2.biz.rr.com
	([24.97.130.2] helo=nt.sixnet.com ident=fwuser)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Je2R-0008OS-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2002 18:14:23 +0000
Message-ID: <00512BA4F9D3D311912A009027E9B8F407E4A3@NT>
From: Dave Ellis <DGE@sixnetio.com>
To: 'Ken Offer' <koffer@arlut.utexas.edu>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: RE: Problem: 51MB partition max size on jffs2
Date: Wed, 4 Dec 2002 13:44:54 -0500 
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wednesday 04 December 2002 17:54, Ken Offer wrote:
> I've got a Toshiba 128MB Smart Card in my embedded system and I wrote a 
> custom nand driver to support it.  I have discovered that I cannot 
> mount a jffs2 partition larger than 51MB on the card (so at this point 
> I have two 51MB partitions and 1 26MB partition).  Trying to mount a 
> larger partition yields a less than helpful error message from mount.  

I had the same problem a few weeks ago, and this patch seems
to solve it:

--- dist/fs/jffs2/build.c	Mon Sep  9 12:29:08 2002
+++ curr/fs/jffs2/build.c	Mon Nov 18 14:18:29 2002
@@ -211,7 +211,8 @@
 
 	c->free_size = c->flash_size;
 	c->nr_blocks = c->flash_size / c->sector_size;
-	c->blocks = kmalloc(sizeof(struct jffs2_eraseblock) * c->nr_blocks,
GFP_KERNEL);
+	/* kmalloc fails for large NAND since can't get more than 128K */
+	c->blocks = vmalloc(sizeof(struct jffs2_eraseblock) * c->nr_blocks);
 	if (!c->blocks)
 		return -ENOMEM;
 	for (i=0; i<c->nr_blocks; i++) {

kmalloc() is limited to 128K and the 128MB Flash needs more than twice that,

so I tried vmalloc() and it seems to be OK (at least with PPC 2.4.18 
patched for the new MTD code). Does anyone know if this change is safe?

Dave
