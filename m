Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A39C606A329
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 09:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vA7pTG+d;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BSoJTKhP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TWHoY9hvFIINAxCcvKie9SeC7yEZKvN4LYPUjhJqEfI=; b=vA7pTG+dGwHDx5eM9SkZi+UUHm
	87kLMgxeWjlPSinPojO1hFu68UlA+oVK6zZcv6rumXay2dbD0Lf6ASUL2x2K7g+8DgwxEzbqR1/r8
	iynhFB7xs1s+Z33v30vv6Mnr532kvgG1AftwWs1rGXdXkvbMjoBOtbe9TFCihy/DRgS2PLYebFxaO
	LmTgpMK6aIktZ1uhlM7rg3g5ZpFjPToo5XVlUA3vwz+BOigzdS5MDipVLgvXEL8ae29jSzm8yABBU
	wM0rz9SKH2Y8V+VxFIh87e8AsKb0IviOBfR2l+hoW9l6HxS9DQnQbpSXZl+qt3ZnzoyojoRicHRNa
	YuCf5Kbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFeE-000000057WA-0dTD;
	Tue, 17 Nov 2026 09:38:42 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFdw-0000000575o-1xaw
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 09:38:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F2011C4EDB9;
	Tue, 17 Nov 2026 09:38:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A3B145FC81;
	Tue, 17 Nov 2026 09:38:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F04211BC1143;
	Tue, 17 Nov 2026 10:38:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908301; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=sf9xmRkRphyVToFoOZV9OHW8g4eV4+0BZB1/eN8sGwk=;
	b=BSoJTKhPyCewKlL26koS2r0po1IAPc+dRY83uAh5CDRJGlN4RkwnQUqglKKIV32mW48dhZ
	hBCb/yVSzOzWbX1Vd+2iyuBDoOtvnqzpE5ojTdPdgPSfloGPcUnFM6XEka0m6obmXjpl8O
	1bmXcVTtug61TSqqlwQTn8Rm4w6Fm8v2TbgdiN5ct9d6mb4L6vDHsv39/aPoZctiG+Ev5Z
	DQMpqkVw3hSO7GNFoGXyYy73B2sK3tM9cxRP9knwGTL1BcbwkEaW497OtiKpPnnvmOmArg
	3yGd2A5vFIIQGz2Ms2K2hoMdEvuD3x/d0VeCtIogKqtWU94E5Kk2GepNlJ0rBA==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>
Subject: [PATCH v2 11/12] mtd: rawnand: r852: Remove #ifdef guards for PM related functions
Date: Tue, 17 Nov 2026 10:37:49 +0100
Message-ID: <20261117093751.14988-12-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117093751.14988-1-paul.cercueil@bootlin.com>
References: <20261117093751.14988-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_013824_850245_F1A2ECD8 
X-CRM114-Status: GOOD (  13.24  )
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

v2: No change
---
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
