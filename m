Received: from scopuli.esotechnik.de ([79.143.188.15] helo=mail.esotechnik.net)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxwvZ-0002q0-MW
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2018 16:14:43 +0000
From: Bernhard Frauendienst <kernel@nospam.obeliks.de>
To: linux-mtd@lists.infradead.org
Cc: Bernhard Frauendienst <kernel@nospam.obeliks.de>
Subject: [PATCH 1/3] mtd: core: add get_mtd_device_by_node
Date: Thu,  6 Sep 2018 18:14:11 +0200
Message-Id: <20180906161413.6335-2-kernel@nospam.obeliks.de>
In-Reply-To: <20180906161413.6335-1-kernel@nospam.obeliks.de>
References: <20180906161413.6335-1-kernel@nospam.obeliks.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add function to retrieve a mtd device by its OF node. Since drivers can
assign arbitrary names to mtd devices in the absence of a label
property, there is no other reliable way to retrieve a mtd device for a
given OF node.

Signed-off-by: Bernhard Frauendienst <kernel@nospam.obeliks.de>
---
 drivers/mtd/mtdcore.c   | 39 +++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/mtd.h |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 97ac219c082e..e59b6a06814c 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -926,6 +926,45 @@ struct mtd_info *get_mtd_device_nm(const char *name)
 }
 EXPORT_SYMBOL_GPL(get_mtd_device_nm);
 
+/**
+ *	get_mtd_device_by_node - obtain a validated handle for an MTD device
+ *	by of_node
+ *	@name: OF node of MTD device to open
+ *
+ *	This function returns MTD device description structure in case of
+ *	success and an error code in case of failure.
+ */
+struct mtd_info *get_mtd_device_by_node(const struct device_node *of_node)
+{
+	int err = -ENODEV;
+	struct mtd_info *mtd = NULL, *other;
+
+	mutex_lock(&mtd_table_mutex);
+
+	mtd_for_each_device(other) {
+		if (of_node == other->dev.of_node) {
+			mtd = other;
+			break;
+		}
+	}
+
+	if (!mtd)
+		goto out_unlock;
+
+	err = __get_mtd_device(mtd);
+	if (err)
+		goto out_unlock;
+
+	mutex_unlock(&mtd_table_mutex);
+	return mtd;
+
+out_unlock:
+	mutex_unlock(&mtd_table_mutex);
+	return ERR_PTR(err);
+}
+EXPORT_SYMBOL_GPL(get_mtd_device_by_node);
+
+
 void put_mtd_device(struct mtd_info *mtd)
 {
 	mutex_lock(&mtd_table_mutex);
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index cd0be91bdefa..fe71358f8eaa 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -570,6 +570,8 @@ extern struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num);
 extern int __get_mtd_device(struct mtd_info *mtd);
 extern void __put_mtd_device(struct mtd_info *mtd);
 extern struct mtd_info *get_mtd_device_nm(const char *name);
+extern struct mtd_info *get_mtd_device_by_node(
+		const struct device_node *of_node);
 extern void put_mtd_device(struct mtd_info *mtd);
 
 
-- 
2.17.1
