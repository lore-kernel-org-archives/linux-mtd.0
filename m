Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576B0606EE84
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 17:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mQl+ToOg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gY0Gycnv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8TeNPuW4/F4fhoWuS06vCBH8a68lpjMKNYvdiS0yTwE=; b=mQl+ToOgRQi9Ta85IJ6qF7gAKe
	V7ECtS/MP8Xdhb6ymFb5jKxGA44+4N21I3d86yDFKKcelDFqz+Fulh0kaQSVJkvFO77dplCnPrmAH
	Tlk9rcf90Q2DUFpuiZMevRVzYU8V+v0dp/7uh1VMA+kYPnBiipSK3rgGrT60U1ewu+9ifRdGc2Jk7
	QRThzv2V0OenVksOGH8mIBLWdKLdySF+twuGvdqDmSFfK3BWTwnINOzrVGcbVDGuC5vf6b2uw61Qh
	yNg1p30CWV7rhEWgNNIHxyJSJb4dAu1CPsSTMZ41Q/GWyJj340R4nmAsAuq3W+XbDLX+Lct7SHPYL
	Fea8mkvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP11x-00000009owg-1XdQ;
	Thu, 05 Nov 2026 17:13:41 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP11E-00000009oXe-1LPH
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 17:13:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3F068C6915D;
	Thu,  5 Nov 2026 17:12:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 102725FF43;
	Thu,  5 Nov 2026 17:12:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF216103292AE;
	Thu,  5 Nov 2026 18:12:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898770; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qtWc1kJS3qAw3VXAtfG98YEe7kRkAnppPQTfXKEnMWg=;
	b=gY0Gycnv68zkHNSmvGn2h5HvvF87OsYVoRhsvnjzOpfuSCf5uKE47d5BB8YtKkBMD5tyNG
	tqaAo6unRDTP0yh0KAc3dLpHG/KJQZvebtr6LTsu7CnOYt41Vhy7kGLSDnS6DR8xt9f3RF
	wo+Pogp5l2T8gVR3H7eSA1a5x8bJN2CnDVx3T0LsmIfKOOanWZcOyu6D/HRzesUYKxl6Ct
	ox4c6FIuL3itBCCveHXG/9TIX2xRJKSkimqjc0Pf90CLIPFdy5+7uEzE5KEzQlFQsE1aEq
	kVWRF9FKT3Y0TCMLrT5FM5nRVyKeBQ0V66fOD/QW9obW4KL/O5cp6ebbTxlmoA==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 01/12] mtd: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:47 +0100
Message-ID: <20261105171158.399247-2-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105171158.399247-1-paul.cercueil@bootlin.com>
References: <20261105171158.399247-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_091256_655576_C7DC87B4 
X-CRM114-Status: GOOD (  13.00  )
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
 drivers/mtd/mtdcore.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 82b1e6392b16..037fe292867b 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -40,8 +40,6 @@
 
 struct backing_dev_info *mtd_bdi;
 
-#ifdef CONFIG_PM_SLEEP
-
 static int mtd_cls_suspend(struct device *dev)
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
@@ -58,15 +56,11 @@ static int mtd_cls_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(mtd_cls_pm_ops, mtd_cls_suspend, mtd_cls_resume);
-#define MTD_CLS_PM_OPS (&mtd_cls_pm_ops)
-#else
-#define MTD_CLS_PM_OPS NULL
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(mtd_cls_pm_ops, mtd_cls_suspend, mtd_cls_resume);
 
 static struct class mtd_class = {
 	.name = "mtd",
-	.pm = MTD_CLS_PM_OPS,
+	.pm = pm_sleep_ptr(&mtd_cls_pm_ops),
 };
 
 static DEFINE_IDR(mtd_idr);
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
