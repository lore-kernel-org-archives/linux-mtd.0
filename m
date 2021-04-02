Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A75B5C433ED
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 10:09:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48901610D1
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 10:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48901610D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dze4eCh8vLpC5aoeE1Nya/SErb4RpMV/wf43okvvD+o=; b=DG7DpUpv/aiGNTmbe0ElHMbar
	cbYhp5/lIHE4IqyCBudFvdshSrsT/99m6Hxff+xfhPQiFJ9QghU23RSmzBEZExxna8nasIoO4ZQMf
	MK/ZS6DrIJhJ1nISCq7v0a1NJEJ2QNJLeHeCn8PH6leQnTJY+/7ofaI6/YP4dA/mjV5qZcfNNGI4L
	t3tlnhacogLnU9pjSpZVDmQuNWONAAxrfCyiUUZVWcCjkYw1UljrsFWdvesVnfBeNXIPpEGX9GqPB
	C5O4BiMQ0lNYyWj4lOYYACcnb9RCIkNkoXlIcamzrw8+tl8OPjSWzRZXM21SA/Tw8CPA5HmZdqFsV
	VUxlp/XIQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSGik-00ChIb-31; Fri, 02 Apr 2021 10:08:06 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSGTy-00Cf5i-PZ
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 09:52:54 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E82591C0005;
 Fri,  2 Apr 2021 09:52:47 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 16/16] mtd: rawnand: arasan: Support NV-DDR interface
Date: Fri,  2 Apr 2021 11:51:45 +0200
Message-Id: <20210402095145.254867-17-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210402095145.254867-1-miquel.raynal@bootlin.com>
References: <20210402095145.254867-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_105252_599726_03AD7A05 
X-CRM114-Status: GOOD (  15.30  )
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
 drivers/mtd/nand/raw/arasan-nand-controller.c | 27 ++++++++++++++-----
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 65a52bb2731e..ac00604be8c6 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -91,7 +91,7 @@
 
 #define DATA_INTERFACE_REG		0x6C
 #define   DIFACE_SDR_MODE(x)		FIELD_PREP(GENMASK(2, 0), (x))
-#define   DIFACE_DDR_MODE(x)		FIELD_PREP(GENMASK(5, 3), (X))
+#define   DIFACE_DDR_MODE(x)		FIELD_PREP(GENMASK(5, 3), (x))
 #define   DIFACE_SDR			0
 #define   DIFACE_NVDDR			BIT(9)
 
@@ -862,25 +862,38 @@ static int anfc_setup_interface(struct nand_chip *chip, int target,
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
+	if (nand_interface_is_nvddr(conf))
+		anand->timings = DIFACE_NVDDR |
+				 DIFACE_DDR_MODE(conf->timings.mode);
+	else
+		anand->timings = DIFACE_SDR |
+				 DIFACE_SDR_MODE(conf->timings.mode);
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
