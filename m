Return-Path: <SRS0=tKtu=DM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BCCC46466
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 15:32:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B6E32085B
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 15:32:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CNtQbzRG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="C6yeSu9g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B6E32085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3SgZwkEf9WAmGlxH5KogDYRBMQ3nB3AHNii9lsri2hQ=; b=CNtQbzRGsm6CVStyxeEiTziZ1
	ScEIg1MHEH6xOkc+CbTy08SViRSh6jPA9L/LVyy5nWJxpaHH+A9HqSA6FLz/0bHPXB1mX62fwnjDU
	e4Sba5Gymf9sqCZAlZtwMtJBsjJJPDpTNFRuB1bMBYDx+q0vvZcfXXUJ49quuU00BSOXCzTzX4yCk
	/5isJWgRhdHq89U+xY81kp5vKHxc5vQZ9IifkS/XdVYTBbX57PhWI8ui7UeVIRrmWpt2irIXiK+Ch
	g2lazX2BbVkCd+wzR/E90FhjT3RO69Q7ScO2IFSEvpadirQtxpx9ngj1jnrjvI1rpAg66FwbuVoKm
	92kRlHyag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPSSz-0004zW-M9; Mon, 05 Oct 2020 15:31:57 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPSSw-0004yN-BQ
 for linux-mtd@lists.infradead.org; Mon, 05 Oct 2020 15:31:55 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 095FVn40129086;
 Mon, 5 Oct 2020 10:31:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601911909;
 bh=Td3Y0lgClZqA+Zrig0Fp3EALnlOS4uPIOQE6gB1VwEA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=C6yeSu9g53jljrpU++gHLNJ2ScszuJfDnvE0uA/xMFeznn4veJ8/PP/f288dCTnuB
 +lSEIRZKkyWmSJ9yo4aegYcZmj+AetTZBhMHGfbq8IzvsvRdROQK301Og6dDplWIWZ
 tklya0ooNe4Xu3vPDHxgncAY1u9ciK02+nd30Oq0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 095FVnWI055048
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 5 Oct 2020 10:31:49 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 5 Oct
 2020 10:31:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 5 Oct 2020 10:31:48 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 095FVdli052390;
 Mon, 5 Oct 2020 10:31:46 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v16 02/15] mtd: spi-nor: add spi_nor_controller_ops_{read_reg,
 write_reg, erase}()
Date: Mon, 5 Oct 2020 21:01:25 +0530
Message-ID: <20201005153138.6437-3-p.yadav@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005153138.6437-1-p.yadav@ti.com>
References: <20201005153138.6437-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_113154_501773_93B6CE28 
X-CRM114-Status: GOOD (  14.12  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Sekhar Nori <nsekhar@ti.com>, Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

They are thin wrappers around
nor->controller_ops->{read_reg,write_reg,erase}(). In a future commit
DTR support will be added. These ops can not be supported by the
controller_ops hooks and these helpers will make it easier to reject
those calls.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/core.c | 87 +++++++++++++++++++++++---------------
 1 file changed, 53 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 4d0f8d165544..7a3bf460a2fa 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -82,6 +82,23 @@ static int spi_nor_spimem_exec_op(struct spi_nor *nor, struct spi_mem_op *op)
 	return spi_mem_exec_op(nor->spimem, op);
 }
 
+static int spi_nor_controller_ops_read_reg(struct spi_nor *nor, u8 opcode,
+					   u8 *buf, size_t len)
+{
+	return nor->controller_ops->read_reg(nor, opcode, buf, len);
+}
+
+static int spi_nor_controller_ops_write_reg(struct spi_nor *nor, u8 opcode,
+					    const u8 *buf, size_t len)
+{
+	return nor->controller_ops->write_reg(nor, opcode, buf, len);
+}
+
+static int spi_nor_controller_ops_erase(struct spi_nor *nor, loff_t offs)
+{
+	return nor->controller_ops->erase(nor, offs);
+}
+
 /**
  * spi_nor_spimem_read_data() - read data from flash's memory region via
  *                              spi-mem
@@ -229,8 +246,8 @@ int spi_nor_write_enable(struct spi_nor *nor)
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WREN,
-						     NULL, 0);
+		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_WREN,
+						       NULL, 0);
 	}
 
 	if (ret)
@@ -258,8 +275,8 @@ int spi_nor_write_disable(struct spi_nor *nor)
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WRDI,
-						     NULL, 0);
+		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_WRDI,
+						       NULL, 0);
 	}
 
 	if (ret)
@@ -289,8 +306,8 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR,
-						    sr, 1);
+		ret = spi_nor_controller_ops_read_reg(nor, SPINOR_OP_RDSR, sr,
+						      1);
 	}
 
 	if (ret)
@@ -320,8 +337,8 @@ static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDFSR,
-						    fsr, 1);
+		ret = spi_nor_controller_ops_read_reg(nor, SPINOR_OP_RDFSR, fsr,
+						      1);
 	}
 
 	if (ret)
@@ -352,7 +369,8 @@ static int spi_nor_read_cr(struct spi_nor *nor, u8 *cr)
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDCR, cr, 1);
+		ret = spi_nor_controller_ops_read_reg(nor, SPINOR_OP_RDCR, cr,
+						      1);
 	}
 
 	if (ret)
@@ -385,10 +403,10 @@ int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = nor->controller_ops->write_reg(nor,
-						     enable ? SPINOR_OP_EN4B :
-							      SPINOR_OP_EX4B,
-						     NULL, 0);
+		ret = spi_nor_controller_ops_write_reg(nor,
+						       enable ? SPINOR_OP_EN4B :
+								SPINOR_OP_EX4B,
+						       NULL, 0);
 	}
 
 	if (ret)
@@ -421,8 +439,8 @@ static int spansion_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_BRWR,
-						     nor->bouncebuf, 1);
+		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_BRWR,
+						       nor->bouncebuf, 1);
 	}
 
 	if (ret)
@@ -453,8 +471,8 @@ int spi_nor_write_ear(struct spi_nor *nor, u8 ear)
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WREAR,
-						     nor->bouncebuf, 1);
+		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_WREAR,
+						       nor->bouncebuf, 1);
 	}
 
 	if (ret)
@@ -484,8 +502,8 @@ int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_XRDSR,
-						    sr, 1);
+		ret = spi_nor_controller_ops_read_reg(nor, SPINOR_OP_XRDSR, sr,
+						      1);
 	}
 
 	if (ret)
@@ -529,8 +547,8 @@ static void spi_nor_clear_sr(struct spi_nor *nor)
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_CLSR,
-						     NULL, 0);
+		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
+						       NULL, 0);
 	}
 
 	if (ret)
@@ -593,8 +611,8 @@ static void spi_nor_clear_fsr(struct spi_nor *nor)
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_CLFSR,
-						     NULL, 0);
+		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLFSR,
+						       NULL, 0);
 	}
 
 	if (ret)
@@ -737,8 +755,8 @@ static int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len)
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WRSR,
-						     sr, len);
+		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_WRSR, sr,
+						       len);
 	}
 
 	if (ret) {
@@ -939,8 +957,8 @@ static int spi_nor_write_sr2(struct spi_nor *nor, const u8 *sr2)
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_WRSR2,
-						     sr2, 1);
+		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_WRSR2,
+						       sr2, 1);
 	}
 
 	if (ret) {
@@ -973,8 +991,8 @@ static int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR2,
-						    sr2, 1);
+		ret = spi_nor_controller_ops_read_reg(nor, SPINOR_OP_RDSR2, sr2,
+						      1);
 	}
 
 	if (ret)
@@ -1004,8 +1022,9 @@ static int spi_nor_erase_chip(struct spi_nor *nor)
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = nor->controller_ops->write_reg(nor, SPINOR_OP_CHIP_ERASE,
-						     NULL, 0);
+		ret = spi_nor_controller_ops_write_reg(nor,
+						       SPINOR_OP_CHIP_ERASE,
+						       NULL, 0);
 	}
 
 	if (ret)
@@ -1146,7 +1165,7 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 
 		return spi_mem_exec_op(nor->spimem, &op);
 	} else if (nor->controller_ops->erase) {
-		return nor->controller_ops->erase(nor, addr);
+		return spi_nor_controller_ops_erase(nor, addr);
 	}
 
 	/*
@@ -1158,8 +1177,8 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 		addr >>= 8;
 	}
 
-	return nor->controller_ops->write_reg(nor, nor->erase_opcode,
-					      nor->bouncebuf, nor->addr_width);
+	return spi_nor_controller_ops_write_reg(nor, nor->erase_opcode,
+						nor->bouncebuf, nor->addr_width);
 }
 
 /**
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
