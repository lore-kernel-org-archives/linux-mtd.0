Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C796C32754
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 16:22:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20E1C20657
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 16:22:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bv7Fdw29";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="y8Civ5+H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20E1C20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pw3SjlQCceCff+OG3livG41RBR4QpbXKIMMlEF3sgT4=; b=Bv7Fdw29xlp9xh
	81vp4NcoVymCg9zUjhdNgG7qk3abhJcnUXGjvFPAgd6hYHgiyG/Qp/HKBZ/TR219Pa9sD7YZnbiu5
	FpGuB1czX7Brqzva5HArdg4ETh8mOES8qaXFPzT2h0Q8aqSjc6GhfXVgIh4EZuTXt5dOfix9Yiy9S
	N2o7/+Io97Kod9Dy8uE77WzWwjRuOIta7s/4rzHmeVZC0k+TQSC4q45uXy0Q1uXNlTcXIWG6g7jyr
	XMyhVBPY81Q3ku1Y6k5OIiA16Tn/SZAGlnsjTs2Ubawu7A3mrZn8LSGADQAifpxe5sDitVP8+zKzO
	uUMyGiZVtkx78kZlvxPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htDqM-0004cn-8k; Thu, 01 Aug 2019 16:22:18 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htDqF-0004Tw-Bd
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 16:22:13 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x71GM5Fr105827;
 Thu, 1 Aug 2019 11:22:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1564676525;
 bh=AMVuR4iXGx1aPpkMjmCtXi18bf1WqQfX1FutIf0KQXk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=y8Civ5+H9gcBAoIUia3lpV5G6pOuGRxgnPeZJrCDgglu4dCxoDJXnXQi/+XdyKBf9
 MrO78RxJKtoNOteS+UzgHiuTbdz8z/Rx1Pbv3yIswGSBqFIYw6/6i3QVtFOkwH9yco
 0rXGffogjMzt0jXnN9ynoXEWmyi2fI8LeT+Ltkpg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x71GM5e7011459
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 1 Aug 2019 11:22:05 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 1 Aug
 2019 11:22:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 1 Aug 2019 11:22:05 -0500
Received: from a0132425.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x71GLxdB097075;
 Thu, 1 Aug 2019 11:22:02 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH v4 1/3] mtd: spi-nor: always use bounce buffer for register
 read/writes
Date: Thu, 1 Aug 2019 21:52:27 +0530
Message-ID: <20190801162229.28897-2-vigneshr@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190801162229.28897-1-vigneshr@ti.com>
References: <20190801162229.28897-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_092211_483263_B19F13E1 
X-CRM114-Status: GOOD (  18.58  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

spi-mem layer expects all buffers passed to it to be DMA'able. But
spi-nor layer mostly allocates buffers on stack for reading/writing to
registers and therefore are not DMA'able. Introduce bounce buffer to be
used to read/write to registers. This ensures that buffer passed to
spi-mem layer during register read/writes is DMA'able. With this change
nor->cmd-buf is no longer used, so drop it.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---

v4:
Avoid memcpy during READID

v3: new patch

 drivers/mtd/spi-nor/spi-nor.c | 70 ++++++++++++++++++++---------------
 include/linux/mtd/spi-nor.h   |  7 +++-
 2 files changed, 45 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 03cc788511d5..e02376e1127b 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -296,15 +296,14 @@ struct flash_info {
 static int read_sr(struct spi_nor *nor)
 {
 	int ret;
-	u8 val;
 
-	ret = nor->read_reg(nor, SPINOR_OP_RDSR, &val, 1);
+	ret = nor->read_reg(nor, SPINOR_OP_RDSR, nor->bouncebuf, 1);
 	if (ret < 0) {
 		pr_err("error %d reading SR\n", (int) ret);
 		return ret;
 	}
 
-	return val;
+	return nor->bouncebuf[0];
 }
 
 /*
@@ -315,15 +314,14 @@ static int read_sr(struct spi_nor *nor)
 static int read_fsr(struct spi_nor *nor)
 {
 	int ret;
-	u8 val;
 
-	ret = nor->read_reg(nor, SPINOR_OP_RDFSR, &val, 1);
+	ret = nor->read_reg(nor, SPINOR_OP_RDFSR, nor->bouncebuf, 1);
 	if (ret < 0) {
 		pr_err("error %d reading FSR\n", ret);
 		return ret;
 	}
 
-	return val;
+	return nor->bouncebuf[0];
 }
 
 /*
@@ -334,15 +332,14 @@ static int read_fsr(struct spi_nor *nor)
 static int read_cr(struct spi_nor *nor)
 {
 	int ret;
-	u8 val;
 
-	ret = nor->read_reg(nor, SPINOR_OP_RDCR, &val, 1);
+	ret = nor->read_reg(nor, SPINOR_OP_RDCR, nor->bouncebuf, 1);
 	if (ret < 0) {
 		dev_err(nor->dev, "error %d reading CR\n", ret);
 		return ret;
 	}
 
-	return val;
+	return nor->bouncebuf[0];
 }
 
 /*
@@ -351,8 +348,8 @@ static int read_cr(struct spi_nor *nor)
  */
 static int write_sr(struct spi_nor *nor, u8 val)
 {
-	nor->cmd_buf[0] = val;
-	return nor->write_reg(nor, SPINOR_OP_WRSR, nor->cmd_buf, 1);
+	nor->bouncebuf[0] = val;
+	return nor->write_reg(nor, SPINOR_OP_WRSR, nor->bouncebuf, 1);
 }
 
 /*
@@ -500,31 +497,31 @@ static int set_4byte(struct spi_nor *nor, bool enable)
 			 * We must clear the register to enable normal behavior.
 			 */
 			write_enable(nor);
-			nor->cmd_buf[0] = 0;
-			nor->write_reg(nor, SPINOR_OP_WREAR, nor->cmd_buf, 1);
+			nor->bouncebuf[0] = 0;
+			nor->write_reg(nor, SPINOR_OP_WREAR,
+				       nor->bouncebuf, 1);
 			write_disable(nor);
 		}
 
 		return status;
 	default:
 		/* Spansion style */
-		nor->cmd_buf[0] = enable << 7;
-		return nor->write_reg(nor, SPINOR_OP_BRWR, nor->cmd_buf, 1);
+		nor->bouncebuf[0] = enable << 7;
+		return nor->write_reg(nor, SPINOR_OP_BRWR, nor->bouncebuf, 1);
 	}
 }
 
 static int s3an_sr_ready(struct spi_nor *nor)
 {
 	int ret;
-	u8 val;
 
-	ret = nor->read_reg(nor, SPINOR_OP_XRDSR, &val, 1);
+	ret = nor->read_reg(nor, SPINOR_OP_XRDSR, nor->bouncebuf, 1);
 	if (ret < 0) {
 		dev_err(nor->dev, "error %d reading XRDSR\n", (int) ret);
 		return ret;
 	}
 
-	return !!(val & XSR_RDY);
+	return !!(nor->bouncebuf[0] & XSR_RDY);
 }
 
 static int spi_nor_sr_ready(struct spi_nor *nor)
@@ -683,7 +680,6 @@ static loff_t spi_nor_s3an_addr_convert(struct spi_nor *nor, unsigned int addr)
  */
 static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 {
-	u8 buf[SPI_NOR_MAX_ADDR_WIDTH];
 	int i;
 
 	if (nor->flags & SNOR_F_S3AN_ADDR_DEFAULT)
@@ -697,11 +693,12 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 	 * control
 	 */
 	for (i = nor->addr_width - 1; i >= 0; i--) {
-		buf[i] = addr & 0xff;
+		nor->bouncebuf[i] = addr & 0xff;
 		addr >>= 8;
 	}
 
-	return nor->write_reg(nor, nor->erase_opcode, buf, nor->addr_width);
+	return nor->write_reg(nor, nor->erase_opcode, nor->bouncebuf,
+			      nor->addr_width);
 }
 
 /**
@@ -1404,9 +1401,11 @@ static int write_sr_cr(struct spi_nor *nor, u8 *sr_cr)
 {
 	int ret;
 
+	memcpy(nor->bouncebuf, sr_cr, 2);
+
 	write_enable(nor);
 
-	ret = nor->write_reg(nor, SPINOR_OP_WRSR, sr_cr, 2);
+	ret = nor->write_reg(nor, SPINOR_OP_WRSR, nor->bouncebuf, 2);
 	if (ret < 0) {
 		dev_err(nor->dev,
 			"error while writing configuration register\n");
@@ -1599,22 +1598,22 @@ static int spansion_read_cr_quad_enable(struct spi_nor *nor)
  */
 static int sr2_bit7_quad_enable(struct spi_nor *nor)
 {
-	u8 sr2;
+	u8 *sr2 = nor->bouncebuf;
 	int ret;
 
 	/* Check current Quad Enable bit value. */
-	ret = nor->read_reg(nor, SPINOR_OP_RDSR2, &sr2, 1);
+	ret = nor->read_reg(nor, SPINOR_OP_RDSR2, sr2, 1);
 	if (ret)
 		return ret;
-	if (sr2 & SR2_QUAD_EN_BIT7)
+	if (*sr2 & SR2_QUAD_EN_BIT7)
 		return 0;
 
 	/* Update the Quad Enable bit. */
-	sr2 |= SR2_QUAD_EN_BIT7;
+	*sr2 |= SR2_QUAD_EN_BIT7;
 
 	write_enable(nor);
 
-	ret = nor->write_reg(nor, SPINOR_OP_WRSR2, &sr2, 1);
+	ret = nor->write_reg(nor, SPINOR_OP_WRSR2, sr2, 1);
 	if (ret < 0) {
 		dev_err(nor->dev, "error while writing status register 2\n");
 		return -EINVAL;
@@ -1627,8 +1626,8 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 	}
 
 	/* Read back and check it. */
-	ret = nor->read_reg(nor, SPINOR_OP_RDSR2, &sr2, 1);
-	if (!(ret > 0 && (sr2 & SR2_QUAD_EN_BIT7))) {
+	ret = nor->read_reg(nor, SPINOR_OP_RDSR2, sr2, 1);
+	if (!(ret > 0 && (*sr2 & SR2_QUAD_EN_BIT7))) {
 		dev_err(nor->dev, "SR2 Quad bit not set\n");
 		return -EINVAL;
 	}
@@ -2177,9 +2176,10 @@ static const struct flash_info spi_nor_ids[] = {
 static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
 {
 	int			tmp;
-	u8			id[SPI_NOR_MAX_ID_LEN];
+	u8			*id;
 	const struct flash_info	*info;
 
+	id = nor->bouncebuf;
 	tmp = nor->read_reg(nor, SPINOR_OP_RDID, id, SPI_NOR_MAX_ID_LEN);
 	if (tmp < 0) {
 		dev_err(nor->dev, "error %d reading JEDEC ID\n", tmp);
@@ -4121,6 +4121,16 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	nor->read_proto = SNOR_PROTO_1_1_1;
 	nor->write_proto = SNOR_PROTO_1_1_1;
 
+	/*
+	 * We need the bounce buffer early to read/write registers when going
+	 * through the spi-mem layer (buffers have to be DMA-able).
+	 */
+	nor->bouncebuf_size = PAGE_SIZE;
+	nor->bouncebuf = devm_kmalloc(dev, nor->bouncebuf_size,
+				      GFP_KERNEL);
+	if (!nor->bouncebuf)
+		return -ENOMEM;
+
 	if (name)
 		info = spi_nor_match_id(name);
 	/* Try to auto-detect if chip name wasn't specified or not found */
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 9f57cdfcc93d..6b5956a7a65a 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -344,6 +344,9 @@ struct flash_info;
  * @mtd:		point to a mtd_info structure
  * @lock:		the lock for the read/write/erase/lock/unlock operations
  * @dev:		point to a spi device, or a spi nor controller device.
+ * @bouncebuf:		bounce buffer used when the buffer passed by the MTD
+ *                      layer is not DMA-able
+ * @bouncebuf_size:	size of the bounce buffer
  * @info:		spi-nor part JDEC MFR id and other info
  * @page_size:		the page size of the SPI NOR
  * @addr_width:		number of address bytes
@@ -356,7 +359,6 @@ struct flash_info;
  * @read_proto:		the SPI protocol for read operations
  * @write_proto:	the SPI protocol for write operations
  * @reg_proto		the SPI protocol for read_reg/write_reg/erase operations
- * @cmd_buf:		used by the write_reg
  * @erase_map:		the erase map of the SPI NOR
  * @prepare:		[OPTIONAL] do some preparations for the
  *			read/write/erase/lock/unlock operations
@@ -382,6 +384,8 @@ struct spi_nor {
 	struct mtd_info		mtd;
 	struct mutex		lock;
 	struct device		*dev;
+	u8			*bouncebuf;
+	size_t			bouncebuf_size;
 	const struct flash_info	*info;
 	u32			page_size;
 	u8			addr_width;
@@ -394,7 +398,6 @@ struct spi_nor {
 	enum spi_nor_protocol	reg_proto;
 	bool			sst_write_second;
 	u32			flags;
-	u8			cmd_buf[SPI_NOR_MAX_CMD_SIZE];
 	struct spi_nor_erase_map	erase_map;
 
 	int (*prepare)(struct spi_nor *nor, enum spi_nor_ops ops);
-- 
2.22.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
