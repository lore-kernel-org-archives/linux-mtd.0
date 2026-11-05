Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87328606D80F
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 17:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pY/GczZd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=L3FyNOMQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FfHeV+//Y7q4TZkOqwVz0oTZSDRlRz4yyV1hPaaGYwA=; b=pY/GczZdUHwaEKNUPFXDlcDTtN
	UTrdLPIJx6BkrFgsDA5WyOh6Wd584wjYt6dQOV2vLk+vi5zoGcI/T+/PuUagJhJgycP9WD8IEGIXn
	gjAvvMk4JE2bidi3RsWpKULm/Z09Tt7Dy9crccEd4iUH0W8u8QWtEAB1lNGRZCi//UV8eJTpfbwR1
	uSfiY93IP7qaO8WChPwidEi6/d2l9pyNgl+sqfHJ8zB15/X7eOesbBDf9WtI+SdUWCH+xdcChoaic
	D1Vozs2i2x9F+4mNy1heidHQWrlbmN1SBqVWFkgJYggXrkb3UivN+U1T/XkoW3ZLblH5f7oRG0mW/
	x8+lPxZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP12Z-00000009pCb-14uP;
	Thu, 05 Nov 2026 17:14:19 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP11E-00000009oXq-1LaB
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 17:13:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A14281A0C32;
	Thu,  5 Nov 2026 17:12:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 787325FF43;
	Thu,  5 Nov 2026 17:12:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51F2410329258;
	Thu,  5 Nov 2026 18:12:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898774; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=QWW8sGSbKCZTYcbVkYjb60ZAYK6JjPCcx3vUHcTIU+g=;
	b=L3FyNOMQAnqkOuPDe1XsOpZiC1yFpS+l8BnlA77ufcPjPWhsRtBYTkTM70y9VBeAESF/WI
	U0j7iJoq6bc29v4HLQr+/+WKOc0QGBLd+guhar5/KXeYMJJ6PdwdPpQYVQJtckEeVpPQI/
	5v7KBcMchc/FEfu9aEIF5YS/2uke+7PTeuu22okqkKlP5OA8i5RPUxPDdqzxHxYyWqbVT+
	xS1jbpt9cl9eSeAsfUj9kYKI4aw48Ae/flt+w77VPltvtpPrE/iPuzztmNqJDHv9o2m1Xr
	NvCCRtNrUqiLiPorvrZT00mTxB9qr2cgDLzwwXv6bjHFJNymMsH0jmNbCF+/4g==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 04/12] mtd: physmap: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:50 +0100
Message-ID: <20261105171158.399247-5-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105171158.399247-1-paul.cercueil@bootlin.com>
References: <20261105171158.399247-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_091256_652237_7B3AB966 
X-CRM114-Status: GOOD (  13.73  )
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
 drivers/mtd/maps/physmap-core.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mtd/maps/physmap-core.c b/drivers/mtd/maps/physmap-core.c
index dcda7685fc99..afda90fc23ee 100644
--- a/drivers/mtd/maps/physmap-core.c
+++ b/drivers/mtd/maps/physmap-core.c
@@ -600,7 +600,6 @@ static int physmap_flash_probe(struct platform_device *dev)
 	return err;
 }
 
-#ifdef CONFIG_PM
 static void physmap_flash_shutdown(struct platform_device *dev)
 {
 	struct physmap_flash_info *info = platform_get_drvdata(dev);
@@ -610,14 +609,11 @@ static void physmap_flash_shutdown(struct platform_device *dev)
 		if (mtd_suspend(info->mtds[i]) == 0)
 			mtd_resume(info->mtds[i]);
 }
-#else
-#define physmap_flash_shutdown NULL
-#endif
 
 static struct platform_driver physmap_flash_driver = {
 	.probe		= physmap_flash_probe,
 	.remove		= physmap_flash_remove,
-	.shutdown	= physmap_flash_shutdown,
+	.shutdown	= pm_ptr(physmap_flash_shutdown),
 	.driver		= {
 		.name	= "physmap-flash",
 		.of_match_table = of_flash_match,
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
