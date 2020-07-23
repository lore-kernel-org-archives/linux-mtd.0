Return-Path: <SRS0=DvMR=BC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63071C433E5
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2020 13:13:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D80FB20737
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2020 13:13:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bki1sQWR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D80FB20737
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yadavpratyush.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7tUy3UvhSvmuY2ePkx6ler4KY5zdnKfE4GNSf+q5am0=; b=bki1sQWR4030eMJRsceP2hX7R
	TN5f3791Ox8LIhi5jpWTZv+a2T4uDvls5ooHlhFA3OYXzWTpz8xxnL5Sh5u9y6EFpCswk6mnKIlAV
	VLYH5YvnIAVvXQQR9sdGop6Jrq4oLDc8/PP/4p4h5Yh3aeJ/NgyiEfscSVTlVryDCc4H9BY2Ozc02
	uJqVj+UyWq2VqD1/TC6xyI9wfCEbjxha5A2yMNeDThGEtE5Qa1bNbwoBKAIrdGVj4aIjspYVPkxpS
	OZG3afK0HZsxdbgsdQkx0/VyM0lv1r7AtGjCqv2FIEsAWt0OtTmIOqWENEoVK+890/4yqQBOH43kF
	9YsLLCueA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyb1Z-0003Uo-Ti; Thu, 23 Jul 2020 13:12:38 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyb1T-0003T0-7M
 for linux-mtd@lists.infradead.org; Thu, 23 Jul 2020 13:12:34 +0000
X-Originating-IP: 42.109.196.68
Received: from localhost.localdomain (unknown [42.109.196.68])
 (Authenticated sender: me@yadavpratyush.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 986591C0014;
 Thu, 23 Jul 2020 13:12:26 +0000 (UTC)
From: Pratyush Yadav <me@yadavpratyush.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v11 01/14] mtd: spi-nor: core: add spi_nor_{read,
 write}_reg() helpers
Date: Thu, 23 Jul 2020 18:41:50 +0530
Message-Id: <20200723131203.40916-2-me@yadavpratyush.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200723131203.40916-1-me@yadavpratyush.com>
References: <20200723131203.40916-1-me@yadavpratyush.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_091231_476664_0C783367 
X-CRM114-Status: GOOD (  10.56  )
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
Cc: Pratyush Yadav <me@yadavpratyush.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Sekhar Nori <nsekhar@ti.com>,
 Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Pratyush Yadav <p.yadav@ti.com>

They are thin wrappers around nor->controller_ops->{read,write}_reg().
In a future commit DTR support will be added. These ops can not be
supported by the {read,write}_reg() hooks and these helpers will make it
easier to reject those calls.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.c | 110 ++++++++++++++++---------------------
 1 file changed, 47 insertions(+), 63 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 65eff4ce6ab1..2ccf2c154779 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -82,6 +82,18 @@ static int spi_nor_spimem_exec_op(struct spi_nor *nor, struct spi_mem_op *op)
 	return spi_mem_exec_op(nor->spimem, op);
 }
 
+static int spi_nor_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
+			    size_t len)
+{
+	return nor->controller_ops->read_reg(nor, opcode, buf, len);
+}
+
+static int spi_nor_write_reg(struct spi_nor *nor, u8 opcode, const u8 *buf,
+			     size_t len)
+{
+	return nor->controller_ops->write_reg(nor, opcode, buf, len);
+}
+
 /**
  * spi_nor_spimem_read_data() - read data from flash's memory region via
  *                              spi-mem
@@ -228,10 +240,8 @@ int spi_nor_write_enable(struct spi_nor *nor)
 				   SPI_MEM_OP_NO_DATA);
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WREN,
-						     NULL, 0);
-	}
+	} else
+		ret = spi_nor_write_reg(nor, SPINOR_OP_WREN, NULL, 0);
 
 	if (ret)
 		dev_dbg(nor->dev, "error %d on Write Enable\n", ret);
@@ -257,10 +267,8 @@ int spi_nor_write_disable(struct spi_nor *nor)
 				   SPI_MEM_OP_NO_DATA);
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WRDI,
-						     NULL, 0);
-	}
+	} else
+		ret = spi_nor_write_reg(nor, SPINOR_OP_WRDI, NULL, 0);
 
 	if (ret)
 		dev_dbg(nor->dev, "error %d on Write Disable\n", ret);
@@ -288,10 +296,8 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
 				   SPI_MEM_OP_DATA_IN(1, sr, 1));
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR,
-						    sr, 1);
-	}
+	} else
+		ret = spi_nor_read_reg(nor, SPINOR_OP_RDSR, sr, 1);
 
 	if (ret)
 		dev_dbg(nor->dev, "error %d reading SR\n", ret);
@@ -319,10 +325,8 @@ static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
 				   SPI_MEM_OP_DATA_IN(1, fsr, 1));
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDFSR,
-						    fsr, 1);
-	}
+	} else
+		ret = spi_nor_read_reg(nor, SPINOR_OP_RDFSR, fsr, 1);
 
 	if (ret)
 		dev_dbg(nor->dev, "error %d reading FSR\n", ret);
@@ -351,9 +355,8 @@ static int spi_nor_read_cr(struct spi_nor *nor, u8 *cr)
 				   SPI_MEM_OP_DATA_IN(1, cr, 1));
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDCR, cr, 1);
-	}
+	} else
+		ret = spi_nor_read_reg(nor, SPINOR_OP_RDCR, cr, 1);
 
 	if (ret)
 		dev_dbg(nor->dev, "error %d reading CR\n", ret);
@@ -384,12 +387,11 @@ int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 				  SPI_MEM_OP_NO_DATA);
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = nor->controller_ops->write_reg(nor,
-						     enable ? SPINOR_OP_EN4B :
-							      SPINOR_OP_EX4B,
-						     NULL, 0);
-	}
+	} else
+		ret = spi_nor_write_reg(nor,
+					enable ? SPINOR_OP_EN4B :
+						 SPINOR_OP_EX4B,
+					NULL, 0);
 
 	if (ret)
 		dev_dbg(nor->dev, "error %d setting 4-byte mode\n", ret);
@@ -420,10 +422,8 @@ static int spansion_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 				   SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 1));
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_BRWR,
-						     nor->bouncebuf, 1);
-	}
+	} else
+		ret = spi_nor_write_reg(nor, SPINOR_OP_BRWR, nor->bouncebuf, 1);
 
 	if (ret)
 		dev_dbg(nor->dev, "error %d setting 4-byte mode\n", ret);
@@ -452,10 +452,8 @@ int spi_nor_write_ear(struct spi_nor *nor, u8 ear)
 				   SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 1));
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WREAR,
-						     nor->bouncebuf, 1);
-	}
+	} else
+		ret = spi_nor_write_reg(nor, SPINOR_OP_WREAR, nor->bouncebuf, 1);
 
 	if (ret)
 		dev_dbg(nor->dev, "error %d writing EAR\n", ret);
@@ -483,10 +481,8 @@ int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
 				   SPI_MEM_OP_DATA_IN(1, sr, 1));
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_XRDSR,
-						    sr, 1);
-	}
+	} else
+		ret = spi_nor_read_reg(nor, SPINOR_OP_XRDSR, sr, 1);
 
 	if (ret)
 		dev_dbg(nor->dev, "error %d reading XRDSR\n", ret);
@@ -528,10 +524,8 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
 				   SPI_MEM_OP_NO_DATA);
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_CLSR,
-						     NULL, 0);
-	}
+	} else
+		ret = spi_nor_write_reg(nor, SPINOR_OP_CLSR, NULL, 0);
 
 	if (ret)
 		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
@@ -592,10 +586,8 @@ static void spi_nor_clear_fsr(struct spi_nor *nor)
 				   SPI_MEM_OP_NO_DATA);
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_CLFSR,
-						     NULL, 0);
-	}
+	} else
+		ret = spi_nor_write_reg(nor, SPINOR_OP_CLFSR, NULL, 0);
 
 	if (ret)
 		dev_dbg(nor->dev, "error %d clearing FSR\n", ret);
@@ -736,10 +728,8 @@ static int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len)
 				   SPI_MEM_OP_DATA_OUT(len, sr, 1));
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WRSR,
-						     sr, len);
-	}
+	} else
+		ret = spi_nor_write_reg(nor, SPINOR_OP_WRSR, sr, len);
 
 	if (ret) {
 		dev_dbg(nor->dev, "error %d writing SR\n", ret);
@@ -938,10 +928,8 @@ static int spi_nor_write_sr2(struct spi_nor *nor, const u8 *sr2)
 				   SPI_MEM_OP_DATA_OUT(1, sr2, 1));
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WRSR2,
-						     sr2, 1);
-	}
+	} else
+		ret = spi_nor_write_reg(nor, SPINOR_OP_WRSR2, sr2, 1);
 
 	if (ret) {
 		dev_dbg(nor->dev, "error %d writing SR2\n", ret);
@@ -972,10 +960,8 @@ static int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
 				   SPI_MEM_OP_DATA_IN(1, sr2, 1));
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR2,
-						    sr2, 1);
-	}
+	} else
+		ret = spi_nor_read_reg(nor, SPINOR_OP_RDSR2, sr2, 1);
 
 	if (ret)
 		dev_dbg(nor->dev, "error %d reading SR2\n", ret);
@@ -1003,10 +989,8 @@ static int spi_nor_erase_chip(struct spi_nor *nor)
 				   SPI_MEM_OP_NO_DATA);
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_CHIP_ERASE,
-						     NULL, 0);
-	}
+	} else
+		ret = spi_nor_write_reg(nor, SPINOR_OP_CHIP_ERASE, NULL, 0);
 
 	if (ret)
 		dev_dbg(nor->dev, "error %d erasing chip\n", ret);
@@ -1158,8 +1142,8 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 		addr >>= 8;
 	}
 
-	return nor->controller_ops->write_reg(nor, nor->erase_opcode,
-					      nor->bouncebuf, nor->addr_width);
+	return spi_nor_write_reg(nor, nor->erase_opcode, nor->bouncebuf,
+				 nor->addr_width);
 }
 
 /**
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
