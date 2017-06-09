Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dJOL2-0001GO-FA
 for linux-mtd@lists.infradead.org; Fri, 09 Jun 2017 18:08:50 +0000
Subject: patch "mtd: use class_groups instead of class_attrs" added to
 driver-core-next
To: gregkh@linuxfoundation.org, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, cyrille.pitchen@wedev4u.fr, dedekind1@gmail.com,
 dwmw2@infradead.org, linux-mtd@lists.infradead.org, marek.vasut@gmail.com,
 richard@nod.at
From: <gregkh@linuxfoundation.org>
Date: Fri, 09 Jun 2017 20:08:14 +0200
Message-ID: <14970316944525@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This is a note to let you know that I've just added the patch titled

    mtd: use class_groups instead of class_attrs

to my driver-core git tree which can be found at
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
in the driver-core-next branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will also be merged in the next major kernel release
during the merge window.

If you have any questions about this process, please let me know.


>From 219eccdabb3a877d285b35b59cfeb242381f9d50 Mon Sep 17 00:00:00 2001
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 8 Jun 2017 10:12:38 +0200
Subject: mtd: use class_groups instead of class_attrs

The class_attrs pointer is long depreciated, and is about to be finally
removed, so move to use the class_groups pointer instead.

Cc: Artem Bityutskiy <dedekind1@gmail.com>
Acked-by: Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: <linux-mtd@lists.infradead.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/mtd/ubi/build.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 93e5d251a9e4..d854521962ef 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -104,23 +104,25 @@ DEFINE_MUTEX(ubi_devices_mutex);
 static DEFINE_SPINLOCK(ubi_devices_lock);
 
 /* "Show" method for files in '/<sysfs>/class/ubi/' */
-static ssize_t ubi_version_show(struct class *class,
-				struct class_attribute *attr, char *buf)
+/* UBI version attribute ('/<sysfs>/class/ubi/version') */
+static ssize_t version_show(struct class *class, struct class_attribute *attr,
+			    char *buf)
 {
 	return sprintf(buf, "%d\n", UBI_VERSION);
 }
+static CLASS_ATTR_RO(version);
 
-/* UBI version attribute ('/<sysfs>/class/ubi/version') */
-static struct class_attribute ubi_class_attrs[] = {
-	__ATTR(version, S_IRUGO, ubi_version_show, NULL),
-	__ATTR_NULL
+static struct attribute *ubi_class_attrs[] = {
+	&class_attr_version.attr,
+	NULL,
 };
+ATTRIBUTE_GROUPS(ubi_class);
 
 /* Root UBI "class" object (corresponds to '/<sysfs>/class/ubi/') */
 struct class ubi_class = {
 	.name		= UBI_NAME_STR,
 	.owner		= THIS_MODULE,
-	.class_attrs	= ubi_class_attrs,
+	.class_groups	= ubi_class_groups,
 };
 
 static ssize_t dev_attribute_show(struct device *dev,
-- 
2.13.1
