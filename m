Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7619E606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 09:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VKCKlqVK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lNz1zWnR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h4dnd5X8eqmA6GA1jAHTOEqEQFYEpb6qy4Xy6DkGZSQ=; b=VKCKlqVK6GAoVgfTCEqooR40Kg
	yAyjkF91GOXb0Km8mT4QYmFrSkAyDOm2TMhebFQiY5rv1/KGiNnDvjMijotT9qMUzuFs7EH8y1MjH
	Xl93OQtfD4aCYDl7on6hXf6ldSE27HMJ2opSW7EfIJQUNR/LAgsNSc5YI04jAFdZIgOHFyJ7xH5X5
	N8lkyXd6llFJddj0UHxt7uA2MEgtK4d2FjqCFiYcuY7UnPD9qIbpAKnevKjDM5OgvmNm4kuaPGMnW
	Tg9anaPmw4qn/GPT4/QJRX7AmKYUUTHcvmkNTKl9ZRbiwfN+rk5S+bKZr+Ix11/+40UhL9GSa47bR
	ksRyNDYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFeD-000000057Vv-43bz;
	Tue, 17 Nov 2026 09:38:41 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFdu-0000000571W-39GI
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 09:38:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2C8014E41146;
	Tue, 17 Nov 2026 09:38:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0B2B5FC81;
	Tue, 17 Nov 2026 09:38:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A94BF11BC0493;
	Tue, 17 Nov 2026 10:38:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908299; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=mkZMJlvFsdTPHRfq55Zs9n/rcb6WsZ4+FI+m4sk8u6c=;
	b=lNz1zWnRE4JSNSZLC26MP50YP+jWpa1WLSxjtb0fqA3RPZvECe35jhudwj70niVx9ySB8A
	I26rIhF56dORH1f+mQkvQq+2iXY90gHh57PlT7uwySLwXkTMCloraE2Mp1EZdUqkwsevrk
	m6Yjd7uJi3aeu1F9Ftk2SVCWWEBv5Pr8rR1/iEdcaKqU5ELRPQSDmCYG37mOe+t5hpiNXW
	Q/VtRIrpc06Ctcrw9qU3/1O6A7v7RxABiCvLPMJA8oL+tZFViSQfEDJiVa+ANSgPWEtNLq
	Ykswoj/OWcgM9UhPK+6pJ40ZMm/gW3yCRm9+Mccflpufa8KFCdJuCkHSedTFNA==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 10/12] mtd: rawnand: omap_elm: Remove #ifdef guards for PM related functions
Date: Tue, 17 Nov 2026 10:37:48 +0100
Message-ID: <20261117093751.14988-11-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117093751.14988-1-paul.cercueil@bootlin.com>
References: <20261117093751.14988-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_013822_978721_1E94E6DE 
X-CRM114-Status: GOOD (  14.20  )
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
 drivers/mtd/nand/raw/omap_elm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap_elm.c b/drivers/mtd/nand/raw/omap_elm.c
index c1d19b8e6715..2e8ab20d8edb 100644
--- a/drivers/mtd/nand/raw/omap_elm.c
+++ b/drivers/mtd/nand/raw/omap_elm.c
@@ -428,7 +428,6 @@ static void elm_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 /*
  * elm_context_save
  * saves ELM configurations to preserve them across Hardware powered-down
@@ -540,9 +539,8 @@ static int elm_resume(struct device *dev)
 	elm_context_restore(info);
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(elm_pm_ops, elm_suspend, elm_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(elm_pm_ops, elm_suspend, elm_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id elm_of_match[] = {
@@ -557,7 +555,7 @@ static struct platform_driver elm_driver = {
 	.driver	= {
 		.name	= DRIVER_NAME,
 		.of_match_table = of_match_ptr(elm_of_match),
-		.pm	= &elm_pm_ops,
+		.pm	= pm_sleep_ptr(&elm_pm_ops),
 	},
 	.probe	= elm_probe,
 	.remove = elm_remove,
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
