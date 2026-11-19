Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB30260A5BDC
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 16:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=swhQrqd5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HAly4Lpr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3AAJ1KD6r80kP4sXrZ2oMrLgInGTgc/LfvSVE4mgVk8=; b=swhQrqd5nofyoQBOFc1itYv0l8
	oD3op2scNVsQx8WOWrxdgSy8/NBB6/mgZl1Q1rHKfsqDEU3OtDi+PhUGwzjTjYKkNAr8DHBv6GDuv
	N7CVY/NuTpaomAnzGwHxT5szxbtXSz3iomvTAd2nvSMUvMUV4VTr77MHW7ZZUIuaoOFb73wuBthYi
	OqnCXqBloSZAmvY0nTGpimowi+ifQhOGRzPNde8Nl6XcsO0+dgRBw11EzCGewx9DAvb/HyNdg05Ew
	ZTnhcxfPzVTWRhg05DqJZFBSJuIV9t0kMasMgtvmZq7VGLrIAaOIEOoQizKbga0Clq4LvDK1PqAHo
	rmImfSRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5Dd-0000000Ch1I-283D;
	Thu, 19 Nov 2026 16:42:41 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5DX-0000000CgrA-3pVU
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 16:42:37 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-706113e92f9so1524071eaf.2
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 08:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106555; x=1795711355; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hzv13UFV3Pl9XMFamXY9cAE0rjp5+8r0g5vJP65x6c8=;
        b=HAly4Lprd4Mhiyo2tzGBWUt9XRB++0gSPg9H2bTu/KRAg7GlzFvH8lYxKZpHCax53G
         wS6KxLy9l+25ECoMXCv8W/h4+4wafVIFvTDJvrVGSJJE1pve/0SMqzOBIV7xfn5FUS5B
         akkHzfH8Kd3JlPpOU2jlVy7efNu+tqDO6VsZ+zX8f3Rze6USlBAiDiycl/+ru9rDg89T
         4lzGbthpWVfnIBelz0rdUNACYE46hye2dZFIqqlVE5dTsBZXgfweRJo+QZk+ynlynXQ3
         wlkK1B/6qyEulR1f8QqWk50VR5fY+4BtyoyhNWc02ZJW7DISGAJSJjtk1BRnhKrdb43B
         7kgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106555; x=1795711355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hzv13UFV3Pl9XMFamXY9cAE0rjp5+8r0g5vJP65x6c8=;
        b=1WJvvks+F906YAlltouZIOWHfHmw/R+zUkfIZ2FJf05PXI5CpGjFGxFLwbqMN5eAyW
         By3BrhVDvN9rBMkSxeYuAyQJGDKNd64A6j/xBhZdDBvng7kGRTWy8glvwtwf36+OW72A
         /XzWcFfbWNEzF4TAu1atB3TKGh0zCRXeNanlDLvC3vXbCEoc7kDp2+gcKzrAyj/iZDed
         aqYfSpb0ZmIrxqRudcKiSBdq8//G4/DGi9qr29RghHbWmoMhJVzkm73cJ/dueccQCRpm
         I5KUcYKv4TM4JUSQH0DQ6jd1cJQl1d2G8YzlA7nBQhlAAbJurQbWcel29XrbumT7ucMi
         /+mw==
X-Forwarded-Encrypted: i=1; AL+hErHpa6hM62LZcP9BOKjwZJYZlCaMz8DlMm+eJP9qgrZxdjq/UgmKjKJ7EG93uimv8ws51tE2Za+SsIQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z/3xu7hak9zBJJr2RICArhI8dmGUlrp/KXXwP1sCKoCwWS4qj4w
	nK0XSKKFzasyimTDeB6KLZhUdcLXfVqhGYvr1j/pY3EmImO1HwlG//cS
X-Gm-Gg: AYBFou14rPV/lTRU8ReE1kCX6Eig7X2Ay+vlb1/6Kpn4DDFMUJuSW3xtAjN0qadkVL3
	Wpe8IBVT+idoHkj8TIYucPcOcSFCE8rTCtJ49YWn+HfqLPXFC1PLTmaoTcWIp40C6x12vm7nl3d
	v0xBpjMqmcRDvWNmqq4R6ZbOF259c52QMg+ZjhQWtDMXSnBBnc9lx2UN4RgWSaVr95gxsANGFIY
	FnoMTC7pwc5Ih8qa1UhMkL8sHt9DQqZSISbQJtP1yeWK5QXpEZyhQv6N99g5s91pmQ992+CjOz0
	frZpouvaB3u8b8su4FScA/v3FE3L7jyVGupUYUQb5KxpKfSU7TCX3lvS5hHAOCeeHLmSJJxw+y5
	d0KnNWhoel88P+cioTbWub8kenxtG7W+eKWQ9tRDKdfLiiE2PFKAbSafzY6dW5AUTJOA9Ku4R6J
	S7emBh692AOGdg2ai41SIXezJCUZeilT5lt3pTgqRjmV0n6W6GFbt4F7dpXUDDIcIRxnGkuaRTA
	iVAvCTG8RBHbmK+GjvP9Al5yG6N5uwKfg5w5piXc2/RHsowPtdK3R+kw1UVI1fDs6iFow2pMQPV
	uZruwn+Hqff3fK1XThv2q0wM3TXU58swxI+tD38H65rP0s1tl/1ScfP9v9koeNS/Md+o1bUd93q
	i0eeh/iT3LQegEcZyIi5lCXKtjx4heahS/7/eFstiLdpkyoGgXkeFrIi9uhvex0aMFLdjp6aqvb
	laMiYseX1iPZuj689k/C5DnuKbqgW60d0FikJGlciJWKAh158DtXA=
X-Received: by 2002:a05:6820:4a19:b0:71a:fc24:cdaa with SMTP id 006d021491bc7-71b3940542emr125468eaf.25.1795106554738;
        Thu, 19 Nov 2026 08:42:34 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm341975eaf.13.2026.11.19.08.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:42:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:42:04 -0700
Subject: [PATCH v2 06/11] nvmem: manage cell attributes independently of
 device resources
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261119-submit-nvmem-provider-lifetime-v1-v2-6-8fca3ec5f18c@gmail.com>
References: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
In-Reply-To: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
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
X-CRM114-CacheID: sfid-20261119_084235_979841_1B1BA4D8 
X-CRM114-Status: GOOD (  20.55  )
X-Spam-Score: -1.9 (-)
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
