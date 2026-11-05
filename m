Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C80F606D801
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 17:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JzTsAO3+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=F/DoIqsy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WAibX6K5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZGjGYPwyoYtgGAE9oYPglcA8h4yRW0xPT/VyUhc4xtc=; b=JzTsAO3+nmumxfeCRLU7L42Hlx
	vVEK5N4fUion8O9J7FjFcM86IvwrWR7yCXWWkk+IDQma8ZOM/dmlvwCf+p0qFzK2qmfGbKO5lf5He
	jziFFmSRxc/729zs0IkD8q1l+gBX8vJYwV1fp3Mbvj8J09y7HSCj7rdrS0MpToubLjXynRCiastLh
	9A+VhaXfdUN0Rn3ma9rszEHuJ23aXMb5JP8gVgisnFFolikT4dWPF5lydGDOQ9fiI3PMw5GzFNuVw
	WGEy30nTvsHsjFzvA+bMKRRp1SgLZWxDOUtRz4ks2DsrNr9xxwn74kKX//ey6SzukZJ5Fhbl05nZk
	O8h+e4eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP12a-00000009pDm-09oZ;
	Thu, 05 Nov 2026 17:14:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP11R-00000009ohz-0iqX
	for linux-mtd@bombadil.infradead.org;
	Thu, 05 Nov 2026 17:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=V5kDdJozdBER4zNiEbFblzGULK1BuE7KJGYVqxyveds=; b=F/DoIqsyXsGEJ8jK/aa7j7/STq
	OE3COAm/JalpeMGtwp66AaIjsfN8Hg0EsLgtyzlmDdva+UQBwKygWoyKkTlybq1VXhg0re7KOXVfn
	yExZ+ZWBcvFKduH33j/WuqrRP5qs64XAdlpO73jYQfOCp8JXz6r/ngUX+6VLBQB+WIC2qgsU65tDf
	8vaUHFe4C/rL2z0A2ETGeM6HKXVfZEqGTJG6vY0IyMvmk1sgkSRJ8/1SEjjNHb4UVhsUpqGA9KUPB
	SCYn/4FSFC6Ao5SiQC9t/9qrjCau9QXHPmxANdv6+YLEONwtfR7pa5kqy6L4WyLy20Hs8d9lTt7EU
	fbJV9btA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP11O-00000003JnQ-2ggS
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 17:13:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C9D8D4E40A04;
	Thu,  5 Nov 2026 17:12:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99B0A5FF43;
	Thu,  5 Nov 2026 17:12:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A4B610329258;
	Thu,  5 Nov 2026 18:12:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898778; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=V5kDdJozdBER4zNiEbFblzGULK1BuE7KJGYVqxyveds=;
	b=WAibX6K5VuFYzcX11Zu5A56/RlxSGuUFxqyVymZh0JIF9KHEh1BD4KTuKlWIaJqdgOEDLh
	1a8t2XNzccsuN3Q5PscCcpEZwcUbDw17oalXNRLRRwLx9QT9D96zjGqEOuER+URUM1b5Of
	vdIsAuOAgfb07CwvMRix5gIfgsdb4HEcJgyBbOqQVrzVvOfkwADkBh5dyIsg4pN2Iiy8mJ
	dtFXMJRvut4SmkGqoy6UazFc1NANEe5D/3gUNWgNpo9RPLWOYu2bW+A8MvI+YGeyMXupwZ
	3cfX0QBDek7W03bbYjijBnuTRt1tr8AInBThyLRmId4Dkkklu69Ni7Tl2wfLYg==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 07/12] mtd: rawnand: fsmc: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:53 +0100
Message-ID: <20261105171158.399247-8-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105171158.399247-1-paul.cercueil@bootlin.com>
References: <20261105171158.399247-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_171306_517147_1696FC06 
X-CRM114-Status: GOOD (  15.01  )
X-Spam-Score: -0.2 (/)
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
