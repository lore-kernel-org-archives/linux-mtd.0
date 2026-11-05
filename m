Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA086606A326
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 17:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tf7RBkF/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dsbX3SIh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PCsHUdONDYsgSzbnGpP34eoN2yc2e/5KfYzv6HHC29M=; b=tf7RBkF/OTJMBxIdLVTF9YPscS
	Wm0ZLKYh+T/EQlKp5dqt/kLTdA0C69do7+z6JzoOBD0B8abHV05BI1bSyyS/NR2eq9xz8Sa3JKxTH
	O+8URKfLAZGnyBhzkS3jinx83vrFaBImNnMhKRY/TQqwIWhzbRiepc+EK5ByDMDOGj48+eohP6eFX
	N4eT0MUXcU26Qa7+UI8LuO2FPJOibwL0R7o2rtarGJpFPB5fHFWkAaYVWdZH3ua+xN3/+sRDhh+Iw
	3CJEC4nJWPa2vX08IBjOA7+qGKUtSgx1FtN/sAtM1Mrg3MZT/Tq/opVksw8GVyZ7sB9pllBXQLRFw
	q0azd6dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP11n-00000009orq-1J6T;
	Thu, 05 Nov 2026 17:13:31 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP11E-00000009oXn-0lqk
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 17:13:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B00DDC6915F;
	Thu,  5 Nov 2026 17:12:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 815EB5FF43;
	Thu,  5 Nov 2026 17:12:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 000C2103292A4;
	Thu,  5 Nov 2026 18:12:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898773; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=8PIa3/LqnhRUlkjFyjWBQUOiIonW0lQDFF+oRiPf328=;
	b=dsbX3SIhbPaJTb0Hf1eNWItEcAzavRCDMuSinp8qa0PSgzUOE7F6jCH+mcL78BRKvDh9+H
	D+PwIKooyltdG0fDBtuIGzHFa0ChagTeGzBjiuPQugvcvu0anQAD3DRtk4b+MYhhrXtSuv
	zd4TcYAol4F5eCyclTJyMFbBaa2T958OJZEAxD8vKXwI22mugUaPduLKJRPH2mZH+qbpg9
	9V8l16u4+NTiqIm2JgX0UdHM3/E1zWzL1X0aGAbAvJQH7hv22kruMO3HiI5Rvo+mMKfHri
	d8LjeOPaGrwXhlgAOsn3LredAgfllTSHUfoTNYchhZcYthw9Cj5R0pwUPkxvng==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 03/12] mtd: spear_smi: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:49 +0100
Message-ID: <20261105171158.399247-4-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105171158.399247-1-paul.cercueil@bootlin.com>
References: <20261105171158.399247-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_091256_491247_EE831903 
X-CRM114-Status: GOOD (  14.32  )
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
 drivers/mtd/devices/spear_smi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index f02f96bff450..689141e525c0 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -1050,7 +1050,6 @@ static void spear_smi_remove(struct platform_device *pdev)
 	}
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int spear_smi_suspend(struct device *dev)
 {
 	struct spear_smi *sdev = dev_get_drvdata(dev);
@@ -1073,9 +1072,8 @@ static int spear_smi_resume(struct device *dev)
 		spear_smi_hw_init(sdev);
 	return ret;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(spear_smi_pm_ops, spear_smi_suspend, spear_smi_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(spear_smi_pm_ops, spear_smi_suspend, spear_smi_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id spear_smi_id_table[] = {
@@ -1090,7 +1088,7 @@ static struct platform_driver spear_smi_driver = {
 		.name = "smi",
 		.bus = &platform_bus_type,
 		.of_match_table = of_match_ptr(spear_smi_id_table),
-		.pm = &spear_smi_pm_ops,
+		.pm = pm_sleep_ptr(&spear_smi_pm_ops),
 	},
 	.probe = spear_smi_probe,
 	.remove = spear_smi_remove,
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
