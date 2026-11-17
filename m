Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F92A606A899
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 09:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uMORUawC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XyR6ygMv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IcF6c8+MPnK7lU9KmsZupdd+lIN4JXdSbn8iMl3LLxQ=; b=uMORUawCBkneGQcLzujKYYxGku
	HXB2VnOgPTzoWTCBwC5/BysSs3WD1L1qzsjyKKzJ4DI8FaGo+7A9CxBl7d5EYPCdv3t00Jg8NRX1w
	NnSULE/3rq91FJxOVG+xf8ufxX2IPhS8obaGXq9JpjVXbAxsiWHFM0528Az+Qwe5CUxiRxKAC7G2b
	05e0FCeqNTBX2mPyyM1YQx6rkpriiJvEJnvE7LGFqEfoGuE3Wxu3pvlZSzVrPv3IWmUE0rydy4soa
	VuMZt1R8MxHdMyW+0CzMk+mTC3z+R4UO5qNs1F16nzryavAuneUAA+EL/ngo8oCeepZHKVXHorbZX
	f005ptKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFdj-000000056qB-3Nfk;
	Tue, 17 Nov 2026 09:38:11 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFdh-000000056nw-2YhO
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 09:38:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1D9F6C4EDBD;
	Tue, 17 Nov 2026 09:38:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C3C9D5FC81;
	Tue, 17 Nov 2026 09:38:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE00711BC0C04;
	Tue, 17 Nov 2026 10:38:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908286; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=jYzpQG4guVr73jaAY4k71MmViNWdI3Qkw+kWHlSxdUQ=;
	b=XyR6ygMvMWK4oLJuBuJjNcGVc8XGDAs25P183bZZBbakAeed9AAz0wi3ALKkK7wFDSJFa5
	lSg3tBgm9AtzffsLdnf2FFa9Rarc91IDd/hjneO6pEy+2utS7k2FpfgcderzD9CGOFLg03
	dFYaOH2JgYq2xKh+9SijDwl+ZxEnOfcScoIBn6aFiqkDVK9OhO0DQrA/leOr+/ddZVhsIo
	MXEwMLR1Tj4V7mbYEh34w+vf2SZm/4jNUqgV/LDkaqNr+T3GZRERAu+mzEMbAji+tw+BcX
	f5iBroT0tXvP9UsLSMBpKbjgxfVe731ijDqT13xwr140NjPPut8HaQmQmefAag==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>,
	Stefan Agner <stefan@agner.ch>
Subject: [PATCH v2 02/12] mtd: rawnand: vf610: Remove #ifdef guards for PM related functions
Date: Tue, 17 Nov 2026 10:37:40 +0100
Message-ID: <20261117093751.14988-3-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117093751.14988-1-paul.cercueil@bootlin.com>
References: <20261117093751.14988-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_013809_836566_DFDEE63E 
X-CRM114-Status: GOOD (  13.41  )
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
Cc: Stefan Agner <stefan@agner.ch>

v2: No change
---
 drivers/mtd/nand/raw/vf610_nfc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9940681810cf..d785c3d28e51 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -906,7 +906,6 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 	nand_cleanup(chip);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int vf610_nfc_suspend(struct device *dev)
 {
 	struct vf610_nfc *nfc = dev_get_drvdata(dev);
@@ -928,15 +927,14 @@ static int vf610_nfc_resume(struct device *dev)
 	vf610_nfc_init_controller(nfc);
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(vf610_nfc_pm_ops, vf610_nfc_suspend, vf610_nfc_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(vf610_nfc_pm_ops, vf610_nfc_suspend, vf610_nfc_resume);
 
 static struct platform_driver vf610_nfc_driver = {
 	.driver		= {
 		.name	= DRV_NAME,
 		.of_match_table = vf610_nfc_dt_ids,
-		.pm	= &vf610_nfc_pm_ops,
+		.pm	= pm_sleep_ptr(&vf610_nfc_pm_ops),
 	},
 	.probe		= vf610_nfc_probe,
 	.remove		= vf610_nfc_remove,
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
