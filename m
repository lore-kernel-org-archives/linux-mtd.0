Return-Path: <SRS0=ZJz0=G6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0167C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 20:31:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52EE561601
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Jan 2021 20:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52EE561601
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C1HlMfviE8qdaHqBCr89XRuuA8OW3cDfmcwJSHpPlBU=; b=Px1ywRhV1IorDPtzoGTeYG+Ky
	YC0LbbtDou6AMzk+OBgoVO0IBtShAilyJWzxkL8fcv3hp+hgO59iotM+STiFNY6DZq460+AWyRlrR
	xgBFTLjPmQ86Rm3+YA+W29UpgJr7x3wYVnQSJcw3fPHqs1utOO60gWFeAHiraCTAmMeDDh8vIthi4
	vlbLDzplaRAQJ/CwSG0S96TSlzBA2OKGjkUIRwMfZPiiygZXK1Co2kdo8ems5NT/+/GmU659TJPvw
	3gG7UDK4hm5vCZbO7jn2RB8pp0SPySYf2y2qI+Acgc2MW3g5xLDpO84l7JLEdvD/4qdP1Bp6c5qhG
	mK9ep2P7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4rSt-0002G8-5i; Wed, 27 Jan 2021 20:30:59 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4rSS-00029E-UA
 for linux-mtd@lists.infradead.org; Wed, 27 Jan 2021 20:30:34 +0000
X-Originating-IP: 86.210.203.150
Received: from localhost.localdomain
 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr [86.210.203.150])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B6A521BF218;
 Wed, 27 Jan 2021 20:30:30 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 9/9] mtd: nand: ecc-hamming: Use the public nsteps field
Date: Wed, 27 Jan 2021 21:30:20 +0100
Message-Id: <20210127203020.9574-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210127203020.9574-1-miquel.raynal@bootlin.com>
References: <20210127203020.9574-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_153033_331458_4230C477 
X-CRM114-Status: GOOD (  13.77  )
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

The software Hamming ECC engine stores the nsteps variable in its own
private structure while it is also exported as a public ECC field.

Let's get rid of the redundant private one and let's use the
nand_ecc_context structure when possible.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc-sw-hamming.c       | 9 ++++-----
 include/linux/mtd/nand-ecc-sw-hamming.h | 2 --
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/ecc-sw-hamming.c b/drivers/mtd/nand/ecc-sw-hamming.c
index 5144775e5a59..a7655b668f32 100644
--- a/drivers/mtd/nand/ecc-sw-hamming.c
+++ b/drivers/mtd/nand/ecc-sw-hamming.c
@@ -504,7 +504,6 @@ int nand_ecc_sw_hamming_init_ctx(struct nand_device *nand)
 		goto free_engine_conf;
 
 	engine_conf->code_size = 3;
-	engine_conf->nsteps = mtd->writesize / conf->step_size;
 	engine_conf->calc_buf = kzalloc(mtd->oobsize, GFP_KERNEL);
 	engine_conf->code_buf = kzalloc(mtd->oobsize, GFP_KERNEL);
 	if (!engine_conf->calc_buf || !engine_conf->code_buf) {
@@ -514,7 +513,7 @@ int nand_ecc_sw_hamming_init_ctx(struct nand_device *nand)
 
 	nand->ecc.ctx.priv = engine_conf;
 	nand->ecc.ctx.nsteps = mtd->writesize / conf->step_size;
-	nand->ecc.ctx.total = engine_conf->nsteps * engine_conf->code_size;
+	nand->ecc.ctx.total = nand->ecc.ctx.nsteps * engine_conf->code_size;
 
 	return 0;
 
@@ -549,7 +548,7 @@ static int nand_ecc_sw_hamming_prepare_io_req(struct nand_device *nand,
 	struct mtd_info *mtd = nanddev_to_mtd(nand);
 	int eccsize = nand->ecc.ctx.conf.step_size;
 	int eccbytes = engine_conf->code_size;
-	int eccsteps = engine_conf->nsteps;
+	int eccsteps = nand->ecc.ctx.nsteps;
 	int total = nand->ecc.ctx.total;
 	u8 *ecccalc = engine_conf->calc_buf;
 	const u8 *data;
@@ -587,7 +586,7 @@ static int nand_ecc_sw_hamming_finish_io_req(struct nand_device *nand,
 	int eccsize = nand->ecc.ctx.conf.step_size;
 	int total = nand->ecc.ctx.total;
 	int eccbytes = engine_conf->code_size;
-	int eccsteps = engine_conf->nsteps;
+	int eccsteps = nand->ecc.ctx.nsteps;
 	u8 *ecccalc = engine_conf->calc_buf;
 	u8 *ecccode = engine_conf->code_buf;
 	unsigned int max_bitflips = 0;
@@ -619,7 +618,7 @@ static int nand_ecc_sw_hamming_finish_io_req(struct nand_device *nand,
 		nand_ecc_sw_hamming_calculate(nand, data, &ecccalc[i]);
 
 	/* Finish a page read: compare and correct */
-	for (eccsteps = engine_conf->nsteps, i = 0, data = req->databuf.in;
+	for (eccsteps = nand->ecc.ctx.nsteps, i = 0, data = req->databuf.in;
 	     eccsteps;
 	     eccsteps--, i += eccbytes, data += eccsize) {
 		int stat =  nand_ecc_sw_hamming_correct(nand, data,
diff --git a/include/linux/mtd/nand-ecc-sw-hamming.h b/include/linux/mtd/nand-ecc-sw-hamming.h
index 9f9073d86ff3..c6c71894c575 100644
--- a/include/linux/mtd/nand-ecc-sw-hamming.h
+++ b/include/linux/mtd/nand-ecc-sw-hamming.h
@@ -17,7 +17,6 @@
  * @req_ctx: Save request context and tweak the original request to fit the
  *           engine needs
  * @code_size: Number of bytes needed to store a code (one code per step)
- * @nsteps: Number of steps
  * @calc_buf: Buffer to use when calculating ECC bytes
  * @code_buf: Buffer to use when reading (raw) ECC bytes from the chip
  * @sm_order: Smart Media special ordering
@@ -25,7 +24,6 @@
 struct nand_ecc_sw_hamming_conf {
 	struct nand_ecc_req_tweak_ctx req_ctx;
 	unsigned int code_size;
-	unsigned int nsteps;
 	u8 *calc_buf;
 	u8 *code_buf;
 	unsigned int sm_order;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
