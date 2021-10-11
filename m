Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34288C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 20:52:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3DB160F22
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 20:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3DB160F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mzSHJNIVNvhkzKcpM5ql4MyFzhkz5zeGKFZ//Ci6d/o=; b=dp1DxDy0uA7dLn
	gjVCJgCPvs8HwX3xBFVflicHYC6RrLK8G7N8QjJJdMl+Mt2sJUwerRA9vNUAOF1ndd6flGLPAWwHe
	3Hxp9m8e2Z5wZAqI78lMx2BbJuhX6fhVmzpRp52R2h8aBcVHXs4c/T2i3UZW8L1yDhmDGNkJ5GIPL
	MkjhiEUOO3tKu0+T/feHKDKIgoGPVII2H4YeafEM/MRWAXqT0poAPni5CB1fruh6f++3+CIlmbkd2
	KLntRstxmzgzOaLxCE/0AxtsAcknvtL3N/JDmAKuxHLJBFsjOS+deqrTmplCTro9o3EsUtuBlUJS0
	E2pgVeqlNmu+DFh0EahQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma2Gb-00AefM-1Q; Mon, 11 Oct 2021 20:51:25 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma2Cg-00AdWu-CL
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 20:47:24 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19BKlFUd120594;
 Mon, 11 Oct 2021 15:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1633985235;
 bh=w7E6JyxIZUA2SdyIeNyt39TQ5DAkOg+qhHKv0x4dNcg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=OVQDwQByzoAHGuXrcyHr7ywvQdjNu304uTfkpW5s7TDx6lcFcUO71dg+2+jbZJZJ2
 NSWtoP8PC6V9weaQAlORVzPYzGgqnZWM1XO17aVi5r/pRvDCKANJUpa4RrFaho1i/h
 /J3mwA4QmOSh+OmSUZ5Dke0/8ST3M11fPt2rrP8s=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19BKlFEA096742
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Oct 2021 15:47:15 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 11
 Oct 2021 15:47:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 11 Oct 2021 15:47:15 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19BKkKEn069811;
 Mon, 11 Oct 2021 15:47:10 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Apurva Nandan <a-nandan@ti.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: <p.yadav@ti.com>
Subject: [PATCH v2 09/14] mtd: spinand: winbond: Add octal_dtr_enable() for
 manufacturer_ops
Date: Tue, 12 Oct 2021 02:16:14 +0530
Message-ID: <20211011204619.81893-10-a-nandan@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011204619.81893-1-a-nandan@ti.com>
References: <20211011204619.81893-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_134722_531360_1E06D652 
X-CRM114-Status: GOOD (  12.18  )
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

Add implementation of octal_dtr_enable() manufacturer_ops for Winbond.
To switch to Ocatl DTR mode, setting programmable dummy cycles and
SPI IO mode using the volatile configuration register is required. To
function at max 120MHz SPI clock in Octal DTR mode, 12 programmable
dummy clock cycle setting is required. (Default number of dummy cycle
are 8 clocks)

Set the programmable dummy cycle to 12 clocks, and SPI IO mode to
Octal DTR with Data Strobe in the VCR. Also, perform a READ ID
operation in Octal DTR SPI mode to ensure the switch was successful.

Datasheet: https://www.winbond.com/export/sites/winbond/datasheet/W35N01JW_Datasheet_Brief.pdf

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 drivers/mtd/nand/spi/winbond.c | 42 ++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 89d8ee801f56..e2cb82d68f96 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -16,6 +16,14 @@
 
 #define WINBOND_CFG_BUF_READ		BIT(3)
 
+/* Octal DTR SPI mode (8D-8D-8D) with Data Strobe output*/
+#define WINBOND_IO_MODE_VCR_OCTAL_DTR	0xE7
+#define WINBOND_IO_MODE_VCR_ADDR	0x00
+
+/* Use 12 dummy clk cycles for using Octal DTR SPI at max 120MHZ */
+#define WINBOND_DUMMY_CLK_COUNT		12
+#define WINBOND_DUMMY_CLK_VCR_ADDR	0x01
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
@@ -156,8 +164,42 @@ static int winbond_write_vcr_op(struct spinand_device *spinand, u8 reg, u8 val)
 	return 0;
 }
 
+static int winbond_spinand_octal_dtr_enable(struct spinand_device *spinand)
+{
+	int ret;
+	struct spi_mem_op op;
+
+	ret = winbond_write_vcr_op(spinand, WINBOND_DUMMY_CLK_VCR_ADDR,
+				   WINBOND_DUMMY_CLK_COUNT);
+	if (ret)
+		return ret;
+
+	ret = winbond_write_vcr_op(spinand, WINBOND_IO_MODE_VCR_ADDR,
+				   WINBOND_IO_MODE_VCR_OCTAL_DTR);
+	if (ret)
+		return ret;
+
+	/* Read flash ID to make sure the switch was successful. */
+	op = (struct spi_mem_op)
+		SPI_MEM_OP(SPI_MEM_OP_CMD_DTR(2, 0x9f9f, 8),
+			   SPI_MEM_OP_NO_ADDR,
+			   SPI_MEM_OP_DUMMY_DTR(16, 8),
+			   SPI_MEM_OP_DATA_IN_DTR(SPINAND_MAX_ID_LEN,
+						  spinand->scratchbuf, 8));
+
+	ret = spi_mem_exec_op(spinand->spimem, &op);
+	if (ret)
+		return ret;
+
+	if (memcmp(spinand->scratchbuf, spinand->id.data, SPINAND_MAX_ID_LEN))
+		return -EINVAL;
+
+	return 0;
+}
+
 static const struct spinand_manufacturer_ops winbond_spinand_manuf_ops = {
 	.init = winbond_spinand_init,
+	.octal_dtr_enable = winbond_spinand_octal_dtr_enable,
 };
 
 const struct spinand_manufacturer winbond_spinand_manufacturer = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
