Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIQDb-0004aI-A8
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 08:30:30 -0400
Message-ID: <4332A3E8.8020002@mw-itcon.de>
Date: Thu, 22 Sep 2005 14:30:32 +0200
From: Peter Menzebach <pm@mw-itcon.de>
MIME-Version: 1.0
To: Peter Menzebach <pm-mtd@mw-itcon.de>,
	"Artem B. Bityuckiy" <dedekind@yandex.ru>,
	Andrew Victor <andrew@sanpeople.com>
References: <432812E8.2030807@mw-itcon.de>
In-Reply-To: <432812E8.2030807@mw-itcon.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: data  loss on jffs2 filesystem on dataflash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter Menzebach wrote:
> Hi,
> I loose files, which I write on a jffs2 filesystem.
> 
> I start with a freshly erased mtd partition. Then I start the following 
> sequence:
> 
> mount /conf
> echo aaa > /conf/aaa
> echo aaa > /conf/aaa
> umount /conf
> mount /conf
> 
> After remounting, the file gets lost (I think because the GC removes the 
> inode). I use kernel 2.6.13 with mtd out of cvs of today.
> The machine is a AT91RM9200 with a serial dataflash. I used already
> jffs2 (most time readonly) as rootfs here for months without problems. 
> The only specialty is, that the dataflash has a unfamiliar erase size of 
> 8448 bytes.
> 
OK guys,
here we are with a patch for it. I made several tests now with
wbuf->pagesize of 1056 and 8*1056 and erase size of 8*1056 and it looks
good so far.

Open is now the question, if we should implement a possibility to adjust
the wbuf_pagesize independently from the jffs2 sectorsize. For my
purposes I can live with a wbuf_size = jffs2 sector_size = 8*1056, but
if we find a nice solution, I would implement it...

IMHO the cleanest solution would be, that the dataflash/mtd layer
reports it's true erase_size = smallest write size = 528/1056 bytes, and
should not make a further guess about later use.

JFFS2 now recognizes, that it can't work with this parameters, and
should adjust it to multiples of the size internally.

Please comment to patch and how to proceed...

Best regards
Peter

P.S. Sry I can't manage to send the patch as attachment. (it get's 
rejected by the mailing list)

diff -urN mtda/fs/jffs2/nodelist.c mtdb/fs/jffs2/nodelist.c
--- mtda/fs/jffs2/nodelist.c	2005-09-22 13:47:32.000000000 +0200
+++ mtdb/fs/jffs2/nodelist.c	2005-09-22 13:44:50.000000000 +0200
@@ -412,7 +412,7 @@

  	/* Calculate how many bytes were already checked */
  	ofs = ref_offset(ref) + sizeof(struct jffs2_raw_inode);
-	len = ofs & (c->wbuf_pagesize - 1);
+	len = ofs % c->wbuf_pagesize;
  	if (likely(len))
  		len = c->wbuf_pagesize - len;

diff -urN mtda/fs/jffs2/os-linux.h mtdb/fs/jffs2/os-linux.h
--- mtda/fs/jffs2/os-linux.h	2005-09-22 13:47:36.000000000 +0200
+++ mtdb/fs/jffs2/os-linux.h	2005-09-22 13:44:53.000000000 +0200
@@ -65,8 +65,12 @@

  #define jffs2_is_readonly(c) (OFNI_BS_2SFFJ(c)->s_flags & MS_RDONLY)

-#ifndef CONFIG_JFFS2_FS_WRITEBUFFER
+/*
  #define SECTOR_ADDR(x) ( ((unsigned long)(x) & ~(c->sector_size-1)) )
+*/
+#ifndef CONFIG_JFFS2_FS_WRITEBUFFER
+#define SECTOR_ADDR(x) ( (((unsigned long)(x) / c->sector_size) * 
c->sector_size) )
+

  #ifdef CONFIG_JFFS2_SUMMARY
  #define jffs2_can_mark_obsolete(c) (0)
diff -urN mtda/fs/jffs2/scan.c mtdb/fs/jffs2/scan.c
--- mtda/fs/jffs2/scan.c	2005-09-22 13:47:32.000000000 +0200
+++ mtdb/fs/jffs2/scan.c	2005-09-22 13:44:50.000000000 +0200
@@ -233,12 +233,12 @@
  		c->nextblock->dirty_size = 0;
  	}
  #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
-	if (!jffs2_can_mark_obsolete(c) && c->nextblock && 
(c->nextblock->free_size & (c->wbuf_pagesize-1))) {
+	if (!jffs2_can_mark_obsolete(c) && c->nextblock && 
(c->nextblock->free_size % c->wbuf_pagesize)) {
  		/* If we're going to start writing into a block which already
  		   contains data, and the end of the data isn't page-aligned,
  		   skip a little and align it. */

-		uint32_t skip = c->nextblock->free_size & (c->wbuf_pagesize-1);
+		uint32_t skip = c->nextblock->free_size % c->wbuf_pagesize;

  		D1(printk(KERN_DEBUG "jffs2_scan_medium(): Skipping %d bytes in 
nextblock to ensure page alignment\n",
  			  skip));
diff -urN mtda/fs/jffs2/wbuf.c mtdb/fs/jffs2/wbuf.c
--- mtda/fs/jffs2/wbuf.c	2005-09-22 13:47:32.000000000 +0200
+++ mtdb/fs/jffs2/wbuf.c	2005-09-22 13:44:50.000000000 +0200
@@ -28,12 +28,12 @@
  static unsigned char *brokenbuf;
  #endif

+#define PAGE_DIV(x) ( ((unsigned long)(x) / (unsigned 
long)(c->wbuf_pagesize)) * (unsigned long)(c->wbuf_pagesize) )
+#define PAGE_MOD(x) ( (unsigned long)(x) % (unsigned 
long)(c->wbuf_pagesize) )
+
  /* max. erase failures before we mark a block bad */
  #define MAX_ERASE_FAILURES 	2

-/* two seconds timeout for timed wbuf-flushing */
-#define WBUF_FLUSH_TIMEOUT	2 * HZ
-
  struct jffs2_inodirty {
  	uint32_t ino;
  	struct jffs2_inodirty *next;
@@ -434,7 +434,7 @@
  	   if we have a switch to next page, we will not have
  	   enough remaining space for this.
  	*/
-	if (pad && !jffs2_dataflash(c)) {
+	if (pad ) {
  		c->wbuf_len = PAD(c->wbuf_len);

  		/* Pad with JFFS2_DIRTY_BITMASK initially.  this helps out ECC'd NOR
@@ -483,9 +483,9 @@
  	}

  	spin_lock(&c->erase_completion_lock);
-
+		
  	/* Adjust free size of the block if we padded. */
-	if (pad && !jffs2_dataflash(c)) {
+	if (pad) {
  		struct jffs2_eraseblock *jeb;

  		jeb = &c->blocks[c->wbuf_ofs / c->sector_size];
@@ -602,15 +602,6 @@

  	return ret;
  }
-
-#ifdef CONFIG_JFFS2_FS_WRITEBUFFER
-#define PAGE_DIV(x) ( ((unsigned long)(x) / (unsigned 
long)(c->wbuf_pagesize)) * (unsigned long)(c->wbuf_pagesize) )
-#define PAGE_MOD(x) ( (unsigned long)(x) % (unsigned 
long)(c->wbuf_pagesize) )
-#else
-#define PAGE_DIV(x) ( (x) & (~(c->wbuf_pagesize - 1)) )
-#define PAGE_MOD(x) ( (x) & (c->wbuf_pagesize - 1) )
-#endif
-
  int jffs2_flash_writev(struct jffs2_sb_info *c, const struct kvec 
*invecs, unsigned long count, loff_t to, size_t *retlen, uint32_t ino)
  {
  	struct kvec outvecs[3];
@@ -654,7 +645,7 @@
  	   erase block. Anything else, and you die.
  	   New block starts at xxx000c (0-b = block header)
  	*/
-	if (SECTOR_ADDR(to) != SECTOR_ADDR(c->wbuf_ofs)) {
+	if (PAGE_DIV(to) != PAGE_DIV(c->wbuf_ofs)) {
  		/* It's a write to a new block */
  		if (c->wbuf_len) {
  			D1(printk(KERN_DEBUG "jffs2_flash_writev() to 0x%lx causes flush of 
wbuf at 0x%08x\n", (unsigned long)to, c->wbuf_ofs));
@@ -905,7 +896,7 @@
  		goto exit;

  	/* if we read in a different block, return */
-	if (SECTOR_ADDR(ofs) != SECTOR_ADDR(c->wbuf_ofs))
+	if (PAGE_DIV(ofs) != PAGE_DIV(c->wbuf_ofs))
  		goto exit;

  	if (ofs >= c->wbuf_ofs) {
@@ -1104,7 +1095,7 @@
  		return 0;

  	if (!c->mtd->block_markbad)
-		return 1; // What else can we do?
+		return 1;

  	D1(printk(KERN_WARNING "jffs2_write_nand_badblock(): Marking bad 
block at %08x\n", bad_offset));
  	ret = c->mtd->block_markbad(c->mtd, bad_offset);
diff -urN mtda/drivers/mtd/mtdpart.c mtdb/drivers/mtd/mtdpart.c
--- mtda/drivers/mtd/mtdpart.c	2005-02-08 18:11:13.000000000 +0100
+++ mtdb/drivers/mtd/mtdpart.c	2005-09-14 13:20:18.000000000 +0200
@@ -465,8 +465,9 @@
  		if (slave->offset == MTDPART_OFS_APPEND)
  			slave->offset = cur_offset;
  		if (slave->offset == MTDPART_OFS_NXTBLK) {
-			u_int32_t emask = master->erasesize-1;
-			slave->offset = (cur_offset + emask) & ~emask;
+			slave->offset = cur_offset;
+			if ((cur_offset % master->erasesize) != 0)
+				slave->offset = ((cur_offset / master->erasesize) + 1) * 
master->erasesize;
  			if (slave->offset != cur_offset) {
  				printk(KERN_NOTICE "Moving partition %d: "
  				       "0x%08x -> 0x%08x\n", i,
