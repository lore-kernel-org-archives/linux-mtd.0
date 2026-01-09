Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CB7D26D7B
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jaXwDbz1BsIaBZGY/L1+5urPn7V2lv3hG3+KxuWmGaY=; b=LYcVDlikKG6OUg
	gXemFvZc+DbiR56ntnRipFrW+IoyMuwts1tlBY2qtwEaGbHPWQzRcWiWwPZZlvLonygXo0IYhrrIY
	Ur13bDqxVL1F6h477ob4WnbSabUpApKhNaIQsPKjcXwW/AM/tm3X4Hc9jZySblCOe3Q0eSjaa/l26
	gVzYPMlDL1EdaECCnV+Cai5IaSX+T7AdFXkluadgvNSvQP6RlOigNnIXSqBygAQ1dvJSPsfWS1xc6
	Hkfu2za0q7sq+X6mwYRiBurfmC+Vqi5GR7c/dKWxQ9rsgsM97Cmf34l0CN9VdxhXcBYNeZD/wfHJT
	UvXAnZaYemv9BdO+ei4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG8E-00000002m4G-3TY1;
	Fri, 09 Jan 2026 17:18:38 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG8B-00000002lvm-0V5a
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:18:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AABCE1A2754;
	Fri,  9 Jan 2026 17:18:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E0CD606C6;
	Fri,  9 Jan 2026 17:18:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 14557103C89B3;
	Fri,  9 Jan 2026 18:18:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979112; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NApdv+R1wOE2XRRRWrScngg2KW6iyNx4NagI1wj3CIc=;
	b=eWq7ZINqBmxQKnbAIdh+fc87X4R8a1h+hotvDIEgf/WeidwTbGcvB7SHRvLgCc7ZHw1rXF
	xKWplgE9mZlSrs41/y90QX0x2kpdpcViHdv6E4qp+VMlAIVCiBTuhTe4JNJcPoMNPLejQB
	bM5mUNQLrT+yzl6mhZf5/a3+9X+YqjBPUWrcaSFvpsbvfXpsscZ6Vcxl+ycNkWrzjTg0gj
	ThNDdNHDCQ1DvRL4s7g+mKkXhY3dtr/mj+Eu09BcGkufkkwRxJygVzoKHWJjYWCyH/nJ4F
	BabNS4t26ZnNepvU49LzbYZyFVkzSkVtEokb2SZ6ClwfYavdbAe6ZJ3N5+A/vA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:10 +0100
Subject: [PATCH v2 12/27] mtd: spinand: winbond: Convert W25N specific
 operation to SPINAND_OP()
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-12-1fff6a2ddb80@bootlin.com>
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
In-Reply-To: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_091835_311692_9596E228 
X-CRM114-Status: GOOD (  13.97  )
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

Winbond W25N* chips require a vendor specific operation to select the
target. Instead of defining this op only in the function that
needs it, hiding it from the core, make it a proper define like all
other spi-mem operations, and implement the necessary
spinand_fill_*_op() helper to make the SPINAND_OP() macro work. This way
we can use it from any function without any extra handling outside of
this helper when we will convert the core to support octal DDR busses.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index bfec5d037f25..dde59f8f63f5 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -87,6 +87,18 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_1S_1S_4S_OP(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
+#define SPINAND_WINBOND_SELECT_TARGET_1S_0_1S(buf)			\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0xc2, 1),				\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_OUT(1, buf, 1))
+
+static struct spi_mem_op
+spinand_fill_winbond_select_target_op(struct spinand_device *spinand, void *valptr)
+{
+	return (struct spi_mem_op)SPINAND_WINBOND_SELECT_TARGET_1S_0_1S(valptr);
+}
+
 static int w25m02gv_ooblayout_ecc(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *region)
 {
@@ -119,12 +131,8 @@ static const struct mtd_ooblayout_ops w25m02gv_ooblayout = {
 static int w25m02gv_select_target(struct spinand_device *spinand,
 				  unsigned int target)
 {
-	struct spi_mem_op op = SPI_MEM_OP(SPI_MEM_OP_CMD(0xc2, 1),
-					  SPI_MEM_OP_NO_ADDR,
-					  SPI_MEM_OP_NO_DUMMY,
-					  SPI_MEM_OP_DATA_OUT(1,
-							spinand->scratchbuf,
-							1));
+	struct spi_mem_op op = SPINAND_OP(spinand, winbond_select_target,
+					  spinand->scratchbuf);
 
 	*spinand->scratchbuf = target;
 	return spi_mem_exec_op(spinand->spimem, &op);

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
