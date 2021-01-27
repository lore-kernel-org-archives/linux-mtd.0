Return-Path: <SRS0=ZJz0=G6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 924B3C433E9
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 20:31:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B71960C3D
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 20:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B71960C3D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6CEYUG9ah9XCjgEZeDO6wRV2/AFPKF9D0RDW57RYNMI=; b=tCzS0lfC70sJErUYRvGvLr2Mf
	LAYuWQnmdq/ME25Y0Pv5yl7KzU4o+jeRu4jDrVpxmdi3RZjbDqUAbWsZF2lN0qKILcYeT9z910VzW
	Svz5+WxYRV/s+J1XIUHmwLzUEztL7mOEFHBj0o5KmyGPUGFTUtqvpnv+TofieiLlqQnlAtu9sSNYq
	mYHbbdtQGE7KKUmDyP1F9X9x2PPGEw3dtZOKaTldfuFogMrlKL+gGe6PKheeZoZ3J2zaID0JwNEZ2
	Oj8ERmGeLIEUEGJyJwZ3l0t0L2Z2v2MraXO9afxq4xVLOpvYZ8MqWE9l1rHGjnzBN3+c+Rk93IAKQ
	P2XMBOeeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4rSj-0002Cr-3x; Wed, 27 Jan 2021 20:30:49 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4rSQ-00028B-7E
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2021 20:30:31 +0000
X-Originating-IP: 86.210.203.150
Received: from localhost.localdomain
 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr [86.210.203.150])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 1C9261BF214;
 Wed, 27 Jan 2021 20:30:28 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 6/9] mtd: rawnand: Try not to use the ECC private structures
Date: Wed, 27 Jan 2021 21:30:17 +0100
Message-Id: <20210127203020.9574-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210127203020.9574-1-miquel.raynal@bootlin.com>
References: <20210127203020.9574-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_153030_585354_443E67B9 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Adam Ford <aford173@gmail.com>, ladis@triops.cz,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Most of the time, there is no need to use the software ECC Hamming and
BCH algorithms private context to know their configuration. All the
data has been stored by their ->init_ctx() hook in the generic NAND
ECC engine structure, so use this one when possible.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index c33fa1b1847f..4e1bd1e5d474 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5162,8 +5162,8 @@ int rawnand_sw_hamming_init(struct nand_chip *chip)
 	chip->ecc.size = base->ecc.ctx.conf.step_size;
 	chip->ecc.strength = base->ecc.ctx.conf.strength;
 	chip->ecc.total = base->ecc.ctx.total;
-	chip->ecc.steps = engine_conf->nsteps;
-	chip->ecc.bytes = engine_conf->code_size;
+	chip->ecc.steps = nanddev_get_ecc_nsteps(base);
+	chip->ecc.bytes = base->ecc.ctx.total / nanddev_get_ecc_nsteps(base);
 
 	return 0;
 }
@@ -5201,7 +5201,7 @@ EXPORT_SYMBOL(rawnand_sw_hamming_cleanup);
 int rawnand_sw_bch_init(struct nand_chip *chip)
 {
 	struct nand_device *base = &chip->base;
-	struct nand_ecc_sw_bch_conf *engine_conf;
+	const struct nand_ecc_props *ecc_conf = nanddev_get_ecc_conf(base);
 	int ret;
 
 	base->ecc.user_conf.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
@@ -5213,13 +5213,11 @@ int rawnand_sw_bch_init(struct nand_chip *chip)
 	if (ret)
 		return ret;
 
-	engine_conf = base->ecc.ctx.priv;
-
-	chip->ecc.size = base->ecc.ctx.conf.step_size;
-	chip->ecc.strength = base->ecc.ctx.conf.strength;
+	chip->ecc.size = ecc_conf->step_size;
+	chip->ecc.strength = ecc_conf->strength;
 	chip->ecc.total = base->ecc.ctx.total;
-	chip->ecc.steps = engine_conf->nsteps;
-	chip->ecc.bytes = engine_conf->code_size;
+	chip->ecc.steps = nanddev_get_ecc_nsteps(base);
+	chip->ecc.bytes = base->ecc.ctx.total / nanddev_get_ecc_nsteps(base);
 
 	return 0;
 }
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
