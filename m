Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAA0606A31B
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 17:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YzznKx/S;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oD69Pc5g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RPTsNsJZcuY2e9hX7mgZ+6bP2DQ4wy0cTI40s9uAXKs=; b=YzznKx/SWRadKJ3rN3lkPF8I2l
	B2mShOaDz1haUIcfdwlAU0lmrtf4B3MFknlLYgTLW34U16oW6AmT0DE6tYLr/GIQc0PPxEf6pyx1x
	OBu9tdvEkb3DJwrm9LrbZvbAg5nC9GF/PfIbG9prlXqJrhgFVUvrfoQYtySFgdcV0G9x4j+wJqfop
	2U+0/tPqpUxhDnzjsY4cvNz69YlhL56UxUeB1xgpjOlEwVmp7UavlX8Jtv/gkUYapk8k0KYpcOGK1
	GhsQwZgRhBSPYXVBBGr9/9G1ccaKi/smTq9G9bIF1C/KZx+yVC4hfrSHJXSWsU+Ty1OksxcEzNbvj
	HReyo6Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP13O-00000009prj-3xL5;
	Thu, 05 Nov 2026 17:15:10 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP11P-00000009og0-2f5H
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 17:13:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CE8F5C69161;
	Thu,  5 Nov 2026 17:12:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A059F5FF43;
	Thu,  5 Nov 2026 17:12:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63A49103292A4;
	Thu,  5 Nov 2026 18:12:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898779; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=EMExV65ZcIsZykQBDtBRoQToWRb7jCYng9HkBlA05ok=;
	b=oD69Pc5gzE17OwKPSp6eXxMTrEZYoS36gFroRX0ztRiLiJalonYJk2K+sAgZj4KgIRXRhT
	pwcO8fcyiR3Jrg81zDNqIwfy3xwAtpgAm3+foleDY9cJUa+6IsfKrkZc39fgRbFAWJE4y5
	Ao9lWRw3iw+u+Qy38AzkWL+0UJMWeCOvolCAFCitLtQLU8C7boUMHWG9pNHomMflt/fnPw
	2rnOmPGeSZgjk7tk9AXvJYTk5IZa72uEDS3d7lXETvhqH1RmBod/qGbYegbBdAWFA2bRwU
	vPOCcflEO1eDJdEEETllJlL54SfeipRK4WtiaNDs+UfBWXhii6E+UV++SlizzA==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 08/12] mtd: rawnand: hisi504: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:54 +0100
Message-ID: <20261105171158.399247-9-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105171158.399247-1-paul.cercueil@bootlin.com>
References: <20261105171158.399247-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_091307_986733_5357EDAB 
X-CRM114-Status: GOOD (  13.80  )
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
