Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F48606A33C
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r8PsIvKS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASBNrobi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ki1RRa3Hf91vTw38+HXlq0xcJwEwvAkqZV1j3+IClOE=; b=r8PsIvKSA9z7QEB0WRTV8RBUAU
	izv4XyFZQ0sMdDcHqvTlUSMSkeKNnJGD3jKYMf7FsEdSLF6UFVtGAxMObGA8kLEkbLFnrphWy92o3
	aeARsf1pTi49Xgr4A4RjcS3lc3h9WoXyzwUDYGdwLVc03OPmtq7Se76G9sZ/9XW00M43J5XR5Ke//
	63Qg7Qou8TcsIwXyNrf7ktgGwwL96smlbsoRf26AOlkDJNQwyxWfFlTSzqp4OHKkQg1A04sFGqZJ4
	t27RF/SxnpkMoAdp/xt5iTck3+G3Udyhl9FY+LxBi9SiNNP7Gt+Rp5sT77DWDExkMKpv335K9jqs6
	LmSx1CIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcD-00000008LCZ-2zYU;
	Thu, 12 Nov 2026 01:28:37 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJc6-00000008L8o-18il
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:28:33 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-53dda625f63so2444261b6e.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446909; x=1795051709; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hMhTaF/Lq9srjx6odTOPS5fFn4jWcOaxw/rA3kVk6mw=;
        b=ASBNrobiDJ9/im/82fDryvWCKl1/fMYHABsjMHXYZ/pV0xW2JgjzfmUeWQ2CGU+suC
         VkxCu9IiQ/FVFZWt/EoZpKsNMDMR8Xw95hesZZyMAHgHUfIH27/uWuWzs/NsCxRzjhbw
         EkH8DyjYZVyCI+RbSukekUOFnjFOaeVnVpaCX/pObge/XbOn6wYLqVztPjP+RF2fSfK6
         DQwK3mL9jwJtBKCpXRoAp0BvVroNIBheUQ7Kb58F7lDOPjFCA0DITXx/bzIQjpndtkP0
         b0L6eb0lwlWfB+pkGftXauhT4ORmddtatKIRzjH20bmuESgd8gXQwqSF6P7ErrSQb5OD
         Tt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446909; x=1795051709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMhTaF/Lq9srjx6odTOPS5fFn4jWcOaxw/rA3kVk6mw=;
        b=FCE3ChQSNMg/CNy5XrD1Yf7+c64mJdUhXsnnVBUWdgcffjiDXIDDh8Qkg6TuC5ZaBU
         wv93aA4P5yWBsQf1JvniHkZR7UtN7CK2yz7seQYtJGAaVUYTB7vmRuOH1bcEFd+pzGPL
         GO8LjF4VSU0lpy9NLLsejjGu/65ExNHqycCPZwR/qQ9rnZanbKhd+1gkS+BtecvE358M
         VOSp1we0Cxt2QJbLCNSbBw+sw4SUnxJjewMb/VlYU349KdYVXVhVE/9A3WmQJ+h4DOqg
         DWRCohOufuZ9PCdRC7p3quVBDfRd8haDiV57CoRVV9+0kLlQ7D3XPS+u6SoBzRBs6aQs
         QNoA==
X-Gm-Message-State: APuU4Z8q+dIZghrMeKsZo2/xF0bSWKEy54oM4q5nsyfl6xkomx9rhShG
	L9j6rNRgOuoWIFd9Amb8s867VTrvvFCIz54PPpSJlBvqV88GE/viIaKRvCU96NU5
X-Gm-Gg: AYBFou0Dav0xsKuUEi+hP1tLaJBexD20BS0cLKeYNra1nK2tEifizKuZlcaufP5TzfH
	N7werH8+Qkewqt/EHmq7k51PrX1AWm328LjWQLGA19kfSJDxj8rodL6IiRyWsGyjELYJDpN2Vsm
	Ku0JzMTRAXPy4D9sHlbZvZh+H6T3WWEXTdBuaNd7BakrBWrhW29OXx0fV/4MEt1IFz9Sdn70rNG
	bWZskMFQumLX5V5Nc05RUQnQhXeSP9J9BwCfTTvvbloSlstSdvbhN0QMrKv80iaZcCkMQoql2vo
	nI18KWrZ59ohf4wKRvx/a55oPQz8p9BlwAMchDdClukaBjTCPgY5ANo1ZmafmZoVrUhXVv4UHdw
	dEPdD0Y/S6xmIEA1WevsES5MUBB5+CBI4GH+kIPOM0hMg5N6nRXvD6rq+WbbXqYpMQ2Zm/05vJb
	lMgrzJkUcpI2pGqTA4Yz1O3fC/I8fGU6vQ2ZbaUjWhFPkhI3MkE5vg5zCT1aMCTBYnQQFnoCJOf
	SpCkrHqj5TzlpWiVHVwvFY+d7x+JEoRiFgbM4cp8AsXpgMKUmGRUK48gXwkYiJmaxjU7aRpl66k
	bOdwtVpji1WTiFj9fSv24W6/Upr7mdt9FCN79V4ac1mPVfmwZ8hd4cviZyskwFXUZgajNh0/bP/
	fjXg6NU/7vc/Q2ovSuXS+acEArkpOz/G50Qw5BxpGXQbn4xx0hEl3SHRYq4mDBzMvOEbJ9T5OBR
	g3Cy0KPjQ9cWimU1pI3H4EFRxitiaMZ2hTTcos/3rE2cGjuRfO98w0Wg==
X-Received: by 2002:a05:6808:c12a:b0:4f4:4eef:52cc with SMTP id 5614622812f47-56b97717f4emr3821584b6e.43.1794446908845;
        Wed, 11 Nov 2026 17:28:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:40 -0700
Subject: [PATCH v3 01/58] nvmem: disconnect provider callbacks before
 unregister returns
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-1-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Tze Yee Ng <tze.yee.ng@altera.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172830_388318_87FC145D 
X-CRM114-Status: GOOD (  27.77  )
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

An NVMEM consumer or device reference can outlive provider unbind. The
reference retains the NVMEM allocation, but not the private data or
hardware resources that the provider releases during remove. Pinning the
provider module also does not prevent unbind from freeing that state.

Reject new callback access once unregister starts and drain admitted
accesses with SRCU before returning to the provider. Cover register
access, keepout handling, cell post-processing and device matching.
Existing consumers retain core-owned metadata and return -ENODEV after
disconnection. Release the write-protect GPIO after the drain so
retained references do not prevent a new provider from requesting it.
The final device release frees only core-owned data.

Give cell entries their own references and retire layout cells when
their driver is unbound. Remove and drain cell attributes and callbacks
before layout-owned state is freed. Rebinding creates new entries; held
old cells remain disconnected. Remove partially added cells when a
layout probe fails, and destroy the layout during provider unregister
rather than at the final consumer put.

Preserve the existing exporter-module references. Providers remain
responsible for unregistering before releasing callback state.

Retain the firmware node explicitly and serialize consumer-reference
acquisition with disconnection. This lets MTD unregister an OTP provider
before freeing its backing object without requiring a release callback
into the departing provider module.

Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/Kconfig          |   1 +
 drivers/nvmem/core.c           | 297 +++++++++++++++++++++++++++--------------
 drivers/nvmem/internals.h      |  13 +-
 drivers/nvmem/layouts.c        |   2 +
 include/linux/nvmem-provider.h |   3 +
 5 files changed, 206 insertions(+), 110 deletions(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index c36c2a4c2a0b..550f3118071a 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig NVMEM
 	bool "NVMEM Support"
+	select SRCU
 	imply NVMEM_LAYOUTS
 	help
 	  Support for NVMEM(Non Volatile Memory) devices like EEPROM, EFUSES...
diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 0556d140170a..8571d821591c 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -27,6 +27,9 @@
 
 #define FLAG_COMPAT		BIT(0)
 struct nvmem_cell_entry {
+	struct kref		refcnt;
+	bool			disconnected;
+	struct nvmem_layout	*layout;
 	const char		*name;
 	int			offset;
 	size_t			raw_len;
@@ -57,28 +60,25 @@ static BLOCKING_NOTIFIER_HEAD(nvmem_notifier);
 static int __nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
 			    void *val, size_t bytes)
 {
-	struct nvmem_operations *ops = nvmem->ops;
-
-	if (!ops->reg_read)
+	if (!nvmem->reg_read)
 		return -EOPNOTSUPP;
 
-	return ops->reg_read(nvmem->priv, offset, val, bytes);
+	return nvmem->reg_read(nvmem->priv, offset, val, bytes);
 }
 
 static int __nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
 			     void *val, size_t bytes)
 {
-	struct nvmem_operations *ops = nvmem->ops;
 	int ret, wr_ok;
 
-	if (!ops->reg_write)
+	if (!nvmem->reg_write)
 		return -EOPNOTSUPP;
 
 	ret = gpiod_set_value_cansleep(nvmem->wp_gpio, 0);
 	if (ret)
 		return ret;
 
-	wr_ok = ops->reg_write(nvmem->priv, offset, val, bytes);
+	wr_ok = nvmem->reg_write(nvmem->priv, offset, val, bytes);
 
 	ret = gpiod_set_value_cansleep(nvmem->wp_gpio, 1);
 	if (ret)
@@ -154,6 +154,10 @@ static int nvmem_access_with_keepouts(struct nvmem_device *nvmem,
 static int nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
 			  void *val, size_t bytes)
 {
+	guard(srcu)(&nvmem->srcu);
+	if (READ_ONCE(nvmem->disconnected))
+		return -ENODEV;
+
 	if (!nvmem->nkeepout)
 		return __nvmem_reg_read(nvmem, offset, val, bytes);
 
@@ -163,6 +167,10 @@ static int nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
 static int nvmem_reg_write(struct nvmem_device *nvmem, unsigned int offset,
 			   void *val, size_t bytes)
 {
+	guard(srcu)(&nvmem->srcu);
+	if (READ_ONCE(nvmem->disconnected))
+		return -ENODEV;
+
 	if (!nvmem->nkeepout)
 		return __nvmem_reg_write(nvmem, offset, val, bytes);
 
@@ -289,8 +297,6 @@ static ssize_t bin_attr_nvmem_write(struct file *filp, struct kobject *kobj,
 
 static umode_t nvmem_bin_attr_get_umode(struct nvmem_device *nvmem)
 {
-	struct nvmem_operations *ops = nvmem->ops;
-
 	umode_t mode = 0400;
 
 	if (!nvmem->root_only)
@@ -299,10 +305,10 @@ static umode_t nvmem_bin_attr_get_umode(struct nvmem_device *nvmem)
 	if (!nvmem->read_only)
 		mode |= 0200;
 
-	if (!ops->reg_write)
+	if (!nvmem->reg_write)
 		mode &= ~0200;
 
-	if (!ops->reg_read)
+	if (!nvmem->reg_read)
 		mode &= ~0444;
 
 	return mode;
@@ -333,7 +339,6 @@ static umode_t nvmem_attr_is_visible(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct nvmem_device *nvmem = to_nvmem_device(dev);
-	struct nvmem_operations *ops = nvmem->ops;
 
 	/*
 	 * If the device has no .reg_write operation, do not allow
@@ -342,7 +347,7 @@ static umode_t nvmem_attr_is_visible(struct kobject *kobj,
 	 * can be forced into read-write mode using the 'force_ro'
 	 * attribute.
 	 */
-	if (attr == &dev_attr_force_ro.attr && !ops->reg_write)
+	if (attr == &dev_attr_force_ro.attr && !nvmem->reg_write)
 		return 0;	/* Attribute not visible */
 
 	return attr->mode;
@@ -468,9 +473,6 @@ static void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem)
 
 static int nvmem_populate_sysfs_cells(struct nvmem_device *nvmem)
 {
-	struct attribute_group group = {
-		.name	= "cells",
-	};
 	struct nvmem_cell_entry *entry;
 	const struct bin_attribute **pattrs;
 	struct bin_attribute *attrs;
@@ -479,6 +481,9 @@ static int nvmem_populate_sysfs_cells(struct nvmem_device *nvmem)
 
 	guard(mutex)(&nvmem_mutex);
 
+	if (nvmem->disconnected)
+		return -ENODEV;
+
 	if (list_empty(&nvmem->cells) || nvmem->sysfs_cells_populated)
 		return 0;
 
@@ -511,9 +516,10 @@ static int nvmem_populate_sysfs_cells(struct nvmem_device *nvmem)
 		i++;
 	}
 
-	group.bin_attrs = pattrs;
+	nvmem->cells_group.name = "cells";
+	nvmem->cells_group.bin_attrs = pattrs;
 
-	ret = device_add_group(&nvmem->dev, &group);
+	ret = device_add_group(&nvmem->dev, &nvmem->cells_group);
 	if (ret)
 		return ret;
 
@@ -540,8 +546,8 @@ static void nvmem_release(struct device *dev)
 	struct nvmem_device *nvmem = to_nvmem_device(dev);
 
 	ida_free(&nvmem_ida, nvmem->id);
-	gpiod_put(nvmem->wp_gpio);
-	kfree(nvmem->ops);
+	of_node_put(nvmem->dev.of_node);
+	cleanup_srcu_struct(&nvmem->srcu);
 	kfree(nvmem);
 }
 
@@ -553,22 +559,30 @@ static const struct bus_type nvmem_bus_type = {
 	.name		= "nvmem",
 };
 
-static void nvmem_cell_entry_drop(struct nvmem_cell_entry *cell)
+static void nvmem_cell_entry_release(struct kref *ref)
 {
-	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE, cell);
-	scoped_guard(mutex, &nvmem_mutex)
-		list_del(&cell->node);
+	struct nvmem_cell_entry *cell = container_of(ref, struct nvmem_cell_entry, refcnt);
+
 	of_node_put(cell->np);
 	kfree_const(cell->name);
 	kfree(cell);
 }
 
+static void nvmem_cell_entry_put(struct nvmem_cell_entry *cell)
+{
+	kref_put(&cell->refcnt, nvmem_cell_entry_release);
+}
+
 static void nvmem_device_remove_all_cells(const struct nvmem_device *nvmem)
 {
 	struct nvmem_cell_entry *cell, *p;
 
-	list_for_each_entry_safe(cell, p, &nvmem->cells, node)
-		nvmem_cell_entry_drop(cell);
+	list_for_each_entry_safe(cell, p, &nvmem->cells, node) {
+		blocking_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE, cell);
+		scoped_guard(mutex, &nvmem_mutex)
+			list_del(&cell->node);
+		nvmem_cell_entry_put(cell);
+	}
 }
 
 static void nvmem_cell_entry_add(struct nvmem_cell_entry *cell)
@@ -583,6 +597,7 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
 						     struct nvmem_cell_entry *cell)
 {
 	cell->nvmem = nvmem;
+	cell->disconnected = false;
 	cell->offset = info->offset;
 	cell->raw_len = info->raw_len ?: info->bytes;
 	cell->bytes = info->bytes;
@@ -653,6 +668,10 @@ int nvmem_add_one_cell(struct nvmem_device *nvmem,
 	struct nvmem_cell_entry *cell;
 	int rval;
 
+	guard(srcu)(&nvmem->srcu);
+	if (READ_ONCE(nvmem->disconnected))
+		return -ENODEV;
+
 	cell = kzalloc_obj(*cell);
 	if (!cell)
 		return -ENOMEM;
@@ -663,6 +682,8 @@ int nvmem_add_one_cell(struct nvmem_device *nvmem,
 		return rval;
 	}
 
+	kref_init(&cell->refcnt);
+	cell->layout = nvmem->layout;
 	nvmem_cell_entry_add(cell);
 
 	return 0;
@@ -729,6 +750,7 @@ nvmem_find_cell_entry_by_name(struct nvmem_device *nvmem, const char *cell_id)
 	list_for_each_entry(iter, &nvmem->cells, node) {
 		if (strcmp(cell_id, iter->name) == 0) {
 			cell = iter;
+			kref_get(&cell->refcnt);
 			break;
 		}
 	}
@@ -795,6 +817,10 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
 	const __be32 *addr;
 	int len, ret;
 
+	guard(srcu)(&nvmem->srcu);
+	if (READ_ONCE(nvmem->disconnected))
+		return -ENODEV;
+
 	for_each_child_of_node_scoped(np, child) {
 		struct nvmem_cell_info info = {0};
 
@@ -851,29 +877,81 @@ int nvmem_layout_register(struct nvmem_layout *layout)
 	if (!layout->add_cells)
 		return -EINVAL;
 
-	/* Populate the cells */
-	ret = layout->add_cells(layout);
+	scoped_guard(srcu, &layout->nvmem->srcu) {
+		if (READ_ONCE(layout->nvmem->disconnected))
+			return -ENODEV;
+		ret = layout->add_cells(layout);
+	}
 	if (ret)
-		return ret;
+		goto err_unregister;
 
 #ifdef CONFIG_NVMEM_SYSFS
 	ret = nvmem_populate_sysfs_cells(layout->nvmem);
-	if (ret) {
-		nvmem_device_remove_all_cells(layout->nvmem);
-		return ret;
-	}
+	if (ret)
+		goto err_unregister;
 #endif
 
 	return 0;
+
+err_unregister:
+	nvmem_layout_unregister(layout);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(nvmem_layout_register);
 
 void nvmem_layout_unregister(struct nvmem_layout *layout)
 {
-	/* Keep the API even with an empty stub in case we need it later */
+	struct nvmem_device *nvmem = layout->nvmem;
+	struct nvmem_cell_entry *cell, *next;
+	struct attribute_group group = {};
+	LIST_HEAD(cells);
+
+	scoped_guard(mutex, &nvmem_mutex) {
+		if (nvmem->sysfs_cells_populated)
+			group = nvmem->cells_group;
+		list_for_each_entry_safe(cell, next, &nvmem->cells, node) {
+			if (cell->layout != layout)
+				continue;
+			WRITE_ONCE(cell->disconnected, true);
+			list_move_tail(&cell->node, &cells);
+		}
+	}
+
+	if (group.bin_attrs) {
+		device_remove_group(&nvmem->dev, &group);
+		scoped_guard(mutex, &nvmem_mutex) {
+			nvmem->sysfs_cells_populated = false;
+			memset(&nvmem->cells_group, 0, sizeof(nvmem->cells_group));
+		}
+		for (int i = 0; group.bin_attrs[i]; i++)
+			devm_kfree(&nvmem->dev, (void *)group.bin_attrs[i]->attr.name);
+		devm_kfree(&nvmem->dev, (void *)group.bin_attrs[0]);
+		devm_kfree(&nvmem->dev, group.bin_attrs);
+	}
+
+	/* Old cell handles retain data, never a departing layout's callbacks. */
+	synchronize_srcu(&nvmem->srcu);
+	list_for_each_entry_safe(cell, next, &cells, node) {
+		blocking_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE, cell);
+		list_del(&cell->node);
+		nvmem_cell_entry_put(cell);
+	}
+#ifdef CONFIG_NVMEM_SYSFS
+	if (!READ_ONCE(nvmem->disconnected) && nvmem_populate_sysfs_cells(nvmem))
+		dev_warn(&nvmem->dev, "Failed to restore provider cell attributes\n");
+#endif
 }
 EXPORT_SYMBOL_GPL(nvmem_layout_unregister);
 
+static void nvmem_disconnect(struct nvmem_device *nvmem)
+{
+	scoped_guard(mutex, &nvmem_mutex)
+		WRITE_ONCE(nvmem->disconnected, true);
+	synchronize_srcu(&nvmem->srcu);
+	gpiod_put(nvmem->wp_gpio);
+	nvmem->wp_gpio = NULL;
+}
+
 /**
  * nvmem_register() - Register a nvmem device for given nvmem_config.
  * Also creates a binary entry in /sys/bus/nvmem/devices/dev-name/nvmem
@@ -883,10 +961,8 @@ EXPORT_SYMBOL_GPL(nvmem_layout_unregister);
  * Return: Will be an ERR_PTR() on error or a valid pointer to nvmem_device
  * on success.
  */
-
 struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 {
-	struct nvmem_operations *ops;
 	struct nvmem_device *nvmem;
 	int rval;
 
@@ -900,15 +976,15 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	if (!nvmem)
 		return ERR_PTR(-ENOMEM);
 
-	ops = kzalloc_obj(*ops);
-	if (!ops) {
+	rval = init_srcu_struct(&nvmem->srcu);
+	if (rval) {
 		kfree(nvmem);
-		return ERR_PTR(-ENOMEM);
+		return ERR_PTR(rval);
 	}
 
 	rval = ida_alloc(&nvmem_ida, GFP_KERNEL);
 	if (rval < 0) {
-		kfree(ops);
+		cleanup_srcu_struct(&nvmem->srcu);
 		kfree(nvmem);
 		return ERR_PTR(rval);
 	}
@@ -918,10 +994,11 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem->dev.type = &nvmem_provider_type;
 	nvmem->dev.bus = &nvmem_bus_type;
 	nvmem->dev.parent = config->dev;
-	nvmem->ops = ops;
 
 	device_initialize(&nvmem->dev);
 
+	nvmem->priv = config->priv;
+
 	if (!config->ignore_wp)
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
 						    GPIOD_OUT_HIGH);
@@ -935,8 +1012,8 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	INIT_LIST_HEAD(&nvmem->cells);
 	nvmem->fixup_dt_cell_info = config->fixup_dt_cell_info;
 
-	ops->reg_read = config->reg_read;
-	ops->reg_write = config->reg_write;
+	nvmem->reg_read = config->reg_read;
+	nvmem->reg_write = config->reg_write;
 
 	nvmem->owner = config->owner;
 	if (!nvmem->owner && config->dev->driver)
@@ -945,14 +1022,13 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem->word_size = config->word_size ?: 1;
 	nvmem->size = config->size;
 	nvmem->root_only = config->root_only;
-	nvmem->priv = config->priv;
 	nvmem->type = config->type;
 	nvmem->keepout = config->keepout;
 	nvmem->nkeepout = config->nkeepout;
 	if (config->of_node)
-		nvmem->dev.of_node = config->of_node;
+		nvmem->dev.of_node = of_node_get(config->of_node);
 	else
-		nvmem->dev.of_node = config->dev->of_node;
+		nvmem->dev.of_node = of_node_get(config->dev->of_node);
 
 	switch (config->id) {
 	case NVMEM_DEVID_NONE:
@@ -972,7 +1048,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 		goto err_put_device;
 
 	nvmem->read_only = device_property_present(config->dev, "read-only") ||
-			   config->read_only || !ops->reg_write;
+			   config->read_only || !nvmem->reg_write;
 
 #ifdef CONFIG_NVMEM_SYSFS
 	nvmem->dev.groups = nvmem_dev_groups;
@@ -1010,7 +1086,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 
 	rval = nvmem_populate_layout(nvmem);
 	if (rval)
-		goto err_remove_dev;
+		goto err_unregister;
 
 	/* If the device has WP GPIO, default to read-only */
 	if (nvmem->wp_gpio)
@@ -1019,23 +1095,24 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 #ifdef CONFIG_NVMEM_SYSFS
 	rval = nvmem_populate_sysfs_cells(nvmem);
 	if (rval)
-		goto err_destroy_layout;
+		goto err_unregister;
 #endif
 
 	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
 
 	return nvmem;
 
-#ifdef CONFIG_NVMEM_SYSFS
-err_destroy_layout:
-	nvmem_destroy_layout(nvmem);
-#endif
-err_remove_dev:
-	device_del(&nvmem->dev);
+err_unregister:
+	nvmem_unregister(nvmem);
+	return ERR_PTR(rval);
 err_remove_cells:
+	nvmem_disconnect(nvmem);
 	nvmem_device_remove_all_cells(nvmem);
 	nvmem_sysfs_remove_compat(nvmem);
+	goto err_put_disconnected;
 err_put_device:
+	nvmem_disconnect(nvmem);
+err_put_disconnected:
 	put_device(&nvmem->dev);
 
 	return ERR_PTR(rval);
@@ -1048,24 +1125,29 @@ static void nvmem_device_release(struct kref *kref)
 
 	nvmem = container_of(kref, struct nvmem_device, refcnt);
 
-	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
-
-	nvmem_sysfs_remove_compat(nvmem);
-
-	nvmem_device_remove_all_cells(nvmem);
-	nvmem_destroy_layout(nvmem);
-	device_unregister(&nvmem->dev);
+	put_device(&nvmem->dev);
 }
 
 /**
  * nvmem_unregister() - Unregister previously registered nvmem device
  *
  * @nvmem: Pointer to previously registered nvmem device.
+ *
+ * Stop and drain provider callbacks before returning. Existing consumers keep
+ * their core-owned metadata, but further access returns -ENODEV.
  */
 void nvmem_unregister(struct nvmem_device *nvmem)
 {
-	if (nvmem)
-		kref_put(&nvmem->refcnt, nvmem_device_release);
+	if (!nvmem)
+		return;
+
+	nvmem_disconnect(nvmem);
+	nvmem_destroy_layout(nvmem);
+	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
+	nvmem_sysfs_remove_compat(nvmem);
+	device_del(&nvmem->dev);
+	nvmem_device_remove_all_cells(nvmem);
+	kref_put(&nvmem->refcnt, nvmem_device_release);
 }
 EXPORT_SYMBOL_GPL(nvmem_unregister);
 
@@ -1103,26 +1185,46 @@ struct nvmem_device *devm_nvmem_register(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_nvmem_register);
 
+struct nvmem_match_data {
+	void *data;
+	int (*match)(struct device *dev, const void *data);
+};
+
+static int nvmem_match_device(struct device *dev, const void *data)
+{
+	const struct nvmem_match_data *match = data;
+	struct nvmem_device *nvmem = to_nvmem_device(dev);
+
+	guard(srcu)(&nvmem->srcu);
+	if (READ_ONCE(nvmem->disconnected))
+		return 0;
+	return match->match(dev, match->data);
+}
+
 static struct nvmem_device *nvmem_device_match(void *data,
 			int (*match)(struct device *dev, const void *data))
 {
+	struct nvmem_match_data match_data = { .data = data, .match = match };
 	struct nvmem_device *nvmem = NULL;
 	struct device *dev;
 
-	scoped_guard(mutex, &nvmem_mutex) {
-		dev = bus_find_device(&nvmem_bus_type, NULL, data, match);
-		if (dev)
-			nvmem = to_nvmem_device(dev);
-	}
+	guard(mutex)(&nvmem_mutex);
+	dev = bus_find_device(&nvmem_bus_type, NULL, &match_data, nvmem_match_device);
+	if (dev)
+		nvmem = to_nvmem_device(dev);
 	if (!nvmem)
 		return ERR_PTR(-EPROBE_DEFER);
 
+	if (READ_ONCE(nvmem->disconnected)) {
+		put_device(dev);
+		return ERR_PTR(-ENODEV);
+	}
+
 	if (!try_module_get(nvmem->owner)) {
 		dev_err(&nvmem->dev,
 			"could not increase module refcount for cell %s\n",
 			nvmem_dev_name(nvmem));
-
-		put_device(&nvmem->dev);
+		put_device(dev);
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -1337,8 +1439,10 @@ nvmem_cell_get_from_lookup(struct device *dev, const char *con_id)
 				cell = ERR_PTR(-ENOENT);
 			} else {
 				cell = nvmem_create_cell(cell_entry, con_id, 0);
-				if (IS_ERR(cell))
+				if (IS_ERR(cell)) {
+					nvmem_cell_entry_put(cell_entry);
 					nvmem_device_put(nvmem);
+				}
 			}
 			break;
 		}
@@ -1347,12 +1451,6 @@ nvmem_cell_get_from_lookup(struct device *dev, const char *con_id)
 	return cell;
 }
 
-static void nvmem_layout_module_put(struct nvmem_device *nvmem)
-{
-	if (nvmem->layout && nvmem->layout->dev.driver)
-		module_put(nvmem->layout->dev.driver->owner);
-}
-
 #if IS_ENABLED(CONFIG_OF)
 static struct nvmem_cell_entry *
 nvmem_find_cell_entry_by_node(struct nvmem_device *nvmem, struct device_node *np)
@@ -1362,25 +1460,15 @@ nvmem_find_cell_entry_by_node(struct nvmem_device *nvmem, struct device_node *np
 	guard(mutex)(&nvmem_mutex);
 
 	list_for_each_entry(cell, &nvmem->cells, node) {
-		if (np == cell->np)
+		if (np == cell->np) {
+			kref_get(&cell->refcnt);
 			return cell;
+		}
 	}
 
 	return NULL;
 }
 
-static int nvmem_layout_module_get_optional(struct nvmem_device *nvmem)
-{
-	if (!nvmem->layout)
-		return 0;
-
-	if (!nvmem->layout->dev.driver ||
-	    !try_module_get(nvmem->layout->dev.driver->owner))
-		return -EPROBE_DEFER;
-
-	return 0;
-}
-
 /**
  * of_nvmem_cell_get() - Get a nvmem cell from given device node and cell id
  *
@@ -1443,25 +1531,17 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np, const char *id)
 		return ERR_CAST(nvmem);
 	}
 
-	ret = nvmem_layout_module_get_optional(nvmem);
-	if (ret) {
-		of_node_put(cell_np);
-		nvmem_device_put(nvmem);
-		return ERR_PTR(ret);
-	}
-
 	cell_entry = nvmem_find_cell_entry_by_node(nvmem, cell_np);
 	of_node_put(cell_np);
 	if (!cell_entry) {
-		nvmem_layout_module_put(nvmem);
-		ret = nvmem->layout ? -EPROBE_DEFER : -ENOENT;
+		ret = READ_ONCE(nvmem->layout) ? -EPROBE_DEFER : -ENOENT;
 		nvmem_device_put(nvmem);
 		return ERR_PTR(ret);
 	}
 
 	cell = nvmem_create_cell(cell_entry, id, cell_index);
 	if (IS_ERR(cell)) {
-		nvmem_layout_module_put(nvmem);
+		nvmem_cell_entry_put(cell_entry);
 		nvmem_device_put(nvmem);
 	}
 
@@ -1575,8 +1655,8 @@ void nvmem_cell_put(struct nvmem_cell *cell)
 	if (cell->id)
 		kfree_const(cell->id);
 
+	nvmem_cell_entry_put(cell->entry);
 	kfree(cell);
-	nvmem_layout_module_put(nvmem);
 	nvmem_device_put(nvmem);
 }
 EXPORT_SYMBOL_GPL(nvmem_cell_put);
@@ -1628,6 +1708,10 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
 {
 	int rc;
 
+	guard(srcu)(&nvmem->srcu);
+	if (READ_ONCE(nvmem->disconnected) || READ_ONCE(cell->disconnected))
+		return -ENODEV;
+
 	rc = nvmem_reg_read(nvmem, cell->offset, buf, cell->raw_len);
 
 	if (rc)
@@ -1742,7 +1826,14 @@ static int __nvmem_cell_entry_write(struct nvmem_cell_entry *cell, void *buf, si
 	struct nvmem_device *nvmem = cell->nvmem;
 	int rc;
 
-	if (!nvmem || nvmem->read_only ||
+	if (!nvmem)
+		return -EINVAL;
+
+	guard(srcu)(&nvmem->srcu);
+	if (READ_ONCE(nvmem->disconnected) || READ_ONCE(cell->disconnected))
+		return -ENODEV;
+
+	if (nvmem->read_only ||
 	    (cell->bit_offset == 0 && len != cell->bytes))
 		return -EINVAL;
 
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index 4e610deeaa7b..4e15699d381b 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -6,12 +6,7 @@
 #include <linux/device.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/nvmem-provider.h>
-
-/* Hold pointers to callbacks owned by the nvmem provider module. */
-struct nvmem_operations {
-	nvmem_reg_read_t	reg_read;
-	nvmem_reg_write_t	reg_write;
-};
+#include <linux/srcu.h>
 
 struct nvmem_device {
 	struct module		*owner;
@@ -20,6 +15,8 @@ struct nvmem_device {
 	int			word_size;
 	int			id;
 	struct kref		refcnt;
+	struct srcu_struct	srcu;
+	bool			disconnected;
 	size_t			size;
 	bool			read_only;
 	bool			root_only;
@@ -34,9 +31,11 @@ struct nvmem_device {
 	unsigned int		nkeepout;
 	struct gpio_desc	*wp_gpio;
 	struct nvmem_layout	*layout;
-	struct nvmem_operations	*ops;
+	nvmem_reg_read_t		reg_read;
+	nvmem_reg_write_t	reg_write;
 	void *priv;
 	bool			sysfs_cells_populated;
+	struct attribute_group cells_group;
 };
 
 int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np);
diff --git a/drivers/nvmem/layouts.c b/drivers/nvmem/layouts.c
index 07a34be9669c..32995c9be68d 100644
--- a/drivers/nvmem/layouts.c
+++ b/drivers/nvmem/layouts.c
@@ -118,6 +118,7 @@ static int nvmem_layout_create_device(struct nvmem_device *nvmem,
 
 	ret = device_add(dev);
 	if (ret) {
+		nvmem->layout = NULL;
 		put_device(dev);
 		return ret;
 	}
@@ -192,6 +193,7 @@ void nvmem_destroy_layout(struct nvmem_device *nvmem)
 	dev = &nvmem->layout->dev;
 	of_node_clear_flag(dev->of_node, OF_POPULATED_BUS);
 	device_unregister(dev);
+	WRITE_ONCE(nvmem->layout, NULL);
 }
 
 int nvmem_layout_bus_register(void)
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 6063fe5b7784..dcf4c52b62c6 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -107,6 +107,9 @@ struct nvmem_cell_info {
  *
  * Note: Specifying name and setting id to -1 implies a unique device
  * whose name is provided as-is (kept unaltered).
+ *
+ * Provider callbacks and @priv must remain valid until nvmem_unregister()
+ * returns, or until a failed nvmem_register() returns.
  */
 struct nvmem_config {
 	struct device		*dev;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
