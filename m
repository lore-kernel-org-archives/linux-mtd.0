Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE279C88E4C
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 08:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vZd3coN2rnO9rTlBS/da9x1x7+ndsarHvSSbrpirdYE=; b=wyQ3WUs+2WPuWz
	kyGhhrZjpRMpLiMJuO3GU4LXPgaEH0bsDRblaw1gWPz1Mg6w7xkI2cSMnGNk0xsnImNsWR3JWvRJ0
	OaHiTwWsEfLDNttOahAFObYrY1jkZBGhHVGIPbp5pVAZz6v4amJBmRLnzYOUialpG9y/4RB5YqId3
	O43W7b/dD2L6pG5eyzABV/j2TPwrLVDy/5uVZVzD+38ft7AceSBh3bIzQMU/BNs2BKQezrc37aEKP
	uSKLWiG68Nf3gvSW1cUKQxy9r2EqOp1uvIPB2Hlo2a58UOfs3blvo7RdTBvbIM+CbcfUq1pVmaAZq
	kvSAPcKBTz4tgHkkW5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4x30-0000000GBpT-3b9u;
	Fri, 11 Sep 2026 08:55:50 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4x2u-0000000GBmd-16qr
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 08:55:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4822A4E40180;
	Fri, 11 Sep 2026 08:55:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1A8CA601DE;
	Fri, 11 Sep 2026 08:55:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 823EF11C7AFA0;
	Fri, 11 Sep 2026 10:55:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789116936; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=kkhMf+HVfBqPHLHRY3DS0z3ZcaxJJxytx6vWDhyBIRA=;
	b=FcwwU6FBl4R1YrHe7j1PqJLYspUCd5fqct5/Zpmkom9q20gFpgF+ibcvGnekXcIj8z9CKk
	JRmF2ehAbSCawFQMPnJsP3Xvh2auFn3XhkBIscZ9Mqr+GroNsDEI2vJ5M0v1dK3VCMRBg4
	yrNHQ1bYjDxfHOfUIecyrH0NVjp1KR0pPsk2Au6Di6iHXwrZRJl4sdglCXLy/eqDlC2lg/
	VWgRwgcfOqONba/LN+ZrGpQLSS3xZqmmh/gLEJVwSFCoIGO4ekIzDZcRZOoV+jd5rrEttm
	bMDim/FN+YMJNK/ij92lGkcWqF6NeKWYnwv8FBo0y47ugA+zUMAT1pY2dt5bGw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 11 Sep 2026 10:55:25 +0200
Subject: [PATCH] mtd: spi-nor: Fix quad-enable for flashes with QER bit in
 SR1
MIME-Version: 1.0
Message-Id: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSQqAMAwAvyI5G2jqAvoV8SAaNQfbmoAI4t8tH
 gdm5gFjFTboiweULzGJIQOVBcz7FDZGWTKDd751HREmVou4yo2WBENUPBmPW2ZcXEMVd2tde4L
 cJ+Ws/e9hfN8PR2jLHmsAAAA=
X-Change-ID: 20260911-perso-fix-spi-nor-qe-mxic-d0513e9f4421
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Jon Hunter <jonathanh@nvidia.com>, Steam Lin <STLin2@winbond.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_015544_458247_AB0F2FF5 
X-CRM114-Status: GOOD (  11.54  )
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

Some flashes (eg. from Macronix) do set BFPT_DWORD15_QER_SR1_BIT6, which
means they do not have an SR2 to read from/write to. The new generic QE
helper was supposed to accommodate this situation but in the last version
that got merged, parts of that specific handling has been moved to a
more contained location, swp.c (which needed most of the extra code),
yet the Macronix case has been forgotten about in that generic QE
handling helper. Booting with such flashes will always fail probing.

Fix the situation by making sure we do not attempt to read SR2 if the QE
bit is in SR1.

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/linux-mtd/178876719232.3543902.14451625037676421254.b4-ty@b4/T/#m5bc4ba6776436f2870ced0eb5789d229037ad840
Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status support")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e2b6efafdd8d..ac909dfb9657 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -985,7 +985,10 @@ static int spi_nor_generic_quad_enable(struct spi_nor *nor)
 	if (!qe_mask[0] && !qe_mask[1])
 		return 0;
 
-	ret = spi_nor_read_sr1_and_sr2(nor, sr);
+	if (qe_mask[0])
+		ret = spi_nor_read_sr1(nor, sr);
+	else
+		ret = spi_nor_read_sr1_and_sr2(nor, sr);
 	if (ret)
 		return ret;
 

---
base-commit: 700bf34058ca7cd792236b1ba5caad3770d66208
change-id: 20260911-perso-fix-spi-nor-qe-mxic-d0513e9f4421

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
