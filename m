Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65917D61013
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 12:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O7FWWoaGmf6JhZ9efl1kPoBiiOLrIdpMMNHbELkp1I0=; b=SZtWyiOT9hvCu8
	WK36Q+XKkpOyaQByw7P38mFXmf2AJwwpan55dUoDtuZ7+F7P7kPlvkIvG6c5lRLY8R/UMB6M/B0wj
	qHyb1KECGgTN+13qnnAB8s6d0B6EUJOsWZWT2N1CsYdCDEARh1crPrZTWf+c4mrMVp/o5XkQu3Ul2
	FW8q/9Leh5mgICx6GX2QnDTuMKe3NWNf9G3oTHjnoMmJgSziYxRat1aDlSQ9ebT0DyrWdPL2jCYKp
	adNvdU0dAWe7yW82IyMMs7KMjm0JQhqGlzig4Yawtx7mAo4vzib3ZAauthc87qNCFdxakZhUHjFvI
	H6bynmrDGhdnKBqxbTBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQqX-0000000055C-3HqY;
	Thu, 29 Jan 2026 12:10:01 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQqV-0000000053y-2sGd
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 12:10:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 483371A2AFD;
	Thu, 29 Jan 2026 12:09:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E76B606B6;
	Thu, 29 Jan 2026 12:09:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3C5B119A868D;
	Thu, 29 Jan 2026 13:09:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769688596; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=W/8oaApIUSI+CrF6Y9lKlZ+WlKQYa9fOIK1PkotcghM=;
	b=gxVGcXcIdCIerq2n7wocBSrtklM5fzEB47n95NPS/+qfKfWAy3jXJAvtu7XZygF/0C0TVR
	vgy5CtkXkny/kv6jm418CdS0Ox50bLMb9ymKxFyzuDii4CI7RGUMf0Ift94RE+XkjxfjYU
	9Ca+XrROkXpe72Jjprz8se2dQOslAdfw8fs7l74zFnP+FJ1365eTUn9Liv6t8YzQvzouuj
	DIjgqQv1wN9YxgYuLFSOoL66LOWP23F2YH4PhxNxLGZpetE7SBPJlyGvVp1gXVvg0XG9EK
	o4ncO7vVBZCk3UzmpKZw4sowDuF4uEt4OWRXrcS2jsIVFghtDWur7cndAHw4Fw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 29 Jan 2026 13:09:29 +0100
Subject: [PATCH v15 3/3] mtd: Add driver for concatenating devices
MIME-Version: 1.0
Message-Id: <20260129-mtd-virt-concat-v15-3-c56a232efbd2@bootlin.com>
References: <20260129-mtd-virt-concat-v15-0-c56a232efbd2@bootlin.com>
In-Reply-To: <20260129-mtd-virt-concat-v15-0-c56a232efbd2@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, 
 Michal Simek <monstr@monstr.eu>, 
 Bernhard Frauendienst <kernel@nospam.obeliks.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_041000_011961_BDAE947A 
X-CRM114-Status: GOOD (  34.38  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>

Introducing CONFIG_MTD_VIRT_CONCAT to separate the legacy flow from the new
approach, where only the concatenated partition is registered as an MTD
device, while the individual partitions that form it are not registered
independently, as they are typically not required by the user.
CONFIG_MTD_VIRT_CONCAT is a boolean configuration option that depends on
CONFIG_MTD_PARTITIONED_MASTER. When enabled, it allows flash nodes to be
exposed as individual MTD devices along with the other partitions.

The solution focuses on fixed-partitions description only as it depends on
device boundaries. It supports multiple sets of concatenated devices, each
comprising two or more partitions.

    flash@0 {
            reg = <0>;
            partitions {
                    compatible = "fixed-partitions";

                    part0@0 {
                            part-concat-next = <&flash0_part1>;
                            label = "part0_0";
                            reg = <0x0 0x800000>;
                    };

                    flash0_part1: part1@800000 {
                            label = "part0_1";
                            reg = <800000 0x800000>;
                    };

                    part2@1000000 {
                            part-concat-next = <&flash1_part0>;
                            label = "part0_2";
                            reg = <0x800000 0x800000>;
                    };
            };
    };

    flash@1 {
            reg = <1>;
            partitions {
                    compatible = "fixed-partitions";

                    flash1_part0: part1@0 {
                            label = "part1_0";
                            reg = <0x0 0x800000>;
                    };

                    part1@800000 {
                            label = "part1_1";
                            reg = <0x800000 0x800000>;
                    };
            };
    };

The partitions that gets created are

flash@0
part0_0-part0_1-concat
flash@1
part1_1
part0_2-part1_0-concat

Suggested-by: Bernhard Frauendienst <kernel@nospam.obeliks.de>
Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>

---

Changes in v15:
- Build mdt-concat as part of the mtd module, not a separate module
  because they are interdependent; make the Konfig a bool instead of a
  tristate so it is a opt-in feature
- Remove 'default n' Kconfig line, 'n' is the default anyway
---
 drivers/mtd/Kconfig           |   9 ++
 drivers/mtd/Makefile          |   1 +
 drivers/mtd/mtd_virt_concat.c | 363 ++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/mtdcore.c         |  19 +++
 drivers/mtd/mtdpart.c         |   6 +
 include/linux/mtd/concat.h    |  51 +++++-
 6 files changed, 448 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 796a2eccbef0..0421c6208de7 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -206,6 +206,15 @@ config MTD_PARTITIONED_MASTER
 	  the parent of the partition device be the master device, rather than
 	  what lies behind the master.
 
+config MTD_VIRT_CONCAT
+	bool "Virtual concatenated MTD devices"
+	depends on MTD_PARTITIONED_MASTER
+	help
+	  The driver enables the creation of virtual MTD device by
+	  concatenating multiple physical MTD devices into a single
+	  entity. This allows for the creation of partitions larger than
+	  the individual physical chips, extending across chip boundaries.
+
 source "drivers/mtd/chips/Kconfig"
 
 source "drivers/mtd/maps/Kconfig"
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 593d0593a038..7b6dd53e8150 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -6,6 +6,7 @@
 # Core functionality.
 obj-$(CONFIG_MTD)		+= mtd.o
 mtd-y				:= mtdcore.o mtdsuper.o mtdconcat.o mtdpart.o mtdchar.o
+mtd-$(CONFIG_MTD_VIRT_CONCAT)	+= mtd_virt_concat.o
 
 obj-y				+= parsers/
 
diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.c
new file mode 100644
index 000000000000..aea88d1c9bc5
--- /dev/null
+++ b/drivers/mtd/mtd_virt_concat.c
@@ -0,0 +1,363 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Virtual concat MTD device driver
+ *
+ * Copyright (C) 2018 Bernhard Frauendienst
+ * Author: Bernhard Frauendienst <kernel@nospam.obeliks.de>
+ */
+
+#include <linux/device.h>
+#include <linux/mtd/mtd.h>
+#include "mtdcore.h"
+#include <linux/mtd/partitions.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/slab.h>
+#include <linux/mtd/concat.h>
+
+#define CONCAT_PROP "part-concat-next"
+#define CONCAT_POSTFIX "concat"
+#define MIN_DEV_PER_CONCAT 1
+
+static LIST_HEAD(concat_node_list);
+
+/**
+ * struct mtd_virt_concat_node - components of a concatenation
+ * @head: List handle
+ * @count: Number of nodes
+ * @nodes: Pointer to the nodes (partitions) to concatenate
+ * @concat: Concatenation container
+ */
+struct mtd_virt_concat_node {
+	struct list_head head;
+	unsigned int count;
+	struct device_node **nodes;
+	struct mtd_concat *concat;
+};
+
+/**
+ * mtd_is_part_concat - Check if the device is already part
+ *                       of a concatenated device
+ * @dev:        pointer to 'device_node'
+ *
+ * Return: true if the device is already part of a concatenation,
+ *         false otherwise.
+ */
+static bool mtd_is_part_concat(struct device_node *dev)
+{
+	struct mtd_virt_concat_node *item;
+	int idx;
+
+	list_for_each_entry(item, &concat_node_list, head) {
+		for (idx = 0; idx < item->count; idx++) {
+			if (item->nodes[idx] == dev)
+				return true;
+		}
+	}
+	return false;
+}
+
+static void mtd_virt_concat_put_mtd_devices(struct mtd_concat *concat)
+{
+	int i;
+
+	for (i = 0; i < concat->num_subdev; i++)
+		put_mtd_device(concat->subdev[i]);
+}
+
+void mtd_virt_concat_destroy_joins(void)
+{
+	struct mtd_virt_concat_node *item, *tmp;
+	struct mtd_info *mtd;
+
+	list_for_each_entry_safe(item, tmp, &concat_node_list, head) {
+		mtd = &item->concat->mtd;
+		if (item->concat) {
+			mtd_device_unregister(mtd);
+			kfree(mtd->name);
+			mtd_concat_destroy(mtd);
+			mtd_virt_concat_put_mtd_devices(item->concat);
+		}
+	}
+}
+
+/**
+ * mtd_virt_concat_destroy - Destroy the concat that includes the mtd object
+ * @mtd:        pointer to 'mtd_info'
+ *
+ * Return: 0 on success, -error otherwise.
+ */
+int mtd_virt_concat_destroy(struct mtd_info *mtd)
+{
+	struct mtd_info *child, *master = mtd_get_master(mtd);
+	struct mtd_virt_concat_node *item, *tmp;
+	struct mtd_concat *concat;
+	int idx, ret = 0;
+	bool is_mtd_found;
+
+	list_for_each_entry_safe(item, tmp, &concat_node_list, head) {
+		is_mtd_found = false;
+
+		/* Find the concat item that hold the mtd device */
+		for (idx = 0; idx < item->count; idx++) {
+			if (item->nodes[idx] == mtd->dev.of_node) {
+				is_mtd_found = true;
+				break;
+			}
+		}
+		if (!is_mtd_found)
+			continue;
+		concat = item->concat;
+
+		/*
+		 * Since this concatenated device is being removed, retrieve
+		 * all MTD devices that are part of it and register them
+		 * individually.
+		 */
+		for (idx = 0; idx < concat->num_subdev; idx++) {
+			child = concat->subdev[idx];
+			if (child->dev.of_node != mtd->dev.of_node) {
+				ret = add_mtd_device(child);
+				if (ret)
+					goto out;
+			}
+		}
+		/* Destroy the concat */
+		if (concat->mtd.name) {
+			del_mtd_device(&concat->mtd);
+			kfree(concat->mtd.name);
+			mtd_concat_destroy(&concat->mtd);
+			mtd_virt_concat_put_mtd_devices(item->concat);
+		}
+
+		for (idx = 0; idx < item->count; idx++)
+			of_node_put(item->nodes[idx]);
+
+		kfree(item->nodes);
+		kfree(item);
+	}
+	return 0;
+out:
+	mutex_lock(&master->master.partitions_lock);
+	list_del(&child->part.node);
+	mutex_unlock(&master->master.partitions_lock);
+	kfree(mtd->name);
+	kfree(mtd);
+
+	return ret;
+}
+
+/**
+ * mtd_virt_concat_create_item - Create a concat item
+ * @parts:        pointer to 'device_node'
+ * @count:        number of mtd devices that make up
+ *                the concatenated device.
+ *
+ * Return: 0 on success, -error otherwise.
+ */
+static int mtd_virt_concat_create_item(struct device_node *parts,
+				       unsigned int count)
+{
+	struct mtd_virt_concat_node *item;
+	struct mtd_concat *concat;
+	int i;
+
+	for (i = 0; i < (count - 1); i++) {
+		if (mtd_is_part_concat(of_parse_phandle(parts, CONCAT_PROP, i)))
+			return 0;
+	}
+
+	item = kzalloc(sizeof(*item), GFP_KERNEL);
+	if (!item)
+		return -ENOMEM;
+
+	item->count = count;
+	item->nodes = kcalloc(count, sizeof(*item->nodes), GFP_KERNEL);
+	if (!item->nodes) {
+		kfree(item);
+		return -ENOMEM;
+	}
+
+	/*
+	 * The partition in which "part-concat-next" property
+	 * is defined is the first device in the list of concat
+	 * devices.
+	 */
+	item->nodes[0] = parts;
+
+	for (i = 1; i < count; i++)
+		item->nodes[i] = of_parse_phandle(parts, CONCAT_PROP, (i - 1));
+
+	concat = kzalloc(sizeof(*concat), GFP_KERNEL);
+	if (!concat) {
+		kfree(item);
+		return -ENOMEM;
+	}
+
+	concat->subdev = kcalloc(count, sizeof(*concat->subdev), GFP_KERNEL);
+	if (!concat->subdev) {
+		kfree(item);
+		kfree(concat);
+		return -ENOMEM;
+	}
+	item->concat = concat;
+
+	list_add_tail(&item->head, &concat_node_list);
+
+	return 0;
+}
+
+void mtd_virt_concat_destroy_items(void)
+{
+	struct mtd_virt_concat_node *item, *temp;
+	int i;
+
+	list_for_each_entry_safe(item, temp, &concat_node_list, head) {
+		for (i = 0; i < item->count; i++)
+			of_node_put(item->nodes[i]);
+
+		kfree(item->nodes);
+		kfree(item);
+	}
+}
+
+/**
+ * mtd_virt_concat_create_add - Add a mtd device to the concat list
+ * @mtd:        pointer to 'mtd_info'
+ *
+ * Return: true on success, false otherwise.
+ */
+bool mtd_virt_concat_add(struct mtd_info *mtd)
+{
+	struct mtd_virt_concat_node *item;
+	struct mtd_concat *concat;
+	int idx;
+
+	list_for_each_entry(item, &concat_node_list, head) {
+		concat = item->concat;
+		for (idx = 0; idx < item->count; idx++) {
+			if (item->nodes[idx] == mtd->dev.of_node) {
+				concat->subdev[concat->num_subdev++] = mtd;
+				return true;
+			}
+		}
+	}
+	return false;
+}
+
+/**
+ * mtd_virt_concat_node_create - List all the concatenations found in DT
+ *
+ * Return: 0 on success, -error otherwise.
+ */
+int mtd_virt_concat_node_create(void)
+{
+	struct device_node *parts = NULL;
+	int ret = 0, count = 0;
+
+	/* List all the concatenations found in DT */
+	do {
+		parts = of_find_node_with_property(parts, CONCAT_PROP);
+		if (!of_device_is_available(parts))
+			continue;
+
+		if (mtd_is_part_concat(parts))
+			continue;
+
+		count = of_count_phandle_with_args(parts, CONCAT_PROP, NULL);
+		if (count < MIN_DEV_PER_CONCAT)
+			continue;
+
+		/*
+		 * The partition in which "part-concat-next" property is defined
+		 * is also part of the concat device, so increament count by 1.
+		 */
+		count++;
+
+		ret = mtd_virt_concat_create_item(parts, count);
+		if (ret) {
+			of_node_put(parts);
+			goto destroy_items;
+		}
+	} while (parts);
+
+	return ret;
+
+destroy_items:
+	mtd_virt_concat_destroy_items();
+
+	return ret;
+}
+
+/**
+ * mtd_virt_concat_create_join - Create and register the concatenated
+ *                                 MTD device.
+ *
+ * Return: 0 on success, -error otherwise.
+ */
+int mtd_virt_concat_create_join(void)
+{
+	struct mtd_virt_concat_node *item;
+	struct mtd_concat *concat;
+	struct mtd_info *mtd;
+	ssize_t name_sz;
+	int ret, idx;
+	char *name;
+
+	list_for_each_entry(item, &concat_node_list, head) {
+		concat = item->concat;
+		/*
+		 * Check if item->count != concat->num_subdev, it indicates
+		 * that the MTD information for all devices included in the
+		 * concatenation are not handy, concat MTD device can't be
+		 * created hence switch to next concat device.
+		 */
+		if (item->count != concat->num_subdev) {
+			continue;
+		} else {
+			/* Calculate the legth of the name of the virtual device */
+			for (idx = 0, name_sz = 0; idx < concat->num_subdev; idx++)
+				name_sz += (strlen(concat->subdev[idx]->name) + 1);
+			name_sz += strlen(CONCAT_POSTFIX);
+			name = kmalloc(name_sz + 1, GFP_KERNEL);
+			if (!name) {
+				mtd_virt_concat_put_mtd_devices(concat);
+				return -ENOMEM;
+			}
+
+			ret = 0;
+			for (idx = 0; idx < concat->num_subdev; idx++) {
+				ret += sprintf((name + ret), "%s-",
+					       concat->subdev[idx]->name);
+			}
+			sprintf((name + ret), CONCAT_POSTFIX);
+
+			if (concat->mtd.name) {
+				ret = memcmp(concat->mtd.name, name, name_sz);
+				if (ret == 0)
+					continue;
+			}
+			mtd = mtd_concat_create(concat->subdev, concat->num_subdev, name);
+			if (!mtd) {
+				kfree(name);
+				return -ENXIO;
+			}
+			concat->mtd = *mtd;
+			/* Arbitrary set the first device as parent */
+			concat->mtd.dev.parent = concat->subdev[0]->dev.parent;
+			concat->mtd.dev = concat->subdev[0]->dev;
+
+			/* Add the mtd device */
+			ret = add_mtd_device(&concat->mtd);
+			if (ret)
+				goto destroy_concat;
+		}
+	}
+
+	return 0;
+
+destroy_concat:
+	mtd_concat_destroy(mtd);
+
+	return ret;
+}
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 64808493b4f5..3760065c4e08 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -34,6 +34,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/mtd/concat.h>
 
 #include "mtdcore.h"
 
@@ -1120,6 +1121,12 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 			goto out;
 	}
 
+	if (IS_REACHABLE(CONFIG_MTD_VIRT_CONCAT)) {
+		ret = mtd_virt_concat_node_create();
+		if (ret < 0)
+			goto out;
+	}
+
 	/* Prefer parsed partitions over driver-provided fallback */
 	ret = parse_mtd_partitions(mtd, types, parser_data);
 	if (ret == -EPROBE_DEFER)
@@ -1137,6 +1144,11 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 	if (ret)
 		goto out;
 
+	if (IS_REACHABLE(CONFIG_MTD_VIRT_CONCAT)) {
+		ret = mtd_virt_concat_create_join();
+		if (ret < 0)
+			goto out;
+	}
 	/*
 	 * FIXME: some drivers unfortunately call this function more than once.
 	 * So we have to check if we've already assigned the reboot notifier.
@@ -1186,6 +1198,11 @@ int mtd_device_unregister(struct mtd_info *master)
 	nvmem_unregister(master->otp_user_nvmem);
 	nvmem_unregister(master->otp_factory_nvmem);
 
+	if (IS_REACHABLE(CONFIG_MTD_VIRT_CONCAT)) {
+		err = mtd_virt_concat_destroy(master);
+		if (err)
+			return err;
+	}
 	err = del_mtd_partitions(master);
 	if (err)
 		return err;
@@ -2621,6 +2638,8 @@ static int __init init_mtd(void)
 
 static void __exit cleanup_mtd(void)
 {
+	mtd_virt_concat_destroy_joins();
+	mtd_virt_concat_destroy_items();
 	debugfs_remove_recursive(dfs_dir_mtd);
 	cleanup_mtdchar();
 	if (proc_mtd)
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 2876501a7814..fc4483686242 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -18,6 +18,7 @@
 #include <linux/err.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/mtd/concat.h>
 
 #include "mtdcore.h"
 
@@ -409,6 +410,11 @@ int add_mtd_partitions(struct mtd_info *parent,
 			goto err_del_partitions;
 		}
 
+		if (IS_REACHABLE(CONFIG_MTD_VIRT_CONCAT)) {
+			if (mtd_virt_concat_add(child))
+				continue;
+		}
+
 		mutex_lock(&master->master.partitions_lock);
 		list_add_tail(&child->part.node, &parent->partitions);
 		mutex_unlock(&master->master.partitions_lock);
diff --git a/include/linux/mtd/concat.h b/include/linux/mtd/concat.h
index b42d9af87c4e..2cd9d48958a8 100644
--- a/include/linux/mtd/concat.h
+++ b/include/linux/mtd/concat.h
@@ -28,5 +28,54 @@ struct mtd_info *mtd_concat_create(
 
 void mtd_concat_destroy(struct mtd_info *mtd);
 
-#endif
+/**
+ * mtd_virt_concat_node_create - Create a component for concatenation
+ *
+ * Returns a positive number representing the no. of devices found for
+ * concatenation, or a negative error code.
+ *
+ * List all the devices for concatenations found in DT and create a
+ * component for concatenation.
+ */
+int mtd_virt_concat_node_create(void);
+
+/**
+ * mtd_virt_concat_add - add mtd_info object to the list of subdevices for concatenation
+ * @mtd: pointer to new MTD device info structure
+ *
+ * Returns true if the mtd_info object is added successfully else returns false.
+ *
+ * The mtd_info object is added to the list of subdevices for concatenation.
+ * It returns true if a match is found, and false if all subdevices have
+ * already been added or if the mtd_info object does not match any of the
+ * intended MTD devices.
+ */
+bool mtd_virt_concat_add(struct mtd_info *mtd);
 
+/**
+ * mtd_virt_concat_create_join - Create and register the concatenated MTD device
+ *
+ * Returns 0 on succes, or a negative error code.
+ *
+ * Creates and registers the concatenated MTD device
+ */
+int mtd_virt_concat_create_join(void);
+
+/**
+ * mtd_virt_concat_destroy - Remove the concat that includes a specific mtd device
+ *                           as one of its components.
+ * @mtd: pointer to MTD device info structure.
+ *
+ * Returns 0 on succes, or a negative error code.
+ *
+ * If the mtd_info object is part of a concatenated device, all other MTD devices
+ * within that concat are registered individually. The concatenated device is then
+ * removed, along with its concatenation component.
+ *
+ */
+int mtd_virt_concat_destroy(struct mtd_info *mtd);
+
+void mtd_virt_concat_destroy_joins(void);
+void mtd_virt_concat_destroy_items(void);
+
+#endif

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
