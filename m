Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2EEC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 22:18:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E421B6139D
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 22:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E421B6139D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=10xJOXV+57T1EjKM0jyJtdiQSunFWFRtC1psJhdglIY=; b=EvimlrDCVXRv8b
	7JURognui0OjLVBGesMzAv8MXHk7sXLxNuxcBUoxtUtrxBtobrCNQn8/DDsHiEDg9rdQrv094NtPx
	4smyo5u+K5okw63Gk9wgXWb61azzfeSa7Bh4H5WO5KtS5SYHyQGHurJ0uW+kqNZnpnm1skSnNa6k2
	AdvLKsHZrwG9ttjBoUig//bBGo9QeZgNsPx/TsnzRtvn0Osa+hWys63CBUdYU3qisRt8czbSx6SdG
	Nm3PgfltOrf4Ng0Nx8cW8l8WalZKrgetSe1MhM3uQHIA5+dDFhTGLLZBEoeugtxnDXi39rICvsXAS
	R25VYNDeolKO4KHMU34Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVLQ1-0090vX-NQ; Tue, 28 Sep 2021 22:17:45 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVLNc-008zxF-3X; Tue, 28 Sep 2021 22:15:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id C3D511C0009;
 Tue, 28 Sep 2021 22:15:13 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 5/8] Revert "mtd: rawnand: sharpsl: Fix external use of SW
 Hamming ECC helper"
Date: Wed, 29 Sep 2021 00:15:04 +0200
Message-Id: <20210928221507.199198-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210928221507.199198-1-miquel.raynal@bootlin.com>
References: <20210928221507.199198-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_151516_471534_7D5462C0 
X-CRM114-Status: GOOD (  20.18  )
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

This reverts commit 46fcb57e6b7283533ebf8ba17a6bd30fa88bdc9f.

Before the introduction of the ECC framework infrastructure, many
drivers used the ->calculate/correct() Hamming helpers directly. The
point of this framework was to avoid this kind of hackish calls and use a
proper and generic API but it is true that in certain cases, drivers
still need to use these helpers in order to do ECC computations on
behalf of their limited hardware.

Right after the introduction of the ECC engine core introduction, it was
spotted that it was not possible to use the shiny rawnand software ECC
helpers so easily because an ECC engine object should have been
allocated and initialized first. While this works well in most cases,
for these drivers just leveraging the power of a single helper in
conjunction with some pretty old and limited hardware, it did not fit.

The idea back then was to declare intermediate helpers which would make
use of the exported software ECC engine bare functions while keeping the
rawnand layer compatibility. As there was already functions with the
rawnand_sw_hamming_ prefix it was decided to declare new local helpers
for this purpose in each driver needing one.

Besides being far from optimal, this design choice was blamed by Linus
when he pulled the "fixes" pull request [1] so that is why now it is
time to clean this mess up.

The implementation of the rawnand_ecc_sw_* helpers has now been enhanced
to support both cases, when the ECC object is instantiated and when it is
not. This way, we can still use the existing and exported rawnand
helpers while avoiding the need for each driver to declare its own
helper, thus this fix from [2] can now be safely reverted.

[1] https://lore.kernel.org/lkml/CAHk-=wh_ZHF685Fni8V9is17mj=pFisUaZ_0=gq6nbK+ZcyQmg@mail.gmail.com/
[2] https://lore.kernel.org/linux-mtd/20210413161840.345208-1-miquel.raynal@bootlin.com

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/sharpsl.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/sharpsl.c b/drivers/mtd/nand/raw/sharpsl.c
index 2f1fe464e663..5612ee628425 100644
--- a/drivers/mtd/nand/raw/sharpsl.c
+++ b/drivers/mtd/nand/raw/sharpsl.c
@@ -11,7 +11,6 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/sharpsl.h>
@@ -97,15 +96,6 @@ static int sharpsl_nand_calculate_ecc(struct nand_chip *chip,
 	return readb(sharpsl->io + ECCCNTR) != 0;
 }
 
-static int sharpsl_nand_correct_ecc(struct nand_chip *chip,
-				    unsigned char *buf,
-				    unsigned char *read_ecc,
-				    unsigned char *calc_ecc)
-{
-	return ecc_sw_hamming_correct(buf, read_ecc, calc_ecc,
-				      chip->ecc.size, false);
-}
-
 static int sharpsl_attach_chip(struct nand_chip *chip)
 {
 	if (chip->ecc.engine_type != NAND_ECC_ENGINE_TYPE_ON_HOST)
@@ -116,7 +106,7 @@ static int sharpsl_attach_chip(struct nand_chip *chip)
 	chip->ecc.strength = 1;
 	chip->ecc.hwctl = sharpsl_nand_enable_hwecc;
 	chip->ecc.calculate = sharpsl_nand_calculate_ecc;
-	chip->ecc.correct = sharpsl_nand_correct_ecc;
+	chip->ecc.correct = rawnand_sw_hamming_correct;
 
 	return 0;
 }
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
