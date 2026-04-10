Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43ED4F45A0C
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Apr 2026 17:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uNo8A5gdTHSpjivg7SxIKpLqrKwa5FN0DnjIHVnNJTM=; b=CLkeIsX729sN7q
	th3WVBlOCfTHmdy3rAFiH4Pj31jM932tD72dBYL4qdz207m/vrCvKb0I/TPPBhr7wdoLwD6zRUvtb
	YMiBNMMxaiwCCXC9f05U3BdpbnZLj3POX2TAKja9plvvsF9iTjXV3Ks+yYqrpsfPK5q5T7B2r94fl
	URvRVBu7wyb6/hSX84fnVx0Uck92SoId+J26n8jOQBU6LMV0HwF6yb/EdcgcJImc3IS1VMrqHSFYZ
	mK+ZYkw3lzXA9PJfDUl8+91ELfZR4q690DcshPPJ9eV8AzjC/UhCXvPaZX3wZuB7+1Wx2emPqm0kr
	2redqKF6JvEK6JGzv4QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFrB-0000000CdU2-2t7w;
	Fri, 10 Apr 2026 17:41:25 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFr8-0000000CdQN-34wI
	for linux-mtd@lists.infradead.org;
	Fri, 10 Apr 2026 17:41:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CCCD2C5C1A5;
	Fri, 10 Apr 2026 17:41:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FD18603F0;
	Fri, 10 Apr 2026 17:41:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D786D10450085;
	Fri, 10 Apr 2026 19:41:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775842878; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5i86694lMeG7kylMxcMPx4GdJDrXhoBS7Gx4ntdJ5OQ=;
	b=bLI7mquFFWnVp00o0oHH9cqiMpthDSACGYJeebI0hLpcQCvNo7uVlnTPmUmFHK7l+sVuuP
	tQgBdTH7L3PiJ0lfkgyvZEhuSwS8bfW+cJNQdE7z9EJXSP9mmxtfoZHoQlHli44dxzZK4N
	UM+E7obF/bgroHUjwk4CXeHzovUTAEY/lg2KRivohSdJBCwtehx6czR6GhbVElqR3ZsFQL
	4JUrdsWiugGhSZsoudEmLJYpS+bZO3p+xacV9NwFiIonpNOU/uTJC9h1XotpNw7PQf4kgL
	ptdS3bJl4C6Xfi1sKFzg3gvtwQRCb/oV4+Hq34id0DGzve7r3LdkGEmypYLMow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 10 Apr 2026 19:41:03 +0200
Subject: [PATCH 3/5] mtd: spinand: Add support for packed read data ODTR
 commands
MIME-Version: 1.0
Message-Id: <20260410-winbond-6-19-rc1-oddr-v1-3-2ac4827a3868@bootlin.com>
References: <20260410-winbond-6-19-rc1-oddr-v1-0-2ac4827a3868@bootlin.com>
In-Reply-To: <20260410-winbond-6-19-rc1-oddr-v1-0-2ac4827a3868@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>
Cc: Steam Lin <STLin2@winbond.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_104123_066353_D1E0F8B3 
X-CRM114-Status: GOOD (  14.36  )
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

Some devices stuff address bits in the double byte opcode (in place of
the repeated byte) in order to be able to increase the size of the
devices, without adding extra address bytes.

Create a flag to identify those devices. When the flag is set, use the
"packed" variant for the read data operation.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 24 +++++++++++++++++++++---
 include/linux/mtd/spinand.h |  7 +++++++
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 66c90419f6d5..96154f359e1a 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -100,6 +100,17 @@ spinand_fill_page_read_op(struct spinand_device *spinand, u64 addr)
 	return op;
 }
 
+static struct spi_mem_op
+spinand_fill_page_read_packed_op(struct spinand_device *spinand, u64 addr)
+{
+	struct spi_mem_op op = spinand->op_templates->page_read;
+
+	op.cmd.opcode |= addr >> 16;
+	op.addr.val = addr & 0xFFFF;
+
+	return op;
+}
+
 struct spi_mem_op
 spinand_fill_prog_exec_op(struct spinand_device *spinand, u64 addr)
 {
@@ -453,7 +464,10 @@ static int spinand_load_page_op(struct spinand_device *spinand,
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	unsigned int row = nanddev_pos_to_row(nand, &req->pos);
-	struct spi_mem_op op = SPINAND_OP(spinand, page_read, row);
+	bool packed = spinand->flags & SPINAND_ODTR_PACKED_PAGE_READ;
+	struct spi_mem_op op = packed ?
+		SPINAND_OP(spinand, page_read_packed, row) :
+		SPINAND_OP(spinand, page_read, row);
 
 	return spi_mem_exec_op(spinand->spimem, &op);
 }
@@ -1489,9 +1503,13 @@ static int spinand_init_odtr_instruction_set(struct spinand_device *spinand)
 	if (!spi_mem_supports_op(spinand->spimem, &tmpl->blk_erase))
 		return -EOPNOTSUPP;
 
-	tmpl->page_read = (struct spi_mem_op)SPINAND_PAGE_READ_8D_8D_0_OP(0);
-	if (!spi_mem_supports_op(spinand->spimem, &tmpl->page_read))
+	if (spinand->flags & SPINAND_ODTR_PACKED_PAGE_READ)
+		tmpl->page_read = (struct spi_mem_op)SPINAND_PAGE_READ_PACKED_8D_8D_0_OP(0);
+	else
+		tmpl->page_read = (struct spi_mem_op)SPINAND_PAGE_READ_8D_8D_0_OP(0);
+	if (!spi_mem_supports_op(spinand->spimem, &tmpl->page_read)) {
 		return -EOPNOTSUPP;
+	}
 
 	tmpl->prog_exec = (struct spi_mem_op)SPINAND_PROG_EXEC_8D_8D_0_OP(0);
 	if (!spi_mem_supports_op(spinand->spimem, &tmpl->prog_exec))
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 6a024cf1c53a..f2f80103649d 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -290,6 +290,12 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
+#define SPINAND_PAGE_READ_PACKED_8D_8D_0_OP(addr)			\
+	SPI_MEM_OP(SPI_MEM_DTR_OP_PACKED_CMD(0x13, addr >> 16, 8),	\
+		   SPI_MEM_DTR_OP_ADDR(2, addr & 0xffff, 8),		\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_NO_DATA)
+
 #define SPINAND_PAGE_READ_FROM_CACHE_8D_8D_8D_OP(addr, ndummy, buf, len, freq) \
 	SPI_MEM_OP(SPI_MEM_DTR_OP_RPT_CMD(0x9d, 8),			\
 		   SPI_MEM_DTR_OP_ADDR(2, addr, 8),			\
@@ -482,6 +488,7 @@ struct spinand_ecc_info {
 #define SPINAND_HAS_PROG_PLANE_SELECT_BIT		BIT(2)
 #define SPINAND_HAS_READ_PLANE_SELECT_BIT		BIT(3)
 #define SPINAND_NO_RAW_ACCESS				BIT(4)
+#define SPINAND_ODTR_PACKED_PAGE_READ			BIT(5)
 
 /**
  * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
