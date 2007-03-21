Received: from mtagate2.de.ibm.com ([195.212.29.151])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HU3Wl-0002M9-B1
	for linux-mtd@lists.infradead.org; Wed, 21 Mar 2007 16:19:11 +0000
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate2.de.ibm.com (8.13.8/8.13.8) with ESMTP id l2LGIwQs055332
	for <linux-mtd@lists.infradead.org>; Wed, 21 Mar 2007 16:18:58 GMT
Received: from d12av01.megacenter.de.ibm.com (d12av01.megacenter.de.ibm.com
	[9.149.165.212])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.3) with
	ESMTP id l2LGIvfa1949878
	for <linux-mtd@lists.infradead.org>; Wed, 21 Mar 2007 17:18:57 +0100
Received: from d12av01.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av01.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l2LGIvC2009743
	for <linux-mtd@lists.infradead.org>; Wed, 21 Mar 2007 17:18:57 +0100
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: Artem.Bityutskiy@nokia.com,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] UBI: rename major_to_info()
Date: Wed, 21 Mar 2007 17:18:50 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200703211718.50407.alexs@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The patch renames major_to_info() to major_to_device() to match the new
struct ubi_device.

Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>
---
 drivers/mtd/ubi/cdev.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

--- dedekind-ubi-2.6.orig/drivers/mtd/ubi/cdev.c
+++ dedekind-ubi-2.6/drivers/mtd/ubi/cdev.c
@@ -50,12 +50,12 @@
 #endif
 
 /**
- * major_to_info - get UBI device object by character device major number.
+ * major_to_device - get UBI device object by character device major number.
  * @major: major number
  *
- * This function returns a pointer to the UBI description object.
+ * This function returns a pointer to the UBI device object.
  */
-static struct ubi_device *major_to_info(int major)
+static struct ubi_device *major_to_device(int major)
 {
 	int i;
 
@@ -124,7 +124,7 @@ static void revoke_exclusive(struct ubi_
 static int vol_cdev_open(struct inode *inode, struct file *file)
 {
 	struct ubi_volume_desc *desc;
-	const struct ubi_device *ubi = major_to_info(imajor(inode));
+	const struct ubi_device *ubi = major_to_device(imajor(inode));
 	int vol_id = iminor(inode) - 1;
 	int mode;
 
@@ -660,7 +660,7 @@ static int ubi_cdev_ioctl(struct inode *
 		return -EPERM;
 	}
 
-	ubi = major_to_info(imajor(inode));
+	ubi = major_to_device(imajor(inode));
 	if (IS_ERR(ubi))
 		return PTR_ERR(ubi);
 
