Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB92606A330
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 17:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OklyUTAt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=P+Pp4GZ9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XrxPn31/w1lyv3UP3I/pdvYcq7R0sGyCbispP6XYIkQ=; b=OklyUTAtVv4r4M3UdxzRDA8mpM
	kiF/I2UVQu6GaR2VXsjJgla6QQardRhS3KZcSXD8poElpIb5eTsoJjo+24GE9Az5C3BLsjiBSbCKr
	feoOQ8mOEU/jV/njtDaEuTjI+QqoowezxuetCpMzDUJwYEzJLtOPRb1GpbgrIEavzddaQduCfuGTk
	wBnhdHXQzoAUFew/9kUDv1HI8JCS1LKziLdSVHqL31t7xVTcGRaki4Ca/StX63zGwkQtBz0Yu7afJ
	k7E+hVienZQTr+/e7owwlbVGeBIwRMcI/dmO0UW2jMb1ayLvKLc4lhcNkm3q8GPskO2H75Xx7u1gH
	KS9SbNMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP13F-00000009pdU-1Phc;
	Thu, 05 Nov 2026 17:15:01 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP11P-00000009ofy-1HT4
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 17:13:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6CB854E40A18
	for <linux-mtd@lists.infradead.org>; Thu,  5 Nov 2026 17:13:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3CE8D5FF43;
	Thu,  5 Nov 2026 17:13:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5812510329258;
	Thu,  5 Nov 2026 18:13:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898783; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=FXIDIhqGUu1xBX3WbOi+XdfAuCLW4ljHhiqr3VGReV8=;
	b=P+Pp4GZ9MUGYPnrE+jSjz55sh2HLfPEUgOkG79/wF/2TOtzV7lLt/PGQbI8TlSYKW/cK+L
	pTD6Q8Xpd41YVnDxvnPoXPQYHYRkGHIFtlk9Wf6z0Wl5IPKtFGhc+LrkM+a2uDQThchbEo
	6CwV5H2BoobQzjiNuxSBFYWFHC/7Z3w6QJu7PVppTAjoyQ/iBq6U1B1WqKmCglrRYDpm38
	LOiNeSwoSGGC84JqXfcmXcXU+PW74m8Uvk4/ur1arEmTS32DPl5lQNM+i8FVE8wCK3YCAb
	yk5pWYKPbnDuYays4eKvJcGigySgTSawJ1w0MMJAnroD/Q4+KCklO77p2VHjEg==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>
Subject: [PATCH 11/12] mtd: rawnand: r852: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:57 +0100
Message-ID: <20261105171158.399247-12-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105171158.399247-1-paul.cercueil@bootlin.com>
References: <20261105171158.399247-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_091307_571112_6812DD43 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: Maxim Levitsky <maximlevitsky@gmail.com>

 drivers/mtd/nand/raw/r852.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..c145eb8ac29d 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -1013,7 +1013,6 @@ static void r852_shutdown(struct pci_dev *pci_dev)
 	pci_disable_device(pci_dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int r852_suspend(struct device *device)
 {
 	struct r852_device *dev = dev_get_drvdata(device);
@@ -1066,7 +1065,6 @@ static int r852_resume(struct device *device)
 	r852_update_card_detect(dev);
 	return 0;
 }
-#endif
 
 static const struct pci_device_id r852_pci_id_tbl[] = {
 
@@ -1076,7 +1074,7 @@ static const struct pci_device_id r852_pci_id_tbl[] = {
 
 MODULE_DEVICE_TABLE(pci, r852_pci_id_tbl);
 
-static SIMPLE_DEV_PM_OPS(r852_pm_ops, r852_suspend, r852_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(r852_pm_ops, r852_suspend, r852_resume);
 
 static struct pci_driver r852_pci_driver = {
 	.name		= DRV_NAME,
@@ -1084,7 +1082,7 @@ static struct pci_driver r852_pci_driver = {
 	.probe		= r852_probe,
 	.remove		= r852_remove,
 	.shutdown	= r852_shutdown,
-	.driver.pm	= &r852_pm_ops,
+	.driver.pm	= pm_sleep_ptr(&r852_pm_ops),
 };
 
 module_pci_driver(r852_pci_driver);
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
