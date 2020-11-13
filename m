Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6BEC56202
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:36:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3168020797
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:36:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UlM7eXVP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3168020797
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jdF6ECB7HflMkganI4qWdELSzZX8NSdiGdi5OMzxSSE=; b=UlM7eXVPS0m0vuHXG39MegrWa
	i2zTh5GzCOZnnte7Y4qn3cWZENk5OGhRbtrITO56Gl1lbfbbWKg96MFjDKcF0fi5nLeZmPBgbqWPe
	uNosVsJQWpGMZFb1kIC+7rI0dXali6qv8+qJVBy/pqaOr3bBtDMaQb4qujmCc3AKkApzuZsrqhBEO
	qYVp2B1LNUYrud7WaKF4rBBWwPvf/44NjMOqpsuTNZI4E9QW1f6n5CSchIr+dwUQi1D72xFqjqDDs
	UERfjayf1TxVqM9IXefiEd2LXHMgkXT276UunZMYQzEVTBMpJ1YVLNg+V3P4SWG01nviT/SwVZWMn
	0zt6O47ew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdYIg-0008Qj-8j; Fri, 13 Nov 2020 12:35:34 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYHl-00082u-Td
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2020 12:34:39 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 78A5DC0003;
 Fri, 13 Nov 2020 12:34:36 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 14/19] mtd: rawnand: tmio: Move the ECC initialization to
 ->attach_chip()
Date: Fri, 13 Nov 2020 13:34:19 +0100
Message-Id: <20201113123424.32233-15-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113123424.32233-1-miquel.raynal@bootlin.com>
References: <20201113123424.32233-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_073438_163630_9AE6E9CA 
X-CRM114-Status: GOOD (  15.52  )
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
this by moving these lines to ->attach_chip().

Fixes: d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing bits")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/tmio_nand.c | 33 +++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/tmio_nand.c b/drivers/mtd/nand/raw/tmio_nand.c
index 31e5e50e77e2..de8e919d0ebe 100644
--- a/drivers/mtd/nand/raw/tmio_nand.c
+++ b/drivers/mtd/nand/raw/tmio_nand.c
@@ -102,6 +102,7 @@
 /*--------------------------------------------------------------------------*/
 
 struct tmio_nand {
+	struct nand_controller controller;
 	struct nand_chip chip;
 	struct completion comp;
 
@@ -354,6 +355,25 @@ static void tmio_hw_stop(struct platform_device *dev, struct tmio_nand *tmio)
 		cell->disable(dev);
 }
 
+static int tmio_attach_chip(struct nand_chip *chip)
+{
+	if (chip->ecc.engine_type != NAND_ECC_ENGINE_TYPE_ON_HOST)
+		return 0;
+
+	chip->ecc.size = 512;
+	chip->ecc.bytes = 6;
+	chip->ecc.strength = 2;
+	chip->ecc.hwctl = tmio_nand_enable_hwecc;
+	chip->ecc.calculate = tmio_nand_calculate_ecc;
+	chip->ecc.correct = tmio_nand_correct_data;
+
+	return 0;
+}
+
+static const struct nand_controller_ops tmio_ops = {
+	.attach_chip = tmio_attach_chip,
+};
+
 static int tmio_probe(struct platform_device *dev)
 {
 	struct tmio_nand_data *data = dev_get_platdata(&dev->dev);
@@ -384,6 +404,10 @@ static int tmio_probe(struct platform_device *dev)
 	mtd->name = "tmio-nand";
 	mtd->dev.parent = &dev->dev;
 
+	nand_controller_init(&tmio->controller);
+	tmio->controller.ops = &tmio_ops;
+	nand_chip->controller = &tmio->controller;
+
 	tmio->ccr = devm_ioremap(&dev->dev, ccr->start, resource_size(ccr));
 	if (!tmio->ccr)
 		return -EIO;
@@ -408,15 +432,6 @@ static int tmio_probe(struct platform_device *dev)
 	nand_chip->legacy.write_buf = tmio_nand_write_buf;
 	nand_chip->legacy.read_buf = tmio_nand_read_buf;
 
-	/* set eccmode using hardware ECC */
-	nand_chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
-	nand_chip->ecc.size = 512;
-	nand_chip->ecc.bytes = 6;
-	nand_chip->ecc.strength = 2;
-	nand_chip->ecc.hwctl = tmio_nand_enable_hwecc;
-	nand_chip->ecc.calculate = tmio_nand_calculate_ecc;
-	nand_chip->ecc.correct = tmio_nand_correct_data;
-
 	if (data)
 		nand_chip->badblock_pattern = data->badblock_pattern;
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
