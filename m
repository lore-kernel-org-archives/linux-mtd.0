Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bme5w-0005E4-2S
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:45:36 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 03/46] mtd: Don't unconditionally unregister reboot notifier
Date: Wed, 21 Sep 2016 11:45:12 +0200
Message-Id: <f83b7dd1edbee967b352aa3c2dab676bafd63a56.1474450295.git.dwalter@sigma-star.at>
In-Reply-To: <cover.1474450295.git.dwalter@sigma-star.at>
References: <cover.1474450295.git.dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

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
2.8.3
