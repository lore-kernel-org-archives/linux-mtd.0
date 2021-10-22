Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208CCC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 02:52:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC4B060E08
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 02:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC4B060E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ri1W1MgAJgAKO6VyPlAcLgM1W0P9pjmM2EIuxrEIC+w=; b=zV4gzq6IOdemxa
	kZqJUiLvDZK6nCVisrWifZV00hBe9+g5B8/pwjo08JYyBWdBOn9WgILAetRqcyZDNr1C0YYtmBCU0
	ntTHgZA06Ht9OhTuiBny2sM7uDGfnq9q2gatOM7ba6vhcU3YOhhUKJwx+PEKtbHXxxXXZwTJJDjbR
	022ch3XCc2KkC7V6U53bhRJhrnITr8g/xeNmxDMZJsnuRsU4oeIMl6gwfFJjpTulaJDz+xwllIt9o
	BTUObaMMSqyUkULn+tvQcRcngKg33i+c1YORRzfl49YzSXTf4SA7LN6qyORZs1+DdNNejAIJeoycx
	RsoHaGkf0+SmG4PO82mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdkeZ-009chZ-Qm; Fri, 22 Oct 2021 02:51:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdkdt-009cYT-Iz; Fri, 22 Oct 2021 02:50:52 +0000
X-UUID: 701ce1703ecc4faaac434eef842f3a88-20211021
X-UUID: 701ce1703ecc4faaac434eef842f3a88-20211021
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1509352123; Thu, 21 Oct 2021 19:50:46 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Oct 2021 19:40:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 22 Oct 2021 10:40:42 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Oct 2021 10:40:41 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: <miquel.raynal@bootlin.com>, <broonie@kernel.org>
CC: <xiangsheng.hou@mediatek.com>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>, <donghunt@amazon.com>, 
 <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: [RFC,v3 2/5] mtd: ecc: realize Mediatek HW ECC driver
Date: Fri, 22 Oct 2021 10:40:18 +0800
Message-ID: <20211022024021.14665-3-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022024021.14665-1-xiangsheng.hou@mediatek.com>
References: <20211022024021.14665-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_195049_721557_D34895C6 
X-CRM114-Status: GOOD (  25.42  )
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

The v3 driver realize Mediatek HW ECC engine with pipelined
case.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
---
 drivers/mtd/nand/core.c     |  10 +-
 drivers/mtd/nand/ecc.c      |  88 +++++++
 drivers/mtd/nand/mtk_ecc.c  | 488 ++++++++++++++++++++++++++++++++++++
 include/linux/mtd/mtk_ecc.h |  38 +++
 include/linux/mtd/nand.h    |  11 +
 5 files changed, 632 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/core.c b/drivers/mtd/nand/core.c
index 5e13a03d2b32..b228b4d13b7a 100644
--- a/drivers/mtd/nand/core.c
+++ b/drivers/mtd/nand/core.c
@@ -232,7 +232,9 @@ static int nanddev_get_ecc_engine(struct nand_device *nand)
 		nand->ecc.engine = nand_ecc_get_on_die_hw_engine(nand);
 		break;
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
-		pr_err("On-host hardware ECC engines not supported yet\n");
+		nand->ecc.engine = nand_ecc_get_on_host_hw_engine(nand);
+		if (PTR_ERR(nand->ecc.engine) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
 		break;
 	default:
 		pr_err("Missing ECC engine type\n");
@@ -252,7 +254,7 @@ static int nanddev_put_ecc_engine(struct nand_device *nand)
 {
 	switch (nand->ecc.ctx.conf.engine_type) {
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
-		pr_err("On-host hardware ECC engines not supported yet\n");
+		nand_ecc_put_on_host_hw_engine(nand);
 		break;
 	case NAND_ECC_ENGINE_TYPE_NONE:
 	case NAND_ECC_ENGINE_TYPE_SOFT:
@@ -297,7 +299,9 @@ int nanddev_ecc_engine_init(struct nand_device *nand)
 	/* Look for the ECC engine to use */
 	ret = nanddev_get_ecc_engine(nand);
 	if (ret) {
-		pr_err("No ECC engine found\n");
+		if (ret != -EPROBE_DEFER)
+			pr_err("No ECC engine found\n");
+
 		return ret;
 	}
 
diff --git a/drivers/mtd/nand/ecc.c b/drivers/mtd/nand/ecc.c
index 6c43dfda01d4..55d6946da9c3 100644
--- a/drivers/mtd/nand/ecc.c
+++ b/drivers/mtd/nand/ecc.c
@@ -96,7 +96,12 @@
 #include <linux/module.h>
 #include <linux/mtd/nand.h>
 #include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
 
+static LIST_HEAD(on_host_hw_engines);
+static DEFINE_MUTEX(on_host_hw_engines_mutex);
 /**
  * nand_ecc_init_ctx - Init the ECC engine context
  * @nand: the NAND device
@@ -611,6 +616,89 @@ struct nand_ecc_engine *nand_ecc_get_on_die_hw_engine(struct nand_device *nand)
 }
 EXPORT_SYMBOL(nand_ecc_get_on_die_hw_engine);
 
+int nand_ecc_register_on_host_hw_engine(struct nand_ecc_engine *engine)
+{
+	struct nand_ecc_engine *item;
+
+	if (!engine)
+		return -ENOTSUPP;
+
+	/* Prevent multiple registerations of one engine */
+	list_for_each_entry(item, &on_host_hw_engines, node)
+		if (item == engine)
+			return 0;
+
+	mutex_lock(&on_host_hw_engines_mutex);
+	list_add_tail(&engine->node, &on_host_hw_engines);
+	mutex_unlock(&on_host_hw_engines_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL(nand_ecc_register_on_host_hw_engine);
+
+int nand_ecc_unregister_on_host_hw_engine(struct nand_ecc_engine *engine)
+{
+	if (!engine)
+		return -ENOTSUPP;
+
+	mutex_lock(&on_host_hw_engines_mutex);
+	list_del(&engine->node);
+	mutex_unlock(&on_host_hw_engines_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL(nand_ecc_unregister_on_host_hw_engine);
+
+struct nand_ecc_engine *nand_ecc_match_on_host_hw_engine(struct device *dev)
+{
+	struct nand_ecc_engine *item;
+
+	list_for_each_entry(item, &on_host_hw_engines, node)
+		if (item->dev == dev)
+			return item;
+
+	return NULL;
+}
+EXPORT_SYMBOL(nand_ecc_match_on_host_hw_engine);
+
+struct nand_ecc_engine *nand_ecc_get_on_host_hw_engine(struct nand_device *nand)
+{
+	struct nand_ecc_engine *engine = NULL;
+	struct device *dev = &nand->mtd.dev;
+	struct platform_device *pdev;
+	struct device_node *np;
+
+	if (list_empty(&on_host_hw_engines))
+		return NULL;
+
+	/* Check for an explicit nand-ecc-engine property */
+	np = of_parse_phandle(dev->of_node, "nand-ecc-engine", 0);
+	if (np) {
+		pdev = of_find_device_by_node(np);
+		if (!pdev)
+			return ERR_PTR(-EPROBE_DEFER);
+
+		engine = nand_ecc_match_on_host_hw_engine(&pdev->dev);
+		platform_device_put(pdev);
+		of_node_put(np);
+
+		if (!engine)
+			return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	if (engine)
+		get_device(engine->dev);
+
+	return engine;
+}
+EXPORT_SYMBOL(nand_ecc_get_on_host_hw_engine);
+
+void nand_ecc_put_on_host_hw_engine(struct nand_device *nand)
+{
+	put_device(nand->ecc.engine->dev);
+}
+EXPORT_SYMBOL(nand_ecc_put_on_host_hw_engine);
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
 MODULE_DESCRIPTION("Generic ECC engine");
diff --git a/drivers/mtd/nand/mtk_ecc.c b/drivers/mtd/nand/mtk_ecc.c
index ce0f8b491e5d..e0c971d6a443 100644
--- a/drivers/mtd/nand/mtk_ecc.c
+++ b/drivers/mtd/nand/mtk_ecc.c
@@ -16,6 +16,7 @@
 #include <linux/of_platform.h>
 #include <linux/mutex.h>
 
+#include <linux/mtd/nand.h>
 #include <linux/mtd/mtk_ecc.h>
 
 #define ECC_IDLE_MASK		BIT(0)
@@ -41,6 +42,9 @@
 #define ECC_IDLE_REG(op)	((op) == ECC_ENCODE ? ECC_ENCIDLE : ECC_DECIDLE)
 #define ECC_CTL_REG(op)		((op) == ECC_ENCODE ? ECC_ENCCON : ECC_DECCON)
 
+#define ECC_FDM_MAX_SIZE 8
+#define ECC_FDM_MIN_SIZE 1
+
 struct mtk_ecc_caps {
 	u32 err_mask;
 	const u8 *ecc_strength;
@@ -79,6 +83,10 @@ static const u8 ecc_strength_mt7622[] = {
 	4, 6, 8, 10, 12, 14, 16
 };
 
+static const u8 ecc_strength_mt7986[] = {
+	4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24
+};
+
 enum mtk_ecc_regs {
 	ECC_ENCPAR00,
 	ECC_ENCIRQ_EN,
@@ -115,6 +123,15 @@ static int mt7622_ecc_regs[] = {
 	[ECC_DECIRQ_STA] =      0x144,
 };
 
+static int mt7986_ecc_regs[] = {
+	[ECC_ENCPAR00] =        0x300,
+	[ECC_ENCIRQ_EN] =       0x80,
+	[ECC_ENCIRQ_STA] =      0x84,
+	[ECC_DECDONE] =         0x124,
+	[ECC_DECIRQ_EN] =       0x200,
+	[ECC_DECIRQ_STA] =      0x204,
+};
+
 static inline void mtk_ecc_wait_idle(struct mtk_ecc *ecc,
 				     enum mtk_ecc_operation op)
 {
@@ -447,6 +464,464 @@ unsigned int mtk_ecc_get_parity_bits(struct mtk_ecc *ecc)
 }
 EXPORT_SYMBOL(mtk_ecc_get_parity_bits);
 
+static inline int data_off(struct nand_device *nand, int i)
+{
+	int eccsize = nand->ecc.ctx.conf.step_size;
+
+	return i * eccsize;
+}
+
+static inline int fdm_off(struct nand_device *nand, int i)
+{
+	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
+	int poi;
+
+	if (i < eng->bad_mark.sec)
+		poi = (i + 1) * eng->fdm_size;
+	else if (i == eng->bad_mark.sec)
+		poi = 0;
+	else
+		poi = i * eng->fdm_size;
+
+	return poi;
+}
+
+static inline int mtk_ecc_data_len(struct nand_device *nand)
+{
+	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
+	int eccsize = nand->ecc.ctx.conf.step_size;
+	int eccbytes = eng->oob_ecc;
+
+	return eccsize + eng->fdm_size + eccbytes;
+}
+
+static inline u8 *mtk_ecc_sec_ptr(struct nand_device *nand,  int i)
+{
+	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
+
+	return eng->page_buf + i * mtk_ecc_data_len(nand);
+}
+
+static inline u8 *mtk_ecc_fdm_ptr(struct nand_device *nand, int i)
+{
+	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
+	int eccsize = nand->ecc.ctx.conf.step_size;
+
+	return eng->page_buf + i * mtk_ecc_data_len(nand) + eccsize;
+}
+
+static void mtk_ecc_no_bad_mark_swap(struct nand_device *a, u8 *b,
+							u8 *c)
+{
+	/* nop */
+}
+
+static void mtk_ecc_bad_mark_swap(struct nand_device *nand, u8 *databuf,
+							u8 *oobbuf)
+{
+	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
+	int step_size = nand->ecc.ctx.conf.step_size;
+	u32 bad_pos = eng->bad_mark.pos;
+
+	bad_pos += eng->bad_mark.sec * step_size;
+
+	swap(oobbuf[0], databuf[bad_pos]);
+}
+
+static void mtk_ecc_set_bad_mark_ctl(struct mtk_ecc_bad_mark_ctl *bm_ctl,
+				     struct mtd_info *mtd)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+
+	if (mtd->writesize == 512) {
+		bm_ctl->bm_swap = mtk_ecc_no_bad_mark_swap;
+	} else {
+		bm_ctl->bm_swap = mtk_ecc_bad_mark_swap;
+		bm_ctl->sec = mtd->writesize / mtk_ecc_data_len(nand);
+		bm_ctl->pos = mtd->writesize % mtk_ecc_data_len(nand);
+	}
+}
+
+static int mtk_ecc_ooblayout_free(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *oob_region)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
+	struct nand_ecc_props *conf = &nand->ecc.ctx.conf;
+	u32 eccsteps, bbm_bytes = 0;
+
+	eccsteps = mtd->writesize / conf->step_size;
+
+	if (section >= eccsteps)
+		return -ERANGE;
+
+	/* reserve 1 byte for bad mark only for section 0 */
+	if (section == 0)
+		bbm_bytes = 1;
+
+	oob_region->length = eng->fdm_size - bbm_bytes;
+	oob_region->offset = section * eng->fdm_size + bbm_bytes;
+
+	return 0;
+}
+
+static int mtk_ecc_ooblayout_ecc(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *oob_region)
+{
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
+
+	if (section)
+		return -ERANGE;
+
+	oob_region->offset = eng->fdm_size * eng->nsteps;
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
+ * mtk_ecc_data_format() - Covert data between ecc format and data/oob buf
+ *
+ * Mediatek HW ECC engine organize data/oob free/oob ecc by sector,
+ * the data format for one page as bellow:
+ * ||          sector 0         ||          sector 1         || ...
+ * || data |   fdm    | oob ecc || data ||   fdm   | oob ecc || ...
+ *
+ * Terefore, it`s necessary to covert data when read/write in MTD_OPS_RAW.
+ * These data include bad mark, sector data, fdm data and oob ecc.
+ */
+static void mtk_ecc_data_format(struct nand_device *nand,
+			u8 *databuf, u8 *oobbuf, bool write)
+{
+	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
+	int step_size = nand->ecc.ctx.conf.step_size;
+	int i;
+
+	if (write) {
+		for (i = 0; i < eng->nsteps; i++) {
+			if (i == eng->bad_mark.sec)
+				eng->bad_mark.bm_swap(nand,
+						databuf, oobbuf);
+			memcpy(mtk_ecc_sec_ptr(nand, i),
+				   databuf + data_off(nand, i), step_size);
+
+			memcpy(mtk_ecc_fdm_ptr(nand, i),
+				   oobbuf + fdm_off(nand, i),
+				   eng->fdm_size);
+
+			memcpy(mtk_ecc_fdm_ptr(nand, i) + eng->fdm_size,
+				   oobbuf + eng->fdm_size * eng->nsteps +
+				   i * eng->oob_ecc,
+				   eng->oob_ecc);
+
+			/* swap back when write */
+			if (i == eng->bad_mark.sec)
+				eng->bad_mark.bm_swap(nand,
+						databuf, oobbuf);
+		}
+	} else {
+		for (i = 0; i < eng->nsteps; i++) {
+			memcpy(databuf + data_off(nand, i),
+				   mtk_ecc_sec_ptr(nand, i), step_size);
+
+			memcpy(oobbuf + fdm_off(nand, i),
+				   mtk_ecc_sec_ptr(nand, i) + step_size,
+				   eng->fdm_size);
+
+			memcpy(oobbuf + eng->fdm_size * eng->nsteps +
+				   i * eng->oob_ecc,
+				   mtk_ecc_sec_ptr(nand, i) + step_size
+				   + eng->fdm_size,
+				   eng->oob_ecc);
+
+			if (i == eng->bad_mark.sec)
+				eng->bad_mark.bm_swap(nand,
+						databuf, oobbuf);
+		}
+	}
+}
+
+static void mtk_ecc_fdm_shift(struct nand_device *nand,
+				u8 *dst_buf, u8 *src_buf)
+{
+	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
+	u8 *poi;
+	int i;
+
+	for (i = 0; i < eng->nsteps; i++) {
+		if (i < eng->bad_mark.sec)
+			poi = src_buf + (i + 1) * eng->fdm_size;
+		else if (i == eng->bad_mark.sec)
+			poi = src_buf;
+		else
+			poi = src_buf + i * eng->fdm_size;
+
+		memcpy(dst_buf + i * eng->fdm_size, poi, eng->fdm_size);
+	}
+}
+
+int mtk_ecc_prepare_io_req_pipelined(struct nand_device *nand,
+					  struct nand_page_io_req *req)
+{
+	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
+	struct mtd_info *mtd = nanddev_to_mtd(nand);
+	u8 *buf = eng->page_buf;
+
+	nand_ecc_tweak_req(&eng->req_ctx, req);
+
+	if (req->mode == MTD_OPS_RAW) {
+		if (req->type == NAND_PAGE_WRITE) {
+			/* change data/oob buf to MTK HW ECC data format */
+			mtk_ecc_data_format(nand, req->databuf.in,
+					req->oobbuf.in, true);
+			req->databuf.out = buf;
+			req->oobbuf.out = buf + nand->memorg.pagesize;
+		}
+	} else {
+		eng->ecc_cfg.op = ECC_DECODE;
+		if (req->type == NAND_PAGE_WRITE) {
+			memset(eng->oob_buf, 0xff, nand->memorg.oobsize);
+			mtd_ooblayout_set_databytes(mtd, req->oobbuf.out,
+							eng->oob_buf,
+							req->ooboffs,
+							mtd->oobavail);
+			eng->bad_mark.bm_swap(nand,
+						req->databuf.in, eng->oob_buf);
+			mtk_ecc_fdm_shift(nand, req->oobbuf.in,
+						eng->oob_buf);
+
+			eng->ecc_cfg.op = ECC_ENCODE;
+		}
+
+		eng->ecc_cfg.mode = ECC_NFI_MODE;
+		eng->ecc_cfg.sectors = eng->nsteps;
+		return mtk_ecc_enable(eng->ecc, &eng->ecc_cfg);
+	}
+
+	return 0;
+}
+
+int mtk_ecc_finish_io_req_pipelined(struct nand_device *nand,
+					  struct nand_page_io_req *req)
+{
+	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
+	struct mtd_info *mtd = nanddev_to_mtd(nand);
+	struct mtk_ecc_stats stats;
+	u8 *buf = eng->page_buf;
+	int ret;
+
+	if (req->type == NAND_PAGE_WRITE) {
+		if (req->mode != MTD_OPS_RAW) {
+			mtk_ecc_disable(eng->ecc);
+			mtk_ecc_fdm_shift(nand, eng->oob_buf,
+					req->oobbuf.in);
+			eng->bad_mark.bm_swap(nand,
+					req->databuf.in, eng->oob_buf);
+		}
+		nand_ecc_restore_req(&eng->req_ctx, req);
+
+		return 0;
+	}
+
+	if (req->mode == MTD_OPS_RAW) {
+		memcpy(buf, req->databuf.in,
+			   nand->memorg.pagesize);
+		memcpy(buf + nand->memorg.pagesize,
+			   req->oobbuf.in, nand->memorg.oobsize);
+
+		/* change MTK HW ECC data format to data/oob buf */
+		mtk_ecc_data_format(nand, req->databuf.in,
+				req->oobbuf.in, false);
+		nand_ecc_restore_req(&eng->req_ctx, req);
+
+		return 0;
+	}
+
+	ret = mtk_ecc_wait_done(eng->ecc, ECC_DECODE);
+	if (ret)
+		return -ETIMEDOUT;
+
+	if (eng->read_empty) {
+		memset(req->databuf.in, 0xff, nand->memorg.pagesize);
+		memset(req->oobbuf.in, 0xff, nand->memorg.oobsize);
+
+		ret = 0;
+	} else {
+		mtk_ecc_get_stats(eng->ecc, &stats, eng->nsteps);
+		mtd->ecc_stats.corrected += stats.corrected;
+		mtd->ecc_stats.failed += stats.failed;
+
+		/*
+		 * Return -EBADMSG when exit uncorrect ecc error.
+		 * Otherwise, return the bitflips.
+		 */
+		if (stats.failed)
+			ret = -EBADMSG;
+		else
+			ret = stats.bitflips;
+
+		mtk_ecc_fdm_shift(nand, eng->oob_buf, req->oobbuf.in);
+		eng->bad_mark.bm_swap(nand,
+					req->databuf.in, eng->oob_buf);
+		mtd_ooblayout_get_databytes(mtd, req->oobbuf.in,
+			eng->oob_buf,
+			0, mtd->oobavail);
+	}
+
+	mtk_ecc_disable(eng->ecc);
+	nand_ecc_restore_req(&eng->req_ctx, req);
+
+	return ret;
+}
+
+int mtk_ecc_init_ctx_pipelined(struct nand_device *nand)
+{
+	struct nand_ecc_props *conf = &nand->ecc.ctx.conf;
+	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
+	struct mtd_info *mtd = nanddev_to_mtd(nand);
+	struct device *dev;
+	int free, ret;
+
+	/*
+	 * In the case of a pipelined engine, the device registering the ECC
+	 * engine is not the actual ECC engine device but the host controller.
+	 */
+	dev = mtk_ecc_get_engine_dev(nand->ecc.engine->dev);
+	if (!dev) {
+		ret = -EINVAL;
+		goto free_engine;
+	}
+
+	eng->ecc = dev_get_drvdata(dev);
+
+	/* calculate oob free bytes except ecc parity data */
+	free = (conf->strength * mtk_ecc_get_parity_bits(eng->ecc)
+		+ 7) >> 3;
+	free = eng->oob_per_sector - free;
+
+	/*
+	 * enhance ecc strength if oob left is bigger than max FDM size
+	 * or reduce ecc strength if oob size is not enough for ecc
+	 * parity data.
+	 */
+	if (free > ECC_FDM_MAX_SIZE)
+		eng->oob_ecc = eng->oob_per_sector - ECC_FDM_MAX_SIZE;
+	else if (free < 0)
+		eng->oob_ecc = eng->oob_per_sector - ECC_FDM_MIN_SIZE;
+
+	/* calculate and adjust ecc strenth based on oob ecc bytes */
+	conf->strength = (eng->oob_ecc << 3) /
+				 mtk_ecc_get_parity_bits(eng->ecc);
+	mtk_ecc_adjust_strength(eng->ecc, &conf->strength);
+
+	eng->oob_ecc = DIV_ROUND_UP(conf->strength *
+				 mtk_ecc_get_parity_bits(eng->ecc), 8);
+
+	eng->fdm_size = eng->oob_per_sector - eng->oob_ecc;
+	if (eng->fdm_size > ECC_FDM_MAX_SIZE)
+		eng->fdm_size = ECC_FDM_MAX_SIZE;
+
+	eng->fdm_ecc_size = ECC_FDM_MIN_SIZE;
+
+	eng->oob_ecc = eng->oob_per_sector - eng->fdm_size;
+
+	if (!mtd->ooblayout)
+		mtd_set_ooblayout(mtd, mtk_ecc_get_ooblayout());
+
+	ret = nand_ecc_init_req_tweaking(&eng->req_ctx, nand);
+	if (ret)
+		goto free_engine;
+
+	eng->oob_buf = kzalloc(mtd->oobsize, GFP_KERNEL);
+	eng->page_buf =
+		kzalloc(mtd->writesize + mtd->oobsize, GFP_KERNEL);
+	if (!eng->oob_buf || !eng->page_buf) {
+		ret = -ENOMEM;
+		goto free_bufs;
+	}
+
+	mtk_ecc_set_bad_mark_ctl(&eng->bad_mark, mtd);
+	eng->ecc_cfg.strength = conf->strength;
+	eng->ecc_cfg.len = conf->step_size + eng->fdm_ecc_size;
+
+	return 0;
+
+free_bufs:
+	nand_ecc_cleanup_req_tweaking(&eng->req_ctx);
+	kfree(eng->oob_buf);
+	kfree(eng->page_buf);
+free_engine:
+	kfree(eng);
+
+	return ret;
+}
+
+void mtk_ecc_cleanup_ctx_pipelined(struct nand_device *nand)
+{
+	struct mtk_ecc_engine *eng = nand->ecc.ctx.priv;
+
+	if (eng) {
+		nand_ecc_cleanup_req_tweaking(&eng->req_ctx);
+		kfree(eng->ecc);
+		kfree(eng->oob_buf);
+		kfree(eng->page_buf);
+		kfree(eng);
+	}
+}
+
+/*
+ * The on-host mtk HW ECC engine work at pipelined situation,
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
@@ -477,6 +952,16 @@ static const struct mtk_ecc_caps mtk_ecc_caps_mt7622 = {
 	.pg_irq_sel = 0,
 };
 
+static const struct mtk_ecc_caps mtk_ecc_caps_mt7986 = {
+	.err_mask = 0x1f,
+	.ecc_strength = ecc_strength_mt7986,
+	.ecc_regs = mt7986_ecc_regs,
+	.num_ecc_strength = 11,
+	.ecc_mode_shift = 5,
+	.parity_bits = 14,
+	.pg_irq_sel = 1,
+};
+
 static const struct of_device_id mtk_ecc_dt_match[] = {
 	{
 		.compatible = "mediatek,mt2701-ecc",
@@ -487,6 +972,9 @@ static const struct of_device_id mtk_ecc_dt_match[] = {
 	}, {
 		.compatible = "mediatek,mt7622-ecc",
 		.data = &mtk_ecc_caps_mt7622,
+	}, {
+		.compatible = "mediatek,mt7986-ecc",
+		.data = &mtk_ecc_caps_mt7986,
 	},
 	{},
 };
diff --git a/include/linux/mtd/mtk_ecc.h b/include/linux/mtd/mtk_ecc.h
index 0e48c36e6ca0..a286183d16c4 100644
--- a/include/linux/mtd/mtk_ecc.h
+++ b/include/linux/mtd/mtk_ecc.h
@@ -33,6 +33,31 @@ struct mtk_ecc_config {
 	u32 len;
 };
 
+struct mtk_ecc_bad_mark_ctl {
+	void (*bm_swap)(struct nand_device *, u8 *databuf, u8* oobbuf);
+	u32 sec;
+	u32 pos;
+};
+
+struct mtk_ecc_engine {
+	struct nand_ecc_req_tweak_ctx req_ctx;
+
+	u32 oob_per_sector;
+	u32 oob_ecc;
+	u32 fdm_size;
+	u32 fdm_ecc_size;
+
+	bool read_empty;
+	u32 nsteps;
+
+	u8 *page_buf;
+	u8 *oob_buf;
+
+	struct mtk_ecc *ecc;
+	struct mtk_ecc_config ecc_cfg;
+	struct mtk_ecc_bad_mark_ctl bad_mark;
+};
+
 int mtk_ecc_encode(struct mtk_ecc *, struct mtk_ecc_config *, u8 *, u32);
 void mtk_ecc_get_stats(struct mtk_ecc *, struct mtk_ecc_stats *, int);
 int mtk_ecc_wait_done(struct mtk_ecc *, enum mtk_ecc_operation);
@@ -44,4 +69,17 @@ unsigned int mtk_ecc_get_parity_bits(struct mtk_ecc *ecc);
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
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 32fc7edf65b3..5ffd3e359515 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -265,10 +265,16 @@ struct nand_ecc_engine_ops {
 
 /**
  * struct nand_ecc_engine - ECC engine abstraction for NAND devices
+ * @dev: Host device
+ * @node: Private field for registration time
  * @ops: ECC engine operations
+ * @priv: Private data
  */
 struct nand_ecc_engine {
+	struct device *dev;
+	struct list_head node;
 	struct nand_ecc_engine_ops *ops;
+	void *priv;
 };
 
 void of_get_nand_ecc_user_config(struct nand_device *nand);
@@ -279,8 +285,13 @@ int nand_ecc_prepare_io_req(struct nand_device *nand,
 int nand_ecc_finish_io_req(struct nand_device *nand,
 			   struct nand_page_io_req *req);
 bool nand_ecc_is_strong_enough(struct nand_device *nand);
+int nand_ecc_register_on_host_hw_engine(struct nand_ecc_engine *engine);
+int nand_ecc_unregister_on_host_hw_engine(struct nand_ecc_engine *engine);
 struct nand_ecc_engine *nand_ecc_get_sw_engine(struct nand_device *nand);
 struct nand_ecc_engine *nand_ecc_get_on_die_hw_engine(struct nand_device *nand);
+struct nand_ecc_engine *nand_ecc_get_on_host_hw_engine(struct nand_device *nand);
+struct nand_ecc_engine *nand_ecc_match_on_host_hw_engine(struct device *dev);
+void nand_ecc_put_on_host_hw_engine(struct nand_device *nand);
 
 #if IS_ENABLED(CONFIG_MTD_NAND_ECC_SW_HAMMING)
 struct nand_ecc_engine *nand_ecc_sw_hamming_get_engine(void);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
