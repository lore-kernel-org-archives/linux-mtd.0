Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6280BC54798
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 03:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jaKBfhhCbOLeB75vbwV/4vSwQid5pr0Zm4vwu4IvqtE=; b=lXWYufanIXkr5B
	PIZLgvUr8cw+/2Lz8wh7j71f7qeTiXRfVTjbEzVEv5RX0trM18XLOlGnZpfgrGhgKBGCm0ch1Rahl
	J/FlXGGNMr9F7xdRZc50lHCxWLXBmaLYGAiZEbRHPmrL5RNoC2nT4cjPYfT+hYeVMSkZNfHt+W0s5
	glVgU8xQ0FCMmslN+ZkDAfAtbtgVaxdEr/sM8sDEEGy6ggeqPcGTbmXjnXgKmrYSc0hUfDPjr7rXn
	2XoxMG6uNSiULRn/ENhX8eREa4adY5qCykyR4AmKEF/7Q+8LZimjY4nXpGCBF3CYgpGPOT9Bt5bKO
	uvW5lzrCygoyWq8igeQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdMbc-00000007ksR-3EE9;
	Fri, 23 Feb 2024 03:52:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdMYG-00000007jfW-2qDP;
	Fri, 23 Feb 2024 03:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=w1qvlQTZQhAKermGBdJ/ks4nnfQJQEbBP2rr0ew/UKw=; b=ilSFpO8OFazaszsq+fdA7dVwT2
	NMv0D6HktNj0S4+TmWqvyT9dpWtbvAe/JUqJfLrHWvDUzyfdjz1dh51UnP+k9L3HC+ER3JpuQgX0O
	0yOW5DQYWNyuj2bi9ZBJjduYvXLbABW99dThN/bCTj1Qg3G/b2KFUp0QV0Wo30Hy9/Yuucl9gMk5g
	tDz2wJiwCtZPLXmoDLQvGBQw6mJEGRPHn5rQZOB8IexnxV+TGldt5c9GdNcyFMLIVv9WM/VoXI4LM
	xKu8kp7NW7Vd3YbHLStr5cxfXPvLz+8G9s9RQ1Ck7DFqxvJ1y+/alJXFYstIb5CCULFb/kmoo6NRY
	CowT/0Uw==;
Received: from saphodev.broadcom.com ([192.19.144.205] helo=relay.smtp-ext.broadcom.com)
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdMYD-00000005dkZ-1Dlq;
	Fri, 23 Feb 2024 03:48:43 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id E3789C0000F9;
	Thu, 22 Feb 2024 19:48:33 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com E3789C0000F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1708660114;
	bh=IlWBsnu227JMFpQncv19RcNKiY0NO3wmso1R4ya+F6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g1Ut55jy+SWzboCGgdsV/AhcWxf1oTIzCWx0rFPTe8RRlW5ahTG5A7yBtiV4QZfMu
	 +H0d2HyIcSQTt8yeKMdRXXfh/8sa4dy8M4OQHlyZUiAisR+SEuGlj2xli70fIGxWXf
	 59HJlpmP9YPWw6QK6I6PBvESc0X6jYOfXlEyYmKU=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.173.232.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 36B9E18041CAC4;
	Thu, 22 Feb 2024 19:48:32 -0800 (PST)
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
Subject: [PATCH v6 12/13] mtd: rawnand: brcmnand: Add support for getting ecc setting from strap
Date: Thu, 22 Feb 2024 19:47:57 -0800
Message-Id: <20240223034758.13753-13-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240223034758.13753-1-william.zhang@broadcom.com>
References: <20240223034758.13753-1-william.zhang@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_034841_522131_85D6905E 
X-CRM114-Status: GOOD (  19.71  )
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
this purpose and update driver to support this option. However these two
options can not be used at the same time.

Signed-off-by: William Zhang <william.zhang@broadcom.com>
Reviewed-by: David Regan <dregan@broadcom.com>

---

Changes in v6:
- Combine the ecc step size and ecc strength into one get function
- Treat it as error condition if both brcm,nand-ecc-use-strap and nand
ecc dts properties are set
- Add intermediate steps to get the sector size bitfield

Changes in v5: None
Changes in v4:
- Update the comments for ecc setting selection

Changes in v3: None
Changes in v2:
- Minor cosmetic fixes

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 83 ++++++++++++++++++++++--
 1 file changed, 77 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index ef7d340475be..e8ffc283b365 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1038,6 +1038,22 @@ static inline int brcmnand_sector_1k_shift(struct brcmnand_controller *ctrl)
 		return -1;
 }
 
+static int brcmnand_get_sector_size_1k(struct brcmnand_host *host)
+{
+	struct brcmnand_controller *ctrl = host->ctrl;
+	int sector_size_bit = brcmnand_sector_1k_shift(ctrl);
+	u16 acc_control_offs = brcmnand_cs_offset(ctrl, host->cs,
+						  BRCMNAND_CS_ACC_CONTROL);
+	u32 acc_control;
+
+	if (sector_size_bit < 0)
+		return 0;
+
+	acc_control = nand_readreg(ctrl, acc_control_offs);
+
+	return (acc_control & BIT(sector_size_bit)) >> sector_size_bit;
+}
+
 static void brcmnand_set_sector_size_1k(struct brcmnand_host *host, int val)
 {
 	struct brcmnand_controller *ctrl = host->ctrl;
@@ -1055,6 +1071,43 @@ static void brcmnand_set_sector_size_1k(struct brcmnand_host *host, int val)
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
+static void brcmnand_get_ecc_settings(struct brcmnand_host *host, struct nand_chip *chip)
+{
+	struct brcmnand_controller *ctrl = host->ctrl;
+	u16 acc_control_offs = brcmnand_cs_offset(ctrl, host->cs,
+						  BRCMNAND_CS_ACC_CONTROL);
+	int sector_size_1k = brcmnand_get_sector_size_1k(host);
+	int spare_area_size, ecc_level;
+	u32 acc;
+
+	spare_area_size = brcmnand_get_spare_size(host);
+	acc = nand_readreg(ctrl, acc_control_offs);
+	ecc_level = (acc & brcmnand_ecc_level_mask(ctrl)) >> ctrl->ecc_level_shift;
+	if (sector_size_1k)
+		chip->ecc.strength = ecc_level * 2;
+	else if (spare_area_size == 16 && ecc_level == 15)
+		chip->ecc.strength = 1; /* hamming */
+	else
+		chip->ecc.strength = ecc_level;
+
+	if (chip->ecc.size == 0) {
+		if (sector_size_1k < 0)
+			chip->ecc.size = 512;
+		else
+			chip->ecc.size = 512 << sector_size_1k;
+	}
+}
+
 /***********************************************************************
  * CS_NAND_SELECT
  ***********************************************************************/
@@ -2625,19 +2678,37 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
 		nanddev_get_memorg(&chip->base);
 	struct brcmnand_controller *ctrl = host->ctrl;
 	struct brcmnand_cfg *cfg = &host->hwcfg;
-	char msg[128];
+	struct device_node *np = nand_get_flash_node(chip);
 	u32 offs, tmp, oob_sector;
+	bool use_strap = false;
+	char msg[128];
 	int ret;
 
 	memset(cfg, 0, sizeof(*cfg));
+	use_strap = of_property_read_bool(np, "brcm,nand-ecc-use-strap");
 
-	ret = of_property_read_u32(nand_get_flash_node(chip),
-				   "brcm,nand-oob-sector-size",
+	/*
+	 * Either nand-ecc-xxx or brcm,nand-ecc-use-strap can be set. Error out
+	 * if both exist.
+	 */
+	if (chip->ecc.strength && use_strap) {
+		dev_err(ctrl->dev,
+			"nand ecc and strap ecc settings can't be set at the same time\n");
+		return -EINVAL;
+	}
+
+	if (use_strap)
+		brcmnand_get_ecc_settings(host, chip);
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
