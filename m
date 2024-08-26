Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2287AC5321D
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 10:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NkhppHAtuttn80ykBG/jzAOXiMXyzYaGsd2E924jOnY=; b=HHnRaLh/0KgGXH
	Tre1q2tPmF12NBa3oqCmFIOGO32bpMltIXA41o7bE1j8Epmpix4rLnEPcUUHuoDl9uo2tQmemQj9w
	eoIS4XB6useRHryDTWI29jMCrHWbiZxDvvC2EsMVKED0P8TTLWB3uPIXDKh1ZoRo/vMkW3iP7Qxi4
	/pEego4ZxJ3ui2UvBcu+LWKxcgxIIu2ZWmLnNBeFzKXV9Ku51EKPShtaPLqauXp7ttcKkAoIBY4oM
	/CZUL6wmjnCJFA/WxMR578BHeDyQuEaIywVZuSqhr+CdinUFtNAEH9TjeZkMA7Ej9lLaocBr81rzh
	JnrufZHv0RRWuj6zpJ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWlr-00000006t40-1tpO;
	Mon, 26 Aug 2024 10:16:23 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWjs-00000006sLK-1TkA
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 10:14:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68A7F1BF20A;
	Mon, 26 Aug 2024 10:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724667258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KMgBtijO8AtO0H5TNwcNt19aPRO/xhWraRdLoypMwq4=;
	b=D908oBDTEX/YS4+Hhhiqs1aesILrOHfS9UZtQdlm1L8ZMikRUlXGKeGHce+syh1dX5nUPU
	hbpHSCpGVNh7F9m5eJjnuevJY//J5LzRbYwLlZJrYJ5kBF+HRgOApULscLFcU7G6gPvSTL
	6znyN2GAH6GRgtU6fO9He0Tpdjx0ODGDoU2EVn2y/VzjdgfSklp77kP1/cnC/chD4SxFpP
	apv4vKQc6PjfOwwzBwRyFsFFOOtnN2Le/dAkh0MfTVXzPk3EdOPg28MfV0zpo6g/luto5n
	Kme4lPZWTIVhWJLEOs6hHgyqsT35QDIlg6shaK+eGeDkC9KBIkd3zOLJaw1t0g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 7/9] mtd: spi-nand: macronix: Extract the bitflip retrieval logic
Date: Mon, 26 Aug 2024 12:14:10 +0200
Message-ID: <20240826101412.20644-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826101412.20644-1-miquel.raynal@bootlin.com>
References: <20240826101412.20644-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_031420_716422_3CF45D6C 
X-CRM114-Status: GOOD (  14.87  )
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

With GET_STATUS commands, SPI-NAND devices can tell the status of the
last read operation, in particular if there was:
- no bitflips
- corrected bitflips
- uncorrectable bitflips

The next step then to read an ECC status register and retrieve the
amount of bitflips, when relevant, if possible. The logic used here
works well for now, but will no longer apply to continuous reads. In
order to prepare the introduction of continuous reads, let's factorize
out the code that is specific to single-page reads.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/macronix.c | 37 ++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 7b1fb4b32340..d26e8a8c5850 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -64,12 +64,29 @@ static int macronix_get_eccsr(struct spinand_device *spinand, u8 *eccsr)
 	return 0;
 }
 
-static int macronix_ecc_get_status(struct spinand_device *spinand,
-				   u8 status)
+static int macronix_get_bf(struct spinand_device *spinand, u8 status)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	u8 eccsr;
 
+	/*
+	 * Let's try to retrieve the real maximum number of bitflips
+	 * in order to avoid forcing the wear-leveling layer to move
+	 * data around if it's not necessary.
+	 */
+	if (macronix_get_eccsr(spinand, spinand->scratchbuf))
+		return nanddev_get_ecc_conf(nand)->strength;
+
+	eccsr = *spinand->scratchbuf;
+	if (WARN_ON(eccsr > nanddev_get_ecc_conf(nand)->strength || !eccsr))
+		return nanddev_get_ecc_conf(nand)->strength;
+
+	return eccsr;
+}
+
+static int macronix_ecc_get_status(struct spinand_device *spinand,
+				   u8 status)
+{
 	switch (status & STATUS_ECC_MASK) {
 	case STATUS_ECC_NO_BITFLIPS:
 		return 0;
@@ -78,21 +95,7 @@ static int macronix_ecc_get_status(struct spinand_device *spinand,
 		return -EBADMSG;
 
 	case STATUS_ECC_HAS_BITFLIPS:
-		/*
-		 * Let's try to retrieve the real maximum number of bitflips
-		 * in order to avoid forcing the wear-leveling layer to move
-		 * data around if it's not necessary.
-		 */
-		if (macronix_get_eccsr(spinand, spinand->scratchbuf))
-			return nanddev_get_ecc_conf(nand)->strength;
-
-		eccsr = *spinand->scratchbuf;
-		if (WARN_ON(eccsr > nanddev_get_ecc_conf(nand)->strength ||
-			    !eccsr))
-			return nanddev_get_ecc_conf(nand)->strength;
-
-		return eccsr;
-
+		return macronix_get_bf(spinand, status);
 	default:
 		break;
 	}
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
