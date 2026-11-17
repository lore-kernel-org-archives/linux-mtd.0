Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C35606A89F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 09:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1pGMFZnh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kDnrmD3W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h+VsQ65cPLBxk3L92trOkyAjGCzd4FmH1kkg442SyYI=; b=1pGMFZnh0o+/gJnmYm0dqTFJ3p
	k+rH9IDnWsp3V7kN3bkVU3TItap1V9b71QrEdLUPT8XbCOLrL/QkkPPvFq/be8QRpXpsbhuwgdd2r
	u8ftn1JzVezWOHiwnKcDtG7zxneBnaK9cb49/H+D2XyEJDM5rnXRuF4D4cP0Hms5RDnzmcfFojIXO
	SeM+/0Qu2Azh+iL4Bg4Gk8HMB/weR7sfRqcGwgNLtPpHhGGsCRyEaNVWz5OnmeHMG3O9DJxd/FRjt
	asv67xLxhf1Oo49H0bQHHyxWR4Xy+eMxEzj+sJoVt11Hzzu8R5Geh82btmJLqA3Wr8MyTsHN9S3yA
	8NZX63mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFdk-000000056rE-3qoc;
	Tue, 17 Nov 2026 09:38:12 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFdi-000000056oT-2eqY
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 09:38:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 266944E41471;
	Tue, 17 Nov 2026 09:38:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAB575FC81;
	Tue, 17 Nov 2026 09:38:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6674C11BC0DE4;
	Tue, 17 Nov 2026 10:38:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908288; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=zt+L2zvrl0xsIKg55Fyi5rBt8i3afRguaaN6st9GaVQ=;
	b=kDnrmD3W+x2ewQ0EuCfxmSl7xRpGAc6G1HGyGvbRVetx3Kvjr8rO1qPEbb/08NorPNFDb/
	JemkhKkqFRxOi67XXT0C7uW1dabk0Crm3ith2qtdXt3XCBMmQUyFKskzO2R5C6gtFFUF7n
	83G6Qeg2n4G/HISngDN+rs/H5ZTNKDhBHMUcFhv5xO6K5FMab2kPi5LE2wm+EgYEbR2Dh5
	YLCeGpR/pnW6kf5kGvDdzN+JKPtCSL1GSqhtrTtbOSplGsKMulqjy70WG/n8545aywvrfR
	u2a2HrTCyOp29vFJpzVpx2LxOWFX+88pXdWiKaRbcX1/7vfzh8ArSe4E2WORAg==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 03/12] mtd: spear_smi: Remove #ifdef guards for PM related functions
Date: Tue, 17 Nov 2026 10:37:41 +0100
Message-ID: <20261117093751.14988-4-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117093751.14988-1-paul.cercueil@bootlin.com>
References: <20261117093751.14988-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_013810_810473_ED8BCFEC 
X-CRM114-Status: GOOD (  14.19  )
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
