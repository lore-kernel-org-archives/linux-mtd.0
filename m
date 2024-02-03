Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C890FC4828F
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Feb 2024 00:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hpllpysg5x9SspnbW3t2GYdzbaCs8s1NaIFyA/XTqjQ=; b=ysZ89CNUaZu25I
	wQQTMrcKEdUfzW/ZTo1Chd19ZwyeC7x08qnIEbiv+SZJojdj+trwxcyTAIwZtad1I5Yn3hf22d6n1
	+Y+KEPSKB3NyIwvXVt8xWDIeHaQMvRo0b/y4NSavOlVT1Nu28G1+QbUI/l7IQovL3KJNcTGkOVoci
	MqYWdOurkVuXNiuIIc7dn7glKCNTWxxiozI0SgzwDH1m/6BODUZb5X0I5O0B/M77lDtJE32IZ+V/B
	R6IaCOP6XUZLjdrSosNJf4dhPCImYDvzun+AApb4dmy3bZxIK8uwe162+OPbWzH9+VDKbvflKQl2T
	6BrsIYBjZIjFvCngnZyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3vT-0000000DxLh-3iRi;
	Sat, 03 Feb 2024 00:30:32 +0000
Received: from lpdvacalvio01.broadcom.com ([192.19.166.228] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3uc-0000000DwfF-1iwM;
	Sat, 03 Feb 2024 00:29:54 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id A277BC00329C;
	Fri,  2 Feb 2024 16:29:37 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com A277BC00329C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1706920177;
	bh=s/ChhgfzXW1d5Br4dKiO6tP7LbtmJXzGgiphezRGZXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fuc3uRjmNby/3g0/5tQhOOe6cRZ7YokmGYLsDNUdPH80/MjQsljPtBH4nNiMRi3n+
	 qeijZ9E9ExRwWV/alTJQjDfevJkCj6oJhG97SNj2a3k7OKvWXcdnMfQFfiUHTrBW1B
	 6ZGuCzhjNNqCepATMQlHk4Hc0bgh93xhgwkNIvMc=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.173.232.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 3139018041CAC4;
	Fri,  2 Feb 2024 16:29:36 -0800 (PST)
From: William Zhang <william.zhang@broadcom.com>
To: Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: f.fainelli@gmail.com,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	David Regan <dregan@broadcom.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH v4 09/12] mtd: rawnand: brcmnand: Add support for getting ecc setting from strap
Date: Fri,  2 Feb 2024 16:28:30 -0800
Message-Id: <20240203002834.171462-10-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240203002834.171462-1-william.zhang@broadcom.com>
References: <20240203002834.171462-1-william.zhang@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_162938_702620_95395F3A 
X-CRM114-Status: GOOD (  21.78  )
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

Changes in v4:
- Update the comments for ecc setting selection

Changes in v3: None
Changes in v2:
- Minor cosmetic fixes

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 83 ++++++++++++++++++++++--
 1 file changed, 76 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 73fdf7ce21aa..efeee9e80213 100644
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
+	 * if brcm,nand-ecc-use-strap is set. However if nand-ecc-strength
+	 * is set, its value will be used and ignore the strap setting.
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
