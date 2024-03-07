Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B454C54E49
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2024 11:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zzxGapihkW6zWC88m3ZNq/tivkw6tVmygnfKmAudijk=; b=IzBKDezGSEX+w0
	JSVHcKmN+FtQtY9Rh1d8wmTw7YsgH3QnnNP3UusBuJ59hCduj9dVgaaWv/EMF0xqrzfU50hlWSPTc
	e9m5bV82TcgpBCWohz0QjrFgvYBZcLoGaVOaSplCev14Gn35pOAkGN7ZHa1sSfIVPZaXDuhx+NvUZ
	ce/iz96uV94CthiIJ5UcNQCLjW1fbpZE4COqSMvSV2AAnCvxFdEwSkHEEYUn4/iP7EsekBNsRfWUx
	9y2jkbAr3eEHv53xetXH/mfzrHGPyIEEDebFevVRGehDa1t9su62NGe9uVOafSMqJVQxwyYZnIqOw
	IsXbdxXy3G9uUkej1tAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riCJU-00000004RZk-1seM;
	Thu, 07 Mar 2024 11:53:28 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riCJQ-00000004RXb-44KG
	for linux-mtd@lists.infradead.org;
	Thu, 07 Mar 2024 11:53:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81FE8E000F;
	Thu,  7 Mar 2024 11:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709812401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4gfOLzMfOuj4PpOKwX97oBCeemWK8LHtpA2XW/OPMjA=;
	b=pEalU7Z7OK34nBBZELLnLk1hBXNu4Kd/y67OaFV0nwiHCnXHG7QJYLvW1wGVE+cdXAYCWR
	wCTSGIH/nfc/qfAquKGFYdd+f9GkP2D2SzHs3fMsbxT1go6ok+1P9iPOlE59XibmJKku+e
	h+tdvPONIGm2yMz+MmvCPStmNyqwdhyEdQFG42JwSTdcNPNCgqZ3fgZtOhCJanC3o+XutB
	h2CiTyAz9cqeM5omb5BklfJSdcOtQbrQf/PkpOCNZ62yFVnA9B/g2vrE7aWLgEcQypVDcO
	PIT2m7dZRklsxy1Ci8zFn0mi41BXFAjX+mI+7Mg3cqsWeEmHqXgcd5HN4MaRdA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	eagle.alexander923@gmail.com,
	mans@mansr.com,
	martin@geanix.com,
	=?UTF-8?q?Sean=20Nyekj=C3=A6r?= <sean@geanix.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] mtd: rawnand: Constrain even more when continuous reads are enabled
Date: Thu,  7 Mar 2024 12:53:14 +0100
Message-Id: <20240307115315.1942678-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_035325_312541_E462483F 
X-CRM114-Status: GOOD (  14.62  )
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

As a matter of fact, continuous reads require additional handling at the
operation level in order for them to work properly. The core helpers do
have this additional logic now, but any time a controller implements its
own page helper, this extra logic is "lost". This means we need another
level of per-controller driver checks to ensure they can leverage
continuous reads. This is for now unsupported, so in order to ensure
continuous reads are enabled only when fully using the core page
helpers, we need to add more initial checks.

Also, as performance is not relevant during raw accesses, we also
prevent these from enabling the feature.

This should solve the issue seen with controllers such as the STM32 FMC2
when in sequencer mode. In this case, the continuous read feature would
be enabled but not leveraged, and most importantly not disabled, leading
to further operations to fail.

Reported-by: Christophe Kerello <christophe.kerello@foss.st.com>
Fixes: 003fe4b9545b ("mtd: rawnand: Support for sequential cache reads")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 4d5a663e4e05..2479fa98f991 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -3594,7 +3594,8 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 	oob = ops->oobbuf;
 	oob_required = oob ? 1 : 0;
 
-	rawnand_enable_cont_reads(chip, page, readlen, col);
+	if (likely(ops->mode != MTD_OPS_RAW))
+		rawnand_enable_cont_reads(chip, page, readlen, col);
 
 	while (1) {
 		struct mtd_ecc_stats ecc_stats = mtd->ecc_stats;
@@ -5212,6 +5213,15 @@ static void rawnand_late_check_supported_ops(struct nand_chip *chip)
 	if (!nand_has_exec_op(chip))
 		return;
 
+	/*
+	 * For now, continuous reads can only be used with the core page helpers.
+	 * This can be extended later.
+	 */
+	if (!(chip->ecc.read_page == nand_read_page_hwecc ||
+	      chip->ecc.read_page == nand_read_page_syndrome ||
+	      chip->ecc.read_page == nand_read_page_swecc))
+		return;
+
 	rawnand_check_cont_read_support(chip);
 }
 
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
