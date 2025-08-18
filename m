Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1DFCA0ED1
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Aug 2025 13:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1sKjoz1ymtWJgoCzyCVY/eaAIRGAnJmB/BMn+W2VYs8=; b=vk+a5W9/vnWWrd
	zpmmWvvOcAUFNiSAwUssA2tRx63ukhJgyXzJmEa6APyCaF+vOWhq+P8yCkCkQ3oD1zgaEPT02JB1x
	HEdHLZgLbzE7tlP4tjzffjCxnc3/QTcWfMGyItoI021RY1xHSbEtCoG53FWQhElE0QHdRm2gASLom
	e49TlUSkaC4pxNOwhsFcG0vlhU6wdBJ+PkaXGo4dwEztWueoaWXySZAMtrkBYvRU6/H7bIM7DERMV
	x5phIjYTq11KEPDTzTe+Z7rxRJUbU9OqwmZO5ZhwLdWUgGfFne2GJ50jGW+90ZddWAKMOL1uS35dh
	8b9Vpk++84uwyUjffcCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo06P-00000007ZC0-2iZE;
	Mon, 18 Aug 2025 13:40:45 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unw9r-000000073UJ-30p6
	for linux-mtd@lists.infradead.org;
	Mon, 18 Aug 2025 09:28:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1755509261; x=1756114061;
	i=markus.stockhausen@gmx.de;
	bh=bF9C0uBEO49JUz5Q6eDZ9ooMt0b3Fkl0KanfDw2n+PA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=oy2+rIQGFaS6Goq74zwETcvdDzrs5nUcKW2JPCTUyFVBUh9HfR7r1U4pU96p5Y7p
	 fSDw/0YEihm/UKlhdYPH31aomRq6JEz0KlSw+H0MIlomr1viKaskaqb8B2cEpYKlw
	 Tu9HhtgeHhYmRGzP2hRfBMzpdCLnGzJ3RyD+Gk/4Q9CA8Lpxxg5YQNkgqHh2gqg+y
	 f0cNHTy1jpg07H2pVsYAfPJjWsLqHOqT9wFsTCgUCL9jP9aeLzm5ncdBAUvtBna1j
	 4lYc5d6qPJ3aeMotDPoPZaiVznNMJoRflDWFVHFWti/O0L3nvluRe9EA6e76Ch5A1
	 saCAPqszZ0Oypihu/A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from openwrt ([94.31.70.55]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N63VY-1uTtEz0qfw-00urfB; Mon, 18
 Aug 2025 11:27:41 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH 2/2] mtd: nand: realtek-ecc: Add Realtek external ECC engine support
Date: Mon, 18 Aug 2025 05:27:25 -0400
Message-ID: <20250818092725.1977105-3-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250818092725.1977105-1-markus.stockhausen@gmx.de>
References: <20250818092725.1977105-1-markus.stockhausen@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:GAvqQq8MLcgoO8GIwJ6euFjlqzppaPFpOL2EEmlQe3hjSNYA0sX
 sdakgkFnCay+064ioVRM8xWGXtF8LzyGD4qCjAZymfd2HuR+VmFP8QBSrmIcqgl2fjI1+s/
 hWjxJPlSwhbCzMdTv4ouWP70TRFfQaD3CFfyBM2RuTYJk89pVsiF0ZR5h5zHFg29sUvZ4tr
 bJuezjes+BXyo9H7dnEZg==
UI-OutboundReport: notjunk:1;M01:P0:0ELPZPxYmXI=;BQJqMyQP6CyQtXhIRtQkoSeckX5 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 u+1h9MY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_022804_070039_9C4BE656 
X-CRM114-Status: GOOD (  22.63  )
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

The Realtek RTl93xx switch SoC series has a built in ECC controller
that can provide BCH6 or BCH12 over 512 data and 6 tag bytes. It
generates 10 (BCH6) or 20 (BCH12) bytes of parity.

This engine will most likely work in conjunction with the Realtek
spi-mem based NAND controller but can work on its own. Therefore
the initial implementation will be of type external.

Remark! The engine can support any data blocks that are multiples
of 512 bytes. For now limit it to data+oob layouts that have been
analyzed from existing devices. This way it keeps compatibility
and pre-existing vendor data can be read.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
---
 drivers/mtd/nand/Kconfig       |   8 +
 drivers/mtd/nand/Makefile      |   1 +
 drivers/mtd/nand/ecc-realtek.c | 433 +++++++++++++++++++++++++++++++++
 3 files changed, 442 insertions(+)
 create mode 100644 drivers/mtd/nand/ecc-realtek.c

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 5b0c2c95f10c..4a17271076bc 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -61,6 +61,14 @@ config MTD_NAND_ECC_MEDIATEK
 	help
 	  This enables support for the hardware ECC engine from Mediatek.
 
+config MTD_NAND_ECC_REALTEK
+        tristate "Realtek RTL93xx hardware ECC engine"
+        depends on HAS_IOMEM
+        depends on MACH_REALTEK_RTL || COMPILE_TEST
+        select MTD_NAND_ECC
+        help
+          This enables support for the hardware ECC engine from Realtek.
+
 endmenu
 
 endmenu
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index 44913ff1bf12..2e0e56267718 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -3,6 +3,7 @@
 nandcore-objs := core.o bbt.o
 obj-$(CONFIG_MTD_NAND_CORE) += nandcore.o
 obj-$(CONFIG_MTD_NAND_ECC_MEDIATEK) += ecc-mtk.o
+obj-$(CONFIG_MTD_NAND_ECC_REALTEK) += ecc-realtek.o
 obj-$(CONFIG_SPI_QPIC_SNAND) += qpic_common.o
 obj-$(CONFIG_MTD_NAND_QCOM) += qpic_common.o
 obj-y	+= onenand/
diff --git a/drivers/mtd/nand/ecc-realtek.c b/drivers/mtd/nand/ecc-realtek.c
new file mode 100644
index 000000000000..a9c2a3a23b78
--- /dev/null
+++ b/drivers/mtd/nand/ecc-realtek.c
@@ -0,0 +1,433 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Support for Realtek hardware ECC engine in RTL93xx SoCs
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/mtd/nand.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+/*
+ * The Realtek ECC engine has two operation modes.
+ *
+ * - BCH6 : Generate 10 ECC bytes from 512 data bytes plus 6 tag bytes
+ * - BCH12: Generate 20 ECC bytes from 512 data bytes plus 6 tag bytes
+ *
+ * It can run for arbitrary NAND flash chips with different block and OOB sizes. Currently there
+ * are only two known devices in the wild that have NAND flash and make use of this ECC engine
+ * (Linksys LGS328C & LGS352C). To keep compatibility with vendor firmware, new modes can only
+ * be added when new data layouts have been analyzed. For now allow BCH6 on flash with 2048 byte
+ * blocks and 64 bytes oob.
+ */
+
+#define RTL_ECC_ALLOWED_PAGE_SIZE 	2048
+#define RTL_ECC_ALLOWED_OOB_SIZE	64
+#define RTL_ECC_ALLOWED_STRENGTH	6
+
+#define RTL_ECC_BLOCK_SIZE 		512
+#define RTL_ECC_TAG_SIZE 		6
+#define RTL_ECC_PARITY_SIZE_BCH6	10
+#define RTL_ECC_PARITY_SIZE_BCH12	20
+
+/*
+ * The engine is fed with two DMA regions. One for data (always 512 bytes) and one for tag and
+ * parity (either 16 bytes for BCH6 or 26 bytes for BCH12). Start and length of each must be
+ * aligned to a multiple of 4.
+ */
+
+#define RTL_ECC_DMA_TAG_PARITY_SIZE	ALIGN(RTL_ECC_TAG_SIZE + RTL_ECC_PARITY_SIZE_BCH12, 4)
+#define RTL_ECC_DMA_SIZE		(RTL_ECC_BLOCK_SIZE + RTL_ECC_DMA_TAG_PARITY_SIZE)
+
+#define RTL_ECC_CFG			0x00
+#define   RTL_ECC_BCH6			0
+#define   RTL_ECC_BCH12			BIT(28)
+#define   RTL_ECC_DMA_PRECISE		BIT(12)
+#define   RTL_ECC_BURST_128		GENMASK(1, 0)
+#define RTL_ECC_DMA_TRIGGER 		0x08
+#define   RTL_ECC_OP_DECODE		0
+#define   RTL_ECC_OP_ENCODE		BIT(0)
+#define RTL_ECC_DMA_START		0x0c
+#define RTL_ECC_DMA_TAG			0x10
+#define RTL_ECC_STATUS			0x14
+#define   RTL_ECC_CORR_COUNT		GENMASK(19, 12)
+#define   RTL_ECC_RESULT		BIT(8)
+#define   RTL_ECC_ALL_ONE		BIT(4)
+#define   RTL_ECC_OP_STATUS		BIT(0)
+
+struct rtl_ecc_engine {
+	struct device *dev;
+	struct nand_ecc_engine engine;
+	struct mutex lock;
+	char *buf;
+	dma_addr_t buf_dma;
+	struct regmap *regmap;
+};
+
+struct rtl_ecc_ctx {
+	struct rtl_ecc_engine * rtlc;
+	struct nand_ecc_req_tweak_ctx req_ctx;
+	int steps;
+	int bch_mode;
+	int parity_size;
+	int rc_bitflips;
+	int rc_status;
+};
+
+static const struct regmap_config rtl_ecc_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+};
+
+static inline void *nand_to_ctx(struct nand_device *nand)
+{
+	return nand->ecc.ctx.priv;
+}
+
+static inline struct rtl_ecc_engine *nand_to_rtlc(struct nand_device *nand)
+{
+	struct nand_ecc_engine *eng = nand->ecc.engine;
+
+	return container_of(eng, struct rtl_ecc_engine, engine);
+}
+
+static int rtl_ecc_ooblayout_ecc(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *oobregion)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	struct rtl_ecc_ctx *ctx = nand_to_ctx(nand);
+
+	if (section < 0 || section >= ctx->steps)
+		return -ERANGE;
+
+	oobregion->offset = ctx->steps * RTL_ECC_TAG_SIZE + section * ctx->parity_size;
+	oobregion->length = ctx->parity_size;
+
+	return 0;
+}
+
+static int rtl_ecc_ooblayout_free(struct mtd_info *mtd, int section,
+				struct mtd_oob_region *oobregion)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	struct rtl_ecc_ctx *ctx = nand_to_ctx(nand);
+
+	if (section < 0 || section >= ctx->steps)
+		return -ERANGE;
+
+	/* Tags can hold arbitrary values, so they are free for user data */
+	oobregion->offset = section * RTL_ECC_TAG_SIZE;
+	oobregion->length = RTL_ECC_TAG_SIZE;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops rtl_ecc_ooblayout_ops = {
+	.ecc = rtl_ecc_ooblayout_ecc,
+	.free = rtl_ecc_ooblayout_free,
+};
+
+static void rtl_ecc_kick_engine(struct rtl_ecc_ctx *ctx, int operation)
+{
+	struct rtl_ecc_engine *rtlc = ctx->rtlc;
+
+	regmap_write(rtlc->regmap, RTL_ECC_CFG,
+		     ctx->bch_mode | RTL_ECC_BURST_128 | RTL_ECC_DMA_PRECISE);
+
+	regmap_write(rtlc->regmap, RTL_ECC_DMA_START, rtlc->buf_dma);
+	regmap_write(rtlc->regmap, RTL_ECC_DMA_TAG, rtlc->buf_dma + RTL_ECC_BLOCK_SIZE);
+	regmap_write(rtlc->regmap, RTL_ECC_DMA_TRIGGER, operation);
+}
+
+static void rtl_ecc_wait_for_engine(struct rtl_ecc_ctx *ctx)
+{
+	struct rtl_ecc_engine *rtlc = ctx->rtlc;
+	int ret, status;
+	bool all_one;
+
+	/*
+	 * The ECC engine needs 6-8 us to encode/decode a BCH6 syndrome for 512 bytes of data
+	 * and 6 tag bytes. In case the NAND area has been erased and all data and oob is
+	 * set to 0xff, decoding takes 30us (reason unknown). Although the engine can trigger
+	 * interrupts when finished, use active polling for now. 12 us maximum wait time has
+	 * proven to be a good tradeoff between performance and overhead.
+	 */
+
+	ret = regmap_read_poll_timeout(rtlc->regmap, RTL_ECC_STATUS, status,
+				       !(status & RTL_ECC_OP_STATUS), 12, 600);
+	if (ret) {
+		ctx->rc_status = ret;
+		return;
+	}
+
+	all_one = FIELD_GET(RTL_ECC_ALL_ONE, status);
+	ctx->rc_status = FIELD_GET(RTL_ECC_RESULT, status);
+	ctx->rc_bitflips = FIELD_GET(RTL_ECC_CORR_COUNT, status);
+
+	/* For erased blocks (all bits one) error status can be ignored */
+	if (ctx->rc_status && all_one)
+		ctx->rc_status = 0;
+}
+
+static void rtl_ecc_run_engine(struct rtl_ecc_ctx *ctx, char *data, char *tag,
+			       char *parity, int operation)
+{
+	struct rtl_ecc_engine *rtlc = ctx->rtlc;
+	char *buf_parity = rtlc->buf + RTL_ECC_BLOCK_SIZE + RTL_ECC_TAG_SIZE;
+	char *buf_tag = rtlc->buf + RTL_ECC_BLOCK_SIZE;
+	char *buf_data = rtlc->buf;
+
+	mutex_lock(&rtlc->lock);
+
+	memcpy(buf_data, data, RTL_ECC_BLOCK_SIZE);
+	memcpy(buf_tag, tag, RTL_ECC_TAG_SIZE);
+	memcpy(buf_parity, parity, ctx->parity_size);
+
+	dma_sync_single_for_device(rtlc->dev, rtlc->buf_dma, RTL_ECC_DMA_SIZE, DMA_TO_DEVICE);
+	rtl_ecc_kick_engine(ctx, operation);
+	rtl_ecc_wait_for_engine(ctx);
+	dma_sync_single_for_cpu(rtlc->dev, rtlc->buf_dma, RTL_ECC_DMA_SIZE, DMA_FROM_DEVICE);
+
+	if (!ctx->rc_status) {
+		memcpy(data, buf_data, RTL_ECC_BLOCK_SIZE);
+		memcpy(tag, buf_tag, RTL_ECC_TAG_SIZE);
+		memcpy(parity, buf_parity, ctx->parity_size);
+	}
+
+	mutex_unlock(&rtlc->lock);
+}
+
+static int rtl_ecc_prepare_io_req(struct nand_device *nand, struct nand_page_io_req *req)
+{
+	struct rtl_ecc_engine *rtlc = nand_to_rtlc(nand);
+	struct rtl_ecc_ctx *ctx = nand_to_ctx(nand);
+	char *data, *tag, *parity;
+	int failure = 0;
+
+	if (req->mode == MTD_OPS_RAW)
+		return 0;
+
+	nand_ecc_tweak_req(&ctx->req_ctx, req);
+
+	if (req->type == NAND_PAGE_READ)
+		return 0;
+
+	tag = req->oobbuf.in;
+	data = req->databuf.in;
+	parity = req->oobbuf.in + ctx->steps * RTL_ECC_TAG_SIZE;
+
+	for (int i = 0; i < ctx->steps; i++) {
+		rtl_ecc_run_engine(ctx, data, tag, parity, RTL_ECC_OP_ENCODE);
+		failure |= ctx->rc_status;
+
+		tag += RTL_ECC_TAG_SIZE;
+		data += RTL_ECC_BLOCK_SIZE;
+		parity += ctx->parity_size;
+	}
+
+	if (unlikely(failure))
+		dev_err(rtlc->dev, "ECC calculation failed\n");
+
+	return failure ? -EBADMSG : 0;
+}
+
+static int rtl_ecc_finish_io_req(struct nand_device *nand, struct nand_page_io_req *req)
+{
+	struct rtl_ecc_engine *rtlc = nand_to_rtlc(nand);
+	struct rtl_ecc_ctx *ctx = nand_to_ctx(nand);
+	struct mtd_info *mtd = nanddev_to_mtd(nand);
+	char *data, *tag, *parity;
+	unsigned int bitflips = 0;
+	int failure = 0;
+
+	if (req->mode == MTD_OPS_RAW)
+		return 0;
+
+	if (req->type == NAND_PAGE_WRITE) {
+		nand_ecc_restore_req(&ctx->req_ctx, req);
+		return 0;
+	}
+
+	tag = req->oobbuf.in;
+	data = req->databuf.in;
+	parity = req->oobbuf.in + ctx->steps * RTL_ECC_TAG_SIZE;
+
+	for (int i = 0 ; i < ctx->steps; i++) {
+		rtl_ecc_run_engine(ctx, data, tag, parity, RTL_ECC_OP_DECODE);
+		failure |= ctx->rc_status;
+		mtd->ecc_stats.failed += !!ctx->rc_status;
+		bitflips = max_t(unsigned int, ctx->rc_bitflips, bitflips);
+
+		tag += RTL_ECC_TAG_SIZE;
+		data += RTL_ECC_BLOCK_SIZE;
+		parity += ctx->parity_size;
+	}
+
+	nand_ecc_restore_req(&ctx->req_ctx, req);
+
+	if (unlikely(failure))
+		dev_err(rtlc->dev, "ECC correction failed\n");
+	else if (unlikely(bitflips > 2))
+		dev_warn(rtlc->dev, "%d bitflips detected\n", ctx->rc_bitflips);
+
+	return failure ? -EBADMSG : bitflips;
+}
+
+static int rtl_ecc_check_support(struct nand_device *nand)
+{
+	struct mtd_info *mtd = nanddev_to_mtd(nand);
+	struct device *dev = nand->ecc.engine->dev;
+
+	if (mtd->oobsize != RTL_ECC_ALLOWED_OOB_SIZE ||
+	    mtd->writesize != RTL_ECC_ALLOWED_PAGE_SIZE) {
+		dev_err(dev, "only flash geometry data=%d, oob=%d supported\n",
+			RTL_ECC_ALLOWED_PAGE_SIZE, RTL_ECC_ALLOWED_OOB_SIZE);
+		return -EINVAL;
+	}
+
+	if (nand->ecc.user_conf.algo != NAND_ECC_ALGO_BCH ||
+	    nand->ecc.user_conf.strength != RTL_ECC_ALLOWED_STRENGTH ||
+	    nand->ecc.user_conf.placement != NAND_ECC_PLACEMENT_OOB ||
+	    nand->ecc.user_conf.step_size != RTL_ECC_BLOCK_SIZE) {
+		dev_err(dev, "only algo=bch, strength=%d, placement=oob, step=%d supported\n",
+			RTL_ECC_ALLOWED_STRENGTH, RTL_ECC_BLOCK_SIZE);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rtl_ecc_init_ctx(struct nand_device *nand)
+{
+	struct nand_ecc_props *conf = &nand->ecc.ctx.conf;
+	struct rtl_ecc_engine *rtlc = nand_to_rtlc(nand);
+	struct mtd_info *mtd = nanddev_to_mtd(nand);
+	int strength = nand->ecc.user_conf.strength;
+	struct device *dev = nand->ecc.engine->dev;
+	struct rtl_ecc_ctx *ctx;
+	int ret;
+
+	ret = rtl_ecc_check_support(nand);
+	if (ret)
+		return ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	nand->ecc.ctx.priv = ctx;
+	mtd_set_ooblayout(mtd, &rtl_ecc_ooblayout_ops);
+
+	conf->algo = NAND_ECC_ALGO_BCH;
+	conf->strength = strength;
+	conf->step_size = RTL_ECC_BLOCK_SIZE;
+	conf->engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
+
+	ctx->rtlc = rtlc;
+	ctx->steps = mtd->writesize / RTL_ECC_BLOCK_SIZE;
+	ctx->bch_mode = strength == 6 ? RTL_ECC_BCH6 : RTL_ECC_BCH12;
+	ctx->parity_size = strength == 6 ? RTL_ECC_PARITY_SIZE_BCH6 : RTL_ECC_PARITY_SIZE_BCH12;
+
+	ret = nand_ecc_init_req_tweaking(&ctx->req_ctx, nand);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "using bch%d with geometry data=%dx%d, tag=%dx6, parity=%dx%d",
+		 conf->strength, ctx->steps, conf->step_size,
+		 ctx->steps, ctx->steps, ctx->parity_size);
+
+	return 0;
+}
+
+static void rtl_ecc_cleanup_ctx(struct nand_device *nand)
+{
+	struct rtl_ecc_ctx *ctx = nand_to_ctx(nand);
+
+	if (ctx)
+		nand_ecc_cleanup_req_tweaking(&ctx->req_ctx);
+}
+
+static struct nand_ecc_engine_ops rtl_ecc_engine_ops = {
+	.init_ctx = rtl_ecc_init_ctx,
+	.cleanup_ctx = rtl_ecc_cleanup_ctx,
+	.prepare_io_req = rtl_ecc_prepare_io_req,
+	.finish_io_req = rtl_ecc_finish_io_req,
+};
+
+static int rtl_ecc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rtl_ecc_engine *rtlc;
+	void __iomem *base;
+	int ret;
+
+	rtlc = devm_kzalloc(dev, sizeof(*rtlc), GFP_KERNEL);
+	if (!rtlc)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	ret = devm_mutex_init(dev, &rtlc->lock);
+	if (ret)
+		return ret;
+
+	rtlc->regmap = devm_regmap_init_mmio(dev, base, &rtl_ecc_regmap_config);
+	if (IS_ERR(rtlc->regmap))
+		return PTR_ERR(rtlc->regmap);
+
+	/*
+	 * Focus on simplicity and use a preallocated DMA buffer for data exchange with the
+	 * engine. Make it a noncoherent memory model as invalidating/flushing caches is
+	 * faster than reading/writing uncached memory.
+	 */
+
+	rtlc->buf = dma_alloc_noncoherent(dev, RTL_ECC_DMA_SIZE, &rtlc->buf_dma,
+					  DMA_BIDIRECTIONAL, GFP_KERNEL);
+	if (IS_ERR(rtlc->buf))
+		return PTR_ERR(rtlc->buf);
+
+	rtlc->dev = dev;
+	rtlc->engine.dev = dev;
+	rtlc->engine.ops = &rtl_ecc_engine_ops;
+	rtlc->engine.integration = NAND_ECC_ENGINE_INTEGRATION_EXTERNAL;
+
+	nand_ecc_register_on_host_hw_engine(&rtlc->engine);
+
+	platform_set_drvdata(pdev, rtlc);
+
+	return 0;
+}
+
+static void rtl_ecc_remove(struct platform_device *pdev)
+{
+	struct rtl_ecc_engine *rtlc = platform_get_drvdata(pdev);
+
+	nand_ecc_unregister_on_host_hw_engine(&rtlc->engine);
+	dma_free_noncoherent(rtlc->dev, RTL_ECC_DMA_SIZE, rtlc->buf, rtlc->buf_dma,
+			     DMA_BIDIRECTIONAL);
+}
+
+static const struct of_device_id rtl_ecc_of_ids[] = {
+	{
+		.compatible = "realtek,rtl9301-ecc",
+	},
+	{ /* sentinel */ },
+};
+
+static struct platform_driver rtl_ecc_driver = {
+	.driver	= {
+		.name = "rtl-nand-ecc-engine",
+		.of_match_table = rtl_ecc_of_ids,
+	},
+	.probe = rtl_ecc_probe,
+	.remove = rtl_ecc_remove,
+};
+module_platform_driver(rtl_ecc_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Markus Stockhausen <markus.stockhausen@gmx.de>");
+MODULE_DESCRIPTION("Realtek NAND hardware ECC controller");
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
