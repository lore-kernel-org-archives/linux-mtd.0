Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CE7606A8AB
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 09:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R9ASaot9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lcbRxdJZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ArL6oJvdft9AgBFUdnqfA1wYo3DH4P09d8IlUAOAgyw=; b=R9ASaot9ae/5ctPOilvupK4amD
	guOea817EUkkT/u8ZdCQjItwQWmoJm8DICi7PHZ/MabAmSYuZWUqbaPfZWervPWFuiWks3k/A8vR4
	4JypM3GvgJSyuwY/Ua9OMIYyj34TbwJYuiKGt1aNfYDs5ajXJ4PVPeUG4QyBmrmX3sA2I4Fbzp5d8
	JvFXfOGscmwB1cep+BMDcl0f8+cDGpbLdGDd4kadqNMGCnPwMYL9+5XqzERcW9URnMLStKl+DP452
	2eKo0483yQQqkmcVDLtviVE++iLwU9/RhYz7/5EamEjy/+mzPbOE8W5bWPHo49nliIMs0x9Hi6Cdq
	OArgEnZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFdz-000000057Bx-0ve0;
	Tue, 17 Nov 2026 09:38:27 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFdq-000000056xi-0Ww3
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 09:38:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 849EE1A159D;
	Tue, 17 Nov 2026 09:38:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 545475FC81;
	Tue, 17 Nov 2026 09:38:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1F6C11BC0DE4;
	Tue, 17 Nov 2026 10:38:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908295; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=G7ZGUNKDKBiHHSlHeQ8b7D1bEj8qPHL+frKQT5rOdyY=;
	b=lcbRxdJZk7QgZUQrOcUg2TNdNWHo8QpPQTTSOA+dGllOz0LefxrY63/FKfPcdCuwddcyBO
	tSjLG32FwGYiPMdmzUKPBXWqvJyf9lxnS4/zQmJIGThHFfFYze483/j8CKcZCnJ4sKB8V7
	CSsOKohuA4FfqOVX3ojxkOKY3q14mYEOell7FimRKbsQvlGU3EI18rvbgIrsRY3RnAB9OZ
	FuPO32nwywkoszk9VY3PHtVUczj6tYbnXDLVJhTPMAJe4EPvi7CHMq4r0CHm7nJqPgnoIj
	iVSBjrq6nGmBpPjJKuaq6u0tg9BUBbwJUwh9hLI5JIajk7Qw9DquqSHeqEbrSw==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 08/12] mtd: rawnand: hisi504: Remove #ifdef guards for PM related functions
Date: Tue, 17 Nov 2026 10:37:46 +0100
Message-ID: <20261117093751.14988-9-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117093751.14988-1-paul.cercueil@bootlin.com>
References: <20261117093751.14988-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_013818_402416_A408F989 
X-CRM114-Status: GOOD (  13.75  )
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
 drivers/mtd/nand/raw/hisi504_nand.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index d97270ec1185..511d133ea936 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -809,7 +809,6 @@ static void hisi_nfc_remove(struct platform_device *pdev)
 	nand_cleanup(chip);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int hisi_nfc_suspend(struct device *dev)
 {
 	struct hinfc_host *host = dev_get_drvdata(dev);
@@ -842,8 +841,8 @@ static int hisi_nfc_resume(struct device *dev)
 
 	return 0;
 }
-#endif
-static SIMPLE_DEV_PM_OPS(hisi_nfc_pm_ops, hisi_nfc_suspend, hisi_nfc_resume);
+
+static DEFINE_SIMPLE_DEV_PM_OPS(hisi_nfc_pm_ops, hisi_nfc_suspend, hisi_nfc_resume);
 
 static const struct of_device_id nfc_id_table[] = {
 	{ .compatible = "hisilicon,504-nfc" },
@@ -855,7 +854,7 @@ static struct platform_driver hisi_nfc_driver = {
 	.driver = {
 		.name  = "hisi_nand",
 		.of_match_table = nfc_id_table,
-		.pm = &hisi_nfc_pm_ops,
+		.pm = pm_sleep_ptr(&hisi_nfc_pm_ops),
 	},
 	.probe		= hisi_nfc_probe,
 	.remove		= hisi_nfc_remove,
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
