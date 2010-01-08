Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTGPW-0007xD-Jr
	for linux-mtd@lists.infradead.org; Fri, 08 Jan 2010 15:06:03 +0000
Received: by fxm22 with SMTP id 22so21921513fxm.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Jan 2010 07:05:57 -0800 (PST)
Subject: [PATCH 1/9] MTD: call remove notifiers before removing the device
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: linux-kernel <linux-kernel@vger.kernel.org>
In-Reply-To: <1262963092.12577.14.camel@maxim-laptop>
References: <1262963092.12577.14.camel@maxim-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 08 Jan 2010 17:05:54 +0200
Message-ID: <1262963154.12577.15.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: joern <joern@logfs.org>, linux-mtd <linux-mtd@lists.infradead.org>,
	Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 1855da2a21882c803e5dfcfb556fff5bc6989c31 Mon Sep 17 00:00:00 2001
From: Maxim Levitsky <maximlevitsky@gmail.com>
Date: Fri, 8 Jan 2010 15:14:20 +0200
Subject: [PATCH 1/9] MTD: call remove notifiers before removing the device

This is first step in implementing proper hotplug support.
Now all users of the mtd device have a chance to put the mtd device
when they are notified to do so, and they have to do so to make hotplug work.

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/mtdcore.c |   21 +++++++++++----------
 1 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index c356c0a..87ff83f 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -341,31 +341,32 @@ int add_mtd_device(struct mtd_info *mtd)
 int del_mtd_device (struct mtd_info *mtd)
 {
 	int ret;
+	struct mtd_notifier *not;
 
 	mutex_lock(&mtd_table_mutex);
 
 	if (mtd_table[mtd->index] != mtd) {
 		ret = -ENODEV;
-	} else if (mtd->usecount) {
+		goto out_error;
+	}
+
+	/* No need to get a refcount on the module containing
+		the notifier, since we hold the mtd_table_mutex */
+	list_for_each_entry(not, &mtd_notifiers, list)
+		not->remove(mtd);
+
+	if (mtd->usecount) {
 		printk(KERN_NOTICE "Removing MTD device #%d (%s) with use count %d\n",
 		       mtd->index, mtd->name, mtd->usecount);
 		ret = -EBUSY;
 	} else {
-		struct mtd_notifier *not;
-
 		device_unregister(&mtd->dev);
-
-		/* No need to get a refcount on the module containing
-		   the notifier, since we hold the mtd_table_mutex */
-		list_for_each_entry(not, &mtd_notifiers, list)
-			not->remove(mtd);
-
 		mtd_table[mtd->index] = NULL;
-
 		module_put(THIS_MODULE);
 		ret = 0;
 	}
 
+out_error:
 	mutex_unlock(&mtd_table_mutex);
 	return ret;
 }
-- 
1.6.3.3
