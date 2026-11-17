Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFD7606A32A
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 09:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tUEWGhK/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gV4ssBiq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jJn/8N8uM27Voow5qdCWJzSJAM3OWzYXMNY4X40+77U=; b=tUEWGhK/A8GIWcCSX8gtT84NNi
	WHTf6a7AFK7NROHi+EsKyOXTkrfNmAhhiNhHjPHF2SaUB5nJd//zpkCxpaEJk0bQG7k3mk7fM8PUj
	36AxbjQ7Pq8pyMWKD35JfyIGL5sXtFuLp5szpW4vnMD9cR0V3eKoED5rUlffsoZwssOcaJIbJyJiE
	wkia8E8hOz4eKjWJeK8E4XMnIKUQwK07SUJrDfijUBBIWmhUfKj0vbq5yGjz0jM7/kE9qTjfqkJDs
	3NcBTmIT6ykRzLzdvEY5FeBpBcPqHSPUEphWmXtbqg+ALce6vG0tw80MHBT6NaH4rRdc+60owBe9V
	90znzZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFeD-000000057VS-31DF;
	Tue, 17 Nov 2026 09:38:41 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFds-0000000571J-36Oy;
	Tue, 17 Nov 2026 09:38:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 21F001A158C;
	Tue, 17 Nov 2026 09:38:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E52805FC81;
	Tue, 17 Nov 2026 09:38:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2BAA811BC1129;
	Tue, 17 Nov 2026 10:38:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908298; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=niJD0njQ1UDwvr3T+XYsWPwrBy0c6qlXpaKDdhLmAMk=;
	b=gV4ssBiqLDmoCoXe4SIe/bAL9n9hYqos8FqYkltwMlaPBbOoBoKvKweKGq4kJIk2LPrHoS
	QxTq4Tr7BQxbOt+1EWq72l/wdppm1KPu5tcgsipDdfYBTrTRt/cWPVs1JBYqon11EreHAa
	s6CcWSvxAbB80MaBHKcXOEqQUJTZYrD40/070WgMNEPIpE+D/ktouXwY0HpeDpBe3VhedC
	/eewolPwxLk6j840izkWrephiqyu6o/5Wx5yCm5B6fYW4WjGW8unTw3xY44q4GiAPbCEHO
	5VfYMCgAtietMz0v1JSIdMLNdukBXq67F1BpOR2aN8OWIUzDVot+m+IERxcX6Q==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 09/12] mtd: rawnand: mtk: Remove #ifdef guards for PM related functions
Date: Tue, 17 Nov 2026 10:37:47 +0100
Message-ID: <20261117093751.14988-10-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117093751.14988-1-paul.cercueil@bootlin.com>
References: <20261117093751.14988-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_013822_107034_4E327E6A 
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

v2: No change
---
 drivers/mtd/nand/raw/mtk_nand.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index c439b7814ebb..4b8451772f9b 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1591,7 +1591,6 @@ static void mtk_nfc_remove(struct platform_device *pdev)
 	mtk_ecc_release(nfc->ecc);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int mtk_nfc_suspend(struct device *dev)
 {
 	struct mtk_nfc *nfc = dev_get_drvdata(dev);
@@ -1635,8 +1634,7 @@ static int mtk_nfc_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(mtk_nfc_pm_ops, mtk_nfc_suspend, mtk_nfc_resume);
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(mtk_nfc_pm_ops, mtk_nfc_suspend, mtk_nfc_resume);
 
 static struct platform_driver mtk_nfc_driver = {
 	.probe  = mtk_nfc_probe,
@@ -1644,9 +1642,7 @@ static struct platform_driver mtk_nfc_driver = {
 	.driver = {
 		.name  = MTK_NAME,
 		.of_match_table = mtk_nfc_id_table,
-#ifdef CONFIG_PM_SLEEP
-		.pm = &mtk_nfc_pm_ops,
-#endif
+		.pm = pm_sleep_ptr(&mtk_nfc_pm_ops),
 	},
 };
 
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
