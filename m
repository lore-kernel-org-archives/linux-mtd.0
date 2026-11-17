Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604D8606A880
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 09:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x/MDhMQI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=I4Nk4L/h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7PJWdU0Fgbv44kmI+f1KGBXQEFkbUEgKXV04LUWY/yQ=; b=x/MDhMQIHlivoRHPPtkH0I+bi9
	myWr3GNPPkxWddqG2LPAHL2HW4Nz1JhturLGUFIslcmbuSwwADAgk0NHKPf80lwmNUSToHLjO5XKZ
	/aii0hWq2KFVTQ2qBbV6myhKSW1hWbufvsIwLuib1YCSw8joxF9ZzLDBr7ot90YmbmM5pIzJm2MEb
	zfNVA0i/d/PyE2+/HfFlxkBNLJA34yv+5qPXuplkqMVU/JFoL7BY3WtsYNQS/4KJ7XeK76bjV1pIB
	zo9fv4WfiPziZgF6r+aYZaCbP/mgIHDMZjmOoPVbb0i30QJsstCc0lZnqbYVNpsLIS6PmH8t1Nwtf
	n50H24Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFdy-000000057BX-3maC;
	Tue, 17 Nov 2026 09:38:26 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFdo-000000056t1-00UW;
	Tue, 17 Nov 2026 09:38:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 185661A158C;
	Tue, 17 Nov 2026 09:38:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D93D15FC81;
	Tue, 17 Nov 2026 09:38:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B5CC11BC0C04;
	Tue, 17 Nov 2026 10:38:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908292; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=/RD6QcqfT8lVqNV9ZoXFSMLkdbPS8XDfq1YdC5eCrLI=;
	b=I4Nk4L/h2QpDBJLYY5gLsTTTDYv8Ivf8x6rjV60TsXh7rfHxs3zA7ug4gmIjNLdvE+JEKA
	aSRecseI3/KOo1rgfOKTno22PqQh0ez73DNgz4ClEnRjil5Ijj+fqnB4y8yIlFHcZctn2y
	SF8SR6sgV5Nr4cKNJ7xEJGEIVv3LbVAv/iEYcc+WjOR/nL025qEotPChW2HzTl/P5YVFuz
	bAdvDU9oGaMSyWU7uTa25E8YIY6z29HjgMGeH2/vZ0BJDY4Jy638rg6tWjcHPEArqLS8Gf
	OKdChEujc8+zzrKtjVDcHt2xGJkWuOYVpADTs2tsyHln7gcNtmpHi1ZYfSClXQ==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 06/12] mtd: nand: mtk: Remove #ifdef guards for PM related functions
Date: Tue, 17 Nov 2026 10:37:44 +0100
Message-ID: <20261117093751.14988-7-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117093751.14988-1-paul.cercueil@bootlin.com>
References: <20261117093751.14988-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_013816_227276_2224EE57 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

v2: No change
---
 drivers/mtd/nand/ecc-mtk.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/ecc-mtk.c b/drivers/mtd/nand/ecc-mtk.c
index 66f0985ef7cd..6f210ba935ad 100644
--- a/drivers/mtd/nand/ecc-mtk.c
+++ b/drivers/mtd/nand/ecc-mtk.c
@@ -588,7 +588,6 @@ static int mtk_ecc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int mtk_ecc_suspend(struct device *dev)
 {
 	struct mtk_ecc *ecc = dev_get_drvdata(dev);
@@ -612,8 +611,7 @@ static int mtk_ecc_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(mtk_ecc_pm_ops, mtk_ecc_suspend, mtk_ecc_resume);
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(mtk_ecc_pm_ops, mtk_ecc_suspend, mtk_ecc_resume);
 
 MODULE_DEVICE_TABLE(of, mtk_ecc_dt_match);
 
@@ -622,9 +620,7 @@ static struct platform_driver mtk_ecc_driver = {
 	.driver = {
 		.name  = "mtk-ecc",
 		.of_match_table = mtk_ecc_dt_match,
-#ifdef CONFIG_PM_SLEEP
-		.pm = &mtk_ecc_pm_ops,
-#endif
+		.pm = pm_sleep_ptr(&mtk_ecc_pm_ops),
 	},
 };
 
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
