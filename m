Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EABC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 17:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UcSwYzJ5wBZ9fEt9ag0yusjJiEWXSWFf9wqSYXoZMKM=; b=XEKhqRTJmDblQ3
	VwYCY2OQDQXqkk54cJi/lJGuPDOam/taP+H01DpTSCdVbxGitj2/yE6qD+KeGCJ1p6FlTD87zGqbg
	bm2fhcaPRrNoaWh8hhjodeGGbGHrZWFQDitAhtM1xV1XEoSX2Ei7E652KDWwI5zRGFTowqj3NBbze
	9cvTk/ySkZHOct6PennGESewS7JtVUP//vqQOOURUDYG7Sy6JVOyg7vp61+1zKFOSnhizeg6efAme
	lCUOFmlfLX2qM2BBkKtJlRSH0ufszpl78OWISrtTOqRg2hMTve5oFbYQVWaw7zShqKYFonZRYqIXZ
	LngGGpAObzXN7pFRkO9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myGrv-00BRS5-TO; Fri, 17 Dec 2021 17:18:08 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myFv1-00B7Zh-VW
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 16:17:17 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id B7B4C200011;
 Fri, 17 Dec 2021 16:17:11 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v7 06/14] spi: spi-mem: Kill the spi_mem_dtr_supports_op()
 helper
Date: Fri, 17 Dec 2021 17:16:46 +0100
Message-Id: <20211217161654.367782-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211217161654.367782-1-miquel.raynal@bootlin.com>
References: <20211217161654.367782-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_081716_324566_69DE6F1D 
X-CRM114-Status: GOOD (  10.17  )
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
controller capabilities (related to memory operations), and now that
these capabilities have been filled by the impacted controllers, there
is no need for a specific helper checking only DTR operations, so let's
just kill spi_mem_dtr_supports_op() and simply use
spi_mem_default_supports_op() instead.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c |  5 +----
 drivers/spi/spi-mem.c             | 10 ----------
 drivers/spi/spi-mxic.c            | 10 +---------
 include/linux/spi/spi-mem.h       | 11 -----------
 4 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 98e0cc4236e3..bc6b33bce0bb 100644
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
index 677e54221ebc..cfe1c99db5f3 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -160,16 +160,6 @@ static bool spi_mem_check_buswidth(struct spi_mem *mem,
 	return true;
 }
 
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
diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index e137b1ec85d4..67d05ee8d6a0 100644
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
index 045ecb7c6f50..d7787c8f3746 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -332,10 +332,6 @@ void spi_controller_dma_unmap_mem_op_data(struct spi_controller *ctlr,
 
 bool spi_mem_default_supports_op(struct spi_mem *mem,
 				 const struct spi_mem_op *op);
-
-bool spi_mem_dtr_supports_op(struct spi_mem *mem,
-			     const struct spi_mem_op *op);
-
 #else
 static inline int
 spi_controller_dma_map_mem_op_data(struct spi_controller *ctlr,
@@ -358,13 +354,6 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
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
