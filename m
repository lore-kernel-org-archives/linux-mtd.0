Received: from ms-smtp-01.nyroc.rr.com ([24.92.226.148])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AAcK6-00019t-CS
	for <linux-mtd@lists.infradead.org>; Fri, 17 Oct 2003 22:39:50 +0100
From: "Dave Ellis" <dge@sixnetio.com>
To: "'Ingo Flaschberger'" <if@sil.at>
Date: Fri, 17 Oct 2003 17:39:16 -0400
Message-ID: <00512BA4F9D3D311912A009027E9B8F407E54C@nt.sixnet.com>
MIME-Version: 1.0
In-Reply-To: <Pine.GSO.4.56.0310100453520.19931@ikarus.sil.at>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: kmalloc jffs2_do_mount_fs 
Reply-To: dge@sixnetio.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-10-10 at 05:13 +0200, Ingo Flaschberger wrote:
> kmalloc does not give you more than 128k (only i you "hack" it).
> jffs2 with a filesystem about 40Mb need more when mounting..
> to fix this.. i have luckily found a patch at the list:
>
http://lists.infradead.org/pipermail/linux-mtd/2002-December/006577.html

As David pointed out in his reply to my original post, the corresponding
kfree() needs to change to vfree(). I am including an updated patch
that does that. It is clean against current CVS, but I have only tested
it with my code, which is nowhere near current.

I am still using this patch since I have questions about possible
problems
with the virtual blocks. The virtual block size depends on the size of a
kernel
structure that can change and may differ for some architectures. If the
flash
is removable, it may be unusable when moved to a different system. Even
if it is not removable (mine isn't for now) a newer kernel could break
it.

It also complicates building images with mkfs.jffs2, since the block
size depends on the size of the partition. With vmalloc() I can use the
same image for any flash with the same erase size.

Also, with NAND flash, I don't see how to determine the virtual block
size when loading an image. I use U-Boot to erase the flash and load 
the image. It is not clear how the clean markers interact with virtual
blocks or what should it do when one of erase blocks in a virtual block
is bad.

Dave Ellis

diff -Naur kmalloc/build.c vmalloc/build.c
--- kmalloc/build.c	Wed Oct 15 10:03:20 2003
+++ vmalloc/build.c	Wed Oct 15 10:48:34 2003
@@ -286,7 +286,7 @@
 
 	c->free_size = c->flash_size;
 	c->nr_blocks = c->flash_size / c->sector_size;
-	c->blocks = kmalloc(sizeof(struct jffs2_eraseblock) *
c->nr_blocks, GFP_KERNEL);
+	c->blocks = vmalloc(sizeof(struct jffs2_eraseblock) *
c->nr_blocks);
 	if (!c->blocks)
 		return -ENOMEM;
 	for (i=0; i<c->nr_blocks; i++) {
@@ -325,7 +325,7 @@
 		D1(printk(KERN_DEBUG "build_fs failed\n"));
 		jffs2_free_ino_caches(c);
 		jffs2_free_raw_node_refs(c);
-		kfree(c->blocks);
+		vfree(c->blocks);
 		return -EIO;
 	}
 
diff -Naur kmalloc/fs.c vmalloc/fs.c
--- kmalloc/fs.c	Wed Oct 15 10:03:20 2003
+++ vmalloc/fs.c	Wed Oct 15 10:48:34 2003
@@ -444,8 +444,6 @@
 	 * to reduce the memorysize for c->blocks. (kmalloc allows max.
128K allocation)
 	 */
 	blocks = c->flash_size / c->mtd->erasesize;
-	while ((blocks * sizeof (struct jffs2_eraseblock)) > (128 *
1024))
-		blocks >>= 1;
 	
 	c->sector_size = c->flash_size / blocks;
 	if (c->sector_size != c->mtd->erasesize)
@@ -506,7 +504,7 @@
  out_nodes:
 	jffs2_free_ino_caches(c);
 	jffs2_free_raw_node_refs(c);
-	kfree(c->blocks);
+	vfree(c->blocks);
  out_inohash:
 	kfree(c->inocache_list);
  out_wbuf:
diff -Naur kmalloc/super-v24.c vmalloc/super-v24.c
--- kmalloc/super-v24.c	Wed Oct 15 10:03:21 2003
+++ vmalloc/super-v24.c	Wed Oct 15 10:48:34 2003
@@ -89,7 +89,7 @@
 	up(&c->alloc_sem);
 	jffs2_free_ino_caches(c);
 	jffs2_free_raw_node_refs(c);
-	kfree(c->blocks);
+	vfree(c->blocks);
 	jffs2_nand_flash_cleanup(c);
 	kfree(c->inocache_list);
 	if (c->mtd->sync)
diff -Naur kmalloc/super.c vmalloc/super.c
--- kmalloc/super.c	Wed Oct 15 10:03:21 2003
+++ vmalloc/super.c	Wed Oct 15 10:48:34 2003
@@ -264,7 +264,7 @@
 	up(&c->alloc_sem);
 	jffs2_free_ino_caches(c);
 	jffs2_free_raw_node_refs(c);
-	kfree(c->blocks);
+	vfree(c->blocks);
 	jffs2_nand_flash_cleanup(c);
 	kfree(c->inocache_list);
 	if (c->mtd->sync)
 
