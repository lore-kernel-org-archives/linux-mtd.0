Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F725C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 08:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vEYTn7O4nvwm9lJ+5qFxQ/3I5uVP/SYhWJju/eJPe+c=; b=NTIkxHCdxftKBx
	pq59QNeov8Qseb6fprXgjuObdwx/QtB2eEol0qWSRpGjoUIlf6J7H2NQUJWHgZg9nfTcWCpqxiUEG
	cRvTDMgb5O5rUV7vuJ8SlOxaV3iHcye9xv6j9hgLMZhoIe2Uyr91qy8CY9uB1vkj5x1HQeel7eMJu
	nFzD9TJumFnL24mCHuQWSkJS8KRTnGIgNb47KPo1VbQvDZTvADtaqcMqQi93e+xckjXWnIQmeB0pL
	lB6vD/RRUqXhA1phVFfzIesnbkdruWNewxEqbkMcwcloChJgsIsOV1eF8PQrZ2PI7Onk4NdYlbvDo
	sHK2JOUbntp/It6s8rng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4fJE-00AkgM-Qw; Tue, 04 Jan 2022 08:36:44 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4fJ9-00Akez-W8
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 08:36:43 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3B90C1C0008;
 Tue,  4 Jan 2022 08:36:37 +0000 (UTC)
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
Subject: [PATCH v9 02/13] spi: spi-mem: Check the controller extra capabilities
Date: Tue,  4 Jan 2022 09:36:20 +0100
Message-Id: <20220104083631.40776-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220104083631.40776-1-miquel.raynal@bootlin.com>
References: <20220104083631.40776-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_003640_190150_F1F736C7 
X-CRM114-Status: GOOD (  10.23  )
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
