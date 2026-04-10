Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E72F459F7
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Apr 2026 17:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+Lxge/XmvFJmf/koFAPreTB1C+xMoWcHo9ICbExF4U=; b=AYt+GOsaoTdRai
	os8xvYGOD//zeGQSNScXK1ISCasl0D7EXN1Wr/N5VQ+I5rlcUrJXh+kGQH0CO9mfWlto3MI1IX6AR
	gcmJoCXmne1n5CrIozYJHb2b6n1lvvopxr75/7rKObAQl0m8T9q04WGpc4O8F8rm8bhcCVrk+n+AM
	UkXPB0y7dyr+YJP4W3ncbaDvD3rni171nELBhLIsC3Z1+u23Zvf/+Drj+Y6RxOrZomIxBeVOQnrdl
	ZKbo2aqt/PybrPTq59RFBi9AvgNBSJko5rOGwPkoBUllAPuxSqcJ2CUkEpSwM+oLeSpJk790sxi5O
	LRf9oTIuRk+VboWwoBhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFrB-0000000CdUJ-4BKg;
	Fri, 10 Apr 2026 17:41:26 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFr9-0000000CdR5-2XNn
	for linux-mtd@lists.infradead.org;
	Fri, 10 Apr 2026 17:41:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4EBEFC5C1A9;
	Fri, 10 Apr 2026 17:41:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11EE7603F0;
	Fri, 10 Apr 2026 17:41:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E68C10450082;
	Fri, 10 Apr 2026 19:41:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775842881; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6cCsRdWer/xoQr7FKNryl+BMiMzpUL7o1CHo+cPuu2k=;
	b=Ep5+M9HSLHRDyXiart+fWuti+USarJuRC0e2PDVSq+djwVJ6Oh+zRrsL0e5uwaGwE239dD
	bOK4GJnkoif2eeCOt6hVLaEYEn/9peMDHTJsqxi0ln/DzLdPKkygB46wM+NnJvxu3LlHWy
	AHRsosfbC0a+zgPP4eocSgaDMwJT9Pc0ovX/3QiP83dsmNdrn2l4X8dVJ6VUZxXK0EnOV1
	VmeZKLrYauSeHDu/6I7R5/IabzaOu6gNfLZJIlFE9lUHM2lx6Bth2k5Yvkvt2j31M04oVv
	xOqO73DY8Dtm+YloPGf5w5EpES9vWbMbNksoBu9PirNe16o4Ci7Nx7XhQoKCxQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 10 Apr 2026 19:41:05 +0200
Subject: [PATCH 5/5] mtd: spinand: winbond: Fix ODTR write VCR on W35NxxJW
MIME-Version: 1.0
Message-Id: <20260410-winbond-6-19-rc1-oddr-v1-5-2ac4827a3868@bootlin.com>
References: <20260410-winbond-6-19-rc1-oddr-v1-0-2ac4827a3868@bootlin.com>
In-Reply-To: <20260410-winbond-6-19-rc1-oddr-v1-0-2ac4827a3868@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>
Cc: Steam Lin <STLin2@winbond.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_104123_799748_38BE89A5 
X-CRM114-Status: GOOD (  10.26  )
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

In most scenarios this variant is actually unused (VCR is written in
SSDR mode), but we need to provide an octal variant. The address is 24
bits but is sent over 4 bytes MSB first. This means we need to shift the
register address by one extra byte for the address to be correct.

I didn't catch this initially because the volatile register region is
256 bytes wide, so the write-then-read procedure did work with the small
register addresses I was using at that time: 0 and 1.

Fixes: 44a2f49b9bdc ("mtd: spinand: winbond: W35N octal DTR support")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index a3fca8a1cff1..269fc587c5fe 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -99,7 +99,7 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 
 #define SPINAND_WINBOND_WRITE_VCR_8D_8D_8D(reg, buf)			\
 	SPI_MEM_OP(SPI_MEM_DTR_OP_RPT_CMD(0x81, 8),			\
-		   SPI_MEM_DTR_OP_ADDR(4, reg, 8),			\
+		   SPI_MEM_DTR_OP_ADDR(4, reg << 8, 8),			\
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_DTR_OP_DATA_OUT(2, buf, 8))
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
