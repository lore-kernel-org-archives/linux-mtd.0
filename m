Received: from xes-mad.com ([216.165.139.214])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J2Em5-0004oe-Pc
	for linux-mtd@lists.infradead.org; Tue, 11 Dec 2007 23:44:36 +0000
Message-ID: <475F20DE.8010507@xes-inc.com>
Date: Tue, 11 Dec 2007 17:44:30 -0600
From: David Scidmore <dscidmore@xes-inc.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] mtdchar.c: ioctl always returns 0 as size written for
	ppc64
Content-Type: multipart/mixed; boundary="------------030407000403060500030904"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------030407000403060500030904
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


"include/linux/mtd/mtd.h" declares "mtd_oob_ops.retlen" as size_t, which 
is 64 bits on targets with a 64 bit addressing. The MEMWRITEOOB ioctl 
calls copy_to_user() to write it back to "mtd_oob_buf.length", which is 
declared in "include/linux/mtd-abi.h" as uint32_t. Since powerpc is a 
big endian architecture, this only copies the upper 32 bits of the 
address, which is always 0.

Signed-off-by: David Scidmore <dscidmore at xes-inc.com>

------

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 22ed96c..bfc0958 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -483,6 +482,7 @@ static int mtd_ioctl(struct inode *inode, struct 
file *file,
     {
         struct mtd_oob_buf buf;
         struct mtd_oob_ops ops;
+            uint32_t retlen;
 
         if(!(file->f_mode & 2))
             return -EPERM;
@@ -522,8 +522,12 @@ static int mtd_ioctl(struct inode *inode, struct 
file *file,
         buf.start &= ~(mtd->oobsize - 1);
         ret = mtd->write_oob(mtd, buf.start, &ops);
 
-        if (copy_to_user(argp + sizeof(uint32_t), &ops.oobretlen,
-                 sizeof(uint32_t)))
+        if (ops.oobretlen > 0xFFFFFFFFU)
+            ret = -EOVERFLOW;
+        retlen = ops.oobretlen;
+        if (copy_to_user(&((struct mtd_oob_buf *)argp)->length,
+                 &retlen,
+                 sizeof(buf.length)))
             ret = -EFAULT;
 
         kfree(ops.oobbuf);


-- 
David Scidmore
Quality Manager
Extreme Engineering Solutions
608-833-1155 ext 101
www.xes-inc.com



--------------030407000403060500030904
Content-Type: text/plain;
 name="mtdchar.c.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mtdchar.c.patch"

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 22ed96c..bfc0958 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -483,6 +482,7 @@ static int mtd_ioctl(struct inode *inode, struct file *file,
 	{
 		struct mtd_oob_buf buf;
 		struct mtd_oob_ops ops;
+	        uint32_t retlen;
 
 		if(!(file->f_mode & 2))
 			return -EPERM;
@@ -522,8 +522,12 @@ static int mtd_ioctl(struct inode *inode, struct file *file,
 		buf.start &= ~(mtd->oobsize - 1);
 		ret = mtd->write_oob(mtd, buf.start, &ops);
 
-		if (copy_to_user(argp + sizeof(uint32_t), &ops.oobretlen,
-				 sizeof(uint32_t)))
+		if (ops.oobretlen > 0xFFFFFFFFU)
+			ret = -EOVERFLOW;
+		retlen = ops.oobretlen;
+		if (copy_to_user(&((struct mtd_oob_buf *)argp)->length,
+				 &retlen,
+				 sizeof(buf.length)))
 			ret = -EFAULT;
 
 		kfree(ops.oobbuf);

--------------030407000403060500030904--
