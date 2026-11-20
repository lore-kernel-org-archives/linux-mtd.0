Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B285660A5BD4
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 20:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w2TPQHKc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LbldoUw8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3AAJ1KD6r80kP4sXrZ2oMrLgInGTgc/LfvSVE4mgVk8=; b=w2TPQHKcc8DZMirirpYQ8fh3Xp
	6ZDHGSmIZ95X5dSgRDqQkkBd1SUT+rUivada6iDjySwCKV79QoAHuQZet+qhwV/iMFIF3VNoE85NO
	OuEUVVu6Xe/oTqlS8Yh6VvYRZSugHmR0IP+y13ZfqbPkTBKX0PxIUCw10OWDC1n25NIVUErBe4PWl
	Vhtl4Tq5SEffkKypuz2CHE1iTCzWVkcp5VC8C0Y7XxPXG5nCsZuhhF/cnIjj8iH5OdQoXD+hvWKN1
	Flapcv2JaEMhrcYa8z6xuGz04BGNswIfTfd6wWNro7BxqZcYrIUECcVmP1aH6jbYRebFdnwN624Yk
	rF0Mq2pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUum-0000000GBxz-1wbz;
	Fri, 20 Nov 2026 20:08:56 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUua-0000000GBs8-2Q9o
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 20:08:50 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7f84a55cc06so841792a34.2
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 12:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205323; x=1795810123; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hzv13UFV3Pl9XMFamXY9cAE0rjp5+8r0g5vJP65x6c8=;
        b=LbldoUw8CZZ6IIaCsspFOCryv0lKsiPVzJfgNkgjGtpFIhoK+qJU0Rsnqb3n+Gtncm
         MFomceiGGXZjc0uBNOYhYF1estlv2QeoYsLSDU0dxxrJsnSe0N4gN6DPsOt9StFBaLtd
         Idcv0cg6XsRXw6S+CNRkUV/HsY27HmwnxC3XjK3LXj46S53futJvqw3/H+YXkmcAHxVK
         y33olMyf1Rcy1bOEl7rHaMtFrfd+VnL9zOSkrwG627NX9S286lk1fdo7ZxRfoydThv1o
         Dp8nmt7P/f9fORFalqXs0dK2ns6KxGF0YgVWZooFTs0SY0Iu3vnPt8sCHZelmplfyWKl
         3DtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205323; x=1795810123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hzv13UFV3Pl9XMFamXY9cAE0rjp5+8r0g5vJP65x6c8=;
        b=mpNHvfv6w/g3vBMSycctccfau66vj6JF5dh5aGzm0JhR9c3s0JOqDVS7Vc+CO+ZMFQ
         1YOhIf9kYYAoxM93miv1QAPIdyl+nlekecqhVxig5XFTpIW91LAIUy1iQylCpt5rWLBA
         BBm2pa1SYm3O0eqG0lO95C/UbF0SxHJvS7/3aYy/faitWIqEcQnthYrBzVH05XNyJLWC
         s2xM3x6hvsz4/v9v1QLRpVty+9iN3TMria37wFQHxnncqUt0OXjyAZw9/1AzeGQmQ6UB
         pQSFwwLYUZlBbebyte+10ARaxrHkTLCvrSymPP+tB+JbI7sH6FqVcItT8RlcLrYsaIKM
         4c+g==
X-Forwarded-Encrypted: i=1; AL+hErFLCEI3VxWDO+qBkQkM1LtBvqPEiP61FHACTliMLoGx6y/xBP/Js6RQDnHeBM7tvWQm3wIRKEhOkuo=@lists.infradead.org
X-Gm-Message-State: APuU4Z8Zp+RFnnWvVjtqRRiStKgHFUiNb/W1n30f7uiVUvXFozlkEwFO
	rIp07hr7FvawEsiaJ1zNOVeGoGyo6lYydZw6f/bhEcU/isp7ndNsW6bn
X-Gm-Gg: AYBFou1N8RlvG9hvuhqIcnax4D2AUVYymRBPm0JFYHIGFSb0kX278uXcQmmkuRmsmhF
	LZG95T8ChpSMO8f7DxyBhdQMs070qgOtGoiIGeKCzYF8C9RvE2b9++CIPWDSpvow3JcvyJoYC1F
	flf/zECmpUykG97HlL7NYi9+TQ01c2J1mHQ7bYpJlGr/bY++lF17Qc96TC8C7rZR4Z5SBuOw+4s
	6keg4r6pdKeQKc+AOBvrj3t69XdCTZEcjo4FeGk1F3Mt1daSN4h+h/0laWZ1U08IDt3QfF6fO6v
	nIYl8My565yY9rhGhW0Uh0ntHHewbe6O6kZOk7HPd7Aaz/UvRqLu/HrQ24ezBKLcUkzjYGPMygj
	OEkyBO+L3hVcEE1N3KnOW6jVlzR80m+iZyzeCl96jWJrcy5B4Etj+DcV+JcVOvnkgw5io0SuCWA
	krnXF8xSIj3RMDM2gOS5DQSrLrey3PfLfPrrv5CAJWEGT5T4dX/N6mts6LTq4gesLtoo1GkQwpc
	Zmc646r0rzWOfZqG21KuQGEXAcRsOiI+MICxx2Mw0vvOLTGnEPblc1YyNB4gyalZu2ePbjLp7hA
	jsCBWxaLONOoX5oWtu7DmCOXpDe4uWPs9AB/DOJGXOlp/O8oAqPwpCff51ocUui6lAaclwFr06m
	YZjjEd4UQJTQbyh532UozOj7B99RjTT0UNBxX9ALzi4ZeXHZrJ+WWPcUeG0Z2/AzCaFkbHKKCGF
	vfL9LamoAPop1guj+cHDJQ4ra7x9fA1bu99db+po5BFNcT2gbLykwGUw==
X-Received: by 2002:a05:6830:2e11:b0:862:a0ce:f557 with SMTP id 46e09a7af769-863152f9025mr4641936a34.4.1795205323499;
        Fri, 20 Nov 2026 12:08:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 13:08:36 -0700
Subject: [PATCH v3 06/11] nvmem: manage cell attributes independently of
 device resources
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-6-523610652402@gmail.com>
References: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
In-Reply-To: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Linus Walleij <linusw@kernel.org>, 
 Khouloud Touil <ktouil@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_120844_689645_C0C147B5 
X-CRM114-Status: GOOD (  19.75  )
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

Cell attributes are populated once and remain until device deletion. A
layout bound after provider registration therefore cannot publish its
cells through an existing group, and the group cannot be refreshed when
cells are removed.

Keep the group in the NVMEM device and explicitly allocate and release
its attributes. Each attribute holds a cell reference until sysfs has
drained its readers. Rebuild the group from the current cell list, and
unwind partial allocations if population fails.

Serialize group replacement separately from cell-list updates so removal
can wait for sysfs readers without holding nvmem_mutex. Remove the group
before device deletion on both unregister and registration failure.

Fixes: 0331c611949f ("nvmem: core: Expose cells through sysfs")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c      | 131 +++++++++++++++++++++++++++++++---------------
 drivers/nvmem/internals.h |   3 ++
 2 files changed, 92 insertions(+), 42 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index d9f1bb64a4a5..c74e3f4e1de6 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -13,6 +13,7 @@
 #include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/kref.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/nvmem-consumer.h>
@@ -476,59 +477,98 @@ static void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem)
 		device_remove_bin_file(nvmem->base_dev, &nvmem->eeprom);
 }
 
-static int nvmem_populate_sysfs_cells(struct nvmem_device *nvmem)
+static void nvmem_sysfs_free_cell_attrs(const struct bin_attribute * const *attrs)
 {
-	struct attribute_group group = {
-		.name	= "cells",
-	};
-	struct nvmem_cell_entry *entry;
-	const struct bin_attribute **pattrs;
-	struct bin_attribute *attrs;
-	unsigned int ncells = 0, i = 0;
-	int ret;
+	if (!attrs)
+		return;
 
-	guard(mutex)(&nvmem_mutex);
+	for (int i = 0; attrs[i]; i++) {
+		nvmem_cell_entry_put(attrs[i]->private);
+		kfree(attrs[i]->attr.name);
+		kfree(attrs[i]);
+	}
+	kfree(attrs);
+}
 
-	if (list_empty(&nvmem->cells) || nvmem->sysfs_cells_populated)
-		return 0;
+static void __nvmem_sysfs_remove_cells(struct nvmem_device *nvmem)
+{
+	lockdep_assert_held(&nvmem->sysfs_mutex);
 
-	/* Allocate an array of attributes with a sentinel */
-	ncells = list_count_nodes(&nvmem->cells);
-	pattrs = devm_kcalloc(&nvmem->dev, ncells + 1,
-			      sizeof(*pattrs), GFP_KERNEL);
-	if (!pattrs)
-		return -ENOMEM;
+	if (!nvmem->sysfs_cells_populated)
+		return;
 
-	attrs = devm_kcalloc(&nvmem->dev, ncells, sizeof(struct bin_attribute), GFP_KERNEL);
-	if (!attrs)
-		return -ENOMEM;
+	device_remove_group(&nvmem->dev, &nvmem->cells_group);
+	nvmem_sysfs_free_cell_attrs(nvmem->cells_group.bin_attrs);
+	nvmem->cells_group.bin_attrs = NULL;
+	nvmem->sysfs_cells_populated = false;
+}
 
-	/* Initialize each attribute to take the name and size of the cell */
-	list_for_each_entry(entry, &nvmem->cells, node) {
-		sysfs_bin_attr_init(&attrs[i]);
-		attrs[i].attr.name = devm_kasprintf(&nvmem->dev, GFP_KERNEL,
-						    "%s@%x,%x", entry->name,
-						    entry->offset,
-						    entry->bit_offset);
-		attrs[i].attr.mode = 0444 & nvmem_bin_attr_get_umode(nvmem);
-		attrs[i].size = entry->bytes;
-		attrs[i].read = &nvmem_cell_attr_read;
-		attrs[i].private = entry;
-		if (!attrs[i].attr.name)
-			return -ENOMEM;
+static void nvmem_sysfs_remove_cells(struct nvmem_device *nvmem)
+{
+	guard(mutex)(&nvmem->sysfs_mutex);
+	__nvmem_sysfs_remove_cells(nvmem);
+}
 
-		pattrs[i] = &attrs[i];
-		i++;
-	}
+static int nvmem_populate_sysfs_cells(struct nvmem_device *nvmem)
+{
+	struct nvmem_cell_entry *entry;
+	const struct bin_attribute **attrs = NULL;
+	unsigned int i = 0;
+	int ret = 0;
 
-	group.bin_attrs = pattrs;
+	guard(mutex)(&nvmem->sysfs_mutex);
 
-	ret = device_add_group(&nvmem->dev, &group);
-	if (ret)
-		return ret;
+	__nvmem_sysfs_remove_cells(nvmem);
+
+	scoped_guard(mutex, &nvmem_mutex) {
+		if (!rcu_access_pointer(nvmem->ops))
+			return -ENODEV;
+		if (list_empty(&nvmem->cells))
+			return 0;
 
-	nvmem->sysfs_cells_populated = true;
+		attrs = kcalloc(list_count_nodes(&nvmem->cells) + 1,
+				sizeof(*attrs), GFP_KERNEL);
+		if (!attrs)
+			return -ENOMEM;
 
+		list_for_each_entry(entry, &nvmem->cells, node) {
+			struct bin_attribute *attr;
+
+			attr = kzalloc_obj(*attr);
+			if (!attr) {
+				ret = -ENOMEM;
+				break;
+			}
+			sysfs_bin_attr_init(attr);
+			attr->attr.name = kasprintf(GFP_KERNEL, "%s@%x,%x",
+						   entry->name, entry->offset,
+						   entry->bit_offset);
+			if (!attr->attr.name) {
+				kfree(attr);
+				ret = -ENOMEM;
+				break;
+			}
+			attr->attr.mode = 0444 & nvmem_bin_attr_get_umode(nvmem);
+			attr->size = entry->bytes;
+			attr->read = nvmem_cell_attr_read;
+			attr->private = entry;
+			kref_get(&entry->refcnt);
+			attrs[i++] = attr;
+		}
+	}
+	if (!ret) {
+		nvmem->cells_group.name = "cells";
+		nvmem->cells_group.bin_attrs = attrs;
+
+		ret = device_add_group(&nvmem->dev, &nvmem->cells_group);
+		if (!ret) {
+			nvmem->sysfs_cells_populated = true;
+			return 0;
+		}
+		nvmem->cells_group.bin_attrs = NULL;
+	}
+
+	nvmem_sysfs_free_cell_attrs(attrs);
 	return ret;
 }
 
@@ -543,6 +583,10 @@ static void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem)
 {
 }
 
+static void nvmem_sysfs_remove_cells(struct nvmem_device *nvmem)
+{
+}
+
 #endif /* CONFIG_NVMEM_SYSFS */
 
 static void nvmem_cell_entry_release(struct kref *ref)
@@ -990,6 +1034,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	rcu_assign_pointer(nvmem->ops, ops);
 
 	device_initialize(&nvmem->dev);
+	mutex_init(&nvmem->sysfs_mutex);
 
 	if (!config->ignore_wp)
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
@@ -1098,6 +1143,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem_destroy_layout(nvmem);
 #endif
 err_remove_dev:
+	nvmem_sysfs_remove_cells(nvmem);
 	device_del(&nvmem->dev);
 err_remove_compat:
 	nvmem_sysfs_remove_compat(nvmem);
@@ -1125,6 +1171,7 @@ void nvmem_unregister(struct nvmem_device *nvmem)
 	nvmem_sysfs_remove_compat(nvmem);
 	nvmem_destroy_layout(nvmem);
 
+	nvmem_sysfs_remove_cells(nvmem);
 	device_unregister(&nvmem->dev);
 }
 EXPORT_SYMBOL_GPL(nvmem_unregister);
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index bc7a99f5aefb..79ea56822ebe 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -4,6 +4,7 @@
 #define _LINUX_NVMEM_INTERNALS_H
 
 #include <linux/device.h>
+#include <linux/mutex.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/nvmem-provider.h>
 #include <linux/srcu.h>
@@ -37,7 +38,9 @@ struct nvmem_device {
 	struct nvmem_layout	*layout;
 	struct nvmem_operations __rcu *ops;
 	void *priv;
+	struct mutex		sysfs_mutex;
 	bool			sysfs_cells_populated;
+	struct attribute_group cells_group;
 };
 
 int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
