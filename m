Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50925606A331
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 17:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ge1McuLW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mRkciElr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=F/JMqKAhqTUAwbZf0gpbxvXMaMrfPHQtEZvL03B8Zqo=; b=Ge1McuLWmTej+wy5XzUeXC0gam
	thMd1wqZF6ujjuv6sV6i6WOJuI6hy53Ut18wA2Ra1AlgWYgC5A8k9gAhVPB/3waf08PpPZ97XzmxD
	gGGtGzElcbS6hcfOeDYtGMc8vcjF9pHAIhxFUgE35uNeTV7KdJS2DzxL6MTLl+CTkcbQdakvnWKCl
	DZjHM//60Tfi3ytst0uI8CNtTq48jV64TJhpGKaG6zFEr0LmeS/xoDM7ZE4R8Sk8YSQVrRKhEE8/M
	vE90m/H59qn1Xo6FFnlVTPGK2r2bGtIMrSMP6OTMoh/PT3K8xoYpTsWLzmGYOxL+g8H04J6++wy/9
	2wd0DP7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP12T-00000009p8L-3u4c;
	Thu, 05 Nov 2026 17:14:14 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP11F-00000009oZb-1btn
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 17:13:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D856E4E40944;
	Thu,  5 Nov 2026 17:12:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A74E15FF43;
	Thu,  5 Nov 2026 17:12:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46C2A103292AB;
	Thu,  5 Nov 2026 18:12:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898775; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=meKomacjCgDHDujcj43Gx3nzO9N+WR5rogxiQaTOISk=;
	b=mRkciElrqKClJNr6/SQrGIDSQ2XVqodvghCXjUYu6D+iaY5WKW0asQqeA5GF6MLOYiQlwp
	Gpui83w3OtKoa0cDtnFoaVKlovL7kpst8TG0zrvJ/qiGosz2DzSKz36stWTHCNEGKoX7pC
	ydyKRPx6LaXBofMWYpDlL2iJIqPlzc2DmhYTLMchQUk+/gYFwxWgpw6zfe7JmkKDFzt0dS
	GmkJv7UmC0EfZGdy7vgeeHd3aiZcKnyMT003UblPFk14he03bqaymJpLEqgC8pBn2SgXDn
	soNXn7FrcP89PWp2BxDrKHwDxER2bD7svMyFfhZl/YKznBovOOjhjQwCEPU+Kw==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 05/12] mtd: maps: pxa2xx: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:51 +0100
Message-ID: <20261105171158.399247-6-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105171158.399247-1-paul.cercueil@bootlin.com>
References: <20261105171158.399247-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_091257_564972_E0F0562B 
X-CRM114-Status: GOOD (  12.71  )
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
 drivers/mtd/maps/pxa2xx-flash.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index bc303a9909d4..15f7fa3548cb 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -111,7 +111,6 @@ static void pxa2xx_flash_remove(struct platform_device *dev)
 	kfree(info);
 }
 
-#ifdef CONFIG_PM
 static void pxa2xx_flash_shutdown(struct platform_device *dev)
 {
 	struct pxa2xx_flash_info *info = platform_get_drvdata(dev);
@@ -119,9 +118,6 @@ static void pxa2xx_flash_shutdown(struct platform_device *dev)
 	if (info && mtd_suspend(info->mtd) == 0)
 		mtd_resume(info->mtd);
 }
-#else
-#define pxa2xx_flash_shutdown NULL
-#endif
 
 static struct platform_driver pxa2xx_flash_driver = {
 	.driver = {
@@ -129,7 +125,7 @@ static struct platform_driver pxa2xx_flash_driver = {
 	},
 	.probe		= pxa2xx_flash_probe,
 	.remove		= pxa2xx_flash_remove,
-	.shutdown	= pxa2xx_flash_shutdown,
+	.shutdown	= pm_ptr(pxa2xx_flash_shutdown),
 };
 
 module_platform_driver(pxa2xx_flash_driver);
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
