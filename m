Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIsZF-0001oC-Jf
 for linux-mtd@lists.infradead.org; Thu, 08 Jun 2017 08:13:23 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Subject: [PATCH 3/7] mtd: use class_groups instead of class_attrs
Date: Thu,  8 Jun 2017 10:12:38 +0200
Message-Id: <20170608081242.27061-4-gregkh@linuxfoundation.org>
In-Reply-To: <20170608081242.27061-1-gregkh@linuxfoundation.org>
References: <20170608081242.27061-1-gregkh@linuxfoundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The class_attrs pointer is long depreciated, and is about to be finally
removed, so move to use the class_groups pointer instead.

Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
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
