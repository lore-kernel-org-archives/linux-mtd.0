Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8022C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 17:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QrjC/jJ/RYOC7t/TX/JYWZbRG+HbPd1hYgTBJ9lMSc8=; b=SbPoHoH+aSUq98
	tFqPBfadiSb4Y+woTHgXWnNWoKIPWoslH2bY/Vfr4vrMTOc/hgf4Lr3jMRK6eiYxu1IhZ3b78xn37
	qu66e3ZSvct+yZMFJ1O5qR3RaKo9Hzt8ujLAo795fveNbr2106FjnpuUlmf/l9S7A1Dl4wI+6/WYM
	s3YTpFaWrLdW6MiXAlEvTmzmiH7y5LvqZXw60ZCrwFg1vpov5eNEUtBrHXvNYrKzkamNji9rDc8RV
	V0GVyC+ByKGMmiCbXJgqdCDky6YLSKB2lss/KvKQOd39hLVxYuUrF8JD2VOzCjr9rGMMfgIVxRCVU
	uNZQqbuPj5WDcQeaOy0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvNSF-00H2De-S4; Thu, 09 Dec 2021 17:43:39 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvNPg-00H1FW-OZ
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 17:41:02 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 31EE6240008;
 Thu,  9 Dec 2021 17:40:58 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 05/12] spi: spi-mem: Export the
 spi_mem_generic_supports_op() helper
Date: Thu,  9 Dec 2021 18:40:39 +0100
Message-Id: <20211209174046.535229-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211209174046.535229-1-miquel.raynal@bootlin.com>
References: <20211209174046.535229-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_094100_966672_A5AE2F3F 
X-CRM114-Status: GOOD (  12.05  )
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

The combination of checks against the number of supported operations is
going to increase exponentially each time we add a new parameter. So far
we only had a dtr parameter. Now we are introducing an ECC parameter. We
need to make this helper available for drivers with specific needs,
instead of creating another set of helpers each time we want to check
something new. In the future if we see that many different drivers use
the same parameter values, we might be tempted to create a specific
helper for that. But for now, let's just make the generic one available.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c       |  7 ++++---
 include/linux/spi/spi-mem.h | 13 +++++++++++++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 9e06cd918273..48b55395178f 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -160,9 +160,9 @@ static bool spi_mem_check_buswidth(struct spi_mem *mem,
 	return true;
 }
 
-static bool spi_mem_generic_supports_op(struct spi_mem *mem,
-					const struct spi_mem_op *op,
-					bool dtr, bool ecc)
+bool spi_mem_generic_supports_op(struct spi_mem *mem,
+				 const struct spi_mem_op *op,
+				 bool dtr, bool ecc)
 {
 	if (!dtr) {
 		if (op->cmd.dtr || op->addr.dtr ||
@@ -183,6 +183,7 @@ static bool spi_mem_generic_supports_op(struct spi_mem *mem,
 
 	return spi_mem_check_buswidth(mem, op);
 }
+EXPORT_SYMBOL_GPL(spi_mem_generic_supports_op);
 
 bool spi_mem_dtr_supports_op(struct spi_mem *mem,
 			     const struct spi_mem_op *op)
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 3be594be24c0..07f637cbe77d 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -320,6 +320,10 @@ void spi_controller_dma_unmap_mem_op_data(struct spi_controller *ctlr,
 					  const struct spi_mem_op *op,
 					  struct sg_table *sg);
 
+bool spi_mem_generic_supports_op(struct spi_mem *mem,
+				 const struct spi_mem_op *op,
+				 bool dtr, bool ecc);
+
 bool spi_mem_default_supports_op(struct spi_mem *mem,
 				 const struct spi_mem_op *op);
 
@@ -327,6 +331,7 @@ bool spi_mem_dtr_supports_op(struct spi_mem *mem,
 			     const struct spi_mem_op *op);
 
 #else
+
 static inline int
 spi_controller_dma_map_mem_op_data(struct spi_controller *ctlr,
 				   const struct spi_mem_op *op,
@@ -342,6 +347,14 @@ spi_controller_dma_unmap_mem_op_data(struct spi_controller *ctlr,
 {
 }
 
+static inline
+bool spi_mem_generic_supports_op(struct spi_mem *mem,
+				 const struct spi_mem_op *op,
+				 bool dtr, bool ecc)
+{
+	return false;
+}
+
 static inline
 bool spi_mem_default_supports_op(struct spi_mem *mem,
 				 const struct spi_mem_op *op)
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
