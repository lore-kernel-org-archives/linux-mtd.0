Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FC5C4742C
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:35:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A853720797
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:35:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z7xM/lQb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A853720797
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7to95msNuBOyov2w/MoEkQpGbsC8+a4pVqIjZvc2NNM=; b=z7xM/lQbuWuBeI2a/IClpqL0s
	Fu/3akuRTOiVoJiAt2vdhAcUIQOdtOjkUBpFu62J6AJDQ8htpoQjC2tEIKDxucOJc7RoaNuxCkPU3
	PEX0OaztdI4zM9Wl7LtZefD+punXziDTZkt0DRqTaUGqIOtc3N3mFGwRmVprkc2sXEUlemDsmoX/z
	qO90Y2UhKlqJJDo/s5oArlh6UaTqeiQOMBzA5ShO/kyAhyl97RJX00pPtKQ0/pORtqFDwzdHPWyY1
	f558i/yXsD13XzleSduhwv0jwNQUe9ESy2CZzpg6DLfsoMQ5d8bZ6jAj2J9fJbX185LERrWGbimyD
	CHkRitMYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdYHh-00080H-BA; Fri, 13 Nov 2020 12:34:33 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYHd-0007y3-V2
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2020 12:34:30 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id AA19CC0010;
 Fri, 13 Nov 2020 12:34:27 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 02/19] mtd: rawnand: xway: Move the ECC initialization to
 ->attach_chip()
Date: Fri, 13 Nov 2020 13:34:07 +0100
Message-Id: <20201113123424.32233-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113123424.32233-1-miquel.raynal@bootlin.com>
References: <20201113123424.32233-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_073430_094892_1BBC913B 
X-CRM114-Status: GOOD (  15.47  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
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
this by moving these lines to ->attach_chip(), a NAND controller
hook.

Fixes: d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing bits")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/xway_nand.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/xway_nand.c b/drivers/mtd/nand/raw/xway_nand.c
index f2dbd63a5c1f..efc5bf5434e0 100644
--- a/drivers/mtd/nand/raw/xway_nand.c
+++ b/drivers/mtd/nand/raw/xway_nand.c
@@ -62,6 +62,7 @@
 #define NAND_CON_NANDM		1
 
 struct xway_nand_data {
+	struct nand_controller	controller;
 	struct nand_chip	chip;
 	unsigned long		csflags;
 	void __iomem		*nandaddr;
@@ -145,6 +146,18 @@ static void xway_write_buf(struct nand_chip *chip, const u_char *buf, int len)
 		xway_writeb(nand_to_mtd(chip), NAND_WRITE_DATA, buf[i]);
 }
 
+static int xway_attach_chip(struct nand_chip *chip)
+{
+	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
+	chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
+
+	return 0;
+}
+
+static const struct nand_controller_ops xway_nand_ops = {
+	.attach_chip = xway_attach_chip,
+};
+
 /*
  * Probe for the NAND device.
  */
@@ -180,8 +193,9 @@ static int xway_nand_probe(struct platform_device *pdev)
 	data->chip.legacy.read_byte = xway_read_byte;
 	data->chip.legacy.chip_delay = 30;
 
-	data->chip.ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
-	data->chip.ecc.algo = NAND_ECC_ALGO_HAMMING;
+	nand_controller_init(&data->controller);
+	data->controller.ops = &xway_nand_ops;
+	data->chip.controller = &data->controller;
 
 	platform_set_drvdata(pdev, data);
 	nand_set_controller_data(&data->chip, data);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
