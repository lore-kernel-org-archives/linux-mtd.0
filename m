Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41C7C47258
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 03:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8odZD5tWo0zQZH/PxBJZy+Wk4Mf4Agif73LjY5LeW/s=; b=vIOAUw1yqfE9XI
	bpw2LkEx6wealIz9QCv82MkgIM9MaBm7OYSusYL2RChmqymJv+yQLYg2m40L4yLPBeWJd7nJhHvu6
	kyuvbi5sRtzfPJp24yZA+ChXcsNZh6beCbpklfXKD4DEu5rP3dtsElhkxOHfcl6OKQ9bAxSIw6SaO
	IOrVBUoyZW9Qs0MKfgrABWU3KV39Fl0d8r/Xijgt62IPfh9s16GwmIhqqoxHDBQvk5/9HzsYbkCzo
	BeH91IFbtJ36W6zpTZ+5SLwlqgjO8JzEetMyqSvzvSUz/3YkW+lHmorrN91V0IQiqGtzZqCslSIU4
	+pBD9sJ27JZgalyl90Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSTbY-001Fv3-28;
	Wed, 24 Jan 2024 03:07:08 +0000
Received: from mail-oi1-f225.google.com ([209.85.167.225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSTb7-001Fce-1i
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jan 2024 03:06:43 +0000
Received: by mail-oi1-f225.google.com with SMTP id 5614622812f47-3bd3b34a58dso3193490b6e.3
        for <linux-mtd@lists.infradead.org>; Tue, 23 Jan 2024 19:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1706065540; x=1706670340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ynywjXfyuUDyBEky1TbYS2FW4j63gm4kdZM9CH++EkQ=;
        b=HCwZMOkav9IZk/piXokSOfXZVcJHb565vGVvK2InS3/wkspw/BzVAnbco1S+Eh18Xs
         Pqf8/Wyk3qgtLZCJFxAYgGrf6v3xP5/TL9RbBcgrJlHU5sELvtUKBFfABVojBy4nrMXQ
         Y/U+AbGbAwiTB/dV3o/NVM73LWE5elJl8zbsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706065540; x=1706670340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ynywjXfyuUDyBEky1TbYS2FW4j63gm4kdZM9CH++EkQ=;
        b=tcCTGTp0qQEcmuM0wFIKvnxx5OE2erlS+DnfaPis1Ax0Wql9bSwhJAI4CKRm/x9tuU
         G9WAmGEq1SLA9uC+qnBTzuDfaxm+UMcgHDvU2vYObWQUzvrIp2UBcNgIH8gfKRVYf7gI
         W/N2ZmQOttjtorh7WQeP0uM9N/LD64kPPG7fvCtYS4dqUDmfgC6lvrFVg4wYyTDHTIoF
         FqCDmKkMg0my0MCkM4OG/pk3w+/j6I1qx1bzDERpu0pHQM7sn0JvmEnqEL7Pfe00sVVE
         98/ClN3KWJBBiSHaz5ol/BpAEmtMiAgGnvRQE4XaX/uMCUHH7fOqkz+Sw+svtNd3FJzh
         yP7Q==
X-Gm-Message-State: AOJu0YyO3Uun5CiHC70MLPO3RMJShnHWrTrRt+6hymv6mi/Qj/grvQ92
	NJqF+AkVV+fMlRzzWY2US+EF6ycw4XpzntFBomh5cWqFRwhGi080s4MDtL3kIj0y9agi/9GVI/q
	ufwqAqzTaaScPKNDx4zIbp8/B9MG+mA==
X-Google-Smtp-Source: AGHT+IFK/2w2iG1AZMvtjj1jtWThPpJ7sawSzLyPn2mzN4taB1JWwBEzC/CVEwcbMMV+JpYCODWXvertPG7F
X-Received: by 2002:a05:6871:3319:b0:213:84f3:b21a with SMTP id nf25-20020a056871331900b0021384f3b21amr2242246oac.61.1706065540433;
        Tue, 23 Jan 2024 19:05:40 -0800 (PST)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp-relay.gmail.com with ESMTPS id c22-20020a056830349600b006dc7502beabsm455320otu.3.2024.01.23.19.05.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jan 2024 19:05:40 -0800 (PST)
X-Relaying-Domain: broadcom.com
From: David Regan <dregan@broadcom.com>
To: dregan@broadcom.com,
	dregan@mail.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	computersforpeace@gmail.com,
	kdasu.kdev@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	joel.peshkin@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	william.zhang@broadcom.com,
	anand.gore@broadcom.com,
	kursad.oney@broadcom.com,
	florian.fainelli@broadcom.com,
	rafal@milecki.pl,
	bcm-kernel-feedback-list@broadcom.com,
	andre.przywara@arm.com,
	baruch@tkos.co.il,
	linux-arm-kernel@lists.infradead.org,
	dan.carpenter@linaro.org
Subject: [PATCH v3 06/10] mtd: rawnand: brcmnand: Add support for getting ecc setting from strap
Date: Tue, 23 Jan 2024 19:04:54 -0800
Message-Id: <20240124030458.98408-7-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240124030458.98408-1-dregan@broadcom.com>
References: <20240124030458.98408-1-dregan@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_190641_570615_E4CC82C4 
X-CRM114-Status: GOOD (  19.94  )
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

From: William Zhang <william.zhang@broadcom.com>

BCMBCA broadband SoC based board design does not specify ecc setting in
dts but rather use the SoC NAND strap info to obtain the ecc strength
and spare area size setting. Add brcm,nand-ecc-use-strap dts propety for
this purpose and update driver to support this option.

The generic nand ecc settings still take precedence over this flag. For
example, if nand-ecc-strength is set in the dts, the driver ignores the
strap setting and falls back to original behavior. This makes sure that
the existing BCMBCA board dts still works the old way even the strap
flag is set in the BCMBCA chip dtsi.

Signed-off-by: William Zhang <william.zhang@broadcom.com>
Reviewed-by: David Regan <dregan@broadcom.com>
---
Changes in v3: None
---
Changes in v2:
- Minor cosmetic fixes
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 83 ++++++++++++++++++++++--
 1 file changed, 76 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 73fdf7ce21aa..869ea64e9189 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1038,6 +1038,19 @@ static inline int brcmnand_sector_1k_shift(struct brcmnand_controller *ctrl)
 		return -1;
 }
 
+static int brcmnand_get_sector_size_1k(struct brcmnand_host *host)
+{
+	struct brcmnand_controller *ctrl = host->ctrl;
+	int shift = brcmnand_sector_1k_shift(ctrl);
+	u16 acc_control_offs = brcmnand_cs_offset(ctrl, host->cs,
+						  BRCMNAND_CS_ACC_CONTROL);
+
+	if (shift < 0)
+		return 0;
+
+	return (nand_readreg(ctrl, acc_control_offs) >> shift) & 0x1;
+}
+
 static void brcmnand_set_sector_size_1k(struct brcmnand_host *host, int val)
 {
 	struct brcmnand_controller *ctrl = host->ctrl;
@@ -1055,6 +1068,38 @@ static void brcmnand_set_sector_size_1k(struct brcmnand_host *host, int val)
 	nand_writereg(ctrl, acc_control_offs, tmp);
 }
 
+static int brcmnand_get_spare_size(struct brcmnand_host *host)
+{
+	struct brcmnand_controller *ctrl = host->ctrl;
+	u16 acc_control_offs = brcmnand_cs_offset(ctrl, host->cs,
+						  BRCMNAND_CS_ACC_CONTROL);
+	u32 acc = nand_readreg(ctrl, acc_control_offs);
+
+	return (acc & brcmnand_spare_area_mask(ctrl));
+}
+
+static int brcmnand_get_ecc_strength(struct brcmnand_host *host)
+{
+	struct brcmnand_controller *ctrl = host->ctrl;
+	u16 acc_control_offs = brcmnand_cs_offset(ctrl, host->cs,
+						  BRCMNAND_CS_ACC_CONTROL);
+	int sector_size_1k = brcmnand_get_sector_size_1k(host);
+	int spare_area_size, ecc_level, ecc_strength;
+	u32 acc;
+
+	spare_area_size = brcmnand_get_spare_size(host);
+	acc = nand_readreg(ctrl, acc_control_offs);
+	ecc_level = (acc & brcmnand_ecc_level_mask(ctrl)) >> ctrl->ecc_level_shift;
+	if (sector_size_1k)
+		ecc_strength = ecc_level * 2;
+	else if (spare_area_size == 16 && ecc_level == 15)
+		ecc_strength = 1; /* hamming */
+	else
+		ecc_strength = ecc_level;
+
+	return ecc_strength;
+}
+
 /***********************************************************************
  * CS_NAND_SELECT
  ***********************************************************************/
@@ -2622,19 +2667,43 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
 		nanddev_get_memorg(&chip->base);
 	struct brcmnand_controller *ctrl = host->ctrl;
 	struct brcmnand_cfg *cfg = &host->hwcfg;
-	char msg[128];
+	struct device_node *np = nand_get_flash_node(chip);
 	u32 offs, tmp, oob_sector;
-	int ret;
+	int ret, sector_size_1k = 0;
+	bool use_strap = false;
+	char msg[128];
 
 	memset(cfg, 0, sizeof(*cfg));
+	use_strap = of_property_read_bool(np, "brcm,nand-ecc-use-strap");
 
-	ret = of_property_read_u32(nand_get_flash_node(chip),
-				   "brcm,nand-oob-sector-size",
+	/*
+	 * Set ECC size and strength based on hw configuration from strap
+	 * if device tree does not specify them and use strap property is set
+	 * If ecc strength is set in dts, don't use strap setting.
+	 */
+	if (chip->ecc.strength)
+		use_strap = 0;
+
+	if (use_strap) {
+		chip->ecc.strength = brcmnand_get_ecc_strength(host);
+		sector_size_1k = brcmnand_get_sector_size_1k(host);
+		if (chip->ecc.size == 0) {
+			if (sector_size_1k < 0)
+				chip->ecc.size = 512;
+			else
+				chip->ecc.size = 512 << sector_size_1k;
+		}
+	}
+
+	ret = of_property_read_u32(np, "brcm,nand-oob-sector-size",
 				   &oob_sector);
 	if (ret) {
-		/* Use detected size */
-		cfg->spare_area_size = mtd->oobsize /
-					(mtd->writesize >> FC_SHIFT);
+		if (use_strap)
+			cfg->spare_area_size = brcmnand_get_spare_size(host);
+		else
+			/* Use detected size */
+			cfg->spare_area_size = mtd->oobsize /
+						(mtd->writesize >> FC_SHIFT);
 	} else {
 		cfg->spare_area_size = oob_sector;
 	}
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
