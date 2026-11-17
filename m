Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D835606A88E
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 09:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vEjIg043;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dm8csNeb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RyhLVOfJbqJJHGWKSKFt6HX0gd7WZ1YUw1WMAPJplpc=; b=vEjIg043snDQ2kjLEuXZ5T952n
	P51BbZN1hXBoHzStXUoyvQWeA9WehMLycTPzlJn03GDaMOhOAmOpgkhcTHWc9sOyQEzmi3eis5WU8
	emBBO9ra2C/o7/EbbAACzJzUw/vjRB3hVQZbPZmhe81ZiiGepHlejaaNJ7ThYKYb+J7/SqUFV9G1s
	REj0rX7ADKRCcXsXL3Yi0hlJhgD4Y55fypXO1d52Cgy1iEZuTDAt7LSS5Ig52xQXFAYtCv34b++2Z
	SRJpFQwbnc7V0eZrGHqyNOpz09+0CvcjcjU90UyQXfpJXdDqtMT1caEiVqZR5AQJRnPXzKCmCNIeQ
	rTXAJrxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFdz-000000057Bi-06Le;
	Tue, 17 Nov 2026 09:38:27 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFdo-000000056vO-3p9L
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 09:38:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6AC2BC4EDB9;
	Tue, 17 Nov 2026 09:38:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1BBE45FC81;
	Tue, 17 Nov 2026 09:38:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51D1211BC112B;
	Tue, 17 Nov 2026 10:38:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908294; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=apAmpkE0yUB9HriZqVB6582NZhDT2GNuBD9sC7CKYDY=;
	b=dm8csNebFJOd9Vy0aaq5g2ibRA41Au40Uy/n6aKWvAtDssTcccvAtNYGjIcDATI8R9e3q2
	E7x1kfAs1Q4z+XncYvhJduXnR4bNRAjlQAuJJPn1lD4YbGoI50kcZRWTT1QMwo4FcVRBhm
	cbti09cZsxIwsFnvtl2taX1jo0InUVmNzd822m5ajvLS/t6wBXor+MpjSlO1DD+fSmLI/0
	6jd7niRNfkUA5tqkZ7AfTlyriBTde9SKfmHxiVPWmuflybC1uOY4kEW494Hj+JfxRQVVLT
	HOTLds8xCTOCyA75S2qE7Gm7u2dySXh71XVx8/Fm8Vbe7QVCheKbR6jJF5IS/A==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 07/12] mtd: rawnand: fsmc: Remove #ifdef guards for PM related functions
Date: Tue, 17 Nov 2026 10:37:45 +0100
Message-ID: <20261117093751.14988-8-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117093751.14988-1-paul.cercueil@bootlin.com>
References: <20261117093751.14988-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_013817_153071_7E9C5FC5 
X-CRM114-Status: GOOD (  14.04  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use the new PM macros for the suspend and resume functions to be
automatically dropped by the compiler when CONFIG_PM or
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---

v2: No change
---
 drivers/mtd/nand/raw/fsmc_nand.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 837c23c63aeb..56ab42ee9e7d 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1186,7 +1186,6 @@ static void fsmc_nand_remove(struct platform_device *pdev)
 	}
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int fsmc_nand_suspend(struct device *dev)
 {
 	struct fsmc_nand_data *host = dev_get_drvdata(dev);
@@ -1215,9 +1214,8 @@ static int fsmc_nand_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(fsmc_nand_pm_ops, fsmc_nand_suspend, fsmc_nand_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(fsmc_nand_pm_ops, fsmc_nand_suspend, fsmc_nand_resume);
 
 static const struct of_device_id fsmc_nand_id_table[] = {
 	{ .compatible = "st,spear600-fsmc-nand" },
@@ -1231,7 +1229,7 @@ static struct platform_driver fsmc_nand_driver = {
 	.driver = {
 		.name = "fsmc-nand",
 		.of_match_table = fsmc_nand_id_table,
-		.pm = &fsmc_nand_pm_ops,
+		.pm = pm_sleep_ptr(&fsmc_nand_pm_ops),
 	},
 };
 
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
