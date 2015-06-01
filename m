Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YzYyE-0007I3-I3
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2015 23:18:15 +0000
Received: by pdbki1 with SMTP id ki1so118537155pdb.1
 for <linux-mtd@lists.infradead.org>; Mon, 01 Jun 2015 16:17:52 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/4] mtd: warn when registering the same master many times
Date: Mon,  1 Jun 2015 16:17:20 -0700
Message-Id: <1433200640-17858-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1433200640-17858-1-git-send-email-computersforpeace@gmail.com>
References: <1433200640-17858-1-git-send-email-computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When CONFIG_MTD_PARTITIONED_MASTER=y, it is fatal to call
mtd_device_parse_register() twice on the same MTD, as we try to register
the same device/kobject multipile times.

When CONFIG_MTD_PARTITIONED_MASTER=n, calling
mtd_device_parse_register() is more of just a nuisance, as we can mostly
navigate around any conflicting actions.

But anyway, doing so is a Bad Thing (TM), and we should complain loudly
for any drivers that try to do this.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdcore.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 03eec42dc715..f0e157e0be89 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -387,6 +387,14 @@ int add_mtd_device(struct mtd_info *mtd)
 	struct mtd_notifier *not;
 	int i, error;
 
+	/*
+	 * May occur, for instance, on buggy drivers which call
+	 * mtd_device_parse_register() multiple times on the same master MTD,
+	 * especially with CONFIG_MTD_PARTITIONED_MASTER=y.
+	 */
+	if (WARN(mtd->backing_dev_info, "MTD already registered\n"))
+		return -EEXIST;
+
 	mtd->backing_dev_info = &mtd_bdi;
 
 	BUG_ON(mtd->writesize == 0);
@@ -597,6 +605,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 	 * does cause problems with parse_mtd_partitions() above (e.g.,
 	 * cmdlineparts will register partitions more than once).
 	 */
+	WARN(mtd->reboot_notifier.notifier_call, "MTD already registered\n");
 	if (mtd->_reboot && !mtd->reboot_notifier.notifier_call) {
 		mtd->reboot_notifier.notifier_call = mtd_reboot_notifier;
 		register_reboot_notifier(&mtd->reboot_notifier);
-- 
1.9.1
