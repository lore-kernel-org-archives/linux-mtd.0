Return-Path: <SRS0=PkFq=XO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9DAC3A5A6
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 19:53:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19AB220678
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 19:53:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N7keSHiR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19AB220678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFOdaPgMduOPY1h53C3cQbfUpDumZGQhbmXd5kLRme8=; b=N7keSHiR0sz+Gy
	yQae9oIaBYcqCKAz8rlIwfs5uwLUcQ2z1JsQogpioE5kzc4GqNGzJLOvi0WEfYyv5NSxHnrowtc2z
	VOIOtGcIGVI1XYvlmhbCZS9YNYCIzG+7tHsrBUTk6U4sK9vWu90O1UYtwVVLAx8QbqmDO9tfy8Z59
	8ekG8V58dNwxZXnCatwHi0xvHpT4LSPmmxX4MNSo0qSYep9phRhRDFjf0Nj0cjjbLUZhV8UUJZ1/J
	YxB/j8NiELVqGGM4a8kX+fKszemN+ut64Sp5K7zVHFyEwjlN1QLRZsAVXksTcBQ72IvOAcq4TbEJd
	tgsKLMYZCnmU0z7qjH6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iB2UQ-0005v6-Lc; Thu, 19 Sep 2019 19:53:18 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iB2Af-0002eW-Jg; Thu, 19 Sep 2019 19:32:55 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1588A240007;
 Thu, 19 Sep 2019 19:32:49 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v3 31/40] mtd: spinand: Instantiate a SPI-NAND on-die ECC
 engine
Date: Thu, 19 Sep 2019 21:31:31 +0200
Message-Id: <20190919193141.7865-32-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919193141.7865-1-miquel.raynal@bootlin.com>
References: <20190919193141.7865-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_123254_118144_C7178EE9 
X-CRM114-Status: GOOD (  15.63  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Make use of the existing functions taken from the SPI-NAND core to
instantiate an on-die ECC engine specific to the SPI-NAND core. The
next step will be to tweak the core to use this object instead of
calling the helpers directly.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 69 +++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h |  9 +++++
 2 files changed, 78 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 49b252bc1352..5a935b7343eb 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -245,6 +245,75 @@ static const struct mtd_ooblayout_ops spinand_noecc_ooblayout = {
 	.free = spinand_noecc_ooblayout_free,
 };
 
+static int spinand_ondie_ecc_init_ctx(struct nand_device *nand)
+{
+	struct spinand_device *spinand = nand_to_spinand(nand);
+	struct mtd_info *mtd = nanddev_to_mtd(nand);
+	struct spinand_ondie_ecc_conf *engine_conf;
+
+	nand->ecc.ctx.conf.provider = NAND_ON_DIE_ECC_ENGINE;
+	nand->ecc.ctx.conf.step_size = nand->ecc.requirements.step_size;
+	nand->ecc.ctx.conf.strength = nand->ecc.requirements.strength;
+
+	engine_conf = kzalloc(sizeof(*engine_conf), GFP_KERNEL);
+	if (!engine_conf)
+		return -ENOMEM;
+
+	nand->ecc.ctx.priv = engine_conf;
+
+	if (spinand->eccinfo.ooblayout)
+		mtd_set_ooblayout(mtd, spinand->eccinfo.ooblayout);
+	else
+		mtd_set_ooblayout(mtd, &spinand_noecc_ooblayout);
+
+	return 0;
+}
+
+static void spinand_ondie_ecc_cleanup_ctx(struct nand_device *nand)
+{
+	kfree(nand->ecc.ctx.priv);
+}
+
+static int spinand_ondie_ecc_prepare_io_req(struct nand_device *nand,
+					    struct nand_page_io_req *req,
+					    void *oobbuf)
+{
+	struct spinand_device *spinand = nand_to_spinand(nand);
+	bool enable = (req->mode != MTD_OPS_RAW);
+
+	/* Only enable or disable the engine */
+	return spinand_ecc_enable(spinand, enable);
+}
+
+static int spinand_ondie_ecc_finish_io_req(struct nand_device *nand,
+					   struct nand_page_io_req *req,
+					   void *oobbuf)
+{
+	struct spinand_ondie_ecc_conf *engine_conf = nand->ecc.ctx.priv;
+	struct spinand_device *spinand = nand_to_spinand(nand);
+
+	if (req->mode == MTD_OPS_RAW)
+		return 0;
+
+	/* Nothing to do when finishing a page write */
+	if (req->type == NAND_PAGE_WRITE)
+		return 0;
+
+	/* Finish a page write: check the status, report errors/bitflips */
+	return spinand_check_ecc_status(spinand, engine_conf->status);
+}
+
+static struct nand_ecc_engine_ops spinand_ondie_ecc_engine_ops = {
+	.init_ctx = spinand_ondie_ecc_init_ctx,
+	.cleanup_ctx = spinand_ondie_ecc_cleanup_ctx,
+	.prepare_io_req = spinand_ondie_ecc_prepare_io_req,
+	.finish_io_req = spinand_ondie_ecc_finish_io_req,
+};
+
+static __maybe_unused struct nand_ecc_engine spinand_ondie_ecc_engine = {
+	.ops = &spinand_ondie_ecc_engine_ops,
+};
+
 static int spinand_write_enable_op(struct spinand_device *spinand)
 {
 	struct spi_mem_op op = SPINAND_WR_EN_DIS_OP(true);
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 87d774b7500c..7526e1edb47b 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -271,6 +271,15 @@ struct spinand_ecc_info {
 
 #define SPINAND_HAS_QE_BIT		BIT(0)
 
+/**
+ * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure
+ * @status: status of the last wait operation that will be used in case
+ *          ->get_status() is not populated by the spinand device.
+ */
+struct spinand_ondie_ecc_conf {
+	u8 status;
+};
+
 /**
  * struct spinand_info - Structure used to describe SPI NAND chips
  * @model: model name
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
