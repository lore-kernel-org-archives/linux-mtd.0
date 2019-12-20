Return-Path: <SRS0=9iyA=2K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62ED5C43603
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Dec 2019 09:39:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 346062146E
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Dec 2019 09:39:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AgEwT/ak"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 346062146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vjtcTkrxFlal2p+GYBGQS+uR1hvQ1abfEZsyNj3xJIg=; b=AgEwT/akd9Roh1
	eFJFw51vHr9FS3NwqjsRE58pKHMX52gylrW1OrKJfUPQ9MnHE/mu6M9YbFCD8ftdeQVgClY2mHTvW
	0XjtnrzBGMnJPGN3FWT+Jp49vhOdgjpG3Ht3BRyRSboikJEG47O0Phl2q4UJsOe8k/ev0emmrszw+
	6x5/XYlRiDktcQwMuJpKDgmRkqTZaGvCL8ctEkBk44APiPSObbDQlNwQ9gAV8XID34UsZlvk8CkxB
	60ciHIE3oABTmS4Qta4g+LSuQVljKcgXYQG9rPQJfYfKc/0woEhiEAHgIELfB664FuqNHpFVOTeTM
	palv1DcqJKdmQV6XxZ6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiEka-0002wX-CB; Fri, 20 Dec 2019 09:39:12 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiEkW-0002w4-Pk
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2019 09:39:10 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 47fNx60pyDz1qqxj;
 Fri, 20 Dec 2019 10:39:06 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 47fNx575dFz1rYZJ;
 Fri, 20 Dec 2019 10:39:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id mAiMHp691h1a; Fri, 20 Dec 2019 10:39:04 +0100 (CET)
X-Auth-Info: /OjfFk9qEdMWF1ehyaoj67Cfalvz8DHUCDXYqMflBzI=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 20 Dec 2019 10:39:04 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH V2] mtd: rawnand: denali_dt: Add support for configuring
 SPARE_AREA_SKIP_BYTES
Date: Fri, 20 Dec 2019 10:39:00 +0100
Message-Id: <20191220093900.1855751-1-marex@denx.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_013909_139135_73CD386B 
X-CRM114-Status: GOOD (  19.14  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marex@denx.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The SPARE_AREA_SKIP_BYTES register is reset when the controller reset
signal is toggled. Yet, this register must be configured to match the
content of the NAND OOB area. The current default value is always set
to 8 and is programmed into the hardware in case the hardware was not
programmed before (e.g. in a bootloader) with a different value. This
however does not work when the block is reset properly by Linux.

On Altera SoCFPGA CycloneV, ArriaV and Arria10, which are the SoCFPGA
platforms which support booting from NAND, the SPARE_AREA_SKIP_BYTES
value must be set to 2. On Socionext Uniphier, the value is 8. This
patch adds support for preconfiguring the default value and handles
the special SoCFPGA case by setting the default to 2 on all SoCFPGA
platforms, while retaining the original behavior and default value of
8 on all the other platforms.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
To: linux-mtd@lists.infradead.org
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
V2: Move denali->oob_skip_bytes = data->oob_skip_bytes; right after
    of_device_get_match_data()
---
 drivers/mtd/nand/raw/denali.c    | 13 ++++++++++---
 drivers/mtd/nand/raw/denali_dt.c |  5 +++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index 3102ddbd8abdb..b6c463d021677 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -1302,14 +1302,21 @@ int denali_init(struct denali_controller *denali)
 
 	/*
 	 * Set how many bytes should be skipped before writing data in OOB.
+	 * If a non-zero value has already been configured, update it in HW.
 	 * If a non-zero value has already been set (by firmware or something),
 	 * just use it. Otherwise, set the driver's default.
 	 */
-	denali->oob_skip_bytes = ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
-	if (!denali->oob_skip_bytes) {
-		denali->oob_skip_bytes = DENALI_DEFAULT_OOB_SKIP_BYTES;
+	if (denali->oob_skip_bytes) {
 		iowrite32(denali->oob_skip_bytes,
 			  denali->reg + SPARE_AREA_SKIP_BYTES);
+	} else {
+		denali->oob_skip_bytes =
+			ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
+		if (!denali->oob_skip_bytes) {
+			denali->oob_skip_bytes = DENALI_DEFAULT_OOB_SKIP_BYTES;
+			iowrite32(denali->oob_skip_bytes,
+				  denali->reg + SPARE_AREA_SKIP_BYTES);
+		}
 	}
 
 	iowrite32(0, denali->reg + TRANSFER_SPARE_REG);
diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index 8b779a899dcf4..443f9c1f6854d 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -27,6 +27,7 @@ struct denali_dt {
 struct denali_dt_data {
 	unsigned int revision;
 	unsigned int caps;
+	unsigned int oob_skip_bytes;
 	const struct nand_ecc_caps *ecc_caps;
 };
 
@@ -34,6 +35,7 @@ NAND_ECC_CAPS_SINGLE(denali_socfpga_ecc_caps, denali_calc_ecc_bytes,
 		     512, 8, 15);
 static const struct denali_dt_data denali_socfpga_data = {
 	.caps = DENALI_CAP_HW_ECC_FIXUP,
+	.oob_skip_bytes = 2,
 	.ecc_caps = &denali_socfpga_ecc_caps,
 };
 
@@ -42,6 +44,7 @@ NAND_ECC_CAPS_SINGLE(denali_uniphier_v5a_ecc_caps, denali_calc_ecc_bytes,
 static const struct denali_dt_data denali_uniphier_v5a_data = {
 	.caps = DENALI_CAP_HW_ECC_FIXUP |
 		DENALI_CAP_DMA_64BIT,
+	.oob_skip_bytes = 8,
 	.ecc_caps = &denali_uniphier_v5a_ecc_caps,
 };
 
@@ -51,6 +54,7 @@ static const struct denali_dt_data denali_uniphier_v5b_data = {
 	.revision = 0x0501,
 	.caps = DENALI_CAP_HW_ECC_FIXUP |
 		DENALI_CAP_DMA_64BIT,
+	.oob_skip_bytes = 8,
 	.ecc_caps = &denali_uniphier_v5b_ecc_caps,
 };
 
@@ -122,6 +126,7 @@ static int denali_dt_probe(struct platform_device *pdev)
 		denali->revision = data->revision;
 		denali->caps = data->caps;
 		denali->ecc_caps = data->ecc_caps;
+		denali->oob_skip_bytes = data->oob_skip_bytes;
 	}
 
 	denali->dev = dev;
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
