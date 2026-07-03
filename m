Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E56C43458
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2026 14:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZlK7CVbgYqvKT0XSP4gdpN9Ifv/DHYXQv7yfNM4aAc=; b=SqaN4xcvs6iWAI
	e3BfrbhN+yanhRnn6/2NwAF8vZrPiC7yzyg4dOM+vCmQ8N3/Rug07DGcTHxLvKLTMHeu3YJ3Pc5n+
	+dbqBSqOErrH54RBwGhkCNwbXSx1BTmjSt38veCZsD8Z6FtsDeY49A6CEbBGGjkyP9vLpdQ79c0gW
	RVM4+YUEKhe1OZDCmBfRV78k7fquvylVK+IlW7JleaZx99f4JE1dt0rly75OlKeuN38P/6u8iT4xw
	ovxAU+f20I6j5A918epDlXJqK+FH05NCIyVgrWakjYG2iL5m7sbGAJjWKeN+Pfb+8TmWnKQQjtcSc
	XCzl803cLi5K8u1DAUMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeuf-00000007GgJ-1W8I;
	Fri, 03 Jul 2026 14:30:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeud-00000007Gf9-3zo3
	for linux-mtd@lists.infradead.org;
	Fri, 03 Jul 2026 14:30:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6497E600B0;
	Fri,  3 Jul 2026 14:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D7F1F000E9;
	Fri,  3 Jul 2026 14:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783089039;
	bh=8jftU6zv2wl3oDx41cJhVCYvQrvyQyq+7JnHl1vQWws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R8caNXT/G/xQ1bwaIiF5sEuGqATtPGqikZQ4+N2J7cJt/SZXcp8rrBJZapZ58byrg
	 eEHAw06cE15bqrYqMvNUVbOd3V2FYiZM/smIc3ytRHM1KbjhExv6Owe7guVyx3b2qG
	 +NeJ/doNGwpqEHaAmqITxMF/7cgZvMbmxoPUzPiNpa2tkWHGWe6aLirfq8x27XUeBl
	 C466jGFcvHBMZ+krzQcxfJNVNkvyIgrKce0zZUyhEwJjkA+8poU49tDdo1pjWxr0w2
	 BJhZZKYf8GJOf8x/ftlNGpzsRIMq+U+CdxL1PGt7Ufmq689nrrqkfgI4c8OfE6Xgg0
	 J1VOQmMnRjoLQ==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/8] mtd: spi-nor: spansion: s25fs256t: move ARCFN check into .late_init
Date: Fri,  3 Jul 2026 16:29:17 +0200
Message-ID: <20260703143003.1809579-7-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260703143003.1809579-1-mwalle@kernel.org>
References: <20260703143003.1809579-1-mwalle@kernel.org>
MIME-Version: 1.0
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

The SFPD parsing is optional. It not meant to fail if something is wrong
with the chip (except for the SFDP itself). Thus it doesn't make any
sense to return -ENODEV.

Move that check to late_init(), which might fail and abort the flash
probing.

Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/mtd/spi-nor/spansion.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index fc5da04aff07..40d3236c723b 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -545,7 +545,6 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
 			  const struct sfdp_parameter_header *bfpt_header,
 			  const struct sfdp_bfpt *bfpt)
 {
-	struct spi_mem_op op;
 	int ret;
 
 	/* Assign 4-byte address mode method that is not determined in BFPT */
@@ -555,19 +554,6 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
 	if (ret)
 		return ret;
 
-	/* Read Architecture Configuration Register (ARCFN) */
-	op = (struct spi_mem_op)
-		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
-					  SPINOR_REG_CYPRESS_ARCFN, 1,
-					  nor->bouncebuf);
-	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
-	if (ret)
-		return ret;
-
-	/* ARCFN value must be 0 if uniform sector is selected  */
-	if (nor->bouncebuf[0])
-		return -ENODEV;
-
 	return 0;
 }
 
@@ -598,6 +584,22 @@ static int s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
 
 static int s25fs256t_late_init(struct spi_nor *nor)
 {
+	struct spi_mem_op op;
+	int ret;
+
+	/* Read Architecture Configuration Register (ARCFN) */
+	op = (struct spi_mem_op)
+		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
+					  SPINOR_REG_CYPRESS_ARCFN, 1,
+					  nor->bouncebuf);
+	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+	if (ret)
+		return ret;
+
+	/* ARCFN value must be 0 if uniform sector is selected  */
+	if (nor->bouncebuf[0])
+		return -ENODEV;
+
 	cypress_nor_ecc_init(nor);
 
 	return 0;
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
