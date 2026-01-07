Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7416CFD628
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jan 2026 13:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7sV+R2ACEyBe5jWyqB09ru0zjKdp1/wYRbbrLTVx2Qs=; b=YbXpDdYLFYFWAi
	j4gwbgjBeqqVzHRnna9aY0K9JZBhvRP/2IJHduVHeTEsxAKK1oHVSXty144G/FgkUgjoEE5O7340J
	n3bXdQyhXJHYY58pybpRCT9KH+ljfmYBOvG13rQemnWU/JN4prDgJXJSdQaI3GhElxxWi6lBzzGnr
	coZMYgNCSkGmN/ynDjhzD1nj78a1LAbeXKE+KmEyBN75S7/puZyYXn6KluQc9o1hrQ18Ti6o3n4zU
	KIDnAtYrsHBquaG/JuqIzsbLZS9W87IrjtPxW/Wavtj76KpH3M373Nzk+JjL59HupKhqCB9NQeu6O
	Y/4LqgHwR/NxBMLfMC4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTE6-0000000Ex30-14P3;
	Wed, 07 Jan 2026 13:05:26 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTE0-0000000Ex15-06e5;
	Wed, 07 Jan 2026 13:05:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7F3D71A26CD;
	Wed,  7 Jan 2026 13:05:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 552FB606F8;
	Wed,  7 Jan 2026 13:05:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 087BF103C873B;
	Wed,  7 Jan 2026 14:05:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767791117; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XMo0yKviCSls+Xrv3kwTnjITS8GQtx4OexQnCkfHofE=;
	b=UuENz/RQwtv9wgkzp85Tr6QLFxQOs22jCliOiild6uFJD47o64iojbXqggSC2Xp+FGTAIK
	xOJe36VxoJ7UQezuQrBpnmBXIPXugHhTltZPcrEliN54Uv5KDE/i7k/PTYx7gWszNhDCsz
	BjmBYJ0tVs/Jp25SUJ2U65+iD1S/5qA6wcmctOsb/wvZ9lKSM3P5R0fe+kBd3V2wnA38F2
	XdShzZWO+EqWf1mAim3q+LglcI/G9iOeEJDDiBZqLxEkCzViMEqH/gS6e9aSgR7anZCwcG
	GltrftUgbGWUzZLGzN/z6QZtOE49aqcauTVB7bDAXJ88wELVqUkqnaSQj6wKAw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Wed, 07 Jan 2026 14:04:53 +0100
Subject: [PATCH v3 2/4] of: reserved_mem: Support multiple 'reg' entries
 for memory-region
MIME-Version: 1.0
Message-Id: <20260107-mtd-memregion-v3-2-f9fc9107b992@bootlin.com>
References: <20260107-mtd-memregion-v3-0-f9fc9107b992@bootlin.com>
In-Reply-To: <20260107-mtd-memregion-v3-0-f9fc9107b992@bootlin.com>
To: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Fuzzy: 4424144f4218900c354d6490f15d7fd89bd74a90c2a7348481eaef86083880102d8c77ac236285b683c0bd37638dc6a3f0301a0bc431696a6ae2fe169c719249
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_050520_221898_CF8C7D99 
X-CRM114-Status: GOOD (  26.11  )
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

The Device Tree specification allows a "memory-region" node to have
multiple 'reg' entries, but the current kernel implementation only
processes the first entry. This can lead to drivers not being able to
access all the reserved memory regions specified in the Device Tree.

This patch extends the reserved memory handling to support multiple
'reg' entries for a single "memory-region" node. The existing exported
functions remain unchanged for backward compatibility, but new APIs
are introduced to allow drivers to access all reserved memory regions.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/of/of_reserved_mem.c    | 147 ++++++++++++++++++++++++++++++++++++----
 include/linux/of_reserved_mem.h |   4 ++
 2 files changed, 137 insertions(+), 14 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 1ab8f4153600b..c9cef279260e7 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -157,6 +157,7 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 	int i, len;
 	const __be32 *prop;
 	bool nomap;
+	int count = 0;
 
 	prop = of_flat_dt_get_addr_size_prop(node, "reg", &len);
 	if (!prop)
@@ -179,12 +180,13 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 				dma_contiguous_early_fixup(base, size);
 			pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
 				uname, &base, (unsigned long)(size / SZ_1M));
+			count++;
 		} else {
 			pr_err("Reserved memory: failed to reserve memory for node '%s': base %pa, size %lu MiB\n",
 			       uname, &base, (unsigned long)(size / SZ_1M));
 		}
 	}
-	return 0;
+	return count;
 }
 
 /*
@@ -247,20 +249,24 @@ void __init fdt_scan_reserved_mem_reg_nodes(void)
 
 	fdt_for_each_subnode(child, fdt, node) {
 		const char *uname;
+		const __be32 *reg;
 		u64 b, s;
+		int i, l;
 
 		if (!of_fdt_device_is_available(fdt, child))
 			continue;
-
-		if (!of_flat_dt_get_addr_size(child, "reg", &b, &s))
+		reg = of_flat_dt_get_addr_size_prop(child, "reg", &l);
+		if (!reg)
 			continue;
-
-		base = b;
-		size = s;
-
-		if (size) {
-			uname = fdt_get_name(fdt, child, NULL);
-			fdt_reserved_mem_save_node(child, uname, base, size);
+		for (i = 0; i < l; i++) {
+			of_flat_dt_read_addr_size(reg, i, &b, &s);
+			base = b;
+			size = s;
+
+			if (size) {
+				uname = fdt_get_name(fdt, child, NULL);
+				fdt_reserved_mem_save_node(child, uname, base, size);
+			}
 		}
 	}
 
@@ -291,16 +297,16 @@ int __init fdt_scan_reserved_mem(void)
 
 	fdt_for_each_subnode(child, fdt, node) {
 		const char *uname;
-		int err;
+		int err, ret;
 
 		if (!of_fdt_device_is_available(fdt, child))
 			continue;
 
 		uname = fdt_get_name(fdt, child, NULL);
 
-		err = __reserved_mem_reserve_reg(child, uname);
-		if (!err)
-			count++;
+		ret = __reserved_mem_reserve_reg(child, uname);
+		if (ret > 0)
+			count += ret;
 		/*
 		 * Save the nodes for the dynamically-placed regions
 		 * into an array which will be used for allocation right
@@ -726,6 +732,35 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_lookup);
 
+/**
+ * of_reserved_mem_array_lookup() - acquire reserved_mem array from a device node
+ * @np:		node pointer of the desired reserved-memory region
+ * @rmrm:	pointer to the first elemennt of the reserved_mem struct of the memory region
+ *
+ * This function allows drivers to acquire a reference to the array of the
+ *  reserved_mem struct based on a device node handle.
+ *
+ * Returns the number reserved_mem elements
+ */
+int of_reserved_mem_array_lookup(struct device_node *np,
+				 struct reserved_mem **rmem)
+{
+	const char *name;
+	int i, count = 0;
+
+	if (!np->full_name)
+		return 0;
+
+	name = kbasename(np->full_name);
+
+	for (i = 0; i < reserved_mem_count; i++)
+		if (!strcmp(reserved_mem[i].name, name))
+			rmem[count++] = &reserved_mem[i];
+
+	return count;
+}
+EXPORT_SYMBOL_GPL(of_reserved_mem_array_lookup);
+
 /**
  * of_reserved_mem_region_to_resource() - Get a reserved memory region as a resource
  * @np:		node containing 'memory-region' property
@@ -761,6 +796,49 @@ int of_reserved_mem_region_to_resource(const struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_region_to_resource);
 
+/**
+ * of_reserved_mem_region_to_resource_array() - Get a reserved memory region as a resources
+ * @dev:	device associated to the node
+ * @np:		node containing 'memory-region' property
+ * @idx:	index of 'memory-region' property to lookup
+ * @res:	Pointer to an array of struct resource pointers to fill in with reserved regions
+ *
+ * This function allows drivers to lookup a node's 'memory-region' property
+ * entries by index and fill an array of struct resource pointers for the entries.
+ *
+ * Returns the number of resources filled in @res on success.
+ * Returns -ENODEV if 'memory-region' is missing or unavailable,
+ * -EINVAL for any other error.
+ */
+int of_reserved_mem_region_to_resource_array(struct device *dev, const struct device_node *np,
+					     unsigned int idx, struct resource **res)
+{
+	struct reserved_mem *rmem[MAX_RESERVED_REGIONS];
+	int count, i;
+	struct resource *r;
+
+	if (!np)
+		return -EINVAL;
+
+	struct device_node *target __free(device_node) = of_parse_phandle(np, "memory-region", idx);
+	if (!target || !of_device_is_available(target))
+		return -ENODEV;
+
+	count = of_reserved_mem_array_lookup(target, rmem);
+	if (count <= 0)
+		return -EINVAL;
+
+	*res = devm_kzalloc(dev, count * sizeof(struct resource), GFP_KERNEL);
+	r = res[0];
+	for (i = 0; i < count; i++) {
+		resource_set_range(&r[i], rmem[i]->base, rmem[i]->size);
+		r[i].flags = IORESOURCE_MEM;
+		r[i].name = rmem[i]->name;
+	}
+	return count;
+}
+EXPORT_SYMBOL_GPL(of_reserved_mem_region_to_resource_array);
+
 /**
  * of_reserved_mem_region_to_resource_byname() - Get a reserved memory region as a resource
  * @np:		node containing 'memory-region' property
@@ -805,3 +883,44 @@ int of_reserved_mem_region_count(const struct device_node *np)
 	return of_count_phandle_with_args(np, "memory-region", NULL);
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_region_count);
+
+/**
+ * of_reserved_mem_region_count() - Return the total number of reserved memory regions
+ * @np:		node containing 'memory-region' property
+ *
+ * This function counts the total number of reserved memory regions referenced
+ * by a node's 'memory-region' property. It iterates over each phandle and sums
+ * the number of regions found in each referenced reserved memory node.
+ *
+ * Returns the total number of reserved memory regions on success.
+ * This function allows drivers to retrieve the number of entries for a node's
+ * 'memory-region' property.
+ *
+ * Returns total number of reserved memory regions on success, or negative error
+ * code on a malformed property.
+ */
+int of_reserved_mem_region_total_count(const struct device_node *np)
+{
+	int nregion = of_count_phandle_with_args(np, "memory-region", NULL);
+	struct device_node *target;
+	int i, nregs = 0;
+
+	for (i = 0; i < nregion; i++) {
+		struct reserved_mem *rmem;
+
+		target = of_parse_phandle(np, "memory-region", i);
+		if (!target)
+			return -ENODEV;
+
+		if (!of_device_is_available(target)) {
+			of_node_put(target);
+			return 0;
+		}
+
+		nregs += of_reserved_mem_array_lookup(target, &rmem);
+
+		of_node_put(target);
+	};
+	return nregs;
+}
+EXPORT_SYMBOL_GPL(of_reserved_mem_region_total_count);
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index f573423359f48..1e0c6afddd812 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -40,11 +40,15 @@ int of_reserved_mem_device_init_by_name(struct device *dev,
 void of_reserved_mem_device_release(struct device *dev);
 
 struct reserved_mem *of_reserved_mem_lookup(struct device_node *np);
+int of_reserved_mem_array_lookup(struct device_node *np, struct reserved_mem **rmem);
 int of_reserved_mem_region_to_resource(const struct device_node *np,
 				       unsigned int idx, struct resource *res);
+int of_reserved_mem_region_to_resource_array(struct device *dev, const struct device_node *np,
+					     unsigned int idx, struct resource **res);
 int of_reserved_mem_region_to_resource_byname(const struct device_node *np,
 					      const char *name, struct resource *res);
 int of_reserved_mem_region_count(const struct device_node *np);
+int of_reserved_mem_region_total_count(const struct device_node *np);
 
 #else
 

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
