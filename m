Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A90C43458
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jul 2026 09:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7p9CKfFia0I2YEYuIepmGGKIz6vWR4elHpR4ky4QYY=; b=4pY8WmExWQEr5z
	q1wwPml/GrCtSw/LJaEuFXhmqfIPVK0l3mzF4gwVWOJ/aF/T6Zog7gk9HiOOX4AVuxG9Zhnpwv1UQ
	DL0odntOkPs0fKT9LLW1x79pIBC9fTpXZqUSQLflRI3phw3t41q52FyIy+YfE7/1r+lXanllpfg/x
	K2dIjhzFLUpAHctNlcmutuJh4bY/A/UL6caYlh8EGHBil/zkzuJ8XHx383kwcZi4kYmoeklIL9yAx
	3F9wro3+pHMdWcwKv5t63mGX+Uto5ehNkdAuZCZFf4DPn/e8vvxAIpI7uxvrD2jUNNQgUyhbmB2gL
	OpHh96INrwDhvxmuU9Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCiI-00000008gSk-3rAl;
	Mon, 13 Jul 2026 09:12:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCiH-00000008gR8-3T8R
	for linux-mtd@lists.infradead.org;
	Mon, 13 Jul 2026 09:12:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DE33C601D9;
	Mon, 13 Jul 2026 09:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C5101F000E9;
	Mon, 13 Jul 2026 09:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783933952;
	bh=d4Ahol2EVxtqhUVcQmmh5ZgKPqb3XHarv+hB9DRVzAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mWA6kga50AYkrpO3CQGfTzPkyCtgV10DO0fmUji2NPYEmNHKngSQz2Xk2mzRgkLk0
	 CDtQ91TVts33JKzV8lmPSemzqlZjmvdb+rVBdL8lu4krIxZo+tcfMjAw8p89wJD2RP
	 lmHOM83EPRTFOXb6h3hJxSce8kD7MpemF7GNVcoohuoWcWbv7HJaRX978XKXpNdoxb
	 ii4tJwAENIvGmuFa6aJEMhcjHE9MAfeHCquDcPln5mvwy4LolODamgI04D0a33XGgr
	 D+oO9wbMEl7Na47rXsu/x9CrBMAILEfCOKR+KGcgU4o0MocxeB/1E6VdDon+cTIIdd
	 SKoSCUHms4xgQ==
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
Subject: [PATCH v2 6/8] mtd: spi-nor: spansion: s25fs256t: move ARCFN check into .late_init
Date: Mon, 13 Jul 2026 11:11:44 +0200
Message-ID: <20260713091206.2414400-7-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260713091206.2414400-1-mwalle@kernel.org>
References: <20260713091206.2414400-1-mwalle@kernel.org>
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

Signed-off-by: Michael Walle <mwalle@kernel.org>
Tested-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
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
