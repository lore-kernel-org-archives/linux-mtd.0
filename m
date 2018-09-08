Received: from scopuli.esotechnik.de ([2a02:c205:3001:6788::1]
 helo=mail.esotechnik.net)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fyd45-0007UE-4X
 for linux-mtd@lists.infradead.org; Sat, 08 Sep 2018 13:14:20 +0000
From: Bernhard Frauendienst <kernel@nospam.obeliks.de>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Bernhard Frauendienst <kernel@nospam.obeliks.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] mtd: core: add get_mtd_device_by_node
Date: Sat,  8 Sep 2018 15:13:43 +0200
Message-Id: <20180908131345.8145-2-kernel@nospam.obeliks.de>
In-Reply-To: <20180908131345.8145-1-kernel@nospam.obeliks.de>
References: <20180908131345.8145-1-kernel@nospam.obeliks.de>
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
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/mtdcore.c   | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/mtd.h |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 97ac219c082e..87dd63926bc9 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -926,6 +926,44 @@ struct mtd_info *get_mtd_device_nm(const char *name)
 }
 EXPORT_SYMBOL_GPL(get_mtd_device_nm);
 
+/**
+ *	get_mtd_device_by_node - obtain a validated handle for an MTD device
+ *	by of_node
+ *	@of_node: OF node of MTD device to open
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
2.18.0
