Return-Path: <SRS0=BNsP=OR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7B4C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 05:45:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A9EA610A2
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 05:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A9EA610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPQ8nIY1unAwibS2yDC0+PB7KGXgxqSAdwZ6ohhMm7g=; b=qUbV3Mbc2B9c7Y
	UfDMzzwoXRmBUjdp1ZJNNymjgfuImXTo3LyL8b/XISgxPZX03QISKHwzFJopWyIwItPIfR6/nNf9v
	mfBY61wcUBYX016LVLNUnkDvhC37luRyGUiZjXA2gkJ/GeAQUUxqM3PB4rbZ07+jr4/Gb+GPvJPcm
	z9fk/Uy0vokbpJf1TSNOQoP7SOg/34+ljIhdSUjJQzuyQi4P2H2E9fip+sE3+l1OfytfRqv5nDPab
	FoWCJvjyywsocJHvxtzla6w43zsARosZBnlFl7VUab3Q+IWUTrFjF0rjxws/SsCBx6Cc9USr7IEgc
	2w7432ZgDmlZWzmpeW/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUjRP-001cMb-Az; Mon, 27 Sep 2021 05:44:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUjQ3-001bmL-Bo; Mon, 27 Sep 2021 05:43:19 +0000
X-UUID: 2d20bf4478e34d6f9ce1ed132e44b715-20210926
X-UUID: 2d20bf4478e34d6f9ce1ed132e44b715-20210926
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1619722914; Sun, 26 Sep 2021 22:43:11 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 26 Sep 2021 22:42:21 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Sep 2021 13:42:20 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Sep 2021 13:42:19 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: <miquel.raynal@bootlin.com>, <broonie@kernel.org>
CC: <xiangsheng.hou@mediatek.com>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <info@bootlin.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>, <donghunt@amazon.com>, 
 <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: [RFC,v2 2/4] mtd: ecc: realize Mediatek HW ECC driver
Date: Mon, 27 Sep 2021 13:42:03 +0800
Message-ID: <20210927054205.17960-3-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210927054205.17960-1-xiangsheng.hou@mediatek.com>
References: <20210927054205.17960-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210926_224315_578933_0CCFC887 
X-CRM114-Status: GOOD (  21.92  )
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

The v2 driver export some function for snfi driver in spi
subsystem to use, include nand parameter(page/spare size)
and ecc status(enable/disable).Also need empty page check
function export from snfi driver.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
---
 drivers/mtd/nand/core.c    |   2 +-
 drivers/mtd/nand/ecc.c     |  19 +++
 drivers/mtd/nand/mtk_ecc.c | 315 +++++++++++++++++++++++++++++++++++++
 include/linux/mtd/nand.h   |  12 ++
 4 files changed, 347 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/core.c b/drivers/mtd/nand/core.c
index 5e13a03d2b32..3db410de3ba2 100644
--- a/drivers/mtd/nand/core.c
+++ b/drivers/mtd/nand/core.c
@@ -232,7 +232,7 @@ static int nanddev_get_ecc_engine(struct nand_device *nand)
 		nand->ecc.engine = nand_ecc_get_on_die_hw_engine(nand);
 		break;
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
-		pr_err("On-host hardware ECC engines not supported yet\n");
+		nand->ecc.engine = nand_ecc_get_on_host_hw_engine(nand);
 		break;
 	default:
 		pr_err("Missing ECC engine type\n");
diff --git a/drivers/mtd/nand/ecc.c b/drivers/mtd/nand/ecc.c
index 6c43dfda01d4..b334cd88c038 100644
--- a/drivers/mtd/nand/ecc.c
+++ b/drivers/mtd/nand/ecc.c
@@ -380,6 +380,7 @@ static const char * const nand_ecc_algos[] = {
 	[NAND_ECC_ALGO_HAMMING] = "hamming",
 	[NAND_ECC_ALGO_BCH] = "bch",
 	[NAND_ECC_ALGO_RS] = "rs",
+	[NAND_ECC_ALGO_MTK_HWECC] = "ecc-mtk",
 };
 
 static enum nand_ecc_algo of_get_nand_ecc_algo(struct device_node *np)
@@ -611,6 +612,24 @@ struct nand_ecc_engine *nand_ecc_get_on_die_hw_engine(struct nand_device *nand)
 }
 EXPORT_SYMBOL(nand_ecc_get_on_die_hw_engine);
 
+struct nand_ecc_engine *nand_ecc_get_on_host_hw_engine(struct nand_device *nand)
+{
+	unsigned int algo = nand->ecc.user_conf.algo;
+
+	if (algo == NAND_ECC_ALGO_UNKNOWN)
+		algo = nand->ecc.defaults.algo;
+
+	switch (algo) {
+	case NAND_ECC_ALGO_MTK_HWECC:
+		return mtk_nand_ecc_get_engine();
+	default:
+		break;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL(nand_ecc_get_on_host_hw_engine);
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
 MODULE_DESCRIPTION("Generic ECC engine");
diff --git a/drivers/mtd/nand/mtk_ecc.c b/drivers/mtd/nand/mtk_ecc.c
index ce0f8b491e5d..33c660f094f3 100644
--- a/drivers/mtd/nand/mtk_ecc.c
+++ b/drivers/mtd/nand/mtk_ecc.c
@@ -61,9 +61,36 @@ struct mtk_ecc {
 	struct mutex lock;
 	u32 sectors;
 
+	u32 page_size;
+	u32 spare_size_per_sector;
+	u32 spare_size_idx;
+	u32 fdm_size;
+	u32 sector_size;
+	bool ecc_en;
+
 	u8 *eccdata;
 };
 
+struct mtk_ecc_bad_mark_ctl {
+	void (*bm_swap)(struct nand_device *, u8 *databuf, u8* oobbuf);
+	u32 sec;
+	u32 pos;
+};
+
+struct mtk_ecc_conf {
+	struct nand_ecc_req_tweak_ctx req_ctx;
+	unsigned int code_size;
+	unsigned int nsteps;
+
+	u8 *spare_databuf;
+	u8 *code_buf;
+	u8 *oob_buf;
+
+	struct mtk_ecc *ecc;
+	struct mtk_ecc_config ecc_cfg;
+	struct mtk_ecc_bad_mark_ctl bad_mark;
+};
+
 /* ecc strength that each IP supports */
 static const u8 ecc_strength_mt2701[] = {
 	4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28, 32, 36,
@@ -79,6 +106,11 @@ static const u8 ecc_strength_mt7622[] = {
 	4, 6, 8, 10, 12, 14, 16
 };
 
+/* supported spare size of each IP */
+static const u8 spare_size_mt7622[] = {
+	16, 26, 27, 28
+};
+
 enum mtk_ecc_regs {
 	ECC_ENCPAR00,
 	ECC_ENCIRQ_EN,
@@ -447,6 +479,289 @@ unsigned int mtk_ecc_get_parity_bits(struct mtk_ecc *ecc)
 }
 EXPORT_SYMBOL(mtk_ecc_get_parity_bits);
 
+u32 mtk_ecc_get_pagesize(struct device_node *dn)
+{
+	struct mtk_ecc *ecc = NULL;
+	struct device_node *child_np;
+
+	child_np = of_get_compatible_child(dn, "spi-nand");
+
+	ecc = of_mtk_ecc_get(child_np);
+
+	return ecc->page_size;
+}
+EXPORT_SYMBOL(mtk_ecc_get_pagesize);
+
+u32 mtk_ecc_get_sparesize(struct device_node *dn)
+{
+	struct mtk_ecc *ecc = NULL;
+	struct device_node *child_np;
+
+	child_np = of_get_compatible_child(dn, "spi-nand");
+
+	ecc = of_mtk_ecc_get(child_np);
+
+	return ecc->spare_size_per_sector;
+}
+EXPORT_SYMBOL(mtk_ecc_get_sparesize);
+
+u32 mtk_ecc_get_spare_idx(struct device_node *dn)
+{
+	struct mtk_ecc *ecc = NULL;
+	struct device_node *child_np;
+
+	child_np = of_get_compatible_child(dn, "spi-nand");
+
+	ecc = of_mtk_ecc_get(child_np);
+
+	return ecc->spare_size_idx;
+}
+EXPORT_SYMBOL(mtk_ecc_get_spare_idx);
+
+u32 mtk_ecc_get_fdmsize(struct device_node *dn)
+{
+	struct mtk_ecc *ecc = NULL;
+	struct device_node *child_np;
+
+	child_np = of_get_compatible_child(dn, "spi-nand");
+
+	ecc = of_mtk_ecc_get(child_np);
+
+	return ecc->fdm_size;
+}
+EXPORT_SYMBOL(mtk_ecc_get_fdmsize);
+
+u32 mtk_ecc_get_sectorsize(struct device_node *dn)
+{
+	struct mtk_ecc *ecc = NULL;
+	struct device_node *child_np;
+
+	child_np = of_get_compatible_child(dn, "spi-nand");
+
+	ecc = of_mtk_ecc_get(child_np);
+
+	return ecc->sector_size;
+}
+EXPORT_SYMBOL(mtk_ecc_get_sectorsize);
+
+bool mtk_ecc_get_status(struct device_node *dn)
+{
+	struct mtk_ecc *ecc = NULL;
+	struct device_node *child_np;
+
+	child_np = of_get_compatible_child(dn, "spi-nand");
+
+	ecc = of_mtk_ecc_get(child_np);
+
+	return ecc->ecc_en;
+}
+EXPORT_SYMBOL(mtk_ecc_get_status);
+
+int mtk_ecc_prepare_io_req(struct nand_device *nand,
+					  struct nand_page_io_req *req)
+{
+	struct mtk_ecc_conf *engine_conf = nand->ecc.ctx.priv;
+	int ret = 0;
+	u32 val;
+
+	nand_ecc_tweak_req(&engine_conf->req_ctx, req);
+
+	if (req->mode == MTD_OPS_RAW) {
+		/* set ecc status to disable */
+		engine_conf->ecc->ecc_en = false;
+		if (req->type == NAND_PAGE_WRITE) {
+			/*
+			 * format data and oob buf to Mediatek nand flash
+			 * data format
+			 */
+			mtk_ecc_format_page();
+		}
+	} else {
+		/* set ecc status to enable */
+		engine_conf->ecc->ecc_en = true;
+		engine_conf->ecc_cfg.op = ECC_DECODE;
+		if (req->type == NAND_PAGE_WRITE) {
+			/*
+			 * format oob buf
+			 * 1) set data bytes according to mtd ooblayout
+			 * 2) bad mark swap to ensure badmark position
+			 * consistent with nand device spec
+			 */
+			mtd_ooblayout_set_databytes();
+			engine_conf->bad_mark.bm_swap();
+
+			engine_conf->ecc_cfg.op = ECC_ENCODE;
+		}
+
+		ret = mtk_ecc_enable(engine_conf->ecc, &engine_conf->ecc_cfg);
+	}
+
+	return ret;
+}
+
+int mtk_ecc_finish_io_req(struct nand_device *nand,
+					  struct nand_page_io_req *req)
+{
+	struct mtk_ecc_conf *engine_conf = nand->ecc.ctx.priv;
+	struct device_node *dn = nanddev_get_of_node(nand);
+	struct mtd_info *mtd = nanddev_to_mtd(nand);
+	u8 *spare_databuf = engine_conf->spare_databuf;
+	int ret;
+
+	if (req->type == NAND_PAGE_WRITE) {
+		if (req->mode != MTD_OPS_RAW)
+			mtk_ecc_disable(engine_conf->ecc);
+
+		nand_ecc_restore_req(&engine_conf->req_ctx, req);
+
+		return 0;
+	}
+
+	if (req->mode == MTD_OPS_RAW) {
+		/* format data and oob buf from Mediatek nand flash data format */
+		mtk_ecc_format_page();
+		nand_ecc_restore_req(&engine_conf->req_ctx, req);
+		return 0;
+	}
+
+	/* set ecc status to default disable */
+	engine_conf->ecc->ecc_en = false;
+	ret = mtk_ecc_wait_done(engine_conf->ecc, ECC_DECODE);
+	if (ret)
+		return -ETIMEDOUT;
+
+	/* check whether read empty by check nfi export function */
+	ret = mtk_snfi_check_empty(dn);
+	if (ret) {
+		memset(req->databuf.in, 0xff, mtd->writesize);
+		memset(req->oobbuf.in, 0xff, mtd->oobsize);
+		ret = 0;
+	} else {
+		/* check the bitflips or uncorrect error */
+		ret = mtk_ecc_update_status(nand, req);
+
+		/*
+		 * format oob buf
+		 * 1) bad mark swap
+		 * 2) get data bytes according to mtd ooblayout
+		 */
+		engine_conf->bad_mark.bm_swap();
+		mtd_ooblayout_get_databytes();
+	}
+
+	mtk_ecc_disable(engine_conf->ecc);
+	nand_ecc_restore_req(&engine_conf->req_ctx, req);
+
+	return ret;
+}
+
+void mtk_ecc_cleanup_ctx(struct nand_device *nand)
+{
+	struct mtk_ecc_conf *engine_conf = nand->ecc.ctx.priv;
+
+	if (engine_conf) {
+		kfree(engine_conf->ecc);
+		kfree(engine_conf);
+	}
+}
+
+
+static void mtk_ecc_set_bad_mark_ctl(struct mtk_ecc_bad_mark_ctl *bm_ctl,
+				     struct mtd_info *mtd)
+{
+	/* todo */
+}
+
+/* calcute spare size per sector according to nand parameter */
+static int mtk_ecc_set_spare_per_sector(struct nand_device *nand,
+			u32 *sps, u32 *idx)
+{
+	/* todo */
+}
+
+static int mtk_ecc_config_init(struct nand_device *nand)
+{
+	struct mtk_ecc_conf *engine_conf = nand->ecc.ctx.priv;
+	struct nand_ecc_props *conf = &nand->ecc.ctx.conf;
+	struct mtd_info *mtd = nanddev_to_mtd(nand);
+	u32 sps, idx;
+
+	conf->engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
+	conf->algo = NAND_ECC_ALGO_MTK_HWECC;
+	conf->step_size = nand->ecc.user_conf.step_size;
+	conf->strength = nand->ecc.user_conf.strength;
+
+	mtk_ecc_set_spare_per_sector(nand, &sps, &idx);
+
+	/* calculate ecc strength per sector */
+	mtk_ecc_adjust_strength(engine_conf->ecc, &conf->strength);
+
+	/*
+	 * set ecc sector size, spare per sector and spare idx
+	 * in nfi cnfg which will be get by snfi driver
+	 */
+	engine_conf->ecc->sector_size = conf->step_size;
+	engine_conf->ecc->spare_size_per_sector = *sps;
+	engine_conf->ecc->spare_size_idx = idx;
+
+	return 0;
+}
+
+int mtk_ecc_init_ctx(struct nand_device *nand)
+{
+	struct device_node *dn = nanddev_get_of_node(nand);
+	struct mtk_ecc_conf *engine_conf;
+	int ret;
+
+	engine_conf = kzalloc(sizeof(*engine_conf), GFP_KERNEL);
+	engine_conf->ecc = of_mtk_ecc_get(dn);
+
+	mtd_set_ooblayout();
+
+	nand->ecc.ctx.priv = engine_conf;
+	ret = mtk_ecc_config_init(nand);
+	if (ret)
+		goto free_engine_conf;
+
+	/*
+	 * the snfi driver need get nand parameter
+	 * when work in ECC nfi mode
+	 */
+	engine_conf->ecc->page_size = nand->memorg.pagesize;
+	engine_conf->ecc->spare_size = nand->memorg.oobsize;
+
+	/*
+	 * bad mark setting to ensure the badmark position
+	 * in Mediatek nand flash data format consistent
+	 * with nand device spec
+	 */
+	mtk_ecc_set_bad_mark_ctl();
+
+	return 0;
+
+free_engine_conf:
+	kfree(engine_conf);
+
+	return ret;
+}
+
+static struct nand_ecc_engine_ops mtk_nand_ecc_engine_ops = {
+	.init_ctx = mtk_ecc_init_ctx,
+	.cleanup_ctx = mtk_ecc_cleanup_ctx,
+	.prepare_io_req = mtk_ecc_prepare_io_req,
+	.finish_io_req = mtk_ecc_finish_io_req,
+};
+
+static struct nand_ecc_engine mtk_nand_ecc_engine = {
+	.ops = &mtk_nand_ecc_engine_ops,
+};
+
+struct nand_ecc_engine *mtk_nand_ecc_get_engine(void)
+{
+	return &mtk_nand_ecc_engine;
+}
+EXPORT_SYMBOL(mtk_nand_ecc_get_engine);
+
 static const struct mtk_ecc_caps mtk_ecc_caps_mt2701 = {
 	.err_mask = 0x3f,
 	.ecc_strength = ecc_strength_mt2701,
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 32fc7edf65b3..fccca85f34ea 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -167,12 +167,14 @@ enum nand_ecc_placement {
  * @NAND_ECC_ALGO_HAMMING: Hamming algorithm
  * @NAND_ECC_ALGO_BCH: Bose-Chaudhuri-Hocquenghem algorithm
  * @NAND_ECC_ALGO_RS: Reed-Solomon algorithm
+ * @NAND_ECC_ALGO_MTK: Mediatek on-host HW BCH algorithm
  */
 enum nand_ecc_algo {
 	NAND_ECC_ALGO_UNKNOWN,
 	NAND_ECC_ALGO_HAMMING,
 	NAND_ECC_ALGO_BCH,
 	NAND_ECC_ALGO_RS,
+	NAND_ECC_ALGO_MTK_HWECC,
 };
 
 /**
@@ -281,6 +283,7 @@ int nand_ecc_finish_io_req(struct nand_device *nand,
 bool nand_ecc_is_strong_enough(struct nand_device *nand);
 struct nand_ecc_engine *nand_ecc_get_sw_engine(struct nand_device *nand);
 struct nand_ecc_engine *nand_ecc_get_on_die_hw_engine(struct nand_device *nand);
+struct nand_ecc_engine *nand_ecc_get_on_host_hw_engine(struct nand_device *nand);
 
 #if IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING)
 struct nand_ecc_engine *nand_ecc_sw_hamming_get_engine(void);
@@ -300,6 +303,15 @@ static inline struct nand_ecc_engine *nand_ecc_sw_bch_get_engine(void)
 }
 #endif /* CONFIG_MTD_NAND_ECC_SW_BCH */
 
+#if IS_ENABLED(CONFIG_MTD_NAND_ECC_MTK)
+struct nand_ecc_engine *mtk_nand_ecc_get_engine(void);
+#else
+static inline struct nand_ecc_engine *mtk_nand_ecc_get_engine(void)
+{
+	return NULL;
+}
+#endif /* CONFIG_MTD_NAND_ECC_MTK */
+
 /**
  * struct nand_ecc_req_tweak_ctx - Help for automatically tweaking requests
  * @orig_req: Pointer to the original IO request
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
