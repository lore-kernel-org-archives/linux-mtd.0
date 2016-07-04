Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bKC0w-0003h9-Ua
 for linux-mtd@lists.infradead.org; Mon, 04 Jul 2016 22:06:52 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, Richard Weinberger <richard@nod.at>
Subject: [PATCH 3/5] mtd: Don't unconditionally unregister reboot notifier
Date: Tue,  5 Jul 2016 00:06:21 +0200
Message-Id: <1467669983-12105-4-git-send-email-richard@nod.at>
In-Reply-To: <1467669983-12105-1-git-send-email-richard@nod.at>
References: <1467669983-12105-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

del_mtd_device() is allowed to fail.
i.e. when the MTD is busy.
Unregister the reboot notifier only when we're really
about to delete the MTD.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/mtdcore.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e3936b8..36e5fb0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -654,17 +654,22 @@ int mtd_device_unregister(struct mtd_info *master)
 {
 	int err;
 
-	if (master->_reboot)
-		unregister_reboot_notifier(&master->reboot_notifier);
-
 	err = del_mtd_partitions(master);
 	if (err)
 		return err;
 
 	if (!device_is_registered(&master->dev))
-		return 0;
+		goto unregister;
 
-	return del_mtd_device(master);
+	err = del_mtd_device(master);
+	if (err)
+		return err;
+
+unregister:
+	if (master->_reboot)
+		unregister_reboot_notifier(&master->reboot_notifier);
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(mtd_device_unregister);
 
-- 
2.7.3
