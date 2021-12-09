Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6389C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 17:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ONVggFEsChr+w68HHUsthNdBhccobX8347V0kGRj5SE=; b=WmvzyndIbE2hV9
	kL12A6HmUA4nDI7E7S3KF+LHJMKtsJ+fqcQD8vFXpSxZt01RY20vt646v4YI31xHuK6UWTfix4vh9
	5yQkgro/neKq9DZfNfpXkoDSurFO1GmYXTY5/fAEP43U80ORiYVom+j+9sYlTv+KoKPE5DgH1NLfF
	p1IujaQuTkdnOqAHKvsQoonIiB0p8A8LA4R7UrGAeTSyPTEVBOowNJTG8F8Yi4LFFY09m9VkpgTfp
	rDAqcz/fyeTXEtmvsRetUk2HWkZqcU1rMcGad4a/aCxUqIUpW5Xi/GbpaxB74gf4RyNwj+fCd7zVW
	SCLQaA81lgIf92GHOTtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvNR5-00H1jI-W3; Thu, 09 Dec 2021 17:42:28 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvNPe-00H1EA-20
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 17:40:59 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id D7C76240003;
 Thu,  9 Dec 2021 17:40:54 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 03/12] spi: spi-mem: Create a helper to gather all the
 supports_op checks
Date: Thu,  9 Dec 2021 18:40:37 +0100
Message-Id: <20211209174046.535229-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211209174046.535229-1-miquel.raynal@bootlin.com>
References: <20211209174046.535229-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_094058_306734_F431B9D1 
X-CRM114-Status: GOOD (  12.97  )
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

So far we check the support for:
- regular operations
- dtr operations
Soon, we will also need to check the support for ECC operations.

As the combinatorial will increase exponentially, let's gather all the
checks in a single generic function. This new helper will be called by
the exported functions, directly used by the different drivers.

Then, in a second time, we will add an ECC check and allow this new
helper to be directly used to avoid increasing dramatically the number
of new helpers needed to cover the {dtr-on/dtr-off, ecc-on/ecc-off}
situations, and perhaps others too. It will always be possible to create
abstraction helpers in the future if a particular combination is
regularly used.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 37f4443ce9a0..013efaaaac75 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -160,26 +160,36 @@ static bool spi_mem_check_buswidth(struct spi_mem *mem,
 	return true;
 }
 
+static bool spi_mem_generic_supports_op(struct spi_mem *mem,
+					const struct spi_mem_op *op,
+					bool dtr)
+{
+	if (!dtr) {
+		if (op->cmd.dtr || op->addr.dtr ||
+		    op->dummy.dtr || op->data.dtr)
+			return false;
+
+		if (op->cmd.nbytes != 1)
+			return false;
+	} else {
+		if (op->cmd.nbytes != 2)
+			return false;
+	}
+
+	return spi_mem_check_buswidth(mem, op);
+}
+
 bool spi_mem_dtr_supports_op(struct spi_mem *mem,
 			     const struct spi_mem_op *op)
 {
-	if (op->cmd.nbytes != 2)
-		return false;
-
-	return spi_mem_check_buswidth(mem, op);
+	return spi_mem_generic_supports_op(mem, op, true);
 }
 EXPORT_SYMBOL_GPL(spi_mem_dtr_supports_op);
 
 bool spi_mem_default_supports_op(struct spi_mem *mem,
 				 const struct spi_mem_op *op)
 {
-	if (op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr)
-		return false;
-
-	if (op->cmd.nbytes != 1)
-		return false;
-
-	return spi_mem_check_buswidth(mem, op);
+	return spi_mem_generic_supports_op(mem, op, false);
 }
 EXPORT_SYMBOL_GPL(spi_mem_default_supports_op);
 
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
