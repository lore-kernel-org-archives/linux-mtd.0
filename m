Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LNmZD-000593-9n
	for linux-mtd@lists.infradead.org; Fri, 16 Jan 2009 11:08:50 +0000
Subject: Re: [PATCH] UBI: add ioctl compatibility
From: Artem Bityutskiy <dedekind@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <200901151734.23870.arnd@arndb.de>
References: <1232036381.25068.10.camel@localhost.localdomain>
	<200901151734.23870.arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 16 Jan 2009 13:08:58 +0200
Message-Id: <1232104138.25068.22.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-01-15 at 17:34 +0100, Arnd Bergmann wrote:
> On Thursday 15 January 2009, Artem Bityutskiy wrote:
> 
> > would you please glance if this patch all-right?
> 
> No, it's not. New ioctl numbers should not be added to fs/compat_ioctl.c
> but rather to the file that implements the file operations (ubi/cdev.c).

Thank you Arnd. Here is the corrected patch. Tested on x68_64 + 32-bit
UBI tools.

>From 8d1e92e1e277e3f9fb51491b248f3c6cbfc86083 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Fri, 16 Jan 2009 14:08:35 +0200
Subject: [PATCH] UBI: add ioctl compatibility

UBI ioctl's do not work when running 64-bit kernel and 32-bit
user-land. Fix this by adding the compat_ioctl method.

Also, UBI serializes all ioctls, so more than one ioctl at a time,
and UBI does not seem to depend on anything else, so use
unlocked_ioctl instead of ioctl (no BKL needed).

Reported-by: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/cdev.c |   41 ++++++++++++++++++++++-------------------
 1 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index a4a6e9a..c5f8a91 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -402,8 +402,8 @@ static ssize_t vol_cdev_write(struct file *file, const char __user *buf,
 	return count;
 }
 
-static int vol_cdev_ioctl(struct inode *inode, struct file *file,
-			  unsigned int cmd, unsigned long arg)
+static long vol_cdev_ioctl(struct file *file, unsigned int cmd,
+			   unsigned long arg)
 {
 	int err = 0;
 	struct ubi_volume_desc *desc = file->private_data;
@@ -803,8 +803,8 @@ out_free:
 	return err;
 }
 
-static int ubi_cdev_ioctl(struct inode *inode, struct file *file,
-			  unsigned int cmd, unsigned long arg)
+static long ubi_cdev_ioctl(struct file *file, unsigned int cmd,
+			   unsigned long arg)
 {
 	int err = 0;
 	struct ubi_device *ubi;
@@ -814,7 +814,7 @@ static int ubi_cdev_ioctl(struct inode *inode, struct file *file,
 	if (!capable(CAP_SYS_RESOURCE))
 		return -EPERM;
 
-	ubi = ubi_get_by_major(imajor(inode));
+	ubi = ubi_get_by_major(imajor(file->f_mapping->host));
 	if (!ubi)
 		return -ENODEV;
 
@@ -950,8 +950,8 @@ static int ubi_cdev_ioctl(struct inode *inode, struct file *file,
 	return err;
 }
 
-static int ctrl_cdev_ioctl(struct inode *inode, struct file *file,
-			   unsigned int cmd, unsigned long arg)
+static long ctrl_cdev_ioctl(struct file *file, unsigned int cmd,
+			    unsigned long arg)
 {
 	int err = 0;
 	void __user *argp = (void __user *)arg;
@@ -1029,24 +1029,27 @@ static int ctrl_cdev_ioctl(struct inode *inode, struct file *file,
 
 /* UBI control character device operations */
 const struct file_operations ubi_ctrl_cdev_operations = {
-	.ioctl = ctrl_cdev_ioctl,
-	.owner = THIS_MODULE,
+	.owner          = THIS_MODULE,
+	.unlocked_ioctl = ctrl_cdev_ioctl,
+	.compat_ioctl   = ctrl_cdev_ioctl,
 };
 
 /* UBI character device operations */
 const struct file_operations ubi_cdev_operations = {
-	.owner = THIS_MODULE,
-	.ioctl = ubi_cdev_ioctl,
-	.llseek = no_llseek,
+	.owner          = THIS_MODULE,
+	.llseek         = no_llseek,
+	.unlocked_ioctl = ubi_cdev_ioctl,
+	.compat_ioctl   = ubi_cdev_ioctl,
 };
 
 /* UBI volume character device operations */
 const struct file_operations ubi_vol_cdev_operations = {
-	.owner   = THIS_MODULE,
-	.open    = vol_cdev_open,
-	.release = vol_cdev_release,
-	.llseek  = vol_cdev_llseek,
-	.read    = vol_cdev_read,
-	.write   = vol_cdev_write,
-	.ioctl   = vol_cdev_ioctl,
+	.owner          = THIS_MODULE,
+	.open           = vol_cdev_open,
+	.release        = vol_cdev_release,
+	.llseek         = vol_cdev_llseek,
+	.read           = vol_cdev_read,
+	.write          = vol_cdev_write,
+	.unlocked_ioctl = vol_cdev_ioctl,
+	.compat_ioctl   = vol_cdev_ioctl,
 };
-- 
1.6.0.6



-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
