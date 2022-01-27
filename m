Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A3BC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jan 2022 09:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQ4Kr3lnlgdXWtNcCet4+lnM2+KkE+rKNJ6zTuzwNsY=; b=AR5ADoQxSIocp3
	/mLgLl/d2g4YnL0hN3ZfhJ0PqlzxghvR9R8nTGHW89y8f7i+NNtdwqGaSldUCDx8SKXTaJYMs9Tmv
	1mOH0eDmU5WNF/wq/it1q1PcNHNvOmOJn/rqdNsaMxG4VCP9Eex+KiUQi7IETDuczuIdU6oA+xAFT
	qUGkEhE9Y7896eBqekaMkAeexnOUvZP2g82UnDhwP//gjotqAyPvtCvBxhff4d0OhVXDllno5uKxj
	nANvz3MKV59Zf3n8FA88KZKLu9Iq2E06CRMNOBhyXB5UwdZB54AlmGN+PyrLgVNhnf2mq/m68roTm
	qMg8ACLMQXSDBtRdlM+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD0wL-00ErHW-SQ; Thu, 27 Jan 2022 09:19:37 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD0v3-00EqnF-5G
 for linux-mtd@lists.infradead.org; Thu, 27 Jan 2022 09:18:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4C82C100009;
 Thu, 27 Jan 2022 09:18:14 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v10 02/13] spi: spi-mem: Check the controller extra
 capabilities
Date: Thu, 27 Jan 2022 10:17:57 +0100
Message-Id: <20220127091808.1043392-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127091808.1043392-1-miquel.raynal@bootlin.com>
References: <20220127091808.1043392-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_011817_364455_DEEE8DF6 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Link: https://lore.kernel.org/linux-mtd/20220104083631.40776-3-miquel.raynal@bootlin.com
---
 drivers/spi/spi-mem.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 37f4443ce9a0..86e6597bc3dc 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -173,11 +173,20 @@ EXPORT_SYMBOL_GPL(spi_mem_dtr_supports_op);
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
+		if (op->cmd.nbytes != 2)
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
