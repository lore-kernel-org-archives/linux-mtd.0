Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A7760A2636
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JMujE+qh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iXgGEc+v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y5mDOhbcunkE/ZZUPjB9+852hdnKc79KpHTzgyTzeh4=; b=JMujE+qhxMHjk7kQMkUfXgw+jr
	35TOH1M/2wRP7/aGY1BM5dG/dSZEktlbdQhHdOrDoQ65ETo2NgNV4oxETYJJBW9lLbiTlTAz3jp/2
	QZNCxTpHXABpPdCOAW+Ef1o1jem1dKxkL6X5K5x1tUWO+SLb1kJ8xx+1bXNE/BhjRwoXd/5EklpEO
	/Ab4YJFDGUQ22sK/jFCRRZ+XKkBXIjAqRfOBH3OP1VvHvHWXxZPD9aOvqEe1cdR5fN4SOVwcJUvFb
	T9fBBRFeksrfGccjuROeDQg6WOuii3zFzBv+ouCN9w8DgaZd0dCTCA6wPOO+2tLZ9emO0RsaPAenx
	V2OqJIHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgWq-00000002vnX-31Ba;
	Tue, 10 Nov 2026 07:44:28 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgWn-00000002vjV-3JLR
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:27 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-51f2e9e6987so1035408b6e.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296665; x=1794901465; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNFIlffp+xCXHMSgggtE3viuHIzA+ozjxJnoIY1lKGM=;
        b=iXgGEc+vXrnlHaVqaRJbmWpY8Zamaw42Op8dW5/zxczxcN8s9j1VAd/Tf60t3gXPjj
         YmDDIKMAPBYCljzsfOAo6eT+HJjbL+ErqmI2voHg3gul6pfgozEfBJhwtzfS5TFPNgtP
         iH1wBONV0PsWY+tFH4VMuzlvk2Z1IyYMqiNcUhul+wsgf+fZWLIAnfGRsmiUuMBDnrRA
         ROKaTXHVyCnQFAFzYohy9kdgKzqVvCBLW0ZqD2RTX5RGR8rIOOZFTTwoFtfaP8dqF2mN
         46+qoiekRDHCqU+GycxY7Uhng+MfLVeopADl9dnhv9Gt3juujajSV1rz/uuepZQeu4Bx
         xYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296665; x=1794901465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gNFIlffp+xCXHMSgggtE3viuHIzA+ozjxJnoIY1lKGM=;
        b=01a0wgA09NqyOY2raro1nXELCRpHXCP7uwZKPCSq4fhIcUtVk/icW40GhSvUqmCZnu
         FBh1GHKDOk1S0W3YdrQI4kATfBxHnXtGO79KBFgbn5neyCVKO3HFa91LOjWdCufFqvKF
         OM5M+Ux4nOS9oq1+gzDQ7xkV1wOsAzYy4K668dBmJaw84IglBuZMFQHamOpC+dLZXzIm
         OzgvVOakXa6aZV7HFQMDxegh5ntwY4YU8TKiewKMo8JmOaR/UJjOTGwNT852nOSJv5ir
         AefuFl3sqACEHmte6o2eJVO/1xIcS49yiil7fjtptdESCABsGvWmeUj7T+tL+cCPw1y0
         cBGg==
X-Gm-Message-State: APuU4Z9oxL79Lpkvcw0YKJeNKhvNZwl5mPkTL7dbpAg2EfpgRN2205ou
	KRkgp2FAcyf8AGUeTwYDOHP+jbQJvczakGuFgwPQw23XZ+bQIP5PE9gv
X-Gm-Gg: AYBFou3fNKyVtW8FyD9XkZMkyGkgsmm/96P7W6Ubw1JGy2sHx4d37SO+6V7uxghNoZo
	H12FkIJXOJf/t1aX3c2UhjIo844BGbfWn6dM6LpqmbnkqqoX2rnWN7Ri0ytAGYei+wlojXPizcI
	dqbmOZGA9y56I55AxFD8BCOiEqmOR1zRT3eVSe/gb0LHiy7xEIp9BkGGxKLGNtgq8kB/LD4Nrdm
	8MfdRrMK3+UjrqW2FQHROtGtYQeYrWv00hL6K2B/PyAf2GwRunyYT556pTyXWHowcqdniL70r6d
	SNIwoEaG+Fe7O5zUxD1vu7LnwRc2IxnlY4ypcvpJZTYpqm9QzIKPBQTfCP+bkAy7JSNYxWio96K
	wjUvyq9VgDj9RGZcC7T5meK9aTG1OyMGcIzFjX0gc2DwKype4v4g/2kNc5LyI4JEpQLHjrhPNRi
	0KwkG3aKDmBVEWG9BuVzDTQpIPhrb9BHL+d7G4PmtFDLwPk6xn0uri2dS9VqcemWLaTgcRLkFFS
	xNfSyMtpr+4JjKWQADukzfwfDPyv5+AQmjXmKEj0m/ZhjEcfeXo4QCons97uDw0gILhsJgVkqac
	l+BhqcuJ644YbHC+NwWL7Sj2xlsqSQKX0wbr5q1ej4vebbS8DLhFUxfOWBQmxGA7DWzaXaxQIXQ
	wUK/MZbkvBidbKiepf72SXVH+VewQxuZd9PG2OMwoNopuD/WC9mfQYQP+dOSuA0pDSSXRtO+SYs
	GGQI2IEbh3JoH4L3PU4CduQL/+5w0ROrF/bdoGWJj5auLJ7SB32dI=
X-Received: by 2002:a05:6808:14c4:b0:564:3fe1:2f9a with SMTP id 5614622812f47-568728d2850mr905382b6e.17.1794296664567;
        Mon, 09 Nov 2026 23:44:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:07 -0700
Subject: [PATCH v2 04/58] mtd: retain virtual concatenations across
 component removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-4-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Yuqiang Sun <izaiahsun@gmail.com>, 
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Bernhard Frauendienst <kernel@nospam.obeliks.de>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook <kees@kernel.org>, 
 linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234425_908683_A088953F 
X-CRM114-Status: GOOD (  26.24  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Virtual concatenation keeps unregistered partition objects outside the
normal partition list. They neither retain their backing masters nor get
removed by partition-registration failure cleanup. The teardown path also
compares a master against its hidden children, leaving stale pointers when
one of the physical devices disappears.

Give staged components explicit ownership of their backing objects and
retain each published concatenation's component set until its final MTD
release. Register the object returned by mtd_concat_create() directly,
instead of copying its embedded device. An old handle then continues to
refer to its original components after a replacement master is probed.

Serialize the staging list and publication across physical controllers.
Store components in DT order and publish only after every contributing
master finishes partition registration. Detach affected joins while holding
the staging lock, then unregister them without it. Use a separate partition
lock class for virtual masters so a physical partition can remove its joins
without nesting locks from the same class.

Unwind hidden components along with ordinary partitions on registration
failure. Keep the other masters' staged components available for a later
probe, and advance the partition offset past a hidden component before
processing an appended partition.

Fixes: 43db6366fc2d ("mtd: Add driver for concatenating devices")
Cc: Yuqiang Sun <izaiahsun@gmail.com>
Cc: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Bernhard Frauendienst <kernel@nospam.obeliks.de>
Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
Cc: Kees Cook <kees@kernel.org>
Cc: linux-hardening@vger.kernel.org
Link: https://lore.kernel.org/r/20261103143953.69642-1-izaiahsun@gmail.com/
Link: https://lore.kernel.org/r/sashiko-outbox-195551@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtd_virt_concat.c | 513 +++++++++++++++++++++---------------------
 drivers/mtd/mtdcore.c         |   9 +-
 drivers/mtd/mtdcore.h         |   3 +
 drivers/mtd/mtdpart.c         |  14 +-
 include/linux/mtd/concat.h    |  18 +-
 5 files changed, 283 insertions(+), 274 deletions(-)

diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.c
index da4277ced4d6..1c797a4afb9b 100644
--- a/drivers/mtd/mtd_virt_concat.c
+++ b/drivers/mtd/mtd_virt_concat.c
@@ -7,346 +7,339 @@
  */
 
 #include <linux/device.h>
+#include <linux/lockdep.h>
+#include <linux/module.h>
 #include <linux/mtd/mtd.h>
-#include "mtdcore.h"
-#include <linux/mtd/partitions.h>
+#include <linux/mtd/concat.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/of_platform.h>
 #include <linux/slab.h>
-#include <linux/mtd/concat.h>
+
+#include "mtdcore.h"
 
 #define CONCAT_PROP "part-concat-next"
-#define CONCAT_POSTFIX "concat"
-#define MIN_DEV_PER_CONCAT 1
 
-static LIST_HEAD(concat_node_list);
+struct mtd_virt_concat_part {
+	struct device_node *node;
+	struct mtd_info *mtd;
+	bool ready;
+};
+
+struct mtd_virt_concat_device {
+	struct list_head node;
+	struct mtd_info *mtd;
+};
 
-/**
- * struct mtd_virt_concat_node - components of a concatenation
- * @head: List handle
- * @count: Number of nodes
- * @nodes: Pointer to the nodes (partitions) to concatenate
- * @concat: Concatenation container
- */
 struct mtd_virt_concat_node {
-	struct list_head head;
+	struct list_head node;
+	struct mtd_virt_concat_device *device;
 	unsigned int count;
-	struct mtd_concat *concat;
-	struct device_node *nodes[] __counted_by(count);
+	struct mtd_virt_concat_part parts[] __counted_by(count);
 };
 
-/**
- * mtd_is_part_concat - Check if the device is already part
- *                       of a concatenated device
- * @dev:        pointer to 'device_node'
- *
- * Return: true if the device is already part of a concatenation,
- *         false otherwise.
- */
-static bool mtd_is_part_concat(struct device_node *dev)
+static LIST_HEAD(concat_node_list);
+static DEFINE_MUTEX(concat_lock);
+static struct lock_class_key concat_partitions_lock_key;
+
+static bool mtd_is_part_concat(struct device_node *node)
 {
 	struct mtd_virt_concat_node *item;
-	int idx;
+	unsigned int i;
 
-	list_for_each_entry(item, &concat_node_list, head) {
-		for (idx = 0; idx < item->count; idx++) {
-			if (item->nodes[idx] == dev)
+	list_for_each_entry(item, &concat_node_list, node)
+		for (i = 0; i < item->count; i++)
+			if (item->parts[i].node == node)
 				return true;
-		}
-	}
 	return false;
 }
 
-static void mtd_virt_concat_put_mtd_devices(struct mtd_concat *concat)
+/* Hidden partitions have no registered device to own their storage. */
+static void mtd_virt_concat_part_release(struct kref *ref)
+{
+	struct mtd_info *mtd = container_of(ref, struct mtd_info, refcnt);
+	struct mtd_info *master = mtd_get_master(mtd);
+	struct mtd_info *parent = mtd->parent;
+
+	of_node_put(mtd_get_of_node(mtd));
+	release_mtd_partition(mtd);
+	if (parent != master)
+		put_device(&parent->dev);
+	mtd_put_lifetime(master);
+}
+
+static void mtd_virt_concat_part_put(struct mtd_info *mtd)
+{
+	kref_put(&mtd->refcnt, mtd_virt_concat_part_release);
+}
+
+static void mtd_virt_concat_release(struct mtd_info *mtd)
 {
+	struct mtd_concat *concat = container_of(mtd, struct mtd_concat, mtd);
 	int i;
 
 	for (i = 0; i < concat->num_subdev; i++)
-		put_mtd_device(concat->subdev[i]);
+		mtd_virt_concat_part_put(concat->subdev[i]);
+	kfree(mtd->priv);
+	kfree(mtd->name);
+	mtd_concat_destroy(mtd);
 }
 
-void mtd_virt_concat_destroy_joins(void)
+static void mtd_virt_concat_unregister(struct list_head *devices)
 {
-	struct mtd_virt_concat_node *item, *tmp;
-	struct mtd_info *mtd;
+	struct mtd_virt_concat_device *device, *next;
 
-	list_for_each_entry_safe(item, tmp, &concat_node_list, head) {
-		mtd = &item->concat->mtd;
-		if (item->concat) {
-			mtd_device_unregister(mtd);
-			kfree(mtd->name);
-			mtd_virt_concat_put_mtd_devices(item->concat);
-			mtd_concat_destroy(mtd);
-		}
+	list_for_each_entry_safe(device, next, devices, node) {
+		list_del(&device->node);
+		mtd_device_unregister(device->mtd);
+		mtd_put_master(device->mtd);
 	}
 }
 
-/**
- * mtd_virt_concat_destroy - Destroy the concat that includes the mtd object
- * @mtd:        pointer to 'mtd_info'
- *
- * Return: 0 on success, -error otherwise.
- */
+static bool mtd_virt_concat_contains(struct mtd_info *part, struct mtd_info *mtd)
+{
+	for (; part; part = part->parent)
+		if (part == mtd)
+			return true;
+	return false;
+}
+
 int mtd_virt_concat_destroy(struct mtd_info *mtd)
 {
-	struct mtd_info *child, *master = mtd_get_master(mtd);
-	struct mtd_virt_concat_node *item, *tmp;
-	struct mtd_concat *concat;
-	int idx, ret = 0;
-	bool is_mtd_found;
-
-	list_for_each_entry_safe(item, tmp, &concat_node_list, head) {
-		is_mtd_found = false;
-
-		/* Find the concat item that hold the mtd device */
-		for (idx = 0; idx < item->count; idx++) {
-			if (item->nodes[idx] == mtd->dev.of_node) {
-				is_mtd_found = true;
-				break;
-			}
-		}
-		if (!is_mtd_found)
-			continue;
-		concat = item->concat;
-
-		/*
-		 * Since this concatenated device is being removed, retrieve
-		 * all MTD devices that are part of it and register them
-		 * individually.
-		 */
-		for (idx = 0; idx < concat->num_subdev; idx++) {
-			child = concat->subdev[idx];
-			if (child->dev.of_node != mtd->dev.of_node) {
-				ret = add_mtd_device(child);
-				if (ret)
-					goto out;
+	struct mtd_virt_concat_node *item;
+	LIST_HEAD(devices);
+	unsigned int i;
+
+	/* A virtual master cannot itself be a DT concatenation component. */
+	if (mtd_get_master(mtd)->master.release == mtd_virt_concat_release)
+		return 0;
+
+	mutex_lock(&concat_lock);
+	list_for_each_entry(item, &concat_node_list, node) {
+		for (i = 0; i < item->count; i++) {
+			struct mtd_virt_concat_part *part = &item->parts[i];
+
+			if (!mtd_virt_concat_contains(part->mtd, mtd))
+				continue;
+			if (item->device) {
+				list_add_tail(&item->device->node, &devices);
+				item->device = NULL;
 			}
+			mtd_virt_concat_part_put(part->mtd);
+			part->mtd = NULL;
+			part->ready = false;
 		}
-		/* Destroy the concat */
-		if (concat->mtd.name) {
-			del_mtd_device(&concat->mtd);
-			kfree(concat->mtd.name);
-			mtd_virt_concat_put_mtd_devices(item->concat);
-			mtd_concat_destroy(&concat->mtd);
-		}
-
-		for (idx = 0; idx < item->count; idx++)
-			of_node_put(item->nodes[idx]);
-
-		kfree(item);
 	}
+	mutex_unlock(&concat_lock);
+
+	/* Unregistration takes the virtual master's partition lock. */
+	mtd_virt_concat_unregister(&devices);
 	return 0;
-out:
-	mutex_lock(&master->master.partitions_lock);
-	list_del(&child->part.node);
-	mutex_unlock(&master->master.partitions_lock);
-	kfree(mtd->name);
-	kfree(mtd);
+}
 
-	return ret;
+static void mtd_virt_concat_free_item(struct mtd_virt_concat_node *item)
+{
+	unsigned int i;
+
+	for (i = 0; i < item->count; i++)
+		of_node_put(item->parts[i].node);
+	kfree(item);
 }
 
-/**
- * mtd_virt_concat_create_item - Create a concat item
- * @parts:        pointer to 'device_node'
- * @count:        number of mtd devices that make up
- *                the concatenated device.
- *
- * Return: 0 on success, -error otherwise.
- */
-static int mtd_virt_concat_create_item(struct device_node *parts,
-				       unsigned int count)
+static int mtd_virt_concat_create_item(struct device_node *node, unsigned int count)
 {
 	struct mtd_virt_concat_node *item;
-	struct mtd_concat *concat;
-	int i;
+	unsigned int i, j;
 
-	for (i = 0; i < (count - 1); i++) {
-		if (mtd_is_part_concat(of_parse_phandle(parts, CONCAT_PROP, i)))
-			return 0;
-	}
-
-	item = kzalloc_flex(*item, nodes, count, GFP_KERNEL);
+	item = kzalloc_flex(*item, parts, count, GFP_KERNEL);
 	if (!item)
 		return -ENOMEM;
-
 	item->count = count;
+	item->parts[0].node = of_node_get(node);
 
-	/*
-	 * The partition in which "part-concat-next" property
-	 * is defined is the first device in the list of concat
-	 * devices.
-	 */
-	item->nodes[0] = parts;
+	for (i = 1; i < count; i++) {
+		struct device_node *part = of_parse_phandle(node, CONCAT_PROP, i - 1);
 
-	for (i = 1; i < count; i++)
-		item->nodes[i] = of_parse_phandle(parts, CONCAT_PROP, (i - 1));
-
-	concat = kzalloc_flex(*concat, subdev, count, GFP_KERNEL);
-	if (!concat) {
-		kfree(item);
-		return -ENOMEM;
+		item->parts[i].node = part;
+		if (!part || mtd_is_part_concat(part))
+			goto out;
+		for (j = 0; j < i; j++)
+			if (item->parts[j].node == part)
+				goto out;
 	}
-
-	item->concat = concat;
-
-	list_add_tail(&item->head, &concat_node_list);
-
+	list_add_tail(&item->node, &concat_node_list);
 	return 0;
+out:
+	mtd_virt_concat_free_item(item);
+	return -EINVAL;
 }
 
-void mtd_virt_concat_destroy_items(void)
+void mtd_virt_concat_destroy_joins(void)
 {
-	struct mtd_virt_concat_node *item, *temp;
-	int i;
+	struct mtd_virt_concat_node *item;
+	LIST_HEAD(devices);
+	unsigned int i;
+
+	mutex_lock(&concat_lock);
+	list_for_each_entry(item, &concat_node_list, node) {
+		if (item->device) {
+			list_add_tail(&item->device->node, &devices);
+			item->device = NULL;
+		}
+		for (i = 0; i < item->count; i++) {
+			if (item->parts[i].mtd)
+				mtd_virt_concat_part_put(item->parts[i].mtd);
+			item->parts[i].mtd = NULL;
+			item->parts[i].ready = false;
+		}
+	}
+	mutex_unlock(&concat_lock);
+	mtd_virt_concat_unregister(&devices);
+}
 
-	list_for_each_entry_safe(item, temp, &concat_node_list, head) {
-		for (i = 0; i < item->count; i++)
-			of_node_put(item->nodes[i]);
+void mtd_virt_concat_destroy_items(void)
+{
+	struct mtd_virt_concat_node *item, *next;
 
-		kfree(item);
+	guard(mutex)(&concat_lock);
+	list_for_each_entry_safe(item, next, &concat_node_list, node) {
+		list_del(&item->node);
+		mtd_virt_concat_free_item(item);
 	}
 }
 
-/**
- * mtd_virt_concat_add - Add a mtd device to the concat list
- * @mtd:        pointer to 'mtd_info'
- *
- * Return: true on success, false otherwise.
- */
-bool mtd_virt_concat_add(struct mtd_info *mtd)
+int mtd_virt_concat_add(struct mtd_info *mtd)
 {
 	struct mtd_virt_concat_node *item;
-	struct mtd_concat *concat;
-	int idx;
-
-	list_for_each_entry(item, &concat_node_list, head) {
-		concat = item->concat;
-		for (idx = 0; idx < item->count; idx++) {
-			if (item->nodes[idx] == mtd->dev.of_node) {
-				concat->subdev[concat->num_subdev++] = mtd;
-				return true;
-			}
+	unsigned int i;
+
+	guard(mutex)(&concat_lock);
+	list_for_each_entry(item, &concat_node_list, node) {
+		for (i = 0; i < item->count; i++) {
+			struct mtd_virt_concat_part *part = &item->parts[i];
+
+			if (part->node != mtd_get_of_node(mtd))
+				continue;
+			if (part->mtd)
+				return -EBUSY;
+			kref_init(&mtd->refcnt);
+			/* The master need not have a registered device. */
+			mtd_get_lifetime(mtd_get_master(mtd));
+			if (mtd->parent != mtd_get_master(mtd))
+				get_device(&mtd->parent->dev);
+			of_node_get(mtd_get_of_node(mtd));
+			part->mtd = mtd;
+			return 1;
 		}
 	}
-	return false;
+	return 0;
 }
 
-/**
- * mtd_virt_concat_node_create - List all the concatenations found in DT
- *
- * Return: 0 on success, -error otherwise.
- */
 int mtd_virt_concat_node_create(void)
 {
-	struct device_node *parts = NULL;
-	int ret = 0, count = 0;
+	struct device_node *node;
+	int ret, count;
 
-	/* List all the concatenations found in DT */
-	do {
-		parts = of_find_node_with_property(parts, CONCAT_PROP);
-		if (!of_device_is_available(parts))
+	guard(mutex)(&concat_lock);
+	for_each_node_with_property(node, CONCAT_PROP) {
+		if (!of_device_is_available(node) || mtd_is_part_concat(node))
 			continue;
-
-		if (mtd_is_part_concat(parts))
-			continue;
-
-		count = of_count_phandle_with_args(parts, CONCAT_PROP, NULL);
-		if (count < MIN_DEV_PER_CONCAT)
+		count = of_count_phandle_with_args(node, CONCAT_PROP, NULL);
+		if (count < 1)
 			continue;
-
-		/*
-		 * The partition in which "part-concat-next" property is defined
-		 * is also part of the concat device, so increament count by 1.
-		 */
-		count++;
-
-		ret = mtd_virt_concat_create_item(parts, count);
+		ret = mtd_virt_concat_create_item(node, count + 1);
 		if (ret) {
-			of_node_put(parts);
-			goto destroy_items;
+			of_node_put(node);
+			return ret;
 		}
-	} while (parts);
+	}
+	return 0;
+}
 
+static int mtd_virt_concat_register(struct mtd_virt_concat_node *item)
+{
+	struct mtd_virt_concat_device *device;
+	struct mtd_info **parts, *mtd;
+	size_t name_size = sizeof("concat");
+	unsigned int i;
+	char *name, *p;
+	int ret;
+
+	parts = kmalloc_array(item->count, sizeof(*parts), GFP_KERNEL);
+	if (!parts)
+		return -ENOMEM;
+	for (i = 0; i < item->count; i++) {
+		parts[i] = item->parts[i].mtd;
+		name_size += strlen(parts[i]->name) + 1;
+	}
+	name = kmalloc(name_size, GFP_KERNEL);
+	if (!name) {
+		ret = -ENOMEM;
+		goto out_parts;
+	}
+	p = name;
+	for (i = 0; i < item->count; i++)
+		p += sprintf(p, "%s-", parts[i]->name);
+	strscpy(p, "concat", name_size - (p - name));
+	device = kzalloc_obj(*device);
+	if (!device) {
+		ret = -ENOMEM;
+		goto out_name;
+	}
+	mtd = mtd_concat_create(parts, item->count, name);
+	if (!mtd) {
+		ret = -ENXIO;
+		goto out_device;
+	}
+	for (i = 0; i < item->count; i++)
+		kref_get(&parts[i]->refcnt);
+	mtd->dev.parent = parts[0]->dev.parent;
+	mtd->owner = THIS_MODULE;
+	mtd->priv = device;
+	mtd_set_dev_defaults(mtd);
+	lockdep_set_class(&mtd->master.partitions_lock, &concat_partitions_lock_key);
+	mtd_set_release(mtd, mtd_virt_concat_release);
+	device->mtd = mtd;
+	ret = add_mtd_device(mtd);
+	if (ret)
+		mtd_put_master(mtd);
+	else
+		item->device = device;
+	kfree(parts);
 	return ret;
 
-destroy_items:
-	mtd_virt_concat_destroy_items();
-
+out_device:
+	kfree(device);
+out_name:
+	kfree(name);
+out_parts:
+	kfree(parts);
 	return ret;
 }
 
-/**
- * mtd_virt_concat_create_join - Create and register the concatenated
- *                                 MTD device.
- *
- * Return: 0 on success, -error otherwise.
- */
-int mtd_virt_concat_create_join(void)
+int mtd_virt_concat_create_join(struct mtd_info *master)
 {
 	struct mtd_virt_concat_node *item;
-	struct mtd_concat *concat;
-	struct mtd_info *mtd;
-	ssize_t name_sz;
-	int ret, idx;
-	char *name;
-
-	list_for_each_entry(item, &concat_node_list, head) {
-		concat = item->concat;
-		/*
-		 * Check if item->count != concat->num_subdev, it indicates
-		 * that the MTD information for all devices included in the
-		 * concatenation are not handy, concat MTD device can't be
-		 * created hence switch to next concat device.
-		 */
-		if (item->count != concat->num_subdev) {
-			continue;
-		} else {
-			/* Calculate the legth of the name of the virtual device */
-			for (idx = 0, name_sz = 0; idx < concat->num_subdev; idx++)
-				name_sz += (strlen(concat->subdev[idx]->name) + 1);
-			name_sz += strlen(CONCAT_POSTFIX);
-			name = kmalloc(name_sz + 1, GFP_KERNEL);
-			if (!name) {
-				mtd_virt_concat_put_mtd_devices(concat);
-				return -ENOMEM;
-			}
+	unsigned int i;
+	int ret;
 
-			ret = 0;
-			for (idx = 0; idx < concat->num_subdev; idx++) {
-				ret += sprintf((name + ret), "%s-",
-					       concat->subdev[idx]->name);
-			}
-			sprintf((name + ret), CONCAT_POSTFIX);
-
-			if (concat->mtd.name) {
-				ret = memcmp(concat->mtd.name, name, name_sz);
-				if (ret == 0) {
-					kfree(name);
-					continue;
-				}
-			}
-			mtd = mtd_concat_create(concat->subdev, concat->num_subdev, name);
-			if (!mtd) {
-				kfree(name);
-				return -ENXIO;
+	guard(mutex)(&concat_lock);
+	list_for_each_entry(item, &concat_node_list, node) {
+		bool ready = true, includes_master = false;
+
+		for (i = 0; i < item->count; i++) {
+			struct mtd_virt_concat_part *part = &item->parts[i];
+
+			if (part->mtd && mtd_get_master(part->mtd) == master) {
+				part->ready = true;
+				includes_master = true;
 			}
-			concat->mtd = *mtd;
-			/* Arbitrary set the first device as parent */
-			concat->mtd.dev.parent = concat->subdev[0]->dev.parent;
-			concat->mtd.dev = concat->subdev[0]->dev;
-
-			/* Add the mtd device */
-			ret = add_mtd_device(&concat->mtd);
-			if (ret)
-				goto destroy_concat;
+			ready &= part->ready;
 		}
+		if (!ready || !includes_master || item->device)
+			continue;
+		ret = mtd_virt_concat_register(item);
+		if (ret)
+			return ret;
 	}
-
 	return 0;
-
-destroy_concat:
-	mtd_concat_destroy(mtd);
-
-	return ret;
 }
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 1c31e2a5fbe0..63feb4c9b8b0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -111,13 +111,13 @@ static void mtd_master_release(struct kref *ref)
 		module_put(owner);
 }
 
-static void mtd_get_lifetime(struct mtd_info *master)
+void mtd_get_lifetime(struct mtd_info *master)
 {
 	if (master->master.release)
 		kref_get(&master->master.life_refcnt);
 }
 
-static void mtd_put_lifetime(struct mtd_info *master)
+void mtd_put_lifetime(struct mtd_info *master)
 {
 	if (master->master.release)
 		kref_put(&master->master.life_refcnt, mtd_master_release);
@@ -1016,7 +1016,7 @@ int del_mtd_device(struct mtd_info *mtd)
  * Set a few defaults based on the parent devices, if not provided by the
  * driver
  */
-static void mtd_set_dev_defaults(struct mtd_info *mtd)
+void mtd_set_dev_defaults(struct mtd_info *mtd)
 {
 	if (mtd->dev.parent) {
 		if (!mtd->owner && mtd->dev.parent->driver)
@@ -1289,7 +1289,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 		goto out;
 
 	if (IS_REACHABLE(CONFIG_MTD_VIRT_CONCAT)) {
-		ret = mtd_virt_concat_create_join();
+		ret = mtd_virt_concat_create_join(mtd);
 		if (ret < 0)
 			goto out;
 	}
@@ -1310,6 +1310,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 
 out:
 	if (ret) {
+		del_mtd_partitions(mtd);
 		nvmem_unregister(mtd->otp_user_nvmem);
 		nvmem_unregister(mtd->otp_factory_nvmem);
 	}
diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index b014861a06a6..232cceeb5742 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -10,6 +10,9 @@ extern struct backing_dev_info *mtd_bdi;
 struct mtd_info *__mtd_next_device(int i);
 int __must_check add_mtd_device(struct mtd_info *mtd);
 int del_mtd_device(struct mtd_info *mtd);
+void mtd_set_dev_defaults(struct mtd_info *mtd);
+void mtd_get_lifetime(struct mtd_info *master);
+void mtd_put_lifetime(struct mtd_info *master);
 int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *, int);
 int del_mtd_partitions(struct mtd_info *);
 void release_mtd_partition(struct mtd_info *mtd);
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index c316cfe92c7e..bcbe8772d464 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -323,6 +323,9 @@ static int __mtd_del_partition(struct mtd_info *mtd)
 	struct mtd_info *child, *next;
 	int err;
 
+	if (IS_REACHABLE(CONFIG_MTD_VIRT_CONCAT))
+		mtd_virt_concat_destroy(mtd);
+
 	list_for_each_entry_safe(child, next, &mtd->partitions, part.node) {
 		err = __mtd_del_partition(child);
 		if (err)
@@ -374,6 +377,8 @@ int del_mtd_partitions(struct mtd_info *mtd)
 	pr_info("Deleting MTD partitions on \"%s\":\n", mtd->name);
 
 	mutex_lock(&master->master.partitions_lock);
+	if (IS_REACHABLE(CONFIG_MTD_VIRT_CONCAT))
+		mtd_virt_concat_destroy(mtd);
 	ret = __del_mtd_partitions(mtd);
 	mutex_unlock(&master->master.partitions_lock);
 
@@ -426,8 +431,15 @@ int add_mtd_partitions(struct mtd_info *parent,
 		}
 
 		if (IS_REACHABLE(CONFIG_MTD_VIRT_CONCAT)) {
-			if (mtd_virt_concat_add(child))
+			ret = mtd_virt_concat_add(child);
+			if (ret < 0) {
+				free_partition(child);
+				goto err_del_partitions;
+			}
+			if (ret) {
+				cur_offset = child->part.offset + child->part.size;
 				continue;
+			}
 		}
 
 		mutex_lock(&master->master.partitions_lock);
diff --git a/include/linux/mtd/concat.h b/include/linux/mtd/concat.h
index f8d4d6ac1fc1..0ba048688b15 100644
--- a/include/linux/mtd/concat.h
+++ b/include/linux/mtd/concat.h
@@ -43,23 +43,23 @@ int mtd_virt_concat_node_create(void);
  * mtd_virt_concat_add - add mtd_info object to the list of subdevices for concatenation
  * @mtd: pointer to new MTD device info structure
  *
- * Returns true if the mtd_info object is added successfully else returns false.
+ * Returns 1 if added, 0 if not a component, or a negative error code.
  *
  * The mtd_info object is added to the list of subdevices for concatenation.
- * It returns true if a match is found, and false if all subdevices have
- * already been added or if the mtd_info object does not match any of the
- * intended MTD devices.
+ * A duplicate component is rejected; the caller retains ownership on error
+ * or when the partition does not match a concatenation.
  */
-bool mtd_virt_concat_add(struct mtd_info *mtd);
+int mtd_virt_concat_add(struct mtd_info *mtd);
 
 /**
  * mtd_virt_concat_create_join - Create and register the concatenated MTD device
+ * @master: master whose partition registration has completed
  *
  * Returns 0 on succes, or a negative error code.
  *
  * Creates and registers the concatenated MTD device
  */
-int mtd_virt_concat_create_join(void);
+int mtd_virt_concat_create_join(struct mtd_info *master);
 
 /**
  * mtd_virt_concat_destroy - Remove the concat that includes a specific mtd device
@@ -68,9 +68,9 @@ int mtd_virt_concat_create_join(void);
  *
  * Returns 0 on succes, or a negative error code.
  *
- * If the mtd_info object is part of a concatenated device, all other MTD devices
- * within that concat are registered individually. The concatenated device is then
- * removed, along with its concatenation component.
+ * Unregister concatenations containing this device or its partitions and
+ * release its staged components. Components of other masters remain staged
+ * for a later rebind. Acquired handles retain their original component set.
  *
  */
 int mtd_virt_concat_destroy(struct mtd_info *mtd);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
