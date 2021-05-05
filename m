Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C39BBC433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 22:22:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F215613D6
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 22:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F215613D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p+CFpJaq2qHRwB0IgezmThYUQRplnS/QvnfYgMtPSqI=; b=ocCvAoE5g67DECtYdUVT2jmLf
	+yF23zG/X1/nj8lFdNUmRXXPq28arjTeJ0+lEbqL4/QDqLfA9bp+6JsO9TAR0Sif9hrRzsfxqcFPB
	Pbiv5o68UYeJUN+eGY9hRoPtCgZYWpTi0jW6j+E91eJFLbo802JaGCR0hAH/zOJ7Qcd2AdkMhnEIc
	3uEZGtcnSEBqEkrw/iiWpo/i4qj2cyWsx0DYTDKKsKdILDBXYrGbePQ02ZHgjQ766I/blMIIJ9z+m
	i/HeP+OJsEaKm2ksSeitWuvE1ItGBj3rShjsxpTOkUrplXl6ZZjo4en0/yCTnN0mgHF2vnm44YecU
	niI9cVkaw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lePu1-002Tq0-6l; Wed, 05 May 2021 22:21:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDm-002OpS-Qx
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 21:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=4i8u0yXiBi6zoHPNKU5VQwi6Wjdt55v3dBLAlU6JBjI=; b=Axqq8AKNZ24E9nGtsez1TIc1AF
 wNYrQ3iM8tODDqpcIBOxlZsJiVHqOD+sz3+5JcZlY+wJsNOI/RbV7pv61GLAR7HtC1gvzA8q1TivO
 qCSrTooXx21CEPhXcf9k7nj+S7iwxu0noBJ0ktPXZS+CuLw2ykWFREKODrRrqIE79nxYzryV4wyqr
 9mQ/0gEfwd1IyYhKO547Pz+BGfrcov5Jx8bKmM/LhzvvSo4lq4tSXIfO15lCIyylMvEKmDHakJaYH
 LiMXXggCAFGNUIK/lsPKKgjfO8MIw9MEUd3Rhzp3dHaLcM7q7jk8smuj3uTWRnqyXaloHzbdY5a/s
 bW0DCDCQ==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDk-005IiG-7k
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 21:38:17 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.stephanxp.local (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 069D41BF20E;
 Wed,  5 May 2021 21:38:13 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 22/22] mtd: rawnand: arasan: Support NV-DDR interface
Date: Wed,  5 May 2021 23:37:50 +0200
Message-Id: <20210505213750.257417-23-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-1-miquel.raynal@bootlin.com>
References: <20210505213750.257417-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_143816_434765_92D38F47 
X-CRM114-Status: GOOD (  15.24  )
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

Add support for the NV-DDR interface.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 25 ++++++++++++++-----
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 307300eeb9cb..8c7537129674 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -879,25 +879,38 @@ static int anfc_setup_interface(struct nand_chip *chip, int target,
 	struct arasan_nfc *nfc = to_anfc(chip->controller);
 	struct device_node *np = nfc->dev->of_node;
 	const struct nand_sdr_timings *sdr;
+	const struct nand_nvddr_timings *nvddr;
 
-	sdr = nand_get_sdr_timings(conf);
-	if (IS_ERR(sdr))
-		return PTR_ERR(sdr);
+	if (nand_interface_is_nvddr(conf)) {
+		nvddr = nand_get_nvddr_timings(conf);
+		if (IS_ERR(nvddr))
+			return PTR_ERR(nvddr);
+	} else {
+		sdr = nand_get_sdr_timings(conf);
+		if (IS_ERR(sdr))
+			return PTR_ERR(sdr);
+	}
 
 	if (target < 0)
 		return 0;
 
-	anand->timings = DIFACE_SDR | DIFACE_SDR_MODE(conf->timings.mode);
+	if (nand_interface_is_sdr(conf))
+		anand->timings = DIFACE_SDR |
+				 DIFACE_SDR_MODE(conf->timings.mode);
+	else
+		anand->timings = DIFACE_NVDDR |
+				 DIFACE_DDR_MODE(conf->timings.mode);
+
 	anand->clk = ANFC_XLNX_SDR_DFLT_CORE_CLK;
 
 	/*
 	 * Due to a hardware bug in the ZynqMP SoC, SDR timing modes 0-1 work
 	 * with f > 90MHz (default clock is 100MHz) but signals are unstable
 	 * with higher modes. Hence we decrease a little bit the clock rate to
-	 * 80MHz when using modes 2-5 with this SoC.
+	 * 80MHz when using SDR modes 2-5 with this SoC.
 	 */
 	if (of_device_is_compatible(np, "xlnx,zynqmp-nand-controller") &&
-	    conf->timings.mode >= 2)
+	    nand_interface_is_sdr(conf) && conf->timings.mode >= 2)
 		anand->clk = ANFC_XLNX_SDR_HS_CORE_CLK;
 
 	return 0;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
