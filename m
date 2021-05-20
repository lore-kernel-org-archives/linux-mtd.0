Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5E1C433ED
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 16:09:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7B6061163
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 16:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7B6061163
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=malat.biz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8bEsJcnFw3IFRNnf1r0SK8C/bDwJrdCv7nyeORprAoE=; b=n5Q/PoGzrRDFzz1qXvi9YCqC5f
	K+p98zwQHOhQoEZDbQt6ONTzfRUia3AI1TdiFV+rm09JTO6WunnxfIBoPIDzQySxsU+SZQ9iZ0LKl
	7dFkdYNJrEp66JY75XyxtCNO/i8FcLg7BTChAttqcPh6KPDb7EcbrnHel7K7HtvFll956Qh1aPLct
	jYQ2IPFLU3RKfCKYVNKsSRPbjrQuvy4wEbnJUrunDPgIk9vQLBIJAhHSL4pah2Ly94+buz+vd09aK
	zIrN+yIoQlJceCM4cum1IBRveisMPw8wdCKHylLjrKiElF3dmKwHQTtZQfplmcir5xnjtW7FmPwUK
	M645D3sw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljlDQ-001rz0-JJ; Thu, 20 May 2021 16:08:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljlCq-001rqO-1X
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 16:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=+cIVdCGAVN+SknHCa6DPdHm8OGBDX8hSGKSydN5mFmw=; b=Fbp74E+U84SeQfr/3wZk2YFjcl
 F4BohiVSCByvxNDTKwjRjK6WkSvqNb2TUrhNNi7xgnV00OG+EVsRMcdAaIqBFEh6VaLSk755JHpXj
 IQiseHGGWuprXHX6DpAutZYHxDv2C+X8IfygvqiO2Uvx0gU+mNcDLzzTYpugzi6+siXg6xjB+eHF0
 +tVmXx2uCa0H/EO6AiQSqTVPOx5ioloPyz3e0+uF1ebD3SnmCYK1UTCYK96U+c0RMBOGzm0k2t/FY
 2t167QrOH+Nia9nTAgRJ5httf8+9WVwXJkfN7tj+Mxpv0a1qPhtpnFuixJId1ZfedNGo/+HtBsKob
 cXFruBvg==;
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljlCm-00GUnF-GX
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 16:07:26 +0000
Received: by mail-ej1-x632.google.com with SMTP id l4so26136480ejc.10
 for <linux-mtd@lists.infradead.org>; Thu, 20 May 2021 09:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=malat-biz.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+cIVdCGAVN+SknHCa6DPdHm8OGBDX8hSGKSydN5mFmw=;
 b=BJMDHCU8fSnWcWa2D5YYwo2qTzKpOjoZIEqcVmMydY13Mg3W4H1HjE5/9HrUXw4Olc
 yqIQ9LgZxObgshB++Xh0/huA2gvYgueO5sARZKz5Qp1z6gNbxAeGp76iNoTj20UnRf3z
 Rx5Lko3ORuO+WLAzC/sO0bj37LjyWUzvE0pYsZ96YpB6k9yrnZjJRoJecRv/eil+3AM4
 fmqPNXIWE8zTDu2eba1qAOz+zgz9NZNZID6fwvAgvrJnEIwd8v9hD8iqNSzV6pWLEoLN
 Kz54bdQlmhk6xlkr/0/AVZFyxnXDqR3FbricxuIdjcmES4b+PGyGIMrZKEJni9vhvxN9
 tk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+cIVdCGAVN+SknHCa6DPdHm8OGBDX8hSGKSydN5mFmw=;
 b=VrPeIDnL/hymhYWxeTKXqnlgl56EScwxvjpi4DcM3Ge1EqHX4Kc32cK43yIp6xO/LL
 03YTn1QIFL5uL6DcsF+DaIcU+8WgM4AJCldd47C/VPBpHD6mFj4OFK7XbNgfOO9MNSiQ
 J5oDCKoKvBgoe8XSagdmE0i0/w5g2/FOKbyr6TwE3piU7aeZjmO2FuaxkFTQYM8e/CC5
 VsXl1PvE/pGV7IxoBIZCrZ2ycgwuUwLFzPCHcTkoTYhay3N5t4N8GZYbabY4t2abSNTk
 hfeCocb07nqNkPNlWF3s+6uhf1Hv1kG/KrzeJUeUt0zMyVobEIndH+xqLK8qNpod/QtD
 Ym6Q==
X-Gm-Message-State: AOAM532ownrccrYLOzy1J7uCQijlsV66ThJ63s+900fgS1bAut1Ao3v7
 JlIxVEIS/1dlHWMf17H5p2+fCZXc6CoyPSZG
X-Google-Smtp-Source: ABdhPJwSc9gJucHnY6962gsqLJ1yhHKvZSqnSwLxlyjrrDgpDv57lTVxH4wdcbBPukOgENUP1xZr9g==
X-Received: by 2002:a17:907:2056:: with SMTP id
 pg22mr5402513ejb.19.1621526840755; 
 Thu, 20 May 2021 09:07:20 -0700 (PDT)
Received: from ntb.petris.klfree.czf (snat2.klfree.cz. [81.201.48.25])
 by smtp.googlemail.com with ESMTPSA id t19sm1899257eds.4.2021.05.20.09.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 09:07:19 -0700 (PDT)
From: Petr Malat <oss@malat.biz>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Petr Malat <oss@malat.biz>
Subject: [PATCH] spi-nor: sfdp: Allow configuring unknown flashes using SFDP
Date: Thu, 20 May 2021 18:07:01 +0200
Message-Id: <20210520160701.28176-1-oss@malat.biz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_090724_629639_D0C69DAC 
X-CRM114-Status: GOOD (  30.12  )
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

This change allows adding a support for flashes with correct SFDP
without recompilation of the kernel by setting sfdp-compatible property
in their node. Alternatively, sfdp_compatible module option can be used
to list JEDEC IDs of flashes, whose SFDP can be trusted. Star "*" can
be used to match all JEDEC IDs.

Signed-off-by: Petr Malat <oss@malat.biz>
---
 .../devicetree/bindings/mtd/jedec,spi-nor.txt |  3 +
 drivers/mtd/spi-nor/core.c                    | 86 +++++++++++--------
 drivers/mtd/spi-nor/core.h                    |  4 +
 drivers/mtd/spi-nor/sfdp.c                    | 66 ++++++++++++++
 drivers/mtd/spi-nor/sfdp.h                    |  2 +
 5 files changed, 126 insertions(+), 35 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
index f03be904d3c2..b641b3e24a07 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
@@ -78,6 +78,9 @@ Optional properties:
 		   cannot reboot properly if the flash is left in the "wrong"
 		   state. This boolean flag can be used on such systems, to
 		   denote the absence of a reliable reset mechanism.
+- sfdp-compatible : Trust information in SFDP and instantiate the device even if
+		   its JEDEC ID isn't known to the driver. All the configuration
+		   is read from SFDP and no workarounds are applied.
 
 Example:
 
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 20df44b753da..47f8108e971e 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2193,7 +2193,8 @@ spi_nor_search_part_by_id(const struct flash_info *parts, unsigned int nparts,
 	return NULL;
 }
 
-static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
+static const struct flash_info *spi_nor_read_id(struct spi_nor *nor,
+						bool autodetect)
 {
 	const struct flash_info *info;
 	u8 *id = nor->bouncebuf;
@@ -2227,8 +2228,15 @@ static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
 		}
 	}
 
-	dev_err(nor->dev, "unrecognized JEDEC id bytes: %*ph\n",
-		SPI_NOR_MAX_ID_LEN, id);
+	if (autodetect) {
+		info = spi_nor_sfdp_generic_info(nor, id);
+		if (!IS_ERR_OR_NULL(info))
+			return info;
+	}
+
+	dev_warn(nor->dev, "unrecognized JEDEC id bytes: %*ph\n",
+		 SPI_NOR_MAX_ID_LEN, id);
+
 	return ERR_PTR(-ENODEV);
 }
 
@@ -2849,19 +2857,25 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
  * @nor:	pointer to a 'struct spi_nor'.
  *
  * The method has a roll-back mechanism: in case the SFDP parsing fails, the
- * legacy flash parameters and settings will be restored.
+ * legacy flash parameters and settings will be restored unless configuration
+ * based solely on SFDP was requested.
  */
-static void spi_nor_sfdp_init_params(struct spi_nor *nor)
+static int spi_nor_sfdp_init_params(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter sfdp_params;
+	int rtn;
 
 	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
 
-	if (spi_nor_parse_sfdp(nor, nor->params)) {
+	rtn = spi_nor_parse_sfdp(nor, nor->params);
+	if (rtn && !(nor->info->flags & SPI_NOR_SFDP_AUTODETECT)) {
 		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
 		nor->addr_width = 0;
 		nor->flags &= ~SNOR_F_4B_OPCODES;
+		return 0;
 	}
+
+	return rtn;
 }
 
 /**
@@ -3051,6 +3065,8 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
  */
 static int spi_nor_init_params(struct spi_nor *nor)
 {
+	int rtn;
+
 	nor->params = devm_kzalloc(nor->dev, sizeof(*nor->params), GFP_KERNEL);
 	if (!nor->params)
 		return -ENOMEM;
@@ -3060,9 +3076,13 @@ static int spi_nor_init_params(struct spi_nor *nor)
 	spi_nor_manufacturer_init_params(nor);
 
 	if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-				 SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ)) &&
-	    !(nor->info->flags & SPI_NOR_SKIP_SFDP))
-		spi_nor_sfdp_init_params(nor);
+				 SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ |
+				 SPI_NOR_SFDP_AUTODETECT)) &&
+	    !(nor->info->flags & SPI_NOR_SKIP_SFDP)) {
+		rtn = spi_nor_sfdp_init_params(nor);
+		if (rtn)
+			return rtn;
+	}
 
 	spi_nor_post_sfdp_fixups(nor);
 
@@ -3349,39 +3369,35 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 {
 	const struct flash_info *info = NULL;
 
-	if (name)
+	if (name) {
 		info = spi_nor_match_id(nor, name);
-	/* Try to auto-detect if chip name wasn't specified or not found */
-	if (!info)
-		info = spi_nor_read_id(nor);
-	if (IS_ERR_OR_NULL(info))
-		return ERR_PTR(-ENOENT);
-
-	/*
-	 * If caller has specified name of flash model that can normally be
-	 * detected using JEDEC, let's verify it.
-	 */
-	if (name && info->id_len) {
-		const struct flash_info *jinfo;
-
-		jinfo = spi_nor_read_id(nor);
-		if (IS_ERR(jinfo)) {
-			return jinfo;
-		} else if (jinfo != info) {
+		if (info) {
 			/*
-			 * JEDEC knows better, so overwrite platform ID. We
-			 * can't trust partitions any longer, but we'll let
-			 * mtd apply them anyway, since some partitions may be
-			 * marked read-only, and we don't want to lose that
+			 * If caller has specified name of flash model that can
+			 * normally be detected using JEDEC, we revert to JEDEC
+			 * detection. If different flash is detected, we can't
+			 * trust partitions any longer, but we'll let mtd apply
+			 * them anyway, since some partitions may be marked
+			 * read-only, and we don't want to lose that
 			 * information, even if it's not 100% accurate.
 			 */
-			dev_warn(nor->dev, "found %s, expected %s\n",
-				 jinfo->name, info->name);
-			info = jinfo;
+			if (info->id_len) {
+				const struct flash_info *jinfo;
+
+				jinfo = spi_nor_read_id(nor, false);
+				if (jinfo != info) {
+					dev_warn(nor->dev,
+						 "found %s, expected %s\n",
+						 jinfo->name, info->name);
+					info = jinfo;
+				}
+			}
+			return info;
 		}
 	}
 
-	return info;
+	/* Try to auto-detect if chip name wasn't specified or not found */
+	return spi_nor_read_id(nor, true);
 }
 
 int spi_nor_scan(struct spi_nor *nor, const char *name,
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index d631ee299de3..96742dc6a91e 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -338,6 +338,10 @@ struct flash_info {
 					 * protection bits. Usually these will
 					 * power-up in a write-protected state.
 					 */
+#define SPI_NOR_SFDP_AUTODETECT	BIT(23)	/*
+					 * Flashinfo was dynamically created and
+					 * all parameters come from SFDP
+					 */
 
 	/* Part specific fixup hooks. */
 	const struct spi_nor_fixups *fixups;
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 6ee7719e5903..3e5c138b0143 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -7,6 +7,7 @@
 #include <linux/bitfield.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
+#include <linux/moduleparam.h>
 #include <linux/mtd/spi-nor.h>
 
 #include "core.h"
@@ -1373,3 +1374,68 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
 	kfree(param_headers);
 	return err;
 }
+
+static char *sfdp_compatible[8];
+static int num_sfdp_compatible;
+module_param_array(sfdp_compatible, charp, &num_sfdp_compatible, 0444);
+MODULE_PARM_DESC(sfdp_compatible, "JEDEC IDs of devices with trusted SFDP which"
+		" the kernel instantiates without them being explicitly listed "
+		"in the driver. Use * to trust SFDP of all devices.");
+
+static bool spi_nor_is_sfdp_trusted(struct spi_nor *nor, const u8 *id)
+{
+	struct device_node *np = spi_nor_get_flash_node(nor);
+	char strid[SPI_NOR_MAX_ID_LEN * 2 + 1];
+	int i;
+
+	if (np && of_property_read_bool(np, "sfdp-compatible"))
+		return 1;
+
+	snprintf(strid, sizeof(strid), "%*phN", SPI_NOR_MAX_ID_LEN, id);
+
+	for (i = 0; i < num_sfdp_compatible; i++) {
+		if (!strcmp("*", sfdp_compatible[i]))
+			return 1;
+		if (!strcmp(strid, sfdp_compatible[i]))
+			return 1;
+	}
+
+	return 0;
+}
+
+struct flash_info *spi_nor_sfdp_generic_info(struct spi_nor *nor, const u8 *id)
+{
+	struct flash_info *info;
+	__le32 sfdp_sig = 0;
+	int err;
+
+	if (!spi_nor_is_sfdp_trusted(nor, id)) {
+		dev_info(nor->dev, "SFDP configuration of JEDEC id %*ph is not"
+				" enabled\n", SPI_NOR_MAX_ID_LEN, id);
+		return ERR_PTR(-ENODEV);
+	}
+
+	/* Sanity check - read SFDP_SIGNATURE */
+	err = spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(sfdp_sig), &sfdp_sig);
+	if (err || le32_to_cpu(sfdp_sig) != SFDP_SIGNATURE) {
+		dev_err(nor->dev, "Failed to read SFDP signature: %d\n", err);
+		return ERR_PTR(err ?: -ENODEV);
+	}
+
+	/* Allocate info */
+	info = devm_kzalloc(nor->dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return ERR_PTR(-ENOMEM);
+
+	memcpy(info->id, id, SPI_NOR_MAX_ID_LEN);
+	info->id_len = SPI_NOR_MAX_ID_LEN;
+	info->name = "sfdp-compatible";
+	info->flags = SPI_NOR_SFDP_AUTODETECT;
+	info->page_size = 256;
+	nor->info = info;
+
+	dev_info(nor->dev, "Using SFDP to configure JEDEC id %*ph\n",
+		 SPI_NOR_MAX_ID_LEN, id);
+
+	return info;
+}
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index 89152ae1cf3e..e9f6c4abd0c3 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -110,4 +110,6 @@ struct sfdp_parameter_header {
 int spi_nor_parse_sfdp(struct spi_nor *nor,
 		       struct spi_nor_flash_parameter *params);
 
+struct flash_info *spi_nor_sfdp_generic_info(struct spi_nor *nor, const u8 *id);
+
 #endif /* __LINUX_MTD_SFDP_H */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
