Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D26DC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 11:21:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51B9A207BC
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 11:21:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a5Oo6K9U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51B9A207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dO7JsL+jsYaN8pOjdcM/XUW8LbynF3DxlLkShaZvksY=; b=a5Oo6K9U1mqy1d
	d0YJhGNfR0Kk6c/R2QPOGZFnuRikCjePPp3oDpC49k8/rO6rd5LkclGKWq91wtrmIVF4rVy/5WbdS
	pFikNcVCwguZw/AlscjOjKGMTx+47MMs1YVLCqy7wAh504qSLpZdN7J7+l5Tu0zG2K2kwUs7TPFGk
	DLbS0DNF3LCZUV/HkWXvOXPDbaM+B+8hgmDfgqbV+PCWzP0XBxAcMlDn6j+hT5viiY6OXLp3uiOEe
	jkyeBw5VCETVotD2fLPr/8AYFs5BBVYkC6MJBFk964pQ/7hywEz1YtxEsQqQNV7A+iGX4kxOAobDW
	e0PvS216fhXof3IujPVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jed53-0006eP-Ni; Fri, 29 May 2020 11:21:41 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jecxb-0003cU-03
 for linux-mtd@lists.infradead.org; Fri, 29 May 2020 11:14:07 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 36375240008;
 Fri, 29 May 2020 11:13:55 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v7 26/28] mtd: rawnand: toshiba: Choose the interface
 configuration for TH58NVG2S3HBAI4
Date: Fri, 29 May 2020 13:13:20 +0200
Message-Id: <20200529111322.7184-27-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529111322.7184-1-miquel.raynal@bootlin.com>
References: <20200529111322.7184-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_041359_374651_56773152 
X-CRM114-Status: GOOD (  12.89  )
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
Cc: Rickard x Andersson <rickaran@axis.com>, Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Rickard x Andersson <rickaran@axis.com>

The Kioxia/Toshiba TH58NVG2S3HBAI4 NAND memory is not ONFI compliant.
The timings of the NAND chip memory are quite close to ONFI mode 4 but
is breaking that spec.

By providing our own set of timings, erase block read speed is increased
from 6910 kiB/s to 13490 kiB/s and erase block write speed is increased
from 3350 kiB/s to 4410 kiB/s.

Tested on IMX6SX which has a NAND controller supporting EDO mode.

Signed-off-by: Rickard x Andersson <rickaran@axis.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_ids.c     |  3 +++
 drivers/mtd/nand/raw/nand_toshiba.c | 38 +++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
index 3b890d55703d..b9945791a9d7 100644
--- a/drivers/mtd/nand/raw/nand_ids.c
+++ b/drivers/mtd/nand/raw/nand_ids.c
@@ -51,6 +51,9 @@ struct nand_flash_dev nand_flash_ids[] = {
 		{ .id = {0xad, 0xde, 0x94, 0xda, 0x74, 0xc4} },
 		  SZ_8K, SZ_8K, SZ_2M, NAND_NEED_SCRAMBLING, 6, 640,
 		  NAND_ECC_INFO(40, SZ_1K) },
+	{"TH58NVG2S3HBAI4 4G 3.3V 8-bit",
+		{ .id = {0x98, 0xdc, 0x91, 0x15, 0x76} },
+		  SZ_2K, SZ_512, SZ_128K, 0, 5, 128, NAND_ECC_INFO(8, SZ_512) },
 
 	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 4, SZ_8K, SP_OPTIONS),
 	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 4, SZ_8K, SP_OPTIONS),
diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
index 6d53f9b7a817..f746c19f3b2c 100644
--- a/drivers/mtd/nand/raw/nand_toshiba.c
+++ b/drivers/mtd/nand/raw/nand_toshiba.c
@@ -212,6 +212,33 @@ tc58nvg0s3e_choose_interface_config(struct nand_chip *chip,
 	return nand_choose_best_sdr_timings(chip, iface, NULL);
 }
 
+static int
+th58nvg2s3hbai4_choose_interface_config(struct nand_chip *chip,
+					struct nand_interface_config *iface)
+{
+	struct nand_sdr_timings *sdr = &iface->timings.sdr;
+
+	/* Start with timings from the closest timing mode, mode 4. */
+	onfi_fill_interface_config(chip, iface, NAND_SDR_IFACE, 4);
+
+	/* Patch timings that differ from mode 4. */
+	sdr->tALS_min = 12000;
+	sdr->tCHZ_max = 20000;
+	sdr->tCLS_min = 12000;
+	sdr->tCOH_min = 0;
+	sdr->tDS_min = 12000;
+	sdr->tRHOH_min = 25000;
+	sdr->tRHW_min = 30000;
+	sdr->tRHZ_max = 60000;
+	sdr->tWHR_min = 60000;
+
+	/* Patch timings not part of onfi timing mode. */
+	sdr->tPROG_max = 700000000;
+	sdr->tBERS_max = 5000000000;
+
+	return nand_choose_best_sdr_timings(chip, iface, sdr);
+}
+
 static int tc58teg5dclta00_init(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -232,6 +259,14 @@ static int tc58nvg0s3e_init(struct nand_chip *chip)
 	return 0;
 }
 
+static int th58nvg2s3hbai4_init(struct nand_chip *chip)
+{
+	chip->ops.choose_interface_config =
+		&th58nvg2s3hbai4_choose_interface_config;
+
+	return 0;
+}
+
 static int toshiba_nand_init(struct nand_chip *chip)
 {
 	if (nand_is_slc(chip))
@@ -247,6 +282,9 @@ static int toshiba_nand_init(struct nand_chip *chip)
 	if (!strncmp("TC58NVG0S3E", chip->parameters.model,
 		     sizeof("TC58NVG0S3E") - 1))
 		tc58nvg0s3e_init(chip);
+	if (!strncmp("TH58NVG2S3HBAI4", chip->parameters.model,
+		     sizeof("TH58NVG2S3HBAI4") - 1))
+		th58nvg2s3hbai4_init(chip);
 
 	return 0;
 }
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
