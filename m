Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F9AC43217
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 08:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=agMyf1UaHdVw/LE07qFRqGNLj7FPlasVEOsRRyK8cfM=; b=WgOvPo5t1SDfyY
	sBPq0VG0af8fFq0EGkz+notN5v9s/bU/ecE5utArsqZPtLbJBjoK3caBowsTcGxDG1C+AXMIIk6s+
	ZmQlHY5RxAxIVAtdADrvXhvEesHDMBSIC0vYuBfpdYDrX7Iouo56Kio2vpXe4FGxXqx6jQ/2iRB2u
	0M6MbVeGVK9DG4xPQyS8slCD3g+c/b9MLg2ZGQVw9G/ROrxBmiwdNbjtq6PMSzZ9qvbE5/hFeQ1lm
	pA7ic3Dbnleuf8+r/pxdxE4z7Kr9EHMYYVT35eBHdKh592mzW57hhNFJvDwwUCpb//uaAAYpJyHMU
	f9qQT56OWJzgSfJz/wKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4fPG-00Ambq-BU; Tue, 04 Jan 2022 08:42:58 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4fJO-00AkkJ-1S
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 08:36:55 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E915B1C0008;
 Tue,  4 Jan 2022 08:36:50 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v9 10/13] spi: mxic: Create a helper to configure the
 controller before an operation
Date: Tue,  4 Jan 2022 09:36:28 +0100
Message-Id: <20220104083631.40776-11-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220104083631.40776-1-miquel.raynal@bootlin.com>
References: <20220104083631.40776-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_003654_262370_E88DE30A 
X-CRM114-Status: GOOD (  12.22  )
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

Create the mxic_spi_set_hc_cfg() helper to configure the HC_CFG
register. This helper will soon be used by the dirmap implementation and
having this code factorized out earlier will clarify this addition.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-mxic.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index 22a82f5f74b5..c45f949a864d 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -280,6 +280,22 @@ static void mxic_spi_hw_init(struct mxic_spi *mxic)
 	       mxic->regs + HC_CFG);
 }
 
+static u32 mxic_spi_prep_hc_cfg(struct spi_device *spi, u32 flags)
+{
+	int nio = 1;
+
+	if (spi->mode & (SPI_TX_OCTAL | SPI_RX_OCTAL))
+		nio = 8;
+	else if (spi->mode & (SPI_TX_QUAD | SPI_RX_QUAD))
+		nio = 4;
+	else if (spi->mode & (SPI_TX_DUAL | SPI_RX_DUAL))
+		nio = 2;
+
+	return flags | HC_CFG_NIO(nio) |
+	       HC_CFG_TYPE(spi->chip_select, HC_CFG_TYPE_SPI_NOR) |
+	       HC_CFG_SLV_ACT(spi->chip_select) | HC_CFG_IDLE_SIO_LVL(1);
+}
+
 static int mxic_spi_data_xfer(struct mxic_spi *mxic, const void *txbuf,
 			      void *rxbuf, unsigned int len)
 {
@@ -349,7 +365,7 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 				const struct spi_mem_op *op)
 {
 	struct mxic_spi *mxic = spi_master_get_devdata(mem->spi->master);
-	int nio = 1, i, ret;
+	int i, ret;
 	u32 ss_ctrl;
 	u8 addr[8], cmd[2];
 
@@ -357,18 +373,9 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 	if (ret)
 		return ret;
 
-	if (mem->spi->mode & (SPI_TX_OCTAL | SPI_RX_OCTAL))
-		nio = 8;
-	else if (mem->spi->mode & (SPI_TX_QUAD | SPI_RX_QUAD))
-		nio = 4;
-	else if (mem->spi->mode & (SPI_TX_DUAL | SPI_RX_DUAL))
-		nio = 2;
-
-	writel(HC_CFG_NIO(nio) |
-	       HC_CFG_TYPE(mem->spi->chip_select, HC_CFG_TYPE_SPI_NOR) |
-	       HC_CFG_SLV_ACT(mem->spi->chip_select) | HC_CFG_IDLE_SIO_LVL(1) |
-	       HC_CFG_MAN_CS_EN,
+	writel(mxic_spi_prep_hc_cfg(mem->spi, HC_CFG_MAN_CS_EN),
 	       mxic->regs + HC_CFG);
+
 	writel(HC_EN_BIT, mxic->regs + HC_EN);
 
 	ss_ctrl = OP_CMD_BYTES(op->cmd.nbytes) |
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
