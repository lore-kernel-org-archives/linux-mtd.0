Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEDBC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 07:38:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 021AF2074D
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 07:38:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E1Ed47C1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 021AF2074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=D1AvXEvQQ1CfzNcjBA4MxWSqJEYxrVDkxiWqWo2/vAs=; b=E1Ed47C1u+YwBT6vw/Ka8WLrOp
	AiUs1WyfmynH+bm+y3sGNGWH6ejy0SvB/nGtikjx2rUiznceJhUMZvbr4KuLSh3sOST6rZmPGpvD0
	JuJzgZ17c7XcT44Vy8PyOn3SwBRFwljcDt5HE+8Jd1fIKmz9zewK2vr64BqFCDmGE0WcSaTI0PllT
	e2stfFpGbPGxk3I6mShcS552coBL9YtNkNMAseG5SWnLwxA6eTnD13b8FsEZMafEJLVLFd/X6s8M3
	jBRRh7Xac23uqMvWg67WyYvZjgGEtiZUHb7hnUztflsiZJkUEaM8+cSg49bhuz0J9ZJcLjLtJaRxx
	Oo/S3Bjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeZan-0002I8-AP; Fri, 29 May 2020 07:38:13 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeZZd-0000w7-MH
 for linux-mtd@lists.infradead.org; Fri, 29 May 2020 07:37:03 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG4.macronix.com with ESMTP id 04T7aHq0067318;
 Fri, 29 May 2020 15:36:21 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: broonie@kernel.org, tudor.ambarus@microchip.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, boris.brezillon@collabora.com,
 matthias.bgg@gmail.com
Subject: [PATCH v4 4/7] mtd: spi-nor: core: add configuration register 2 read
 & write support
Date: Fri, 29 May 2020 15:36:12 +0800
Message-Id: <1590737775-4798-5-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1590737775-4798-1-git-send-email-masonccyang@mxic.com.tw>
References: <1590737775-4798-1-git-send-email-masonccyang@mxic.com.tw>
X-MAIL: TWHMLLG4.macronix.com 04T7aHq0067318
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_003702_109804_D8207B1C 
X-CRM114-Status: UNSURE (   9.33  )
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
Cc: juliensu@mxic.com.tw, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 Mason Yang <masonccyang@mxic.com.tw>, p.yadav@ti.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Configuration register 2 is to set the device operation condition like
STR or DTR mode at address offset 0 and DQS mode at address offset 0x200.

Each device has various address offset for it's specific operatoin
setting.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 drivers/mtd/spi-nor/core.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/core.h |  2 ++
 2 files changed, 80 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 3799417..fed6236 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -269,6 +269,84 @@ int spi_nor_write_disable(struct spi_nor *nor)
 }
 
 /**
+ * spi_nor_read_cr2() - Read the Configuration Register 2.
+ * @nor:	pointer to 'struct spi_nor'.
+ * @addr:	offset address to read.
+ * @cr2:	pointer to a DMA-able buffer where the value of the
+ *              Configuration Register 2  will be written.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int spi_nor_read_cr2(struct spi_nor *nor, u32 addr, u8 *cr2)
+{
+	int ret;
+	u8 cmd = nor->params->rd_reg_cmd;
+
+	if (nor->spimem) {
+		struct spi_mem_op op =
+			SPI_MEM_OP(SPI_MEM_OP_CMD(cmd, 1),
+				   SPI_MEM_OP_ADDR(4, addr, 1),
+				   SPI_MEM_OP_DUMMY(4, 1),
+				   SPI_MEM_OP_DATA_IN(1, cr2, 1));
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		if (spi_nor_protocol_is_dtr(nor->reg_proto))
+			ret = -ENOTSUPP;
+		else
+			ret = nor->controller_ops->read_reg(nor, cmd, cr2, 1);
+	}
+
+	if (ret)
+		dev_dbg(nor->dev, "error %d reading CR2\n", ret);
+
+	return ret;
+}
+
+/**
+ * spi_nor_write_cr2() - Write the Configuration Register 2.
+ * @nor:	pointer to 'struct spi_nor'.
+ * @addr:	offset address to write.
+ * @cr2:	pointer to a DMA-able buffer where the value of the
+ *              Configuratin Register 2 will be read.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int spi_nor_write_cr2(struct spi_nor *nor, u32 addr, u8 *cr2)
+{
+	int ret;
+	u8 cmd = nor->params->wr_reg_cmd;
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op =
+			SPI_MEM_OP(SPI_MEM_OP_CMD(cmd, 1),
+				   SPI_MEM_OP_ADDR(4, addr, 1),
+				   SPI_MEM_OP_NO_DUMMY,
+				   SPI_MEM_OP_DATA_OUT(1, cr2, 1));
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		if (spi_nor_protocol_is_dtr(nor->reg_proto))
+			ret = -ENOTSUPP;
+		else
+			ret = nor->controller_ops->write_reg(nor, cmd, cr2, 1);
+	}
+
+	if (ret)
+		dev_dbg(nor->dev, "error %d write CFG Reg 2\n", ret);
+
+	return ret;
+}
+
+/**
  * spi_nor_read_sr() - Read the Status Register.
  * @nor:	pointer to 'struct spi_nor'.
  * @sr:		pointer to a DMA-able buffer where the value of the
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 8de7f53..0eb07ca 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -434,6 +434,8 @@ struct spi_nor_manufacturer {
 
 int spi_nor_write_enable(struct spi_nor *nor);
 int spi_nor_write_disable(struct spi_nor *nor);
+int spi_nor_read_cr2(struct spi_nor *nor, u32 addr, u8 *cr2);
+int spi_nor_write_cr2(struct spi_nor *nor, u32 addr, u8 *cr2);
 int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable);
 int spi_nor_write_ear(struct spi_nor *nor, u8 ear);
 int spi_nor_wait_till_ready(struct spi_nor *nor);
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
