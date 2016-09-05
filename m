Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgvsD-00060M-Ug
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 15:31:51 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 1/6] UBI: dissociate the on-flash format version and the
 userspace ABI version
Date: Mon,  5 Sep 2016 17:31:22 +0200
Message-Id: <1473089487-29285-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1473089487-29285-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1473089487-29285-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All user-space tools are currently testing the /sys/class/ubi/version value
to make sure they can interact with the in-kernel layer.
They actually don't care about the on-flash format version since this field
is attached to the UBI subsystem and not to each UBI device instance
(theoretically, each instance could have it's own on-flash format version).
All they care about is whether they are able to use the ioctl they know
about.

Create a new UBI_ABI_VERSION to expose the the ABI version instead of
using the UBI_VERSION value which is about to be increased to support
MLC devices.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/ubi/build.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 45ea1ddebc5c..914fcf07b573 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -103,11 +103,13 @@ DEFINE_MUTEX(ubi_devices_mutex);
 /* Protects @ubi_devices and @ubi->ref_count */
 static DEFINE_SPINLOCK(ubi_devices_lock);
 
+#define UBI_ABI_VERSION		1
+
 /* "Show" method for files in '/<sysfs>/class/ubi/' */
 static ssize_t ubi_version_show(struct class *class,
 				struct class_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%d\n", UBI_VERSION);
+	return sprintf(buf, "%d\n", UBI_ABI_VERSION);
 }
 
 /* UBI version attribute ('/<sysfs>/class/ubi/version') */
@@ -1490,7 +1492,7 @@ MODULE_PARM_DESC(fm_autoconvert, "Set this parameter to enable fastmap automatic
 module_param(fm_debug, bool, 0);
 MODULE_PARM_DESC(fm_debug, "Set this parameter to enable fastmap debugging by default. Warning, this will make fastmap slow!");
 #endif
-MODULE_VERSION(__stringify(UBI_VERSION));
+MODULE_VERSION(__stringify(UBI_ABI_VERSION));
 MODULE_DESCRIPTION("UBI - Unsorted Block Images");
 MODULE_AUTHOR("Artem Bityutskiy");
 MODULE_LICENSE("GPL");
-- 
2.7.4
