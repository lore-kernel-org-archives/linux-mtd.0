Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B7BC4742C
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:35:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9796A20797
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:35:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qugcSzdA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9796A20797
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I2tdoPFm5CwoBflbr/ojmnpz85vSYgs8MBrkJHNcDAg=; b=qugcSzdAcq0+8OuEV92LI/Ipp
	ibIv0pmCnqDltt4XP87ctEbbbUkvbKQjH841lpE9NWnAsCpFwFE9KKJ+Iin6uo1PpE8glWFzDmCLQ
	eeswm39QmwGBZ0JJj+iWHZNXMWaJr//NBh1dRvJHuPbwU5YOJaOqnAzigmJW836Yof5r3p2HVNT45
	kAl7xNEMtlh+mSjswBQG2fyMld+BOpO0yCPv5fFRNHrOGMQPvtldcL9y6hGlLsL0/c+cHqPdgfDoa
	g80NikIFs5Qd1A1ArUVUaTQxeyjI2B+jAWa18E7gAZYiKAi9uZho5ecXIeIhK4T04SGtwxj3ienAF
	eg/MiK2uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdYIM-0008Eq-1d; Fri, 13 Nov 2020 12:35:14 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYHi-000814-8t
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2020 12:34:35 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 9532FC000B;
 Fri, 13 Nov 2020 12:34:32 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 09/19] mtd: rawnand: lpc32xx_mlc: Move the ECC initialization
 to ->attach_chip()
Date: Fri, 13 Nov 2020 13:34:14 +0100
Message-Id: <20201113123424.32233-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113123424.32233-1-miquel.raynal@bootlin.com>
References: <20201113123424.32233-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_073434_466905_8704774F 
X-CRM114-Status: GOOD (  13.63  )
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
Cc: Vladimir Zapolskiy <vz@mleia.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The probe function is only supposed to initialize the controller
hardware but not the ECC engine. Indeed, we don't know anything about
the NAND chip(s) at this stage. Let's move the logic initializing the
ECC engine, even pretty simple, to the ->attach_chip() hook which gets
called during nand_scan() routine, after the NAND chip discovery. As
the previously mentioned logic is supposed to parse the DT for us, it
is likely that the chip->ecc.* entries be overwritten. So let's avoid
this by moving these lines to ->attach_chip().

Fixes: d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing bits")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Cc: Sylvain Lemieux <slemieux.tyco@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_mlc.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index bd854e044898..452ecaf7775a 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -647,6 +647,9 @@ static int lpc32xx_nand_attach_chip(struct nand_chip *chip)
 	struct lpc32xx_nand_host *host = nand_get_controller_data(chip);
 	struct device *dev = &host->pdev->dev;
 
+	if (chip->ecc.engine_type != NAND_ECC_ENGINE_TYPE_ON_HOST)
+		return 0;
+
 	host->dma_buf = devm_kzalloc(dev, mtd->writesize, GFP_KERNEL);
 	if (!host->dma_buf)
 		return -ENOMEM;
@@ -655,8 +658,17 @@ static int lpc32xx_nand_attach_chip(struct nand_chip *chip)
 	if (!host->dummy_buf)
 		return -ENOMEM;
 
-	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
 	chip->ecc.size = 512;
+	chip->ecc.hwctl = lpc32xx_ecc_enable;
+	chip->ecc.read_page_raw = lpc32xx_read_page;
+	chip->ecc.read_page = lpc32xx_read_page;
+	chip->ecc.write_page_raw = lpc32xx_write_page_lowlevel;
+	chip->ecc.write_page = lpc32xx_write_page_lowlevel;
+	chip->ecc.write_oob = lpc32xx_write_oob;
+	chip->ecc.read_oob = lpc32xx_read_oob;
+	chip->ecc.strength = 4;
+	chip->ecc.bytes = 10;
+
 	mtd_set_ooblayout(mtd, &lpc32xx_ooblayout_ops);
 	host->mlcsubpages = mtd->writesize / 512;
 
@@ -740,15 +752,6 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, host);
 
 	/* Initialize function pointers */
-	nand_chip->ecc.hwctl = lpc32xx_ecc_enable;
-	nand_chip->ecc.read_page_raw = lpc32xx_read_page;
-	nand_chip->ecc.read_page = lpc32xx_read_page;
-	nand_chip->ecc.write_page_raw = lpc32xx_write_page_lowlevel;
-	nand_chip->ecc.write_page = lpc32xx_write_page_lowlevel;
-	nand_chip->ecc.write_oob = lpc32xx_write_oob;
-	nand_chip->ecc.read_oob = lpc32xx_read_oob;
-	nand_chip->ecc.strength = 4;
-	nand_chip->ecc.bytes = 10;
 	nand_chip->legacy.waitfunc = lpc32xx_waitfunc;
 
 	nand_chip->options = NAND_NO_SUBPAGE_WRITE;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
