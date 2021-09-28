Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47F6C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 22:19:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FA606139D
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 22:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FA606139D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vsxwe2uVGc8VdfB/OHEqCku9XI15nBHwwxWVhPuHu6k=; b=gR4eSHo20u4UqG
	xVo0pl5LRZ3I/bHKU35dyLB31tg//6LVNpMWjBKll1RYUZx5zz5+gZ4MsKEH9caSbGoQEfCYapABv
	8vpSx0rXDev+3Ga95o+wuJAnKrGrOIgfOQAdF5V2G8M5J+VqtWgiifhg9MmdEvji984e4q1/P0uh1
	WB3aboqmxK9GzhnKDu6sth4xTwexIO6+vbniwok8WtiKfBkdCUmT/zu6E4+zC02VtzjEnxn5orVK3
	cKR7Axeg7/aNgAKKxvuaE1Hn25SidWD+Fiezsh5gey2ucKXQJpFWfOzEqjQ0XVeyCEW5jQfH6cUPX
	xi3eC2CcqIRSOduO5x/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVLRI-0091VF-5W; Tue, 28 Sep 2021 22:19:04 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVLNb-008zwb-IY; Tue, 28 Sep 2021 22:15:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 248731C0004;
 Tue, 28 Sep 2021 22:15:11 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/8] mtd: rawnand: Let callers use the bare Hamming helpers
Date: Wed, 29 Sep 2021 00:15:01 +0200
Message-Id: <20210928221507.199198-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210928221507.199198-1-miquel.raynal@bootlin.com>
References: <20210928221507.199198-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_151515_947742_F5FC5086 
X-CRM114-Status: GOOD (  18.95  )
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

Enhancing the implementation of the rawnand_ecc_sw_* helpers to support
both cases, when the ECC object is instantiated and when it is not is a
quite elegant way to solve this situation. This way, we can still use
the existing and exported rawnand helpers while avoiding the need for
each driver to declare its own helper.

Following this change, most of the fixes sent in [2] can now be safely
reverted. Only the fsmc fix will need to be kept because there is
actually something specific to the driver to do in its ->correct()
helper.

[1] https://lore.kernel.org/lkml/CAHk-=wh_ZHF685Fni8V9is17mj=pFisUaZ_0=gq6nbK+ZcyQmg@mail.gmail.com/
[2] https://lore.kernel.org/linux-mtd/20210413161840.345208-1-miquel.raynal@bootlin.com/

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc-sw-hamming.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/ecc-sw-hamming.c b/drivers/mtd/nand/ecc-sw-hamming.c
index a7655b668f32..254db2e7f8bb 100644
--- a/drivers/mtd/nand/ecc-sw-hamming.c
+++ b/drivers/mtd/nand/ecc-sw-hamming.c
@@ -364,9 +364,9 @@ int nand_ecc_sw_hamming_calculate(struct nand_device *nand,
 {
 	struct nand_ecc_sw_hamming_conf *engine_conf = nand->ecc.ctx.priv;
 	unsigned int step_size = nand->ecc.ctx.conf.step_size;
+	bool sm_order = engine_conf ? engine_conf->sm_order : false;
 
-	return ecc_sw_hamming_calculate(buf, step_size, code,
-					engine_conf->sm_order);
+	return ecc_sw_hamming_calculate(buf, step_size, code, sm_order);
 }
 EXPORT_SYMBOL(nand_ecc_sw_hamming_calculate);
 
@@ -457,9 +457,10 @@ int nand_ecc_sw_hamming_correct(struct nand_device *nand, unsigned char *buf,
 {
 	struct nand_ecc_sw_hamming_conf *engine_conf = nand->ecc.ctx.priv;
 	unsigned int step_size = nand->ecc.ctx.conf.step_size;
+	bool sm_order = engine_conf ? engine_conf->sm_order : false;
 
 	return ecc_sw_hamming_correct(buf, read_ecc, calc_ecc, step_size,
-				      engine_conf->sm_order);
+				      sm_order);
 }
 EXPORT_SYMBOL(nand_ecc_sw_hamming_correct);
 
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
