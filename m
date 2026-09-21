Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5108AC982E1
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 09:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWnn7T4kuP2XpSUGqRsXN49RT3Szx7mq2xSFqc3Aheo=; b=ctEif9nVUX+vzc
	GU4UmdYqZRk+loMMmG1I3N5xDkvDS2bdawkJ1zn3VT9PMPznTjNcpA+1dAXUeo38sytJ+8Vys0nxp
	aBXUTeLFD59XjA9ufoLRGjIWoaOLnsNxV8cy8I7Vukjxm6LeMdRtdIbQg+ne9tIEl6/SMsvaIGbiY
	lO6TJ4/QLBsH1bPRxslXTCGRs+UCQqEyACdp7Qbie8YlVzbrw1+cFEcNqok/8AD3GQ5uwZhqJ9MQO
	LAjVp0pw6+ky25Tj6GZQxdZYQAWQNxE0qRRWEwhQOnwOHsU31k+893bBJzNZAhYZXkTy4xx/uve2+
	lSJXpN3ZdcTuiiNNpzFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aTy-00000001Xkg-1JUn;
	Mon, 21 Sep 2026 09:38:42 +0000
Received: from spam01.horizon.auto ([42.62.85.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aTv-00000001Xij-0uLk
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 09:38:41 +0000
Received: from spam01.horizon.auto (exchange003.hobot.cc [10.69.1.10])
	by spam01.horizon.auto with ESMTPS id 68L9c36m068860
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
	Mon, 21 Sep 2026 17:38:03 +0800 (+08)
	(envelope-from fei.xie@horizon.auto)
Received: from server227.horizon.auto (10.9.0.252) by exchange003.hobot.cc
 (10.69.1.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Mon, 21 Sep 2026
 17:38:02 +0800
From: Fei Xie <fei.xie@horizon.auto>
To: Mark Brown <broonie@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger
	<richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Parshuram Thombare <pthombar@cadence.com>, <linux-spi@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, "fei.xie"
	<fei.xie@horizon.auto>
Subject: [RFC PATCH 3/4] spi: cadence-xspi: factor out reusable ACMD helpers
Date: Mon, 21 Sep 2026 17:37:00 +0800
Message-ID: <20260921093701.1341766-4-fei.xie@horizon.auto>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921093701.1341766-1-fei.xie@horizon.auto>
References: <20260921093701.1341766-1-fei.xie@horizon.auto>
MIME-Version: 1.0
X-Originating-IP: [10.9.0.252]
X-ClientProxiedBy: exchange004.hobot.cc (10.9.15.112) To exchange003.hobot.cc
 (10.69.1.10)
X-DKIM-Results: exchange003.hobot.cc; dkim=none;
X-DNSRBL: 
X-MAIL: spam01.horizon.auto 68L9c36m068860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horizon.auto;
	s=auto; t=1789983498;
	bh=1b1haRp//ZE7fcCGYJ0hGUgE8n+xITtgL9GI45T07h8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QWnT/mDeQvfT6OKpP2lYYoygkJByifjObIVo58BFETHmo1l4xdWt0U1fibOlWQc8P
	 jkgi2JQMO90mP/H5wrA5hdErLtoQavAQSWNJLOZ2ilP0RtkpSGxQGHSEFCq13iBZmD
	 ntrieEA9g4Q7y2Krtj9fofbniga0dEFCEBL8tAYsG06wHsERv9g6LOwdv8kvw7Hr1k
	 SKLKoMIOHaoxrKFhXcOf0b9klaKRRfOqJZ7Qjqx/5lYsS32mAf5Q/pou17jgsUIwxn
	 5qssNBpXhxZfDNJaq2pK7vsn1BaeEkXR+9Mi1yaxqFOG9kMnXpWwlAI26GArYbEpnR
	 d/aAnPXa6zQuQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_023839_930597_BC0079B3 
X-CRM114-Status: GOOD (  17.03  )
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

From: "fei.xie" <fei.xie@horizon.auto>

Move DMA buffer allocation, XIP setup and PIO command execution into
common helpers.

Keep SPI NAND address conversion and operation state handling in
NAND-specific wrappers. This is a behavior-neutral preparation for
sharing the ACMD PIO and MDMA path with other flash types.

Signed-off-by: fei.xie <fei.xie@horizon.auto>
---
 drivers/spi/spi-cadence-xspi.c | 223 ++++++++++++++++++++-------------
 1 file changed, 136 insertions(+), 87 deletions(-)

diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-xspi.c
index 0fedf6cd6a590..114c1e0fd79fb 100644
--- a/drivers/spi/spi-cadence-xspi.c
+++ b/drivers/spi/spi-cadence-xspi.c
@@ -822,10 +822,35 @@ static void cdns_xspi_nand_reset_seq_init(struct cdns_xspi_dev *cdns_xspi)
 	writel(cfg, cdns_xspi->iobase + CDNS_XSPI_RST_SEQ_CFG_0);
 }
 
+static int cdns_xspi_acmd_alloc_dma_buf(struct cdns_xspi_dev *cdns_xspi,
+					size_t len)
+{
+	cdns_xspi->dma_buf = dmam_alloc_coherent(cdns_xspi->dev, len,
+						 &cdns_xspi->dma_addr,
+						 GFP_KERNEL);
+	if (!cdns_xspi->dma_buf)
+		return -ENOMEM;
+
+	cdns_xspi->dma_buf_len = len;
+
+	return 0;
+}
+
+static void cdns_xspi_acmd_disable_xip(struct cdns_xspi_dev *cdns_xspi)
+{
+	u32 reg_val;
+
+	reg_val = readl(cdns_xspi->iobase + CDNS_XSPI_XIP_MODE_CFG);
+	if (reg_val & CDNS_XSPI_XIP_EN) {
+		reg_val &= ~CDNS_XSPI_XIP_EN;
+		writel(reg_val, cdns_xspi->iobase + CDNS_XSPI_XIP_MODE_CFG);
+	}
+}
+
 static int cdns_xspi_nand_init(struct cdns_xspi_dev *cdns_xspi,
 			       struct spinand_device *spinand)
 {
-	u32 reg_val;
+	int ret;
 
 	cdns_xspi_nand_cfg_seq_init(cdns_xspi, spinand);
 	cdns_xspi_nand_read_seq_init(cdns_xspi, spinand);
@@ -835,19 +860,12 @@ static int cdns_xspi_nand_init(struct cdns_xspi_dev *cdns_xspi,
 	cdns_xspi_nand_status_seq_init(cdns_xspi);
 	cdns_xspi_nand_erase_seq_init(cdns_xspi, spinand);
 
-	reg_val = readl(cdns_xspi->iobase + CDNS_XSPI_XIP_MODE_CFG);
-	if (reg_val & CDNS_XSPI_XIP_EN) {
-		reg_val &= ~CDNS_XSPI_XIP_EN;
-		writel(reg_val, cdns_xspi->iobase + CDNS_XSPI_XIP_MODE_CFG);
-	}
-	cdns_xspi->dma_buf_len = spinand->base.memorg.pagesize +
-				 spinand->base.memorg.oobsize;
-	cdns_xspi->dma_buf = dmam_alloc_coherent(cdns_xspi->dev,
-						 cdns_xspi->dma_buf_len,
-						 &cdns_xspi->dma_addr,
-						 GFP_KERNEL);
-	if (!cdns_xspi->dma_buf)
-		return -ENOMEM;
+	cdns_xspi_acmd_disable_xip(cdns_xspi);
+	ret = cdns_xspi_acmd_alloc_dma_buf(cdns_xspi,
+					   spinand->base.memorg.pagesize +
+					   spinand->base.memorg.oobsize);
+	if (ret)
+		return ret;
 
 	cdns_xspi->acmd_info.initialized = true;
 
@@ -1070,12 +1088,10 @@ static u32 cdns_xspi_acmd_cmd(struct cdns_xspi_dev *cdns_xspi, u32 type,
 	       FIELD_PREP(CDNS_XSPI_ACMD_CMD_TYPE, type);
 }
 
-static int cdns_xspi_pio_mdma_erase(struct cdns_xspi_dev *cdns_xspi,
-				    struct spinand_device *spinand,
-				    const struct spi_mem_op *op)
+static int cdns_xspi_pio_erase(struct cdns_xspi_dev *cdns_xspi,
+			       u64 xspi_addr)
 {
 	u32 cmd_regs[6] = { 0 };
-	u64 xspi_addr;
 	int ret;
 
 	ret = cdns_xspi_wait_for_controller_idle(cdns_xspi);
@@ -1085,10 +1101,6 @@ static int cdns_xspi_pio_mdma_erase(struct cdns_xspi_dev *cdns_xspi,
 		return ret;
 	}
 
-	ret = cdns_xspi_nand_addr(spinand, op->addr.val, 0, &xspi_addr);
-	if (ret)
-		return ret;
-
 	if (upper_32_bits(xspi_addr)) {
 		dev_err(cdns_xspi->dev,
 			"erase address 0x%llx exceeds the ACMD PIO range\n",
@@ -1137,71 +1149,141 @@ static int cdns_xspi_pio_reset(struct cdns_xspi_dev *cdns_xspi)
 }
 
 static int cdns_xspi_pio_mdma_program(struct cdns_xspi_dev *cdns_xspi,
-				      struct spinand_device *spinand,
-				      const struct spi_mem_op *op)
+				      u64 xspi_addr, const void *buf,
+				      size_t nbytes)
 {
 	u32 cmd_regs[6] = { 0 };
-	u64 xspi_addr;
 	int ret;
 
-	if (!cdns_xspi->out_buffer || !cdns_xspi->acmd_info.data_nbytes) {
-		dev_err(cdns_xspi->dev, "missing program-load data\n");
-		ret = -EINVAL;
-		goto out_clear_program_state;
-	}
+	if (!buf || !nbytes)
+		return -EINVAL;
 
-	if (cdns_xspi->acmd_info.data_nbytes > cdns_xspi->dma_buf_len) {
-		ret = -EMSGSIZE;
-		goto out_clear_program_state;
+	if (nbytes > cdns_xspi->dma_buf_len)
+		return -EMSGSIZE;
+
+	if (upper_32_bits(xspi_addr)) {
+		dev_err(cdns_xspi->dev,
+			"program address 0x%llx exceeds the ACMD PIO range\n",
+			xspi_addr);
+		return -ERANGE;
 	}
 
-	memcpy(cdns_xspi->dma_buf, cdns_xspi->out_buffer,
-	       cdns_xspi->acmd_info.data_nbytes);
+	memcpy(cdns_xspi->dma_buf, buf, nbytes);
 
 	ret = cdns_xspi_wait_for_controller_idle(cdns_xspi);
 	if (ret) {
 		dev_err(cdns_xspi->dev,
 			"controller did not become idle before program\n");
-		goto out_clear_program_state;
+		return ret;
 	}
 
-	ret = cdns_xspi_nand_addr(spinand, op->addr.val,
-				  cdns_xspi->acmd_info.column_addr,
-				  &xspi_addr);
-	if (ret)
-		goto out_clear_program_state;
+	cmd_regs[1] = lower_32_bits(xspi_addr);
+	cmd_regs[2] = lower_32_bits(cdns_xspi->dma_addr);
+	cmd_regs[3] = upper_32_bits(cdns_xspi->dma_addr);
+	cmd_regs[4] = nbytes - 1;
+	cmd_regs[0] = cdns_xspi_acmd_cmd(cdns_xspi,
+					 CDNS_XSPI_ACMD_PROG_OP,
+					 CDNS_XSPI_ACMD_DATA_THREAD, true);
+
+	return cdns_xspi_acmd_run(cdns_xspi, cmd_regs,
+				  CDNS_XSPI_ACMD_DATA_THREAD);
+}
+
+static int cdns_xspi_pio_mdma_read(struct cdns_xspi_dev *cdns_xspi,
+				   u64 xspi_addr, void *buf, size_t nbytes)
+{
+	u32 cmd_regs[6] = { 0 };
+	int ret;
+
+	if (!buf || !nbytes)
+		return -EINVAL;
+
+	if (nbytes > cdns_xspi->dma_buf_len)
+		return -EMSGSIZE;
+
+	ret = cdns_xspi_wait_for_controller_idle(cdns_xspi);
+	if (ret) {
+		dev_err(cdns_xspi->dev,
+			"controller did not become idle before read\n");
+		return ret;
+	}
 
 	if (upper_32_bits(xspi_addr)) {
 		dev_err(cdns_xspi->dev,
-			"program address 0x%llx exceeds the ACMD PIO range\n",
+			"read address 0x%llx exceeds the ACMD PIO range\n",
 			xspi_addr);
-		ret = -ERANGE;
-		goto out_clear_program_state;
+		return -ERANGE;
 	}
 
 	cmd_regs[1] = lower_32_bits(xspi_addr);
 	cmd_regs[2] = lower_32_bits(cdns_xspi->dma_addr);
 	cmd_regs[3] = upper_32_bits(cdns_xspi->dma_addr);
-	cmd_regs[4] = cdns_xspi->acmd_info.data_nbytes - 1;
+	cmd_regs[4] = nbytes - 1;
 	cmd_regs[0] = cdns_xspi_acmd_cmd(cdns_xspi,
-					 CDNS_XSPI_ACMD_PROG_OP,
+					 CDNS_XSPI_ACMD_READ_OP,
 					 CDNS_XSPI_ACMD_DATA_THREAD, true);
 
 	ret = cdns_xspi_acmd_run(cdns_xspi, cmd_regs,
 				 CDNS_XSPI_ACMD_DATA_THREAD);
+	if (ret) {
+		dev_err(cdns_xspi->dev, "ACMD read failed: %d\n", ret);
+		return ret;
+	}
+
+	memcpy(buf, cdns_xspi->dma_buf, nbytes);
+
+	return 0;
+}
+
+static int cdns_xspi_nand_pio_erase(struct cdns_xspi_dev *cdns_xspi,
+				    struct spinand_device *spinand,
+				    const struct spi_mem_op *op)
+{
+	u64 xspi_addr;
+	int ret;
+
+	ret = cdns_xspi_nand_addr(spinand, op->addr.val, 0, &xspi_addr);
+	if (ret)
+		return ret;
+
+	return cdns_xspi_pio_erase(cdns_xspi, xspi_addr);
+}
+
+static int cdns_xspi_nand_pio_program(struct cdns_xspi_dev *cdns_xspi,
+				      struct spinand_device *spinand,
+				      const struct spi_mem_op *op)
+{
+	u64 xspi_addr;
+	int ret;
+
+	if (!cdns_xspi->out_buffer || !cdns_xspi->acmd_info.data_nbytes) {
+		dev_err(cdns_xspi->dev, "missing program-load data\n");
+		ret = -EINVAL;
+		goto out_clear_program_state;
+	}
+
+	ret = cdns_xspi_nand_addr(spinand, op->addr.val,
+				  cdns_xspi->acmd_info.column_addr,
+				  &xspi_addr);
+	if (ret)
+		goto out_clear_program_state;
+
+	ret = cdns_xspi_pio_mdma_program(cdns_xspi, xspi_addr,
+					 cdns_xspi->out_buffer,
+					 cdns_xspi->acmd_info.data_nbytes);
 
 out_clear_program_state:
 	cdns_xspi->acmd_info.column_addr = 0;
 	cdns_xspi->acmd_info.data_nbytes = 0;
 	cdns_xspi->out_buffer = NULL;
+
 	return ret;
 }
 
-static int cdns_xspi_pio_mdma_read(struct cdns_xspi_dev *cdns_xspi,
+static int cdns_xspi_nand_pio_read(struct cdns_xspi_dev *cdns_xspi,
 				   struct spinand_device *spinand,
 				   const struct spi_mem_op *op)
 {
-	u32 cmd_regs[6] = { 0 };
 	u64 xspi_addr;
 	int ret;
 
@@ -1217,52 +1299,19 @@ static int cdns_xspi_pio_mdma_read(struct cdns_xspi_dev *cdns_xspi,
 		goto out_clear_read_state;
 	}
 
-	if (op->data.nbytes > cdns_xspi->dma_buf_len) {
-		ret = -EMSGSIZE;
-		goto out_clear_read_state;
-	}
-
-	ret = cdns_xspi_wait_for_controller_idle(cdns_xspi);
-	if (ret) {
-		dev_err(cdns_xspi->dev,
-			"controller did not become idle before read\n");
-		goto out_clear_read_state;
-	}
-
 	ret = cdns_xspi_nand_addr(spinand,
 				  cdns_xspi->acmd_info.row_addr,
 				  op->addr.val, &xspi_addr);
 	if (ret)
 		goto out_clear_read_state;
 
-	if (upper_32_bits(xspi_addr)) {
-		dev_err(cdns_xspi->dev,
-			"read address 0x%llx exceeds the ACMD PIO range\n",
-			xspi_addr);
-		ret = -ERANGE;
-		goto out_clear_read_state;
-	}
-
-	cmd_regs[1] = lower_32_bits(xspi_addr);
-	cmd_regs[2] = lower_32_bits(cdns_xspi->dma_addr);
-	cmd_regs[3] = upper_32_bits(cdns_xspi->dma_addr);
-	cmd_regs[4] = op->data.nbytes - 1;
-	cmd_regs[0] = cdns_xspi_acmd_cmd(cdns_xspi,
-					 CDNS_XSPI_ACMD_READ_OP,
-					 CDNS_XSPI_ACMD_DATA_THREAD, true);
-
-	ret = cdns_xspi_acmd_run(cdns_xspi, cmd_regs,
-				 CDNS_XSPI_ACMD_DATA_THREAD);
-	if (ret) {
-		dev_err(cdns_xspi->dev, "ACMD read failed: %d\n", ret);
-		goto out_clear_read_state;
-	}
-
-	memcpy(op->data.buf.in, cdns_xspi->dma_buf, op->data.nbytes);
+	ret = cdns_xspi_pio_mdma_read(cdns_xspi, xspi_addr,
+				      op->data.buf.in, op->data.nbytes);
 
 out_clear_read_state:
 	cdns_xspi->acmd_info.row_addr_valid = false;
 	cdns_xspi->acmd_info.row_addr = 0;
+
 	return ret;
 }
 
@@ -1334,17 +1383,17 @@ static int cdns_xspi_send_pio_command(struct cdns_xspi_dev *cdns_xspi,
 		return cdns_xspi_pio_reset(cdns_xspi);
 
 	case CDNS_XSPI_NAND_OP_BLOCK_ERASE:
-		return cdns_xspi_pio_mdma_erase(cdns_xspi, spinand, op);
+		return cdns_xspi_nand_pio_erase(cdns_xspi, spinand, op);
 
 	case CDNS_XSPI_NAND_OP_PROGRAM_EXECUTE:
-		return cdns_xspi_pio_mdma_program(cdns_xspi, spinand, op);
+		return cdns_xspi_nand_pio_program(cdns_xspi, spinand, op);
 
 	default:
 		break;
 	}
 
 	if (read_cache && op->cmd.opcode == read_cache->cmd.opcode)
-		return cdns_xspi_pio_mdma_read(cdns_xspi, spinand, op);
+		return cdns_xspi_nand_pio_read(cdns_xspi, spinand, op);
 
 use_stig:
 	/* ACMD does not consume this operation; execute it through STIG. */
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
