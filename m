Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FA7C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 17:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=96oLXQkfHR2kKHhb/SnzzSTdxlkGoEWyX6IlkShlJx8=; b=bRX2T5AnZfwdjU
	iZXHwoZMcdYJQX2/MXQcZeeKy6TKfGPVNuUqidQSMY77p1WyRfuBEFdZh/slgL92ZZ3etkhhzZI+S
	/UvoskPYcZXfIyFmseNSuGWZVuXjsWr1Gr8h69DCZMJYYaUOKy+0oSPue93g8bWsHJONSaBUXgJPU
	snfexNQUEU0lJ5UCF2Sd0iMP1qYMl3ReBZ35zu+MdF+wW7dygleUlQ+CUak0iOc0h0h6O9oGbhoCV
	j2GVe4ARJsHcTnBFwVOAkD4MrROPqvCordiRVPDTr1qo7NnE9naoW19m+KsrCJyn8dI1AGu835nWW
	mz4Vk7FT8dQk0I+VVF8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvNRd-00H1wq-DY; Thu, 09 Dec 2021 17:43:01 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvNPf-00H1Eb-GP
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 17:41:01 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id CF0B424000C;
 Thu,  9 Dec 2021 17:40:56 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 04/12] spi: spi-mem: Add an ecc_en parameter to the
 spi_mem_op structure
Date: Thu,  9 Dec 2021 18:40:38 +0100
Message-Id: <20211209174046.535229-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211209174046.535229-1-miquel.raynal@bootlin.com>
References: <20211209174046.535229-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_094059_750511_1320A4E4 
X-CRM114-Status: GOOD (  13.31  )
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

Soon the SPI-NAND core will need a way to request a SPI controller to
enable ECC support for a given operation. This is because of the
pipelined integration of certain ECC engines, which are directly managed
by the SPI controller itself.

Introduce a spi_mem_op additional field for this purpose: ecc_en.

So far this field is left unset and checked to be false by all
the SPI controller drivers in their ->supports_op() hook, as they all
call spi_mem_default/dtr_supports_op().

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c       | 11 ++++++++---
 include/linux/spi/spi-mem.h |  3 +++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 013efaaaac75..9e06cd918273 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -162,7 +162,7 @@ static bool spi_mem_check_buswidth(struct spi_mem *mem,
 
 static bool spi_mem_generic_supports_op(struct spi_mem *mem,
 					const struct spi_mem_op *op,
-					bool dtr)
+					bool dtr, bool ecc)
 {
 	if (!dtr) {
 		if (op->cmd.dtr || op->addr.dtr ||
@@ -176,20 +176,25 @@ static bool spi_mem_generic_supports_op(struct spi_mem *mem,
 			return false;
 	}
 
+	if (!ecc) {
+		if (op->ecc_en)
+			return false;
+	}
+
 	return spi_mem_check_buswidth(mem, op);
 }
 
 bool spi_mem_dtr_supports_op(struct spi_mem *mem,
 			     const struct spi_mem_op *op)
 {
-	return spi_mem_generic_supports_op(mem, op, true);
+	return spi_mem_generic_supports_op(mem, op, true, false);
 }
 EXPORT_SYMBOL_GPL(spi_mem_dtr_supports_op);
 
 bool spi_mem_default_supports_op(struct spi_mem *mem,
 				 const struct spi_mem_op *op)
 {
-	return spi_mem_generic_supports_op(mem, op, false);
+	return spi_mem_generic_supports_op(mem, op, false, false);
 }
 EXPORT_SYMBOL_GPL(spi_mem_default_supports_op);
 
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 85e2ff7b840d..3be594be24c0 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -94,6 +94,7 @@ enum spi_mem_data_dir {
  *		 operation does not involve transferring data
  * @data.buf.in: input buffer (must be DMA-able)
  * @data.buf.out: output buffer (must be DMA-able)
+ * @ecc_en: error correction is required
  */
 struct spi_mem_op {
 	struct {
@@ -126,6 +127,8 @@ struct spi_mem_op {
 			const void *out;
 		} buf;
 	} data;
+
+	bool ecc_en;
 };
 
 #define SPI_MEM_OP(__cmd, __addr, __dummy, __data)		\
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
