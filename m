Return-Path: <SRS0=Vrwx=JK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F9BC433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 10:00:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD36C613B2
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 10:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD36C613B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PE/guhMIMGY14nKyBRWBDZ+3BmM2twQUO5RoI9qs/uI=; b=oCPZhm53ST/JsE2eIGygsFQdXf
	lkOuj/bKWIxkV8AwNQx+C1MBGTwfibLAFc8Jc48mvrRJfzEPRkInVt+Dejl7d74G+bMSLdZ4OX+EW
	EcZ0fF5RshLiwVpP5JhSe3NZFHxYNsn5zfhn64TO7tvpPLGrCqLByqADhh5KxzxGi74UKMft2u3Rm
	rBeRf362jJkC0qDNFUP6Hjv+8tPlZWQ1BQAzuhK/oqSoyznRHFucfSU0vXRXcg99lspAExW0m22FE
	Xi++Puu9RSxWyzoRTMldGazkMjMM0NWpc0jKbg44dXyjlGH7qYXR+q3Su9lqQIDdGqoz2piM74ALC
	mbvXAeXA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWFpO-008opO-Qz; Tue, 13 Apr 2021 09:59:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWFpL-008op0-Tp
 for linux-mtd@desiato.infradead.org; Tue, 13 Apr 2021 09:59:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=52Mwh5CrnPQ7yrzyJO33y5ka26nMLbM5P+b5p0QyoAk=; b=EW118SiOTbZLMRWcNtpJmG29OT
 3EuK1im+LFqgtWmuWStn5xN1fvqZWYFNeUNKWTi+f1As6+5ihC6Gq5+drt0D0hcxVWL+L6k9Pbzow
 m5IR6doPnAz15BptTcJ5PtBAUZ0AoxqKqa1Az2/U1+BynGuyHVGU9r9Qc3IHJ2nShfbLKomr9qki/
 Ig5TvOqflH6QFmnbOJXPkJVHD14UML4LHakXgCIRUT/zH6Phti6T1LCiIrIYOzrnU9LR2J5DsRVLD
 DYTdaFqqIvUVxwaabtGaz/Be8GOmTRyFYkvPWLP42TSU9NtEIyjUPIgC+rsrWl2Sz6/aEyPlE/y7a
 l02BMsvQ==;
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWFpI-006uQp-8I
 for linux-mtd@lists.infradead.org; Tue, 13 Apr 2021 09:59:21 +0000
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 0195910000D;
 Tue, 13 Apr 2021 09:59:16 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, stable@vger.kernel.org,
 Trevor Woerner <twoerner@gmail.com>
Subject: [PATCH v2] mtd: rawnand: lpc32xx_slc: Fix external use of SW Hamming
 ECC helper
Date: Tue, 13 Apr 2021 11:59:16 +0200
Message-Id: <20210413095916.330405-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_025920_452765_5D350172 
X-CRM114-Status: GOOD (  12.51  )
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

Fixes: 19b2ce184b9f ("mtd: nand: ecc-hamming: Stop using raw NAND structures")
Cc: stable@vger.kernel.org
Reported-by: Trevor Woerner <twoerner@gmail.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/lpc32xx_slc.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index 6b7269cfb7d8..65663f5ba54f 100644
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
@@ -819,8 +832,14 @@ static int lpc32xx_nand_attach_chip(struct nand_chip *chip)
 	return 0;
 }
 
+static void lpc32xx_nand_detach_chip(struct nand_chip *chip)
+{
+	rawnand_sw_hamming_cleanup(chip);
+}
+
 static const struct nand_controller_ops lpc32xx_nand_controller_ops = {
 	.attach_chip = lpc32xx_nand_attach_chip,
+	.detach_chip = lpc32xx_nand_detach_chip,
 };
 
 /*
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
