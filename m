Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1770C63697
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 13:51:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F79E2223F
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 13:51:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ohaU8eyR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F79E2223F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tb/ARm8IQbcCkgb3IiDn6mvaFi10B5NsKn3HmsQAthI=; b=ohaU8eyR72xRb2a97SsieT/QY
	OPMdK6Yj5Lvofe24FyVaApAP1xdcrg8YPMThmTd17IUpk2RN+DtXT6/qBqFBHWeJsDvvztuWapAvd
	+QNj1NrGdadqXkoAtHCUGuaWnQ/jfjukbwE2X4vzk4Or0qciIu+5GBwVJX8JEpTTXLsmfruFYhy7y
	SVfzugdMTrZnXLh1D8fdEd++Rv8gCbXFX53iqql0d8myqa2OehmF9aXX2aFIOQvsuZyORaJsEm7Qf
	mFSQOWdnvGgNY6KZJ6fLUJvr1okwEjMeahdzQ8t3zj2ffDT6OUP7VDOIJnXhqEka9r0xl5uI5LfqC
	pKMcoWq+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdZU0-0007p9-CQ; Fri, 13 Nov 2020 13:51:20 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYHo-000842-5k
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2020 12:34:42 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 83EACC000E;
 Fri, 13 Nov 2020 12:34:38 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 17/19] mtd: rawnand: r852: Move the ECC initialization to
 ->attach_chip()
Date: Fri, 13 Nov 2020 13:34:22 +0100
Message-Id: <20201113123424.32233-18-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113123424.32233-1-miquel.raynal@bootlin.com>
References: <20201113123424.32233-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_073440_494192_F1054729 
X-CRM114-Status: GOOD (  17.23  )
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
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
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
Cc: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/raw/r852.c | 40 +++++++++++++++++++++++++------------
 drivers/mtd/nand/raw/r852.h |  1 +
 2 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 6b7addd2c420..620708135d3d 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -817,6 +817,29 @@ static irqreturn_t r852_irq(int irq, void *data)
 	return ret;
 }
 
+static int r852_attach_chip(struct nand_chip *chip)
+{
+	if (chip->ecc.engine_type != NAND_ECC_ENGINE_TYPE_ON_HOST)
+		return 0;
+
+	chip->ecc.placement = NAND_ECC_PLACEMENT_INTERLEAVED;
+	chip->ecc.size = R852_DMA_LEN;
+	chip->ecc.bytes = SM_OOB_SIZE;
+	chip->ecc.strength = 2;
+	chip->ecc.hwctl = r852_ecc_hwctl;
+	chip->ecc.calculate = r852_ecc_calculate;
+	chip->ecc.correct = r852_ecc_correct;
+
+	/* TODO: hack */
+	chip->ecc.read_oob = r852_read_oob;
+
+	return 0;
+}
+
+static const struct nand_controller_ops r852_ops = {
+	.attach_chip = r852_attach_chip,
+};
+
 static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 {
 	int error;
@@ -848,6 +871,10 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 	if (!chip)
 		goto error4;
 
+	nand_controller_init(&dev->controller);
+	dev->controller.ops = &r852_ops;
+	chip->controller = &dev->controller;
+
 	/* commands */
 	chip->legacy.cmd_ctrl = r852_cmdctl;
 	chip->legacy.waitfunc = r852_wait;
@@ -858,19 +885,6 @@ static int  r852_probe(struct pci_dev *pci_dev, const struct pci_device_id *id)
 	chip->legacy.read_buf = r852_read_buf;
 	chip->legacy.write_buf = r852_write_buf;
 
-	/* ecc */
-	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
-	chip->ecc.placement = NAND_ECC_PLACEMENT_INTERLEAVED;
-	chip->ecc.size = R852_DMA_LEN;
-	chip->ecc.bytes = SM_OOB_SIZE;
-	chip->ecc.strength = 2;
-	chip->ecc.hwctl = r852_ecc_hwctl;
-	chip->ecc.calculate = r852_ecc_calculate;
-	chip->ecc.correct = r852_ecc_correct;
-
-	/* TODO: hack */
-	chip->ecc.read_oob = r852_read_oob;
-
 	/* init our device structure */
 	dev = kzalloc(sizeof(struct r852_device), GFP_KERNEL);
 
diff --git a/drivers/mtd/nand/raw/r852.h b/drivers/mtd/nand/raw/r852.h
index e9ce299c499d..96fe301d15da 100644
--- a/drivers/mtd/nand/raw/r852.h
+++ b/drivers/mtd/nand/raw/r852.h
@@ -104,6 +104,7 @@
 #define DMA_MEMORY	1
 
 struct r852_device {
+	struct nand_controller		controller;
 	void __iomem *mmio;		/* mmio */
 	struct nand_chip *chip;		/* nand chip backpointer */
 	struct pci_dev *pci_dev;	/* pci backpointer */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
