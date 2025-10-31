Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71734CCFA02
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uTleUvVf4w5cm5BCNunFHGtWk93Q6G107juhnW1F7gY=; b=c7KCYuaeKj4aH4
	u1z1xZRriCScwL6lh7Wv4LE0fVyr0nfhz/w95G0dBCaTFvoPr5tVjEAvf+m1FcLnMjDY6KvAmJWo3
	XGTzJv7IJV7tr0SVVD+wbdyTXVa8rZS8W3ytCDhH8Wym5blGZdGPkuq0138PLYapeJ4v04T1i8XZt
	gTxiGnFISQIa0W7zJe9RLTzXD3bZJxY8g1sfMcDZ6FwCiOmq9/jvR2J40pu70Egx61ozWjoRp/yKO
	CodNyv4r45k+VMnTEOocyLvth761CXIjm7nIYhtx0U4OJPQdz2EWpK+r3KqNw+qMRiOzmbhhG636+
	xWkTu1aVtJnfVYyyBxbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvu-00000006UxR-3QFm;
	Fri, 31 Oct 2025 17:29:02 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvN-00000006UHU-2ioD
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 013254E41434;
	Fri, 31 Oct 2025 17:28:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C680160704;
	Fri, 31 Oct 2025 17:28:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0665D1181800A;
	Fri, 31 Oct 2025 18:28:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931707; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0D819DjHSpaRd5sIkugzSV64SQrVD1HOP8VmsLdk4Cc=;
	b=ff+PzoKBP81lcSIDzQLMSk0h88WMACbVcd1/DCo/j/SjoCpU1K14DqJD148RjQbuEFs5ra
	jCa198t0lPKipwaWH8Zc+PmsXA1LifdU6zAWhc7D5Xry46x6ZX1TLzQr4dz2leRiYNzs/M
	eTeJpOpH4xuurPTO/15yXJtHNs5KImf9T0cmx2+148VFibhq8ojRvrB1FNsWWLlrHFfOi4
	9d7rAy+3JfvBhwUqKRq2/URpkERT1NSie6vhohmVXdX5Z2h8tLj99ZIQhZFu2ZU3V4rnAo
	SJgjtdfHAChcgw+4bDAyj1oKHNS5aMZ+/k/YM1bVBWiAatqj3UPntvJAj2Igog==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:26:57 +0100
Subject: [PATCH 13/28] mtd: spinand: winbond: Convert W25N specific
 operation to SPINAND_OP()
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-13-be42de23ebf1@bootlin.com>
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102829_952626_1324F4E6 
X-CRM114-Status: GOOD (  13.45  )
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

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index bfec5d037f25b81a3c90feba666fe8283a41ddb1..dde59f8f63f511a298a43a5b43fe07c1d726f179 100644
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
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
