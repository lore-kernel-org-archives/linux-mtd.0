Received: from ernst.netinsight.se ([212.247.11.2])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHo7P-00054Y-9W
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 15:49:43 -0400
Message-ID: <433067BF.6080909@users.sourceforge.net>
Date: Tue, 20 Sep 2005 21:49:19 +0200
From: Anders Grafstrom <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <E1EHjUk-0001IT-Dn@phoenix.infradead.org>	<43303409.5030406@users.sourceforge.net>
	<43303D59.1040805@yandex.ru>
In-Reply-To: <43303D59.1040805@yandex.ru>
Content-Type: multipart/mixed; boundary="------------010504040501040307020003"
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/fs/jffs2 erase.c,1.84,1.85 roll back
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------010504040501040307020003
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Artem B. Bityutskiy wrote:
> Let's analyse the situation.
> 
> JFFS2 issues the erase command, MTD returns OK, but the eraseblock does 
> not contain all 0xFFs. Is this JFFS2's fault? No. this is driver's 
> fault. The driver must not return success in this case. It must return 
> an error.
> 
> And the check in JFFS2 that the eraseblock contains all FFs is *wrong*. 
> That's not JFFS2's business at all. That's MTD's business. MTD 
> guarantees that it either erases the eraseblock or returns error. My 
> oppinion is that this check must go to MTD. Perhaps, you may embrace it 
> by #ifdefs - this is the implementation detal.
> 
> So, JFFS2 does what it is not supposed to do at all. It slows down 
> things by this. I wanted to remove the check, but dwmw2 loudly 
> complained. He wants to be as reliable as it is possible.
It would be nice if the MTD layer could be trusted :)

> Ok, now about the rollback. If we return -EIO, JFFS2 will mark the block 
> as bad. Imagine your driver is broken, and the block is not actually 
> bad. That's just driver. JFFS2 will mark nearly all eraseblocks as bad. 
> What will you do next? In case of NAND, this assumes you're in trouble 
> unless you have a list of real bad blocks.
> 
> So, this is why I rolled back. Probably the right approach will be to 
> add such blocks to the JFFS2 in-RAM bad block list but not mark them as 
> bad physically. But this is a distinct activity. I didn't explore this.
> 
> That "fix" slipped there accidentally. I didn't test it. So I removed 
> it. If you are energetic enough, work this problem out please :-)
> 

So if we return -EIO, then we go to jffs2_erase_failed(). For NAND, if 
the MTD driver reported erase failure (bad_offset != 0xffffffff), a 
retry is made before giving up on the block and marking it bad. Also the 
read operation may have failed, erase may have failed and MTD missed it, 
write of clean marker may have failed. As it is these cases will put the 
block on the bad_list. In the case of NOR it will also be put on the 
bad_list at once.
But how about retrying for all of these cases?

I'm thinking something like this patch...
(It does not make sure that it was a device level failure that occurred 
two times before marking NAND blocks bad physically. So it's flawed.)

--------------010504040501040307020003
Content-Type: text/plain;
 name="erase_retry.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="erase_retry.patch"

Index: mtd/fs/jffs2/erase.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/erase.c,v
retrieving revision 1.85
diff -u -r1.85 erase.c
--- mtd/fs/jffs2/erase.c	20 Sep 2005 14:53:15 -0000	1.85
+++ mtd/fs/jffs2/erase.c	20 Sep 2005 19:31:58 -0000
@@ -20,6 +20,9 @@
 #include <linux/pagemap.h>
 #include "nodelist.h"
 
+/* max. erase failures before we mark a block bad */
+#define MAX_ERASE_FAILURES 	2
+
 struct erase_priv_struct {
 	struct jffs2_eraseblock *jeb;
 	struct jffs2_sb_info *c;
@@ -171,24 +174,24 @@
 
 static void jffs2_erase_failed(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb, uint32_t bad_offset)
 {
-	/* For NAND, if the failure did not occur at the device level for a
-	   specific physical page, don't bother updating the bad block table. */
-	if (jffs2_cleanmarker_oob(c) && (bad_offset != 0xffffffff)) {
-		/* We had a device-level failure to erase.  Let's see if we've
-		   failed too many times. */
-		if (!jffs2_write_nand_badblock(c, jeb, bad_offset)) {
-			/* We'd like to give this block another try. */
-			spin_lock(&c->erase_completion_lock);
-			list_del(&jeb->list);
-			list_add(&jeb->list, &c->erase_pending_list);
-			c->erasing_size -= c->sector_size;
-			c->dirty_size += c->sector_size;
-			jeb->dirty_size = c->sector_size;
-			spin_unlock(&c->erase_completion_lock);
-			return;
-		}
+	if (++jeb->bad_count < MAX_ERASE_FAILURES) {
+		/* We'd like to give this block another try. */
+		printk(KERN_WARNING "Retrying erase at 0x%08x\n", jeb->offset);
+		spin_lock(&c->erase_completion_lock);
+		list_del(&jeb->list);
+		list_add(&jeb->list, &c->erase_pending_list);
+		c->erasing_size -= c->sector_size;
+		c->dirty_size += c->sector_size;
+		jeb->dirty_size = c->sector_size;
+		spin_unlock(&c->erase_completion_lock);
+		return;
 	}
 
+	/* For NAND, if the failure did occur at the device level for a
+	   specific physical page, update the bad block table. */
+	if (jffs2_cleanmarker_oob(c) && (bad_offset != 0xffffffff))
+		jffs2_write_nand_badblock(c, jeb, bad_offset);
+
 	spin_lock(&c->erase_completion_lock);
 	c->erasing_size -= c->sector_size;
 	c->bad_size += c->sector_size;
@@ -337,6 +340,7 @@
 			if (*datum + 1) {
 				*bad_offset += i;
 				printk(KERN_WARNING "Newly-erased block contained word 0x%lx at offset 0x%08x\n", *datum, *bad_offset);
+				ret = -EIO;
 				goto fail;
 			}
 		}
@@ -425,6 +429,8 @@
 		jeb->wasted_size = 0;
 	}
 
+	jeb->bad_count = 0;
+
 	spin_lock(&c->erase_completion_lock);
 	c->erasing_size -= c->sector_size;
 	c->free_size += jeb->free_size;
Index: mtd/fs/jffs2/wbuf.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/wbuf.c,v
retrieving revision 1.98
diff -u -r1.98 wbuf.c
--- mtd/fs/jffs2/wbuf.c	7 Sep 2005 08:34:55 -0000	1.98
+++ mtd/fs/jffs2/wbuf.c	20 Sep 2005 19:31:59 -0000
@@ -28,9 +28,6 @@
 static unsigned char *brokenbuf;
 #endif
 
-/* max. erase failures before we mark a block bad */
-#define MAX_ERASE_FAILURES 	2
-
 /* two seconds timeout for timed wbuf-flushing */
 #define WBUF_FLUSH_TIMEOUT	2 * HZ
 
@@ -1099,10 +1096,6 @@
 {
 	int 	ret;
 
-	/* if the count is < max, we try to write the counter to the 2nd page oob area */
-	if( ++jeb->bad_count < MAX_ERASE_FAILURES)
-		return 0;
-
 	if (!c->mtd->block_markbad)
 		return 1; // What else can we do?
 

--------------010504040501040307020003--
