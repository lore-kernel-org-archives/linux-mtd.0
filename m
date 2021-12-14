Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CAEC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Dec 2021 11:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fT+i77fV4zf2UJV5gPskRAWKxuF9K112+/a7nu48w2c=; b=LfMEqetJNM5OiY
	QwdjWWb9tmUmvg2i+6pXEB1jNAzJCSwZ1iYK4yfqiXHf0JXxPqm74rOoIDH9fZh8sW8VkaYfqpG8W
	+0FtHOTFGibbjGzuArKM7TbIQlFr/lmcvrGx6+yM16MXAW8EH4pHj1TU2E/5GW10+Y5Tk3U8gQFek
	UO5Sd+3XqR4DvqRkyQERR85+iMEVqAGldlRBfJj85QNvD9Y4Z3GWc440YIhi8DwopJF0PQUHN47No
	dgIU5ptWjAayVcX0v0oWZ/05o6snfbm/JL4BcugdpALsQVLQfzuf+UTtm9UHkljyjYFRsyr3j8PlM
	RZSO6MKr3pa+l7VLtbKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx6Eo-00DkdY-3L; Tue, 14 Dec 2021 11:44:54 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx6Bw-00Djb9-Ge
 for linux-mtd@lists.infradead.org; Tue, 14 Dec 2021 11:41:58 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 2A9D3240009;
 Tue, 14 Dec 2021 11:41:53 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 05/13] spi: spi-mem: Export the
 spi_mem_generic_supports_op() helper
Date: Tue, 14 Dec 2021 12:41:32 +0100
Message-Id: <20211214114140.54629-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211214114140.54629-1-miquel.raynal@bootlin.com>
References: <20211214114140.54629-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_034156_730956_00827687 
X-CRM114-Status: GOOD (  12.00  )
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
instead of creating yet another set of helpers each time we want to
check something new. In the future if we see that many different drivers
use the same parameter values, we might be tempted to create a specific
helper for that. But for now, let's just make the generic one
available.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c       |  7 ++++---
 include/linux/spi/spi-mem.h | 12 ++++++++++++
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 4c6944d7b174..df2ec2c8ce31 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -160,9 +160,9 @@ static bool spi_mem_check_buswidth(struct spi_mem *mem,
 	return true;
 }
 
-static bool spi_mem_generic_supports_op(struct spi_mem *mem,
-					const struct spi_mem_op *op,
-					struct spi_mem_controller_caps *caps)
+bool spi_mem_generic_supports_op(struct spi_mem *mem,
+				 const struct spi_mem_op *op,
+				 struct spi_mem_controller_caps *caps)
 {
 	if (!caps->dtr) {
 		if (op->cmd.dtr || op->addr.dtr ||
@@ -178,6 +178,7 @@ static bool spi_mem_generic_supports_op(struct spi_mem *mem,
 
 	return spi_mem_check_buswidth(mem, op);
 }
+EXPORT_SYMBOL_GPL(spi_mem_generic_supports_op);
 
 bool spi_mem_dtr_supports_op(struct spi_mem *mem,
 			     const struct spi_mem_op *op)
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index f365efcfb719..a17dd5035530 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -325,6 +325,10 @@ void spi_controller_dma_unmap_mem_op_data(struct spi_controller *ctlr,
 					  const struct spi_mem_op *op,
 					  struct sg_table *sg);
 
+bool spi_mem_generic_supports_op(struct spi_mem *mem,
+				 const struct spi_mem_op *op,
+				 struct spi_mem_controller_caps *caps);
+
 bool spi_mem_default_supports_op(struct spi_mem *mem,
 				 const struct spi_mem_op *op);
 
@@ -347,6 +351,14 @@ spi_controller_dma_unmap_mem_op_data(struct spi_controller *ctlr,
 {
 }
 
+static inline
+bool spi_mem_generic_supports_op(struct spi_mem *mem,
+				 const struct spi_mem_op *op,
+				 struct spi_mem_controller_caps *caps)
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
