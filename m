Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F02CC6B1D
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 16:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLXdcNyAfq62MSDnaXkp0t3E90M1PL7jqTgvkhm0ItE=; b=MPQXFB5zrHIlt5
	45IWqWYAk6TsrH1JCfkBTt7fiJfSnh//IUzFDH3BZsrKyyMfn8B7sPROVT6h/xqIKqze/paUGfLxP
	vX54skxg4ml59nuKRLFuQusyd/LXLBNx/DZsbsZ2XaEn2+63728ca/PVZWg0vNPtQHCddvEgpOQdA
	ZNrxsM/ImJyZFNz/Aj0Dlbw1rkc+4j7HBjZjgzoPUVSC98l5zVWe0BJnDEP+Oa2tUQXLxLc+0teKc
	j0AHrtBbOMrI2k8nFaj2gbr6hUVx61l8fMMtaMwBjHAlI1iwb8GcWnLZLBuGY38hiMpO3wlZP6d90
	9FU2hTRsqpabCcJ2fApg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfSl-0000000DX6c-03vp;
	Tue, 13 Oct 2026 16:34:51 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfSd-0000000DX1Q-2aI3
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 16:34:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 378FC1A1216;
	Tue, 13 Oct 2026 16:34:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0CD4F60362;
	Tue, 13 Oct 2026 16:34:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62A1111D7180D;
	Tue, 13 Oct 2026 18:34:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791909281; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hd4xqbqZfQTtYZlZh1PzDHrfekBZu/c7Qjh9nfxt1Qc=;
	b=fM1GoyxxLNsEWBaPPsjoqb2rLKiGA2NZsdwe5ew2CQfrjDhOpU61o7SP/4AOswN3tZMwPN
	yQd5qMwQCc2vCACizDVQtS4ciwVRVGsw9Qxj9XmQiXxBbX3o3Ue7zbBvao13iWOi93GiIY
	KFSLLEhdtSn0cb2ahZmYrnAeVbW5nuzp7LIe2rXq7pgZS4ZnXZ0jtbfMv7HGM3mKhQUZTn
	ovVrPSf8Z1dARJumZDi2vkKjq65UUIvZZF1CBaGhfoweLoIyXlT5/srxuqRRnQr/pEBixY
	D42nFQrrcjEbe85aR3DdNkZB0W6WYhcr9aPONzEOTCW4VOZVhA/9FQj/JzB6GQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 13 Oct 2026 18:33:56 +0200
Subject: [PATCH v3 06/17] mtd: spi-nor: Fix the meaning of a comment
MIME-Version: 1.0
Message-Id: <20261013-winbond-master-spi-nor-w35t-v3-6-6dde1d513df8@bootlin.com>
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
In-Reply-To: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_093447_974131_6A5D0016 
X-CRM114-Status: GOOD (  12.91  )
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

I got mislead by the comment above spi_nor_setup() which implies that we
program a specific configuration into the device. spi_nor_setup() is
pure software, it is the step where the core configures itself for
dealing with the device. spi_nor_init() is where we tell the device how
to communicate with us based on all the knowledge we gathered from its
SFDP table and the DT.

Improve the comment a bit to reflect the fact that one should not write
volatile configurations in spi_nor_setup(). spi_nor_init() should be
used for that instead (since it is called at resume time).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 2bbec3feda39..bc11c8cbb234 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3458,7 +3458,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		init_waitqueue_head(&nor->rww.wait);
 
 	/*
-	 * Configure the SPI memory:
+	 * Decide how we will deal with the SPI memory:
 	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
 	 * - set the number of dummy cycles (mode cycles + wait states).
 	 * - set the SPI protocols for register and memory accesses.

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
