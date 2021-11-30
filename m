Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21D9C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Nov 2021 08:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wCFBzfvK6RFOaVrMrPA4wT503y96NJn9c35n3DzJXvA=; b=X82KkwQqf1s3S2
	fAQGXcVm1BBbZCmS9nCg8QWqBss1jEEj2wPTtmfckndf9cuROy9XVPdilBRT9gGDqtInGxBS1FYpm
	AeTYkp8pGq8NCYqKiqJIsYl5epUpccHir/10Glyb7V2XNtnCJeVMBqFVEhNHs15k6Es4t5ROpYvxA
	DUbuP9OldNnmgGHKj1H8vEjmXOGkM4D4dsMNakGBTeyRQluxeO203Ikbp4VEWMxSBrQvN18flKev/
	Kyi6B6u/yUpEfes3orBOR2sszn1RojUlRQcJMQcbXboAQopCqrRq6wCnBMRtTa7vVMJDXNv8lHPeO
	17Y2Bsfjq3bkY8FP/mBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mryZG-0047dk-CM; Tue, 30 Nov 2021 08:32:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mryYw-0047YX-49; Tue, 30 Nov 2021 08:32:32 +0000
X-UUID: 5cc9fdd974e64fc78e90ca5e6f4c80be-20211130
X-UUID: 5cc9fdd974e64fc78e90ca5e6f4c80be-20211130
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 472084470; Tue, 30 Nov 2021 01:32:24 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Nov 2021 00:32:22 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 30 Nov 2021 16:32:20 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 30 Nov 2021 16:32:19 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: <miquel.raynal@bootlin.com>, <broonie@kernel.org>
CC: <xiangsheng.hou@mediatek.com>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>, <donghunt@amazon.com>, 
 <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: [RFC,v4,2/5] mtd: nand: ecc: mtk: Convert to the ECC infrastructure
Date: Tue, 30 Nov 2021 16:31:59 +0800
Message-ID: <20211130083202.14228-3-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130083202.14228-1-xiangsheng.hou@mediatek.com>
References: <20211130083202.14228-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_003230_211941_E9FD312D 
X-CRM114-Status: GOOD (  23.95  )
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

Convert the Mediatek HW ECC engine to the ECC infrastructure with
pipelined case.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
---
 drivers/mtd/nand/ecc-mtk.c       | 614 +++++++++++++++++++++++++++++++
 include/linux/mtd/nand-ecc-mtk.h |  68 ++++
 2 files changed, 682 insertions(+)

diff --git a/drivers/mtd/nand/ecc-mtk.c b/drivers/mtd/nand/ecc-mtk.c
index 31d7c77d5c59..c44499b3d0a5 100644
--- a/drivers/mtd/nand/ecc-mtk.c
+++ b/drivers/mtd/nand/ecc-mtk.c
@@ -16,6 +16,7 @@
 #include <linux/of_platform.h>
 #include <linux/mutex.h>
 
+#include <linux/mtd/nand.h>
 #include <linux/mtd/nand-ecc-mtk.h>
 
 #define ECC_IDLE_MASK		BIT(0)
@@ -41,11 +42,17 @@
 #define ECC_IDLE_REG(op)	((op) == ECC_ENCODE ? ECC_ENCIDLE : ECC_DECIDLE)
 #define ECC_CTL_REG(op)		((op) == ECC_ENCODE ? ECC_ENCCON : ECC_DECCON)
 
+#define OOB_FREE_MAX_SIZE 8
+#define OOB_FREE_MIN_SIZE 1
+
 struct mtk_ecc_caps {
 	u32 err_mask;
 	const u8 *ecc_strength;
 	const u32 *ecc_regs;
 	u8 num_ecc_strength;
+	const u8 *spare_size;
+	u8 num_spare_size;
+	u32 max_section_size;
 	u8 ecc_mode_shift;
 	u32 parity_bits;
 	int pg_irq_sel;
@@ -79,6 +86,12 @@ static const u8 ecc_strength_mt7622[] = {
 	4, 6, 8, 10, 12, 14, 16
 };
 
+/* spare size for each section that each IP supports */
+static const u8 spare_size_mt7622[] = {
+	16, 26, 27, 28, 32, 36, 40, 44, 48, 49, 50, 51,
+	52, 62, 61, 63, 64, 67, 74
+};
+
 enum mtk_ecc_regs {
 	ECC_ENCPAR00,
 	ECC_ENCIRQ_EN,
@@ -447,6 +460,604 @@ unsigned int mtk_ecc_get_parity_bits(struct mtk_ecc *ecc)
 }
 EXPORT_SYMBOL(mtk_ecc_get_parity_bits);
 
+static inline int mtk_ecc_data_off(struct nand_device *nand, int i)
+{
+	int eccsize = nand->ecc.ctx.conf.step_size;
+
+	return i * eccsize;
+}
+
+static inline int mtk_ecc_oob_free_position(struct nand_device *nand, int i)
+{
+	struct mtk_ecc_engine *eng = nand_to_ecc_ctx(nand);
+	int position;
+
+	if (i < eng->bbm_ctl.section)
+		position = (i + 1) * eng->oob_free;
+	else if (i == eng->bbm_ctl.section)
+		position = 0;
+	else
+		position = i * eng->oob_free;
+
+	return position;
+}
+
+static inline int mtk_ecc_data_len(struct nand_device *nand)
+{
+	struct mtk_ecc_engine *eng = nand_to_ecc_ctx(nand);
+	int eccsize = nand->ecc.ctx.conf.step_size;
+	int eccbytes = eng->oob_ecc;
+
+	return eccsize + eng->oob_free + eccbytes;
+}
+
+static inline u8 *mtk_ecc_section_ptr(struct nand_device *nand,  int i)
+{
+	struct mtk_ecc_engine *eng = nand_to_ecc_ctx(nand);
+
+	return eng->bounce_page_buf + i * mtk_ecc_data_len(nand);
+}
+
+static inline u8 *mtk_ecc_oob_free_ptr(struct nand_device *nand, int i)
+{
+	struct mtk_ecc_engine *eng = nand_to_ecc_ctx(nand);
+	int eccsize = nand->ecc.ctx.conf.step_size;
+
+	return eng->bounce_page_buf + i * mtk_ecc_data_len(nand) + eccsize;
+}
+
+static void mtk_ecc_no_bbm_swap(struct nand_device *a, u8 *b, u8 *c)
+{
+	/* nop */
+}
+
+static void mtk_ecc_bbm_swap(struct nand_device *nand, u8 *databuf, u8 *oobbuf)
+{
+	struct mtk_ecc_engine *eng = nand_to_ecc_ctx(nand);
+	int step_size = nand->ecc.ctx.conf.step_size;
+	u32 bbm_pos = eng->bbm_ctl.position;
+
+	bbm_pos += eng->bbm_ctl.section * step_size;
+
+	swap(oobbuf[0], databuf[bbm_pos]);
+}
+
+static void mtk_ecc_set_bbm_ctl(struct mtk_ecc_bbm_ctl *bbm_ctl,
+				struct nand_device *nand)
+{
+	if (nanddev_page_size(nand) == 512) {
+		bbm_ctl->bbm_swap = mtk_ecc_no_bbm_swap;
+	} else {
+		bbm_ctl->bbm_swap = mtk_ecc_bbm_swap;
+		bbm_ctl->section = nanddev_page_size(nand) /
+				   mtk_ecc_data_len(nand);
+		bbm_ctl->position = nanddev_page_size(nand) %
+				    mtk_ecc_data_len(nand);
+	}
+}
+
+static int mtk_ecc_ooblayout_free(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *oob_region)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	struct mtk_ecc_engine *eng = nand_to_ecc_ctx(nand);
+	struct nand_ecc_props *conf = &nand->ecc.ctx.conf;
+	u32 eccsteps, bbm_bytes = 0;
+
+	eccsteps = mtd->writesize / conf->step_size;
+
+	if (section >= eccsteps)
+		return -ERANGE;
+
+	/* Reserve 1 byte for BBM only for section 0 */
+	if (section == 0)
+		bbm_bytes = 1;
+
+	oob_region->length = eng->oob_free - bbm_bytes;
+	oob_region->offset = section * eng->oob_free + bbm_bytes;
+
+	return 0;
+}
+
+static int mtk_ecc_ooblayout_ecc(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *oob_region)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	struct mtk_ecc_engine *eng = nand_to_ecc_ctx(nand);
+
+	if (section)
+		return -ERANGE;
+
+	oob_region->offset = eng->oob_free * eng->nsteps;
+	oob_region->length = mtd->oobsize - oob_region->offset;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops mtk_ecc_ooblayout_ops = {
+	.free = mtk_ecc_ooblayout_free,
+	.ecc = mtk_ecc_ooblayout_ecc,
+};
+
+const struct mtd_ooblayout_ops *mtk_ecc_get_ooblayout(void)
+{
+	return &mtk_ecc_ooblayout_ops;
+}
+
+static struct device *mtk_ecc_get_engine_dev(struct device *dev)
+{
+	struct platform_device *eccpdev;
+	struct device_node *np;
+
+	/*
+	 * The device node is only the host controller,
+	 * not the actual ECC engine when pipelined case.
+	 */
+	np = of_parse_phandle(dev->of_node, "nand-ecc-engine", 0);
+	if (!np)
+		return NULL;
+
+	eccpdev = of_find_device_by_node(np);
+	if (!eccpdev) {
+		of_node_put(np);
+		return NULL;
+	}
+
+	platform_device_put(eccpdev);
+	of_node_put(np);
+
+	return &eccpdev->dev;
+}
+
+/*
+ * mtk_ecc_data_format() - Convert to/from MTK ECC on-flash data format
+ *
+ * MTK ECC engine organize page data by section, the on-flash format as bellow:
+ * ||          section 0         ||          section 1          || ...
+ * || data | OOB free | OOB ECC || data || OOB free | OOB ECC || ...
+ *
+ * Terefore, it`s necessary to convert data when reading/writing in raw mode.
+ */
+static void mtk_ecc_data_format(struct nand_device *nand,
+				struct nand_page_io_req *req)
+{
+	struct mtk_ecc_engine *eng = nand_to_ecc_ctx(nand);
+	int step_size = nand->ecc.ctx.conf.step_size;
+	void *databuf, *oobbuf;
+	int i;
+
+	if (req->type == NAND_PAGE_WRITE) {
+		databuf = (void *)req->databuf.out;
+		oobbuf = (void *)req->oobbuf.out;
+
+		/*
+		 * Convert the source databuf and oobbuf to MTK ECC
+		 * on-flash data format.
+		 */
+		for (i = 0; i < eng->nsteps; i++) {
+			if (i == eng->bbm_ctl.section)
+				eng->bbm_ctl.bbm_swap(nand,
+						      databuf, oobbuf);
+			memcpy(mtk_ecc_section_ptr(nand, i),
+			       databuf + mtk_ecc_data_off(nand, i),
+			       step_size);
+
+			memcpy(mtk_ecc_oob_free_ptr(nand, i),
+			       oobbuf + mtk_ecc_oob_free_position(nand, i),
+			       eng->oob_free);
+
+			memcpy(mtk_ecc_oob_free_ptr(nand, i) + eng->oob_free,
+			       oobbuf + eng->oob_free * eng->nsteps +
+			       i * eng->oob_ecc,
+			       eng->oob_ecc);
+		}
+
+		req->databuf.out = eng->bounce_page_buf;
+		req->oobbuf.out = eng->bounce_oob_buf;
+	} else {
+		databuf = req->databuf.in;
+		oobbuf = req->oobbuf.in;
+
+		/*
+		 * Convert the on-flash MTK ECC data format to
+		 * destination databuf and oobbuf.
+		 */
+		memcpy(eng->bounce_page_buf, databuf,
+		       nanddev_page_size(nand));
+		memcpy(eng->bounce_oob_buf, oobbuf,
+		       nanddev_per_page_oobsize(nand));
+
+		for (i = 0; i < eng->nsteps; i++) {
+			memcpy(databuf + mtk_ecc_data_off(nand, i),
+			       mtk_ecc_section_ptr(nand, i), step_size);
+
+			memcpy(oobbuf + mtk_ecc_oob_free_position(nand, i),
+			       mtk_ecc_section_ptr(nand, i) + step_size,
+			       eng->oob_free);
+
+			memcpy(oobbuf + eng->oob_free * eng->nsteps +
+			       i * eng->oob_ecc,
+			       mtk_ecc_section_ptr(nand, i) + step_size
+			       + eng->oob_free,
+			       eng->oob_ecc);
+
+			if (i == eng->bbm_ctl.section)
+				eng->bbm_ctl.bbm_swap(nand,
+						      databuf, oobbuf);
+		}
+	}
+}
+
+static void mtk_ecc_oob_free_shift(struct nand_device *nand,
+				   u8 *dst_buf, u8 *src_buf, bool write)
+{
+	struct mtk_ecc_engine *eng = nand_to_ecc_ctx(nand);
+	u32 position;
+	int i;
+
+	for (i = 0; i < eng->nsteps; i++) {
+		if (i < eng->bbm_ctl.section)
+			position = (i + 1) * eng->oob_free;
+		else if (i == eng->bbm_ctl.section)
+			position = 0;
+		else
+			position = i * eng->oob_free;
+
+		if (write)
+			memcpy(dst_buf + i * eng->oob_free, src_buf + position,
+			       eng->oob_free);
+		else
+			memcpy(dst_buf + position, src_buf + i * eng->oob_free,
+			       eng->oob_free);
+	}
+}
+
+static void mtk_ecc_set_section_size_and_strength(struct nand_device *nand)
+{
+	struct nand_ecc_props *reqs = &nand->ecc.requirements;
+	struct nand_ecc_props *user = &nand->ecc.user_conf;
+	struct nand_ecc_props *conf = &nand->ecc.ctx.conf;
+	struct mtk_ecc_engine *eng = nand_to_ecc_ctx(nand);
+
+	/* Configure the correction depending on the NAND device topology */
+	if (user->step_size && user->strength) {
+		conf->step_size = user->step_size;
+		conf->strength = user->strength;
+	} else if (reqs->step_size && reqs->strength) {
+		conf->step_size = reqs->step_size;
+		conf->strength = reqs->strength;
+	}
+
+	/*
+	 * Align ECC strength and ECC size.
+	 * The MTK HW ECC engine only support 512 and 1024 ECC size.
+	 */
+	if (conf->step_size < 1024) {
+		if (nanddev_page_size(nand) > 512 &&
+		    eng->ecc->caps->max_section_size > 512) {
+			conf->step_size = 1024;
+			conf->strength <<= 1;
+		} else {
+			conf->step_size = 512;
+		}
+	} else {
+		conf->step_size = 1024;
+	}
+
+	eng->section_size = conf->step_size;
+}
+
+static int mtk_ecc_set_spare_per_section(struct nand_device *nand)
+{
+	struct nand_ecc_props *conf = &nand->ecc.ctx.conf;
+	struct mtk_ecc_engine *eng = nand_to_ecc_ctx(nand);
+	const u8 *spare = eng->ecc->caps->spare_size;
+	u32 i, closest_spare = 0;
+
+	eng->nsteps = nanddev_page_size(nand) / conf->step_size;
+	eng->oob_per_section = nanddev_per_page_oobsize(nand) / eng->nsteps;
+
+	if (conf->step_size == 1024)
+		eng->oob_per_section >>= 1;
+
+	if (eng->oob_per_section < spare[0]) {
+		dev_err(eng->ecc->dev, "OOB size per section too small %d\n",
+			eng->oob_per_section);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < eng->ecc->caps->num_spare_size; i++) {
+		if (eng->oob_per_section >= spare[i] &&
+		    spare[i] >= spare[closest_spare]) {
+			closest_spare = i;
+			if (eng->oob_per_section == spare[i])
+				break;
+		}
+	}
+
+	eng->oob_per_section = spare[closest_spare];
+	eng->oob_per_section_idx = closest_spare;
+
+	if (conf->step_size == 1024)
+		eng->oob_per_section <<= 1;
+
+	return 0;
+}
+
+int mtk_ecc_prepare_io_req_pipelined(struct nand_device *nand,
+				     struct nand_page_io_req *req)
+{
+	struct mtk_ecc_engine *eng = nand_to_ecc_ctx(nand);
+	struct mtd_info *mtd = nanddev_to_mtd(nand);
+	int ret;
+
+	nand_ecc_tweak_req(&eng->req_ctx, req);
+
+	/* Store the source buffer data to avoid modify source data */
+	if (req->type == NAND_PAGE_WRITE) {
+		if (req->datalen)
+			memcpy(eng->src_page_buf + req->dataoffs,
+			       req->databuf.out,
+			       req->datalen);
+
+		if (req->ooblen)
+			memcpy(eng->src_oob_buf + req->ooboffs,
+			       req->oobbuf.out,
+			       req->ooblen);
+	}
+
+	if (req->mode == MTD_OPS_RAW) {
+		if (req->type == NAND_PAGE_WRITE)
+			mtk_ecc_data_format(nand, req);
+
+		return 0;
+	}
+
+	eng->ecc_cfg.mode = ECC_NFI_MODE;
+	eng->ecc_cfg.sectors = eng->nsteps;
+	eng->ecc_cfg.op = ECC_DECODE;
+
+	if (req->type == NAND_PAGE_READ)
+		return mtk_ecc_enable(eng->ecc, &eng->ecc_cfg);
+
+	memset(eng->bounce_oob_buf, 0xff, nanddev_per_page_oobsize(nand));
+	if (req->ooblen) {
+		if (req->mode == MTD_OPS_AUTO_OOB) {
+			ret = mtd_ooblayout_set_databytes(mtd,
+							  req->oobbuf.out,
+							  eng->bounce_oob_buf,
+							  req->ooboffs,
+							  mtd->oobavail);
+			if (ret)
+				return ret;
+		} else {
+			memcpy(eng->bounce_oob_buf + req->ooboffs,
+			       req->oobbuf.out,
+			       req->ooblen);
+		}
+	}
+
+	eng->bbm_ctl.bbm_swap(nand, (void *)req->databuf.out,
+			      eng->bounce_oob_buf);
+	mtk_ecc_oob_free_shift(nand, (void *)req->oobbuf.out,
+			       eng->bounce_oob_buf, true);
+
+	eng->ecc_cfg.op = ECC_ENCODE;
+
+	return mtk_ecc_enable(eng->ecc, &eng->ecc_cfg);
+}
+
+int mtk_ecc_finish_io_req_pipelined(struct nand_device *nand,
+				    struct nand_page_io_req *req)
+{
+	struct mtk_ecc_engine *eng = nand_to_ecc_ctx(nand);
+	struct mtd_info *mtd = nanddev_to_mtd(nand);
+	struct mtk_ecc_stats stats;
+	int ret;
+
+	if (req->type == NAND_PAGE_WRITE) {
+		/* Restore the source buffer data */
+		if (req->datalen)
+			memcpy((void *)req->databuf.out,
+			       eng->src_page_buf + req->dataoffs,
+			       req->datalen);
+
+		if (req->ooblen)
+			memcpy((void *)req->oobbuf.out,
+			       eng->src_oob_buf + req->ooboffs,
+			       req->ooblen);
+
+		if (req->mode != MTD_OPS_RAW)
+			mtk_ecc_disable(eng->ecc);
+
+		nand_ecc_restore_req(&eng->req_ctx, req);
+
+		return 0;
+	}
+
+	if (req->mode == MTD_OPS_RAW) {
+		mtk_ecc_data_format(nand, req);
+		nand_ecc_restore_req(&eng->req_ctx, req);
+
+		return 0;
+	}
+
+	ret = mtk_ecc_wait_done(eng->ecc, ECC_DECODE);
+	if (ret) {
+		ret = -ETIMEDOUT;
+		goto out;
+	}
+
+	if (eng->read_empty) {
+		memset(req->databuf.in, 0xff, nanddev_page_size(nand));
+		memset(req->oobbuf.in, 0xff, nanddev_per_page_oobsize(nand));
+		ret = 0;
+
+		goto out;
+	}
+
+	mtk_ecc_get_stats(eng->ecc, &stats, eng->nsteps);
+	mtd->ecc_stats.corrected += stats.corrected;
+	mtd->ecc_stats.failed += stats.failed;
+
+	/*
+	 * Return -EBADMSG when exit uncorrect ECC error.
+	 * Otherwise, return the bitflips.
+	 */
+	if (stats.failed)
+		ret = -EBADMSG;
+	else
+		ret = stats.bitflips;
+
+	memset(eng->bounce_oob_buf, 0xff, nanddev_per_page_oobsize(nand));
+	mtk_ecc_oob_free_shift(nand, eng->bounce_oob_buf, req->oobbuf.in, false);
+	eng->bbm_ctl.bbm_swap(nand, req->databuf.in, eng->bounce_oob_buf);
+
+	if (req->ooblen) {
+		if (req->mode == MTD_OPS_AUTO_OOB)
+			ret = mtd_ooblayout_get_databytes(mtd,
+							  req->oobbuf.in,
+							  eng->bounce_oob_buf,
+							  req->ooboffs,
+							  mtd->oobavail);
+		else
+			memcpy(req->oobbuf.in,
+			       eng->bounce_oob_buf + req->ooboffs,
+			       req->ooblen);
+	}
+
+out:
+	mtk_ecc_disable(eng->ecc);
+	nand_ecc_restore_req(&eng->req_ctx, req);
+
+	return ret;
+}
+
+int mtk_ecc_init_ctx_pipelined(struct nand_device *nand)
+{
+	struct nand_ecc_props *conf = &nand->ecc.ctx.conf;
+	struct mtd_info *mtd = nanddev_to_mtd(nand);
+	struct mtk_ecc_engine *eng;
+	struct device *dev;
+	int free, ret;
+
+	/*
+	 * In the case of a pipelined engine, the device registering the ECC
+	 * engine is not the actual ECC engine device but the host controller.
+	 */
+	dev = mtk_ecc_get_engine_dev(nand->ecc.engine->dev);
+	if (!dev)
+		return -EINVAL;
+
+	eng = devm_kzalloc(dev, sizeof(*eng), GFP_KERNEL);
+	if (!eng)
+		return -ENOMEM;
+
+	nand->ecc.ctx.priv = eng;
+	nand->ecc.engine->priv = eng;
+
+	eng->ecc = dev_get_drvdata(dev);
+
+	mtk_ecc_set_section_size_and_strength(nand);
+
+	ret = mtk_ecc_set_spare_per_section(nand);
+	if (ret)
+		return ret;
+
+	clk_prepare_enable(eng->ecc->clk);
+	mtk_ecc_hw_init(eng->ecc);
+
+	/* Calculate OOB free bytes except ECC parity data */
+	free = (conf->strength * mtk_ecc_get_parity_bits(eng->ecc)
+	       + 7) >> 3;
+	free = eng->oob_per_section - free;
+
+	/*
+	 * Enhance ECC strength if OOB left is bigger than max FDM size
+	 * or reduce ECC strength if OOB size is not enough for ECC
+	 * parity data.
+	 */
+	if (free > OOB_FREE_MAX_SIZE)
+		eng->oob_ecc = eng->oob_per_section - OOB_FREE_MAX_SIZE;
+	else if (free < 0)
+		eng->oob_ecc = eng->oob_per_section - OOB_FREE_MIN_SIZE;
+
+	/* Calculate and adjust ECC strenth based on OOB ECC bytes */
+	conf->strength = (eng->oob_ecc << 3) /
+			 mtk_ecc_get_parity_bits(eng->ecc);
+	mtk_ecc_adjust_strength(eng->ecc, &conf->strength);
+
+	eng->oob_ecc = DIV_ROUND_UP(conf->strength *
+		       mtk_ecc_get_parity_bits(eng->ecc), 8);
+
+	eng->oob_free = eng->oob_per_section - eng->oob_ecc;
+	if (eng->oob_free > OOB_FREE_MAX_SIZE)
+		eng->oob_free = OOB_FREE_MAX_SIZE;
+
+	eng->oob_free_protected = OOB_FREE_MIN_SIZE;
+
+	eng->oob_ecc = eng->oob_per_section - eng->oob_free;
+
+	if (!mtd->ooblayout)
+		mtd_set_ooblayout(mtd, mtk_ecc_get_ooblayout());
+
+	ret = nand_ecc_init_req_tweaking(&eng->req_ctx, nand);
+	if (ret)
+		return ret;
+
+	eng->src_page_buf = kmalloc(nanddev_page_size(nand) +
+			    nanddev_per_page_oobsize(nand), GFP_KERNEL);
+	eng->bounce_page_buf = kmalloc(nanddev_page_size(nand) +
+			       nanddev_per_page_oobsize(nand), GFP_KERNEL);
+	if (!eng->src_page_buf || !eng->bounce_page_buf) {
+		ret = -ENOMEM;
+		goto cleanup_req_tweak;
+	}
+
+	eng->src_oob_buf = eng->src_page_buf + nanddev_page_size(nand);
+	eng->bounce_oob_buf = eng->bounce_page_buf + nanddev_page_size(nand);
+
+	mtk_ecc_set_bbm_ctl(&eng->bbm_ctl, nand);
+	eng->ecc_cfg.strength = conf->strength;
+	eng->ecc_cfg.len = conf->step_size + eng->oob_free_protected;
+	mtd->bitflip_threshold = conf->strength;
+
+	return 0;
+
+cleanup_req_tweak:
+	nand_ecc_cleanup_req_tweaking(&eng->req_ctx);
+
+	return ret;
+}
+
+void mtk_ecc_cleanup_ctx_pipelined(struct nand_device *nand)
+{
+	struct mtk_ecc_engine *eng = nand_to_ecc_ctx(nand);
+
+	if (eng) {
+		nand_ecc_cleanup_req_tweaking(&eng->req_ctx);
+		kfree(eng->src_page_buf);
+		kfree(eng->bounce_page_buf);
+	}
+}
+
+/*
+ * The MTK ECC engine work at pipelined situation,
+ * will be registered by the drivers that wrap it.
+ */
+static struct nand_ecc_engine_ops mtk_ecc_engine_pipelined_ops = {
+	.init_ctx = mtk_ecc_init_ctx_pipelined,
+	.cleanup_ctx = mtk_ecc_cleanup_ctx_pipelined,
+	.prepare_io_req = mtk_ecc_prepare_io_req_pipelined,
+	.finish_io_req = mtk_ecc_finish_io_req_pipelined,
+};
+
+struct nand_ecc_engine_ops *mtk_ecc_get_pipelined_ops(void)
+{
+	return &mtk_ecc_engine_pipelined_ops;
+}
+EXPORT_SYMBOL(mtk_ecc_get_pipelined_ops);
+
 static const struct mtk_ecc_caps mtk_ecc_caps_mt2701 = {
 	.err_mask = 0x3f,
 	.ecc_strength = ecc_strength_mt2701,
@@ -472,6 +1083,9 @@ static const struct mtk_ecc_caps mtk_ecc_caps_mt7622 = {
 	.ecc_strength = ecc_strength_mt7622,
 	.ecc_regs = mt7622_ecc_regs,
 	.num_ecc_strength = 7,
+	.spare_size = spare_size_mt7622,
+	.num_spare_size = 19,
+	.max_section_size = 1024,
 	.ecc_mode_shift = 4,
 	.parity_bits = 13,
 	.pg_irq_sel = 0,
diff --git a/include/linux/mtd/nand-ecc-mtk.h b/include/linux/mtd/nand-ecc-mtk.h
index 0e48c36e6ca0..6d550032cbd9 100644
--- a/include/linux/mtd/nand-ecc-mtk.h
+++ b/include/linux/mtd/nand-ecc-mtk.h
@@ -33,6 +33,61 @@ struct mtk_ecc_config {
 	u32 len;
 };
 
+/**
+ * struct mtk_ecc_bbm_ctl - Information relative to the BBM swap
+ * @bbm_swap: BBM swap function
+ * @section: Section number in data area for swap
+ * @position: Position in @section for swap with BBM
+ */
+struct mtk_ecc_bbm_ctl {
+	void (*bbm_swap)(struct nand_device *nand, u8 *databuf, u8 *oobbuf);
+	u32 section;
+	u32 position;
+};
+
+/**
+ * struct mtk_ecc_engine - Information relative to the ECC
+ * @req_ctx: Save request context and tweak the original request to fit the
+ *           engine needs
+ * @oob_per_section: OOB size for each section to store OOB free/ECC bytes
+ * @oob_per_section_idx: The index for @oob_per_section in spare size array
+ * @oob_ecc: OOB size for each section to store the ECC parity
+ * @oob_free: OOB size for each section to store the OOB free bytes
+ * @oob_free_protected: OOB free bytes will be protected by the ECC engine
+ * @section_size: The size of each section
+ * @read_empty: Indicate whether empty page for one read operation
+ * @nsteps: The number of the sections
+ * @src_page_buf: Buffer used to store source data buffer when write
+ * @src_oob_buf: Buffer used to store source OOB buffer when write
+ * @bounce_page_buf: Data bounce buffer
+ * @bounce_oob_buf: OOB bounce buffer
+ * @ecc: The ECC engine private data structure
+ * @ecc_cfg: The configuration of each ECC operation
+ * @bbm_ctl: Information relative to the BBM swap
+ */
+struct mtk_ecc_engine {
+	struct nand_ecc_req_tweak_ctx req_ctx;
+
+	u32 oob_per_section;
+	u32 oob_per_section_idx;
+	u32 oob_ecc;
+	u32 oob_free;
+	u32 oob_free_protected;
+	u32 section_size;
+
+	bool read_empty;
+	u32 nsteps;
+
+	u8 *src_page_buf;
+	u8 *src_oob_buf;
+	u8 *bounce_page_buf;
+	u8 *bounce_oob_buf;
+
+	struct mtk_ecc *ecc;
+	struct mtk_ecc_config ecc_cfg;
+	struct mtk_ecc_bbm_ctl bbm_ctl;
+};
+
 int mtk_ecc_encode(struct mtk_ecc *, struct mtk_ecc_config *, u8 *, u32);
 void mtk_ecc_get_stats(struct mtk_ecc *, struct mtk_ecc_stats *, int);
 int mtk_ecc_wait_done(struct mtk_ecc *, enum mtk_ecc_operation);
@@ -44,4 +99,17 @@ unsigned int mtk_ecc_get_parity_bits(struct mtk_ecc *ecc);
 struct mtk_ecc *of_mtk_ecc_get(struct device_node *);
 void mtk_ecc_release(struct mtk_ecc *);
 
+#if IS_ENABLED(CONFIG_MTD_NAND_ECC_MTK)
+
+struct nand_ecc_engine_ops *mtk_ecc_get_pipelined_ops(void);
+
+#else /* !CONFIG_MTD_NAND_ECC_MTK */
+
+struct nand_ecc_engine_ops *mtk_ecc_get_pipelined_ops(void)
+{
+	return NULL;
+}
+
+#endif /* CONFIG_MTD_NAND_ECC_MTK */
+
 #endif
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
