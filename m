Return-Path: <SRS0=FSZL=DT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C8CC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 10:02:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9420C208B6
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 10:02:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fpbxmZU5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=robart.cc header.i=@robart.cc header.b="EpPOmB/3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9420C208B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=robart.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xusNgtjGvStbFpo1UoJGxy5gmbDHkagY9NVaubczWY8=; b=fpbxmZU5zssTeJFsrtuVBxiTlx
	7aax0x1THM04v0+OKhgOjTBF7Zr+4Pt/22GyulXiX3Jy4///RvSwXYBNmCCFyn1RKi7q26jpw+raL
	DtGqfEWpu90VC0JHk/QknVY9+UaKJS/LwHTe3ALQsww7YXaahBtpuuqGm5xYrszxvNGUSF/A62TDd
	hSX09oER9c0ZckLYRpsgzvyPHak0nlrh2ThslOzjqDwQ/LaEjq+YQ8DH/prYR2ASylAApEvUt4pEe
	OM0pj/m990Kt1rY/vS7HHrFkaETtrKcuLXiHry13HLPzbN6OiJvPYXiL6JFrshxw+YuNyWlSouXBa
	wTCvOQpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRudv-0005bC-1N; Mon, 12 Oct 2020 10:01:23 +0000
Received: from srv-mta-01.robart.cc ([80.123.245.229])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRuds-0005aW-PI
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2020 10:01:21 +0000
Received: from localhost (localhost [127.0.0.1])
 by srv-mta-01.robart.cc (Postfix) with ESMTP id 8082E1C0D5E;
 Mon, 12 Oct 2020 12:01:18 +0200 (CEST)
Received: from srv-mta-01.robart.cc ([127.0.0.1])
 by localhost (srv-mta-01.robart.cc [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id kTsDOySIUQhq; Mon, 12 Oct 2020 12:01:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by srv-mta-01.robart.cc (Postfix) with ESMTP id 51C9E1C0D6A;
 Mon, 12 Oct 2020 12:01:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 srv-mta-01.robart.cc 51C9E1C0D6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=robart.cc;
 s=B016B336-104E-11EA-8E2D-E36DD02BB770; t=1602496878;
 bh=/+OEJWUI5RJ4+8wR3LXaqjt4iAbMPHXznmVHbJWqLqQ=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=EpPOmB/3eKew8sVGjPrQfADES46QM8W2x3LxnUMb4KHARrM4G9z3cdhrv2xainCmC
 jV1Gv/N1FDUZf2Im0oF6bBzfRZXKvqlrNv1KgyF0sVeSKApENXUS/m33ZxdO8o84Nt
 uB0ZnYLZcUs63+jrxoY1hDguNS5p8E0JnQtNNKgF36wzWJf/ZQ2OSm+PssmoH7sxsl
 TGE5pPmNQ4ffAJe7Z/Ftz7l8Ow7uL7WIrYyHa29viFhv5SszW9OWiZ4ECrHBw3Mcqz
 E6oYaAAa6VfbV17DchqPU+Ee4RCmYM9pr34IUYucDYKzwq+qEY0kd/5gk5tMpXHMe4
 k+a00CDn0eZyg==
X-Virus-Scanned: amavisd-new at srv-mta-01.robart.cc
Received: from srv-mta-01.robart.cc ([127.0.0.1])
 by localhost (srv-mta-01.robart.cc [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ZsvoaqKHi_qI; Mon, 12 Oct 2020 12:01:18 +0200 (CEST)
Received: from srv-mda-01.robart.cc (srv-mda-01.robart.cc [10.0.10.21])
 by srv-mta-01.robart.cc (Postfix) with ESMTP id 322CD1C0D5E;
 Mon, 12 Oct 2020 12:01:18 +0200 (CEST)
Date: Mon, 12 Oct 2020 12:01:18 +0200 (CEST)
From: Manuel Dipolt <mdipolt@robart.cc>
To: linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1302710164.236549.1602496878099.JavaMail.zimbra@robart.cc>
Subject: [PATCH v6] mtd: rawnand: sunxi: enable NAND MDMA (Master DMA)
 support for allwinner a23,a33,h3
MIME-Version: 1.0
X-Originating-IP: [10.0.20.40]
X-Mailer: Zimbra 8.8.15_GA_3959 (ZimbraWebClient - FF78 (Linux)/8.8.15_GA_3953)
Thread-Index: FX2apCpytS43djv+pIRNLlZI8iapvw==
Thread-Topic: rawnand: sunxi: enable NAND MDMA (Master DMA) support for
 allwinner a23, a33, h3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_060121_089693_5628146F 
X-CRM114-Status: GOOD (  18.09  )
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
Cc: Roland Ruckerbauer <rruckerbauer@robart.cc>,
 Boris Brezillon <boris.brezillon@collabora.com>, maxime <maxime@cerno.tech>,
 miquel raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch enables NAND MDMA (Master DMA) mode for the Allwinner socs A23/A33/H3. 

Till now dma transfer was via ahb to and from the internal sram where the nfc io is mapped. 
Now mbus dma mode gets set for the sun8i-a23-nand-controller as default. 
Mbus dma requires less configuration like defining a dedicated dma channel in the device tree. 

yours,
Manuel


Signed-off-by: Manuel Dipolt <manuel.dipolt@robart.cc>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 118 +++++++++++++++++++-----------
 1 file changed, 75 insertions(+), 43 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 2a7ca3072f35..21c4ae93075a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -51,6 +51,7 @@
 #define NFC_REG_USER_DATA(x)	(0x0050 + ((x) * 4))
 #define NFC_REG_SPARE_AREA	0x00A0
 #define NFC_REG_PAT_ID		0x00A4
+#define NFC_REG_MDMA_ADDR	0x00C0
 #define NFC_REG_MDMA_CNT	0x00C4
 #define NFC_RAM0_BASE		0x0400
 #define NFC_RAM1_BASE		0x0800
@@ -207,13 +208,13 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * NAND Controller capabilities structure: stores NAND controller capabilities
  * for distinction between compatible strings.
  *
- * @extra_mbus_conf:	Contrary to A10, A10s and A13, accessing internal RAM
+ * @has_mdma:		Use mbus dma mode, otherwise general dma
  *			through MBUS on A23/A33 needs extra configuration.
  * @reg_io_data:	I/O data register
  * @dma_maxburst:	DMA maxburst
  */
 struct sunxi_nfc_caps {
-	bool extra_mbus_conf;
+	bool has_mdma;
 	unsigned int reg_io_data;
 	unsigned int dma_maxburst;
 };
@@ -363,24 +364,34 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
 	if (!ret)
 		return -ENOMEM;
 
-	dmad = dmaengine_prep_slave_sg(nfc->dmac, sg, 1, tdir, DMA_CTRL_ACK);
-	if (!dmad) {
-		ret = -EINVAL;
-		goto err_unmap_buf;
+	if (!nfc->caps->has_mdma) {
+		dmad = dmaengine_prep_slave_sg(nfc->dmac, sg, 1, tdir, DMA_CTRL_ACK);
+		if (!dmad) {
+			ret = -EINVAL;
+			goto err_unmap_buf;
+		}
 	}
 
 	writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD,
 	       nfc->regs + NFC_REG_CTL);
 	writel(nchunks, nfc->regs + NFC_REG_SECTOR_NUM);
 	writel(chunksize, nfc->regs + NFC_REG_CNT);
-	if (nfc->caps->extra_mbus_conf)
+
+	if (nfc->caps->has_mdma) {
+		writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_DMA_TYPE_NORMAL,
+		       nfc->regs + NFC_REG_CTL);
 		writel(chunksize * nchunks, nfc->regs + NFC_REG_MDMA_CNT);
+		writel(sg_dma_address(sg), nfc->regs + NFC_REG_MDMA_ADDR);
+	} else {
+		writel(readl(nfc->regs + NFC_REG_CTL) | NFC_DMA_TYPE_NORMAL,
+		       nfc->regs + NFC_REG_CTL);
 
-	dmat = dmaengine_submit(dmad);
+		dmat = dmaengine_submit(dmad);
 
-	ret = dma_submit_error(dmat);
-	if (ret)
-		goto err_clr_dma_flag;
+		ret = dma_submit_error(dmat);
+		if (ret)
+			goto err_clr_dma_flag;
+	}
 
 	return 0;
 
@@ -911,7 +922,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	unsigned int max_bitflips = 0;
 	int ret, i, raw_mode = 0;
 	struct scatterlist sg;
-	u32 status;
+	u32 status, wait;
 
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
@@ -929,13 +940,18 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	writel((NAND_CMD_RNDOUTSTART << 16) | (NAND_CMD_RNDOUT << 8) |
 	       NAND_CMD_READSTART, nfc->regs + NFC_REG_RCMD_SET);
 
-	dma_async_issue_pending(nfc->dmac);
+	wait = NFC_CMD_INT_FLAG;
+
+	if (nfc->caps->has_mdma)
+		wait |= NFC_DMA_INT_FLAG;
+	else
+		dma_async_issue_pending(nfc->dmac);
 
 	writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD | NFC_DATA_TRANS,
 	       nfc->regs + NFC_REG_CMD);
 
-	ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, false, 0);
-	if (ret)
+	ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
+	if (ret && !nfc->caps->has_mdma)
 		dmaengine_terminate_all(nfc->dmac);
 
 	sunxi_nfc_randomizer_disable(nand);
@@ -1276,6 +1292,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct scatterlist sg;
+	u32 wait;
 	int ret, i;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
@@ -1304,14 +1321,19 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	writel((NAND_CMD_RNDIN << 8) | NAND_CMD_PAGEPROG,
 	       nfc->regs + NFC_REG_WCMD_SET);
 
-	dma_async_issue_pending(nfc->dmac);
+	wait = NFC_CMD_INT_FLAG;
+
+	if (nfc->caps->has_mdma)
+		wait |= NFC_DMA_INT_FLAG;
+	else
+		dma_async_issue_pending(nfc->dmac);
 
 	writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD |
 	       NFC_DATA_TRANS | NFC_ACCESS_DIR,
 	       nfc->regs + NFC_REG_CMD);
 
-	ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, false, 0);
-	if (ret)
+	ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
+	if (ret && !nfc->caps->has_mdma)
 		dmaengine_terminate_all(nfc->dmac);
 
 	sunxi_nfc_randomizer_disable(nand);
@@ -1695,7 +1717,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);
 	ecc->priv = data;
 
-	if (nfc->dmac) {
+	if (nfc->dmac || nfc->caps->has_mdma) {
 		ecc->read_page = sunxi_nfc_hw_ecc_read_page_dma;
 		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage_dma;
 		ecc->write_page = sunxi_nfc_hw_ecc_write_page_dma;
@@ -2058,6 +2080,36 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 	}
 }
 
+static int sunxi_nfc_dma_init(struct sunxi_nfc *nfc, struct resource *r)
+{
+	int ret;
+
+	if (nfc->caps->has_mdma)
+		return 0;
+
+	nfc->dmac = dma_request_chan(nfc->dev, "rxtx");
+	if (IS_ERR(nfc->dmac)) {
+		ret = PTR_ERR(nfc->dmac);
+		if (ret == -EPROBE_DEFER)
+			return ret;
+
+		/* Ignore errors to fall back to PIO mode */
+		dev_warn(nfc->dev, "failed to request rxtx DMA channel: %d\n", ret);
+		nfc->dmac = NULL;
+	} else {
+		struct dma_slave_config dmac_cfg = { };
+
+		dmac_cfg.src_addr = r->start + nfc->caps->reg_io_data;
+		dmac_cfg.dst_addr = dmac_cfg.src_addr;
+		dmac_cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		dmac_cfg.dst_addr_width = dmac_cfg.src_addr_width;
+		dmac_cfg.src_maxburst = nfc->caps->dma_maxburst;
+		dmac_cfg.dst_maxburst = nfc->caps->dma_maxburst;
+		dmaengine_slave_config(nfc->dmac, &dmac_cfg);
+	}
+	return 0;
+}
+
 static int sunxi_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -2132,30 +2184,10 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_ahb_reset_reassert;
 
-	nfc->dmac = dma_request_chan(dev, "rxtx");
-	if (IS_ERR(nfc->dmac)) {
-		ret = PTR_ERR(nfc->dmac);
-		if (ret == -EPROBE_DEFER)
-			goto out_ahb_reset_reassert;
-
-		/* Ignore errors to fall back to PIO mode */
-		dev_warn(dev, "failed to request rxtx DMA channel: %d\n", ret);
-		nfc->dmac = NULL;
-	} else {
-		struct dma_slave_config dmac_cfg = { };
+	ret = sunxi_nfc_dma_init(nfc, r);
 
-		dmac_cfg.src_addr = r->start + nfc->caps->reg_io_data;
-		dmac_cfg.dst_addr = dmac_cfg.src_addr;
-		dmac_cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-		dmac_cfg.dst_addr_width = dmac_cfg.src_addr_width;
-		dmac_cfg.src_maxburst = nfc->caps->dma_maxburst;
-		dmac_cfg.dst_maxburst = nfc->caps->dma_maxburst;
-		dmaengine_slave_config(nfc->dmac, &dmac_cfg);
-
-		if (nfc->caps->extra_mbus_conf)
-			writel(readl(nfc->regs + NFC_REG_CTL) |
-			       NFC_DMA_TYPE_NORMAL, nfc->regs + NFC_REG_CTL);
-	}
+	if (ret)
+		goto out_ahb_reset_reassert;
 
 	platform_set_drvdata(pdev, nfc);
 
@@ -2202,7 +2234,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
-	.extra_mbus_conf = true,
+	.has_mdma = true,
 	.reg_io_data = NFC_REG_A23_IO_DATA,
 	.dma_maxburst = 8,
 };
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
