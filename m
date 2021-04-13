Return-Path: <SRS0=Vrwx=JK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D812C43460
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 16:20:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59DC66135C
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 16:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59DC66135C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lfFBoE5V9lx+2DKZzhlVQ9UigoJCY1ZIpnQfisRSCnE=; b=HpkHlYxYhSlijCUyBRt2ltZ9m
	WV3PjqnnfwL1AsP1dF3bPz28bKprKtQiAanMB47lFEgLx4yJ9DEzw/hMHVcH5s+vynBfJN0W1yY8x
	JDRoGhwtezz47q98v06xIBELCJsVznzuhXct+AKVu/FHGtfenvVbrBuLQfew8fupc9B9nH83cadbR
	8B+s7DzYhj5xbAiWF12gqPFHCRZMw3Pq89PwC7N5+kMFs4PyE+3vyOU/Vt88bKIKV5O0Vho+yI4jf
	/AQZIJ+zts9vUTQyGXuqK9AcmFIU0Ww4uuZXVacj1NrxU62Ex/a7UTtu1nQ8hXID65V7oM/QEMToE
	Cqnfx0T/w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWLkd-009ln8-SC; Tue, 13 Apr 2021 16:18:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLkZ-009lmF-Nt
 for linux-mtd@desiato.infradead.org; Tue, 13 Apr 2021 16:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=IxaOna/oGj56w9XsEwziTVG4LLeF1xhPpN8AFAFgkKc=; b=LTdXxD/OF+FqJu+w2oToiviztc
 Z0PV8jiEBvTUb2Uu+Hgp5Nt76r5keSVAKDF9DOtv5ZUxXsVzyPh3GYCFgHgakY1Ez9RTF+tB4GCzy
 bsh4WLeEE/Yh/9QZzDsHf706h3IZ9rbXfq89aA11cTYHttDuUZFhh7MECtrM568k4F59W9mzCcys1
 R76qOVst/JamOnPkw6DiziIXZdBRKMRDRn+/2VT/LWUnRnnFR6mIBRBmA3LnaRI62alZFE6Gr5kWN
 xUDAu7q+S3uE9Pi40oWr4NbEiBQ71egc2yMYAUjOjVKn9YVC3dLsIAFPiXM+/+VDQzkpSsw8gIYgL
 3rOH687A==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLkV-007AlH-Tw
 for linux-mtd@lists.infradead.org; Tue, 13 Apr 2021 16:18:50 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 072E4FF810;
 Tue, 13 Apr 2021 16:18:43 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, stable@vger.kernel.org,
 Vladimir Zapolskiy <vz@mleia.com>, Trevor Woerner <twoerner@gmail.com>
Subject: [PATCH v3 3/7] mtd: rawnand: lpc32xx_slc: Fix external use of SW
 Hamming ECC helper
Date: Tue, 13 Apr 2021 18:18:36 +0200
Message-Id: <20210413161840.345208-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210413161840.345208-1-miquel.raynal@bootlin.com>
References: <20210413161840.345208-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_091848_122672_E7BA8533 
X-CRM114-Status: GOOD (  11.89  )
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

Since the Hamming software ECC engine has been updated to become a
proper and independent ECC engine, it is now mandatory to either
initialize the engine before using any one of his functions or use one
of the bare helpers which only perform the calculations. As there is no
actual need for a proper ECC initialization, let's just use the bare
helper instead of the rawnand one.

Fixes: 90ccf0a0192f ("mtd: nand: ecc-hamming: Rename the exported functions")
Cc: stable@vger.kernel.org
Cc: Vladimir Zapolskiy <vz@mleia.com>
Reported-by: Trevor Woerner <twoerner@gmail.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Tested-by: Trevor Woerner <twoerner@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_slc.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index 6b7269cfb7d8..d7dfc6fd85ca 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -27,6 +27,7 @@
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/mtd/lpc32xx_slc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 
 #define LPC32XX_MODNAME		"lpc32xx-nand"
 
@@ -344,6 +345,18 @@ static int lpc32xx_nand_ecc_calculate(struct nand_chip *chip,
 	return 0;
 }
 
+/*
+ * Corrects the data
+ */
+static int lpc32xx_nand_ecc_correct(struct nand_chip *chip,
+				    unsigned char *buf,
+				    unsigned char *read_ecc,
+				    unsigned char *calc_ecc)
+{
+	return ecc_sw_hamming_correct(buf, read_ecc, calc_ecc,
+				      chip->ecc.size, false);
+}
+
 /*
  * Read a single byte from NAND device
  */
@@ -802,7 +815,7 @@ static int lpc32xx_nand_attach_chip(struct nand_chip *chip)
 	chip->ecc.write_oob = lpc32xx_nand_write_oob_syndrome;
 	chip->ecc.read_oob = lpc32xx_nand_read_oob_syndrome;
 	chip->ecc.calculate = lpc32xx_nand_ecc_calculate;
-	chip->ecc.correct = rawnand_sw_hamming_correct;
+	chip->ecc.correct = lpc32xx_nand_ecc_correct;
 	chip->ecc.hwctl = lpc32xx_nand_ecc_enable;
 
 	/*
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
