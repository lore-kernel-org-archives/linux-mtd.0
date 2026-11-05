Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394A9606A328
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 17:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iHUGu4y8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=A07nps1E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ybmsa7o7qHzGc3kiO6W+mQdJxw+F0LcCqVA4x+XNugg=; b=iHUGu4y8UI2DyU4OXnO1zF+UBr
	yLz7bXba+eTY14B69nyhk3OPCsE7OIW0Wnax67oFhed/wxOBY9HHL5BJHeBkVCuIix6vLqBHpUlSC
	uDBt7V01qtNParA9NHy1mCYqyVNEUejv6yiF5+S2jsCEY6OljxG1+TnOKc9TYH1q9pNJsBPBRXYaK
	8KGGnKUTScJq0aVWeE16RtSAwFreFR6rZ8XJrc1bjbsBbPgwFSN0R+qYhyWGcZIwmXA7PirVgI9E/
	RVLp2nvisSq3T1oyqQtji3AjdVS4zBgFncReRjYhf6nj+N8UawuzKbMQ2tpgKDdYWzxoOxJ1IT8dz
	ybS/etNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP145-00000009qD6-2XHe;
	Thu, 05 Nov 2026 17:15:53 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP11P-00000009ofx-1FPN
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 17:13:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 470334E40AA6
	for <linux-mtd@lists.infradead.org>; Thu,  5 Nov 2026 17:13:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 17C715FF43;
	Thu,  5 Nov 2026 17:13:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC6EE103292A4;
	Thu,  5 Nov 2026 18:13:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898784; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=OOkUYu1EZFnPCSGQBZwoGTH7xYgEpMmagU9IyZl2dKc=;
	b=A07nps1E0mP9e9t0U1Y6lQBMgP97pa+gyCzCTqhQxMJc0S59QgCUweplqNxhr4nf5WeprE
	wc4s/juz2pD2bEhUCmPzr6Lj4idz9NWjk1++VbEzjiRL4iolwPqBVJUuaXNr23xbmH79RS
	mlNTdgFPlwl0IPh/LwNJmRzbULZ8U32IAAkNaEuz6qJX1lWr5vaHMZ6qaeWN2gm0nCt//t
	Go+AoPnfiuOxDZuGOSs6X1hd4xeyVCkatYHmjubyrzR4WACJcUlxO1Ap0mrJf2ip8QR+RQ
	OpeEaPKEzR0Pm8v4sc1uOhqMLMtEtaLAHv3SESdkxbHyRUIJsTPCe7GqDjLTGQ==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 12/12] mtd: rawnand: txx9ndfmc: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:58 +0100
Message-ID: <20261105171158.399247-13-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105171158.399247-1-paul.cercueil@bootlin.com>
References: <20261105171158.399247-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_091307_567819_23AA10AE 
X-CRM114-Status: GOOD (  13.78  )
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
 drivers/mtd/nand/raw/txx9ndfmc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index 4cc6e91dbc23..9dc624957a3c 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -391,21 +391,17 @@ static void txx9ndfmc_remove(struct platform_device *dev)
 	}
 }
 
-#ifdef CONFIG_PM
 static int txx9ndfmc_resume(struct platform_device *dev)
 {
 	if (platform_get_drvdata(dev))
 		txx9ndfmc_initialize(dev);
 	return 0;
 }
-#else
-#define txx9ndfmc_resume NULL
-#endif
 
 static struct platform_driver txx9ndfmc_driver = {
 	.probe		= txx9ndfmc_probe,
 	.remove		= txx9ndfmc_remove,
-	.resume		= txx9ndfmc_resume,
+	.resume		= pm_ptr(txx9ndfmc_resume),
 	.driver		= {
 		.name	= "txx9ndfmc",
 	},
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
