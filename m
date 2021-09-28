Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3D0C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 22:56:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B7ED6138F
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 22:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B7ED6138F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TZpMx716D7+rAyDygKwbEYJ6A0shw/h0T7UcZgQqYnQ=; b=WPijvZbYgUpahY
	lty5ZEWdwlUuZNZ/alh63C13CshS7OyZuY/AM3XwKDOEElAr0W1QKWiCP4/v/PXAMcNet1CESQEmJ
	OOkKCqvvwoHidzvTDv0n/5qu4geJDGfYIcLtS0Z3tc8SLBfW3kneXfamwYtlbr3w/HoZVMFm0lTA/
	lRZf7aRJIUSqlEVIxhF9FViueuWrc+uWhG0W4AgKTeE8dS3iJf15MNMe2vYFlVFbGmHqFeouXgY99
	TQqDxiIKfl4/vuGJty2AwmldlXFK6fbJyL/GpgShV+SyRObBDvgTXlIOMGqFlDVC097KLTh0egrJO
	hIB8JMSvG0IPT5aRq5OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVM0a-009AcI-9E; Tue, 28 Sep 2021 22:55:32 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVLVI-00931i-PP
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 22:23:14 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id F1CEC100007;
 Tue, 28 Sep 2021 22:23:09 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, stable@vger.kernel.org
Subject: [PATCH 3/9] mtd: rawnand: gpio: Keep the driver compatible with
 on-die ECC engines
Date: Wed, 29 Sep 2021 00:22:52 +0200
Message-Id: <20210928222258.199726-14-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210928222258.199726-1-miquel.raynal@bootlin.com>
References: <20210928222258.199726-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_152313_029460_5008AEFF 
X-CRM114-Status: GOOD (  19.97  )
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

Following the introduction of the generic ECC engine infrastructure, it
was necessary to reorganize the code and move the ECC configuration in
the ->attach_chip() hook. Failing to do that properly lead to a first
series of fixes supposed to stabilize the situation. Unfortunately, this
only fixed the use of software ECC engines, preventing any other kind of
engine to be used, including on-die ones.

It is now time to (finally) fix the situation by ensuring that we still
provide a default (eg. software ECC) but will still support different
ECC engines such as on-die ECC engines if properly described in the
device tree.

There are no changes needed on the core side in order to do this, but we
just need to leverage the logic there which allows:
1- a subsystem default (set to Host engines in the raw NAND world)
2- a driver specific default (here set to software ECC engines)
3- any type of engine requested by the user (ie. described in the DT)

As the raw NAND subsystem has not yet been fully converted to the ECC
engine infrastructure, in order to provide a default ECC engine for this
driver we need to set chip->ecc.engine_type *before* calling
nand_scan(). During the initialization step, the core will consider this
entry as the default engine for this driver. This value may of course
be overloaded by the user if the usual DT properties are provided.

Fixes: f6341f6448e0 ("mtd: rawnand: gpio: Move the ECC initialization to ->attach_chip()")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/gpio.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index fb7a086de35e..fdf073d2e1b6 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -163,9 +163,8 @@ static int gpio_nand_exec_op(struct nand_chip *chip,
 
 static int gpio_nand_attach_chip(struct nand_chip *chip)
 {
-	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
-
-	if (chip->ecc.algo == NAND_ECC_ALGO_UNKNOWN)
+	if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_SOFT &&
+	    chip->ecc.algo == NAND_ECC_ALGO_UNKNOWN)
 		chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
 
 	return 0;
@@ -365,6 +364,13 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (gpiomtd->nwp && !IS_ERR(gpiomtd->nwp))
 		gpiod_direction_output(gpiomtd->nwp, 1);
 
+	/*
+	 * This driver assumes that the default ECC engine should be TYPE_SOFT.
+	 * Set ->engine_type before registering the NAND devices in order to
+	 * provide a driver specific default value.
+	 */
+	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
+
 	ret = nand_scan(chip, 1);
 	if (ret)
 		goto err_wp;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
