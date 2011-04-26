Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QEdpL-0007bl-Dj
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2011 08:41:00 +0000
Received: by eyh6 with SMTP id 6so130684eyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Apr 2011 01:40:57 -0700 (PDT)
Subject: Re: ubiformat: libmt error (side effect from last Large Buffer
	Allocations patch)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefano Babic <sbabic@denx.de>
In-Reply-To: <4DB66CA3.2040906@denx.de>
References: <4DB66CA3.2040906@denx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 Apr 2011 11:37:23 +0300
Message-ID: <1303807043.2778.45.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Grant Erickson <marathon96@gmail.com>, linux-mtd@lists.infradead.org,
	Bastian Ruppert <bastian.ruppert@sewerin.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, 2011-04-26 at 08:56 +0200, Stefano Babic wrote:
> Hi,
> 
> I have seen a side effect introduced with Grant's patch. I have applied
> the patchset and this fix the allocation problem in kernel.

I think it would be great to actually CC grant :-) So, this e-mail is
about this patch:

http://lists.infradead.org/pipermail/linux-mtd/2011-April/034818.html

Grant, the original e-mail from Stefano:
http://lists.infradead.org/pipermail/linux-mtd/2011-April/035190.html

> However, the result lenght can be an odd multiple of the minimum I/O
> size, and when there is not enough memory available, the introduced
> mtd_malloc_up_to_size() tries to allocate half the amount of requested
> size, getting a buffer not aligned with the minimum I/O size. The result
> is that the test in nand_base.c for the alignment fails:

Good catch! Shame on me to not foresee this issue. Thanks for reporting!

> IMHO mtd_malloc_up_to_size() must allocate a buffer aligned with the
> minimum I/O size. What about adding the I/O size as parameter to
> mtd_malloc_up_to_size, so the function will return always an aligned
> buffer ?

Yes, I think this is the right solution. I've cooked the following
patch, compile-tested only - please review and test.


>From 18d93dac176025defd5711b429acd91ef8563a9a Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Tue, 26 Apr 2011 11:42:10 +0300
Subject: [PATCH] mtd: a fix candidate for mtd_kmalloc_up_to

This is a fix candidate for the problem reported here:

http://lists.infradead.org/pipermail/linux-mtd/2011-April/035190.html

If it is OK, we'll need to fold it to Grant's patches and add
credits to Stefano Babic <sbabic@denx.de> there, probably in form of a
"Tested-by:" tag.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/mtdchar.c   |    4 ++--
 drivers/mtd/mtdcore.c   |   28 ++++++++++++++++++----------
 fs/jffs2/scan.c         |    2 +-
 include/linux/mtd/mtd.h |    2 +-
 4 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 9301464..7b7f992 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -203,7 +203,7 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 	if (!count)
 		return 0;
 
-	kbuf = mtd_kmalloc_up_to(&size);
+	kbuf = mtd_kmalloc_up_to(mtd, &size);
 	if (!kbuf)
 		return -ENOMEM;
 
@@ -289,7 +289,7 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
 	if (!count)
 		return 0;
 
-	kbuf = mtd_kmalloc_up_to(&size);
+	kbuf = mtd_kmalloc_up_to(mtd, &size);
 	if (!kbuf)
 		return -ENOMEM;
 
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 6f720cc..a50348b 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -651,6 +651,9 @@ int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
  * ask the memory allocator to avoid re-trying, swapping, writing back
  * or performing I/O.
  *
+ * Note, this function also makes sure that the allocated buffer is aligned to
+ * the MTD device's min. I/O unit, i.e. the "mtd->writesize" value.
+ *
  * This is called, for example by mtd_{read,write} and jffs2_scan_medium,
  * to handle smaller (i.e. degraded) buffer allocations under low- or
  * fragmented-memory situations where such reduced allocations, from a
@@ -658,24 +661,29 @@ int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
  *
  * Returns a pointer to the allocated buffer on success; otherwise, NULL.
  */
-void *mtd_kmalloc_up_to(size_t *size)
+void *mtd_kmalloc_up_to(const struct mtd_info *mtd, size_t *size)
 {
 	gfp_t flags = __GFP_NOWARN | __GFP_WAIT |
 		       __GFP_NORETRY | __GFP_NO_KSWAPD;
-	size_t try;
+	size_t min_alloc = max_t(size_t, mtd->writesize, PAGE_SIZE);
 	void *kbuf;
 
-	try = min_t(size_t, *size, KMALLOC_MAX_SIZE);
+	*size = min_t(size_t, *size, KMALLOC_MAX_SIZE);
 
-	do {
-		if (try <= PAGE_SIZE)
-			flags = GFP_KERNEL;
+	while (*size > min_alloc) {
+		kbuf = kmalloc(*size, flags);
+		if (kbuf)
+			return kbuf;
 
-		kbuf = kmalloc(try, flags);
-	} while (!kbuf && ((try >>= 1) >= PAGE_SIZE));
+		*size >>= 1;
+		*size = ALIGN(*size, mtd->writesize);
+	}
 
-	*size = try;
-	return kbuf;
+	/*
+	 * For the last resort allocation allow 'kmalloc()' to do all sorts of
+	 * things (write-back, dropping caches, etc) by using GFP_KERNEL.
+	 */
+	return kmalloc(*size, GFP_KERNEL);
 }
 
 EXPORT_SYMBOL_GPL(add_mtd_device);
diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index e393213..8d8cd34 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -120,7 +120,7 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 		D1(printk(KERN_DEBUG "Trying to allocate readbuf of %zu "
 			"bytes\n", try_size));
 
-		flashbuf = mtd_kmalloc_up_to(&try_size);
+		flashbuf = mtd_kmalloc_up_to(c->mtd, &try_size);
 		if (!flashbuf)
 			return -ENOMEM;
 
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index a5d31ba..06b489a 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -348,7 +348,7 @@ int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 int default_mtd_readv(struct mtd_info *mtd, struct kvec *vecs,
 		      unsigned long count, loff_t from, size_t *retlen);
 
-void *mtd_kmalloc_up_to(size_t *size);
+void *mtd_kmalloc_up_to(const struct mtd_info *mtd, size_t *size);
 
 #ifdef CONFIG_MTD_PARTITIONS
 void mtd_erase_callback(struct erase_info *instr);
-- 
1.7.2.3



-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
