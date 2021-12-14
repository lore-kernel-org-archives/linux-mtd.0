Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CB9C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Dec 2021 11:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nEU7evqSJ8r0ipsMyDhVuVapnqNwKRW6Auel5BNIPbg=; b=IvwleDpom5Jc5M
	4zpaHSylEAfey93H1g/TyGvXdKpm+ucU+O6OTvsPXVTkPGl0jEeBD56nNiS4d0egLK8C0SNmlvpZi
	Kxoxj1ysxzdmbX2rI0tqTe2u9b3AcyA3J6SBzRpPMd5q3EnhzKZAyo66ADQ9G/bnNo34p7RnPAtQv
	wz4jAcbBF02PnzuoaNom8LV3JK0FtdX3/rJQKklUgADqqHQ4+UeblOyIKaRvFDr2gi9JWzy9FpRCG
	cZEJtWg6jGj4I562bGyOwDjYWxpKEyoPoXM5ZlGSydoQfZcjaQ/pjuqHBTOwKz2IXfJKCMxGdutvo
	JDuwH0yxmIKyQBu0YIXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx6O1-00DmtC-6R; Tue, 14 Dec 2021 11:54:25 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx6C9-00Djh3-QQ
 for linux-mtd@lists.infradead.org; Tue, 14 Dec 2021 11:42:11 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C6375240009;
 Tue, 14 Dec 2021 11:42:06 +0000 (UTC)
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
Subject: [PATCH v5 12/13] spi: mxic: Use spi_mem_generic_supports_op()
Date: Tue, 14 Dec 2021 12:41:39 +0100
Message-Id: <20211214114140.54629-13-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211214114140.54629-1-miquel.raynal@bootlin.com>
References: <20211214114140.54629-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_034210_056168_641A9BA1 
X-CRM114-Status: GOOD (  11.26  )
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

This driver can be simplified a little bit by using
spi_mem_generic_supports_op() instead of the
spi_mem_default/dtr_supports_op() couple. The all_false boolean is
inverted to become a dtr boolean, which checks if at least one of the
operation member uses dtr mode. The idea behind this change is to
simplify the introduction of the pipelined ECC engine.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mxic.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index 485a7f2afb44..5e71aa630504 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -452,7 +452,7 @@ static ssize_t mxic_spi_mem_dirmap_write(struct spi_mem_dirmap_desc *desc,
 static bool mxic_spi_mem_supports_op(struct spi_mem *mem,
 				     const struct spi_mem_op *op)
 {
-	bool all_false;
+	struct spi_mem_controller_caps caps = {};
 
 	if (op->data.buswidth > 8 || op->addr.buswidth > 8 ||
 	    op->dummy.buswidth > 8 || op->cmd.buswidth > 8)
@@ -465,13 +465,9 @@ static bool mxic_spi_mem_supports_op(struct spi_mem *mem,
 	if (op->addr.nbytes > 7)
 		return false;
 
-	all_false = !op->cmd.dtr && !op->addr.dtr && !op->dummy.dtr &&
-		    !op->data.dtr;
+	caps.dtr = op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr;
 
-	if (all_false)
-		return spi_mem_default_supports_op(mem, op);
-	else
-		return spi_mem_dtr_supports_op(mem, op);
+	return spi_mem_generic_supports_op(mem, op, &caps);
 }
 
 static int mxic_spi_mem_dirmap_create(struct spi_mem_dirmap_desc *desc)
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
