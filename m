Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ECC606D823
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 17:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N1lEt8ar;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0XyN17E0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I3KGEiSiRv1YVl17kwPHv8bSGoEIALBV0c5TkRpiEG4=; b=N1lEt8arYJuxD2nioD9SGG2WgO
	uZFTsrdbJjQ1GTHpBQh94y5xvHypm2r29qpYOXMUuDqy7b+47Nvm/ziG1qWm2pGKG0KhBwBEPLw/4
	bUUWcAULKICzkV5CccNnVMJHoS3j6WujXLD4oofVcMvSxuyLGERP8XiX9bAF80XoN+hjoYdxRoXg/
	KuONfYttm5b3j5yekyHJh1E5GeUirsO6Fo/1wF7+/VHW0h5ijdIwXzQSW+DcJTVk1vBydKAcrUj91
	z6UYTtfMoDipxzdY6p4xoS1Px67OTBDZD7Xi9OBIMKIT5WVuqK/qx81GUhQqqOtYPaljr6OmaeeoM
	hBG8YJ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP12H-00000009p3R-1CyF;
	Thu, 05 Nov 2026 17:14:01 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP11E-00000009oXj-1RiA
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 17:13:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 79EB5C6915E
	for <linux-mtd@lists.infradead.org>; Thu,  5 Nov 2026 17:12:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4993E5FF43;
	Thu,  5 Nov 2026 17:12:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DFF0B10329289;
	Thu,  5 Nov 2026 18:12:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898771; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=wmNMQ1rsb0YZf0K3Hhzn76ME2eJ3SKH3TWsuBCeSig8=;
	b=0XyN17E0E3NvcPkfm4vUhi25oAb9yH+bibcMS006lPYpFR9IjKkb9MpRhgvXvCXjtcruyY
	mDJpZsP04iqtArI0dPfgdiLDpkWH8mPofNIHy2WRFIZHJvYc8Wv7tlfWsOWYWQ/E47LBbE
	mDDkxX7xd7UJH2ViD8rlc7Wy0D6zvPR875tApglMIOdj+M1Rz1qoDWetIFEFMhPlfhozfZ
	As0eE8VN5BEQa6R1XGMwdHC1J8mtJ6p3K6rPU/PlcVo9v0TJz80SxozWRSqdY0K1+vq6Dg
	m/lisCEGCVcWEJa724ZfrvxUi2r27KGt5OcQrPLX/RV+CltBfYp+SWPmzvQWqw==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>,
	Stefan Agner <stefan@agner.ch>
Subject: [PATCH 02/12] mtd: rawnand: vf610: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:48 +0100
Message-ID: <20261105171158.399247-3-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105171158.399247-1-paul.cercueil@bootlin.com>
References: <20261105171158.399247-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_091256_768451_010C2492 
X-CRM114-Status: GOOD (  13.62  )
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
