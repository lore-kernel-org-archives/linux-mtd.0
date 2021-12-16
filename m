Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCDCC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 12:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SGWMzMjxsDYndKbiBm8YjfhGrA+Dq6XHPFc2E6bLqAs=; b=uSIqL4D7tTVKKu
	UlqFjeFX/aOSGKU/ddoP7Yyua65Vclsh4UUO1vT/h6YD55TKXcopC8ej3iL+/TfmqT9R5qWu155kS
	aXg3+CM0B5uskatL6g10AI+4kutD5ssDnXmNP+PIAb1JfbI/sGIUgborqOq00+Sl5quJ1XO+/u1Pa
	9rjxGuam5b19M6qSZjtUcX7VSaaU/1S021kLDzA9RLI54blgdXs3cqJN5CTzUhk4UJufrbJbrr4iB
	FJ01fuy6HWtYv8/k94SHgAHmqFqfjx8w+CMUsz3/QZABG6PLSiZ6EOgeHk5gGxwPxYHcqAwhJPGY7
	YSCLOrfJSzf7DcStvFmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxpTC-005KJR-0e; Thu, 16 Dec 2021 12:02:46 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxolT-00574U-R7
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 11:17:37 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id ED2A4E0006;
 Thu, 16 Dec 2021 11:17:32 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v6 21/28] spi: spi-mem: Kill the spi_mem_dtr_supports_op()
 helper
Date: Thu, 16 Dec 2021 12:16:47 +0100
Message-Id: <20211216111654.238086-22-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211216111654.238086-1-miquel.raynal@bootlin.com>
References: <20211216111654.238086-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_031736_191975_A8E84053 
X-CRM114-Status: GOOD (  13.91  )
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

Now that spi_mem_default_supports_op() has access to the static
controller capabilities (related to memory operations), let's use this
new information in order to derive if the operation is supported or
not by the controller. This way, there is no need for the
spi_mem_dtr_supports_op() helper anymore.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c |  5 +----
 drivers/spi/spi-mem.c             | 27 +++++++++++++--------------
 drivers/spi/spi-mxic.c            | 10 +---------
 include/linux/spi/spi-mem.h       | 11 -----------
 4 files changed, 15 insertions(+), 38 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 0622c7db52e6..24198e085011 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1252,10 +1252,7 @@ static bool cqspi_supports_mem_op(struct spi_mem *mem,
 	if (!(all_true || all_false))
 		return false;
 
-	if (all_true)
-		return spi_mem_dtr_supports_op(mem, op);
-	else
-		return spi_mem_default_supports_op(mem, op);
+	return spi_mem_default_supports_op(mem, op);
 }
 
 static int cqspi_of_get_flash_pdata(struct platform_device *pdev,
diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index bfd5c6b2db0a..aae1bc655299 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -163,24 +163,23 @@ static bool spi_mem_check_buswidth(struct spi_mem *mem,
 const struct spi_controller_mem_caps spi_mem_no_caps = {};
 EXPORT_SYMBOL_GPL(spi_mem_no_caps);
 
-bool spi_mem_dtr_supports_op(struct spi_mem *mem,
-			     const struct spi_mem_op *op)
-{
-	if (op->cmd.dtr && op->cmd.nbytes != 2)
-		return false;
-
-	return spi_mem_check_buswidth(mem, op);
-}
-EXPORT_SYMBOL_GPL(spi_mem_dtr_supports_op);
-
 bool spi_mem_default_supports_op(struct spi_mem *mem,
 				 const struct spi_mem_op *op)
 {
-	if (op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr)
-		return false;
+	struct spi_controller *ctlr = mem->spi->controller;
+	bool op_is_dtr =
+		op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr;
 
-	if (op->cmd.nbytes != 1)
-		return false;
+	if (op_is_dtr) {
+		if (!ctlr->mem_ops->caps->dtr)
+			return false;
+
+		if (op->cmd.dtr && op->cmd.nbytes != 2)
+			return false;
+	} else {
+		if (op->cmd.nbytes != 1)
+			return false;
+	}
 
 	return spi_mem_check_buswidth(mem, op);
 }
diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index 8f8530bd3779..8c8c929c87b5 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -335,8 +335,6 @@ static int mxic_spi_data_xfer(struct mxic_spi *mxic, const void *txbuf,
 static bool mxic_spi_mem_supports_op(struct spi_mem *mem,
 				     const struct spi_mem_op *op)
 {
-	bool all_false;
-
 	if (op->data.buswidth > 8 || op->addr.buswidth > 8 ||
 	    op->dummy.buswidth > 8 || op->cmd.buswidth > 8)
 		return false;
@@ -348,13 +346,7 @@ static bool mxic_spi_mem_supports_op(struct spi_mem *mem,
 	if (op->addr.nbytes > 7)
 		return false;
 
-	all_false = !op->cmd.dtr && !op->addr.dtr && !op->dummy.dtr &&
-		    !op->data.dtr;
-
-	if (all_false)
-		return spi_mem_default_supports_op(mem, op);
-	else
-		return spi_mem_dtr_supports_op(mem, op);
+	return spi_mem_default_supports_op(mem, op);
 }
 
 static int mxic_spi_mem_exec_op(struct spi_mem *mem,
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 5f728f3113bd..b413c8667af7 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -329,10 +329,6 @@ void spi_controller_dma_unmap_mem_op_data(struct spi_controller *ctlr,
 
 bool spi_mem_default_supports_op(struct spi_mem *mem,
 				 const struct spi_mem_op *op);
-
-bool spi_mem_dtr_supports_op(struct spi_mem *mem,
-			     const struct spi_mem_op *op);
-
 #else
 static inline int
 spi_controller_dma_map_mem_op_data(struct spi_controller *ctlr,
@@ -355,13 +351,6 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 {
 	return false;
 }
-
-static inline
-bool spi_mem_dtr_supports_op(struct spi_mem *mem,
-			     const struct spi_mem_op *op)
-{
-	return false;
-}
 #endif /* CONFIG_SPI_MEM */
 
 int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op);
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
