Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B19CEBF92
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 17:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kSlMk+MpHtcH3EHKNrRgTA845jSf3TE9tt/sTmDuqzw=; b=FtaVPCleOavc4l
	QDUZ+8oSVq/EQISqS7eE1gle23R+VtVPhGKQBvB0H7g59sUQrvNMNM9IUCTxQuke3mVJ57pkI5G4V
	99WyFvOcH4XavZTp5wZpdWmQlayIcO2KLRyi8b5tB4tgtnEoeRJ9aRSUlkjcLGbxM9LLnpKpv7bXs
	7uFYHYFDDhXyDC8d0AS9vmkvFQUR2t50HbxRcrHBHR6S+zcwkqvJoHDzmYwjmAxsJDQQzp92kKKlP
	CihplIc1dxGLqcsWbCMx5HF7f+dxrhtuCCS0JvSnxwirWzGI75IHu+nAMMYCwAMoKMc49PyxokFtT
	qup8A9n7hG1Bb0j2khVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2ag-0000000GRhS-3osC;
	Mon, 17 Nov 2025 17:00:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2af-0000000GRgM-1E7j
	for linux-mtd@bombadil.infradead.org;
	Mon, 17 Nov 2025 17:00:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=SOqWn/p8/oSr9AkEwJmrLLI3GLlfATIVuHnXrtjGKbU=; b=X9QeteCmiJvQ7aZoJbqYKgBSIA
	ZuiZd+nSUJxAaD1si2LqBBISADv9Y+Bgsh4mIcMANB1IRAPZKNpfGLb26QWgTjNncYvHB3lxJovUW
	3ipTkvN6lfm3TpCnSWYCNoox9icl18oIhOcO90uhgfQTsdptvLcSEIDRYQQZ+BUJZTW1u9/kErhVZ
	/Hhhsk2ZfRPj+8V7ZGLvUcbMV6zoDwZOlrOJQhNLVx+8ODPm6TdtL7QKuwH+o0omWRYXY+15HO6tu
	DRML6CUMFWsJtW+FOF9dMVc38mgDapksq/zV3X2xidO1yELALuA572dIl68DeMc3qidku3nBMqZzc
	EH4/6yyw==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1iy-00000007iSy-3dpL
	for linux-mtd@lists.infradead.org;
	Mon, 17 Nov 2025 16:05:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EE5934E4172B;
	Mon, 17 Nov 2025 17:00:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C390C606B9;
	Mon, 17 Nov 2025 17:00:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D394910371D53;
	Mon, 17 Nov 2025 18:00:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763398828; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SOqWn/p8/oSr9AkEwJmrLLI3GLlfATIVuHnXrtjGKbU=;
	b=m3ptm5Te0mmtC/HBnCIC2cDtV75kYy0DZtoLPD8M9224/nrLH1vCjx8zs0UOJkqMs9OAc/
	UUEc+kVeUwRr2fqthwjVRjASeC6zP5YBmmj+YfCShsGD3PI3v2PoUTb4WPS9mcgZ7LWKVv
	WWCLNU6e/ug9S9q1uGOqhFP0SqpvXr0neQMtmwrRLDYprxhEWuRoUKP2cNz6N6f8aHa5Lo
	Bp3hn0WRFjHs9zC0n9uZY9tAzMIanReEauaCz0oA/bdhWAc+bgeymsfBZUTSEQLLyT5AZr
	5D3G07PfBxt43N0/zXUoOGhAqalwczd9vpNZWsCkl87fKjOPZyLncipyfdOvUw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Mon, 17 Nov 2025 18:00:14 +0100
Subject: [PATCH 1/3] of: reserved_mem: Support multiple 'reg' entries for
 memory-region
MIME-Version: 1.0
Message-Id: <20251117-mtd-memregion-v1-1-7b35611c79a6@bootlin.com>
References: <20251117-mtd-memregion-v1-0-7b35611c79a6@bootlin.com>
In-Reply-To: <20251117-mtd-memregion-v1-0-7b35611c79a6@bootlin.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_160505_025622_22B19C67 
X-CRM114-Status: GOOD (  26.85  )
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
 drivers/of/of_reserved_mem.c    | 141 ++++++++++++++++++++++++++++++++++++----
 include/linux/of_reserved_mem.h |   4 ++
 2 files changed, 133 insertions(+), 12 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 2e9ea751ed2df..2477933883903 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -159,6 +159,7 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 	int len;
 	const __be32 *prop;
 	bool nomap;
+	int count = 0;
 
 	prop = of_get_flat_dt_prop(node, "reg", &len);
 	if (!prop)
@@ -183,6 +184,7 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 				dma_contiguous_early_fixup(base, size);
 			pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
 				uname, &base, (unsigned long)(size / SZ_1M));
+			count++;
 		} else {
 			pr_err("Reserved memory: failed to reserve memory for node '%s': base %pa, size %lu MiB\n",
 			       uname, &base, (unsigned long)(size / SZ_1M));
@@ -190,7 +192,7 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 
 		len -= t_len;
 	}
-	return 0;
+	return count;
 }
 
 /*
@@ -235,7 +237,7 @@ void __init fdt_scan_reserved_mem_reg_nodes(void)
 	phys_addr_t base, size;
 	const __be32 *prop;
 	int node, child;
-	int len;
+	int len, i;
 
 	if (!fdt)
 		return;
@@ -273,12 +275,12 @@ void __init fdt_scan_reserved_mem_reg_nodes(void)
 		if (len > t_len)
 			pr_warn("%s() ignores %d regions in node '%s'\n",
 				__func__, len / t_len - 1, uname);
-
-		base = dt_mem_next_cell(dt_root_addr_cells, &prop);
-		size = dt_mem_next_cell(dt_root_size_cells, &prop);
-
-		if (size)
-			fdt_reserved_mem_save_node(child, uname, base, size);
+		for (i = 0; i < len; i += t_len) {
+			base = dt_mem_next_cell(dt_root_addr_cells, &prop);
+			size = dt_mem_next_cell(dt_root_size_cells, &prop);
+			if (size)
+				fdt_reserved_mem_save_node(child, uname, base, size);
+		}
 	}
 
 	/* check for overlapping reserved regions */
@@ -308,16 +310,16 @@ int __init fdt_scan_reserved_mem(void)
 
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
@@ -750,6 +752,37 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
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
+	for (i = 0; i < reserved_mem_count; i++)
+		if (!strcmp(reserved_mem[i].name, name)) {
+			if (!count)
+				*rmem = &reserved_mem[i];
+			count++;
+		}
+
+	return count;
+}
+EXPORT_SYMBOL_GPL(of_reserved_mem_array_lookup);
+
 /**
  * of_reserved_mem_region_to_resource() - Get a reserved memory region as a resource
  * @np:		node containing 'memory-region' property
@@ -785,6 +818,49 @@ int of_reserved_mem_region_to_resource(const struct device_node *np,
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
+	struct reserved_mem *rmem;
+	int count, i;
+	struct resource *r;
+
+	if (!np)
+		return -EINVAL;
+
+	struct device_node __free(device_node) *target = of_parse_phandle(np, "memory-region", idx);
+	if (!target || !of_device_is_available(target))
+		return -ENODEV;
+
+	count = of_reserved_mem_array_lookup(target, &rmem);
+	if (count <= 0)
+		return -EINVAL;
+
+	*res = devm_kzalloc(dev, count * sizeof(struct resource), GFP_KERNEL);
+	r = res[0];
+	for (i = 0; i < count; i++) {
+		resource_set_range(&r[i], rmem[i].base, rmem[i].size);
+		r[i].flags = IORESOURCE_MEM;
+		r[i].name = rmem[i].name;
+	}
+	return count;
+}
+EXPORT_SYMBOL_GPL(of_reserved_mem_region_to_resource_array);
+
 /**
  * of_reserved_mem_region_to_resource_byname() - Get a reserved memory region as a resource
  * @np:		node containing 'memory-region' property
@@ -829,3 +905,44 @@ int of_reserved_mem_region_count(const struct device_node *np)
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
