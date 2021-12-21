Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7ACC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 17:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3g6D2a2gqqLjp990Ix45g5jI/70FrRJ5/J0GaKjry90=; b=E85yWs5O6rn6QU
	P02YHNwqa/+uyZkr6+c/NOwCRm906lYFV9M9jxFgUtWq3jQ3uCczaQzntuSeGtUKrkUPaPlWrMxAR
	gLRBcEPweIaGvx8TG9+u2fT76Vb8AADjddL1Z2+XmbXXqljFMOcKquzEUeUZ/NGEP/RGkZBj1hai5
	cQo2T1t187w/HFelL+sZNMSLI3ZiT2MafM7dLNtX7+RBwv9mqtFreIsvapcUAwckfY2uDl5wk699G
	ad7I5RmcadD8sJdyfPHqWuXSprtD8lsqd+hqoJ8tXGmkGUpk5nl/Vyh5A4B2t85dP68DcVDKGPd3b
	d14trlVY+n8C2B3liZ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzjGC-007vYn-Sv; Tue, 21 Dec 2021 17:49:12 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzjFv-007vSR-LW
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 17:48:57 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 062A320000B;
 Tue, 21 Dec 2021 17:48:51 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v8 03/14] spi: spi-mem: Check the controller extra capabilities
Date: Tue, 21 Dec 2021 18:48:33 +0100
Message-Id: <20211221174844.56385-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211221174844.56385-1-miquel.raynal@bootlin.com>
References: <20211221174844.56385-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_094855_872702_00E30A45 
X-CRM114-Status: GOOD (  10.06  )
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

Controllers can now provide a spi-mem capabilities structure. Let's make
use of it in spi_mem_controller_default_supports_op(). As we want to
check for DTR operations as well as normal operations in a single
helper, let's pull the necessary checks from spi_mem_dtr_supports_op()
for now.

However, because no controller provide these extra capabilities, this
change has no effect so far.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 1dfd38d82607..83651cbc87f2 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -183,11 +183,32 @@ EXPORT_SYMBOL_GPL(spi_mem_dtr_supports_op);
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
+		if (!spi_mem_controller_is_capable(ctlr, dtr))
+			return false;
+
+		if (op->cmd.buswidth == 8 && op->cmd.nbytes % 2)
+			return false;
+
+		if (op->addr.nbytes && op->addr.buswidth == 8 &&
+		    op->addr.nbytes % 2)
+			return false;
+
+		if (op->dummy.nbytes && op->dummy.buswidth == 8 &&
+		    op->dummy.nbytes % 2)
+			return false;
+
+		if (op->data.dir != SPI_MEM_NO_DATA &&
+		    op->dummy.buswidth == 8 && op->data.nbytes % 2)
+			return false;
+	} else {
+		if (op->cmd.nbytes != 1)
+			return false;
+	}
 
 	return spi_mem_check_buswidth(mem, op);
 }
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
