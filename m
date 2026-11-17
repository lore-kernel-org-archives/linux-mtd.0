Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA11606A32A
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 09:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QPSFDzZu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=oshs2VVF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vHSouHzyAvO0XFsnruZi470tZEGhoIlcxc6zViYK650=; b=QPSFDzZuWBh1IaNf1TX+CN/l4g
	xMEoDgDVh+5N0oErB9A4t3+2YKatFMn93OB9PhIxSyloNIjsHvkAIElXeUJkksQjhxq9ZE9eaxKgx
	tMJP2f8e9pDT84PnHsEcBjJrhRUj5Da6M1tYbQNsu0Py/fawLvcj5iXV9sBfRP1F1EngC6SG/nIwq
	UJrS6Jbp94THvYCwsylvQwf+EDJq0IZ0R0FzOA6/AsFUxg1VsF2dmU7X6NRK/B/pbttw3t3GfVu7T
	zBFay5uvUmgW5oTTs8s4pVvIh5wyz7gITjJIsACeuIU9NKVh0R5owcSww7Fq1KVM/YLifTPkyafFd
	/TnMUVUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFeF-000000057Yu-2Vku;
	Tue, 17 Nov 2026 09:38:43 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFdx-0000000578F-3D3H
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 09:38:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4D1011A159D;
	Tue, 17 Nov 2026 09:38:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2365F5FC81;
	Tue, 17 Nov 2026 09:38:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5206C11BC0B8F;
	Tue, 17 Nov 2026 10:38:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908303; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=doiWoBjdny1ljjzKEq5yZ9l1HgmsVW3my1hbvOjJh0A=;
	b=oshs2VVFbKko1cnziwCjIxtOgZGmi/40wvJzVJJkEj5I5QvMJZspa9WvlXh1lrkH5F45lF
	UramDTADpThRZhivCv7uQrerTnoTI9nNCJVEw5LnJXwAOjs/bil8yMJZN3FgrAmtQNgU/c
	RmVO6sRlZZu2ppPlnIOX7H/X7EpOUDV9teht2BUN1XN7SUQL3UYP4qpLalI2gYZ6Y7kb2Y
	d/sR8CzSOrGOAnvElTa8uCtIRnZVYunSdY8fBbxXAM3qYqrsnao7CebCtooRvGnuv++pdb
	Zj4fhQu6jMHOLnuxUZRNd9KNtNNHCCatnaLYw72KOCTF4UdUA8dHbAUZsRSwJg==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 12/12] mtd: rawnand: txx9ndfmc: Remove #ifdef guards for PM related functions
Date: Tue, 17 Nov 2026 10:37:50 +0100
Message-ID: <20261117093751.14988-13-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117093751.14988-1-paul.cercueil@bootlin.com>
References: <20261117093751.14988-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_013825_979809_2105B036 
X-CRM114-Status: GOOD (  13.15  )
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
 drivers/mtd/nand/raw/txx9ndfmc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index 4cc6e91dbc23..9dc624957a3c 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -391,21 +391,17 @@ static void txx9ndfmc_remove(struct platform_device *dev)
 	}
 }
 
-#ifdef CONFIG_PM
 static int txx9ndfmc_resume(struct platform_device *dev)
 {
 	if (platform_get_drvdata(dev))
 		txx9ndfmc_initialize(dev);
 	return 0;
 }
-#else
-#define txx9ndfmc_resume NULL
-#endif
 
 static struct platform_driver txx9ndfmc_driver = {
 	.probe		= txx9ndfmc_probe,
 	.remove		= txx9ndfmc_remove,
-	.resume		= txx9ndfmc_resume,
+	.resume		= pm_ptr(txx9ndfmc_resume),
 	.driver		= {
 		.name	= "txx9ndfmc",
 	},
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
