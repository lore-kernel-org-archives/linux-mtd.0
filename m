Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86984C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 22:28:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5221961381
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 22:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5221961381
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vhUrdXeQiy1pV6u0iEQkppMJCeaLH9nCJpCgEpg7CHU=; b=DNiBy2MYHVSnkE
	GRz+kTpUAgB0rdcFm6exmozUtkwoW0SUJ6PKyvE8FHWSIxvmof7L/c2MtBC3DxTasBEO7DjYSUVtF
	iTVI7Z/Z5P4jej2vwtWjiriVNryJETbExWhPAJgoJF8Nz/w+6fmO6qiR8AyM0ArB5uxmr+hPv13Nb
	hr2ag5UwmA73kXSQpnBT3PIaTDE4a9kZge6k5ibxCsAooCRsoMn1YkpwDeFXKPUtH9lXFOUW2ZgQZ
	CyaDwDaAYZKHTCEqKA5Qx8Iv/zFufugMnBpXR5bAUp9OGtLPo/A1tsSI7bbA0VB5+iptYMgbkH5B+
	5pe5uQ4dkAbRrSkLCKKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVLaC-0094fN-Ss; Tue, 28 Sep 2021 22:28:16 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVLNe-008zz8-NE; Tue, 28 Sep 2021 22:15:22 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 65CFE1C000D;
 Tue, 28 Sep 2021 22:15:16 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 8/8] Revert "mtd: rawnand: cs553x: Fix external use of SW
 Hamming ECC helper"
Date: Wed, 29 Sep 2021 00:15:07 +0200
Message-Id: <20210928221507.199198-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210928221507.199198-1-miquel.raynal@bootlin.com>
References: <20210928221507.199198-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_151519_078013_C3BFD75C 
X-CRM114-Status: GOOD (  20.08  )
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

This reverts commit 56a8d3fd1f342d10ee7b27e9ac0f4d00b5fbb91c.

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
 drivers/mtd/nand/raw/cs553x_nand.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/cs553x_nand.c b/drivers/mtd/nand/raw/cs553x_nand.c
index df40927e5678..6edf78c16fc8 100644
--- a/drivers/mtd/nand/raw/cs553x_nand.c
+++ b/drivers/mtd/nand/raw/cs553x_nand.c
@@ -18,7 +18,6 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/iopoll.h>
@@ -241,15 +240,6 @@ static int cs_calculate_ecc(struct nand_chip *this, const u_char *dat,
 	return 0;
 }
 
-static int cs553x_ecc_correct(struct nand_chip *chip,
-			      unsigned char *buf,
-			      unsigned char *read_ecc,
-			      unsigned char *calc_ecc)
-{
-	return ecc_sw_hamming_correct(buf, read_ecc, calc_ecc,
-				      chip->ecc.size, false);
-}
-
 static struct cs553x_nand_controller *controllers[4];
 
 static int cs553x_attach_chip(struct nand_chip *chip)
@@ -261,7 +251,7 @@ static int cs553x_attach_chip(struct nand_chip *chip)
 	chip->ecc.bytes = 3;
 	chip->ecc.hwctl  = cs_enable_hwecc;
 	chip->ecc.calculate = cs_calculate_ecc;
-	chip->ecc.correct  = cs553x_ecc_correct;
+	chip->ecc.correct  = rawnand_sw_hamming_correct;
 	chip->ecc.strength = 1;
 
 	return 0;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
