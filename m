Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D694C47094
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 13:50:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DF4D613C8
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 13:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DF4D613C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YqBNMzv5BlbnS0I10KY7ZRDZDNEt8ugWrdkELWFc63E=; b=UucF44JYv6j92W
	DZ8iU6ILko7pLw/dFY+iM8PRKfp0jpkpOWbUv8QcYevRE5Ts43e9dsdpsxz8ZSVA4YCq4ca25aRDE
	U/IMvvNtt18nvVxWEDNWhcKz9WNhRuhF+SI2iMBKbki9XYo+n7pazciEfk4KeELASFlBrz1bhSyEF
	S8WdxGJ3CqJoePjEN0Ij8MAbZcgHc7GTDwX6l6mm0u+72eUa/9AH2ezwMPmuO0pvygGMLMXRyBUzH
	ulmBBej1oxFy7ZbH/ZM9P8+VZmdtj3mXqW9sKSF/08PmQbPokvkEGlIPCoPsVKV/dxVnQHjPXT7JH
	YCdv9fPAsr4vDJGiKOuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrL44-000yjR-M0; Thu, 10 Jun 2021 13:49:44 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrL3X-000yUT-Av
 for linux-mtd@lists.infradead.org; Thu, 10 Jun 2021 13:49:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3BFF824000D;
 Thu, 10 Jun 2021 13:49:08 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, ryan.barnett@collins.com,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/5] mtd: rawnand: omap: Aggregate the HW configuration of the
 ELM
Date: Thu, 10 Jun 2021 15:49:02 +0200
Message-Id: <20210610134906.3503303-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210610134906.3503303-1-miquel.raynal@bootlin.com>
References: <20210610134906.3503303-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_064911_619752_2639ACE9 
X-CRM114-Status: GOOD (  12.81  )
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

Instead of calling elm_config() for each possible BCH configuration,
just save the BCH configuration that must be applied and use it in a
single call at the bottom.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/omap2.c | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 512f60780a50..eb8b5e10ab6e 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -1915,6 +1915,7 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
 	struct omap_nand_info *info = mtd_to_omap(mtd);
 	struct device *dev = &info->pdev->dev;
 	int min_oobbytes = BADBLOCK_MARKER_LENGTH;
+	int elm_bch_strength = -1;
 	int oobbytes_per_step;
 	dma_cap_mask_t mask;
 	int err;
@@ -2068,12 +2069,7 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
 		chip->ecc.write_subpage	= omap_write_subpage_bch;
 		mtd_set_ooblayout(mtd, &omap_ooblayout_ops);
 		oobbytes_per_step	= chip->ecc.bytes;
-
-		err = elm_config(info->elm_dev, BCH4_ECC,
-				 mtd->writesize / chip->ecc.size,
-				 chip->ecc.size, chip->ecc.bytes);
-		if (err < 0)
-			return err;
+		elm_bch_strength = BCH4_ECC;
 		break;
 
 	case OMAP_ECC_BCH8_CODE_HW_DETECTION_SW:
@@ -2110,13 +2106,7 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
 		chip->ecc.write_subpage	= omap_write_subpage_bch;
 		mtd_set_ooblayout(mtd, &omap_ooblayout_ops);
 		oobbytes_per_step	= chip->ecc.bytes;
-
-		err = elm_config(info->elm_dev, BCH8_ECC,
-				 mtd->writesize / chip->ecc.size,
-				 chip->ecc.size, chip->ecc.bytes);
-		if (err < 0)
-			return err;
-
+		elm_bch_strength = BCH8_ECC;
 		break;
 
 	case OMAP_ECC_BCH16_CODE_HW:
@@ -2132,19 +2122,21 @@ static int omap_nand_attach_chip(struct nand_chip *chip)
 		chip->ecc.write_subpage	= omap_write_subpage_bch;
 		mtd_set_ooblayout(mtd, &omap_ooblayout_ops);
 		oobbytes_per_step	= chip->ecc.bytes;
-
-		err = elm_config(info->elm_dev, BCH16_ECC,
-				 mtd->writesize / chip->ecc.size,
-				 chip->ecc.size, chip->ecc.bytes);
-		if (err < 0)
-			return err;
-
+		elm_bch_strength = BCH16_ECC;
 		break;
 	default:
 		dev_err(dev, "Invalid or unsupported ECC scheme\n");
 		return -EINVAL;
 	}
 
+	if (elm_bch_strength >= 0) {
+		err = elm_config(info->elm_dev, elm_bch_strength,
+				 mtd->writesize / chip->ecc.size,
+				 chip->ecc.size, chip->ecc.bytes);
+		if (err < 0)
+			return err;
+	}
+
 	/* Check if NAND device's OOB is enough to store ECC signatures */
 	min_oobbytes += (oobbytes_per_step *
 			 (mtd->writesize / chip->ecc.size));
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
