Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B2F606A332
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 17:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JcHfWtY1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=D2cBAARK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=D9AaXb3G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=t60KA81eLnALfOaitQcb8pQ2mPTmmjhDolFCA9cwkH8=; b=JcHfWtY1xLbufbVTXituHKXLSm
	WHEbtB9Hw68XcUDiOhhGwfCujfZ4BMSAxv4aoHi7GkZqKyh9W86yaAGS/dPZRZm0nqusrShWZizaM
	5Q5z6YxBJwspee4SdSvD2diUNjDLJpoSm4QxIpuS8Rh4+eMGaHZsxc0FdbsgeCqPAl4hqRQjgjZWm
	d7SQFFxEffyBD2jbIYmeLDyWomjykVGS+kTiH0tjJWHaXlqWInfBSl2dRkvCQEGvILNFiA/GO0gjg
	UOvZ8zSVGTo8JQp4BwWZA1LKdm+ejQu+fjExZJRVp1ev2wm2q80AF/g8S2iMNTQj5lyh5VDfHqKFg
	XeQ1RVOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP13M-00000009pmz-1bAe;
	Thu, 05 Nov 2026 17:15:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP11X-00000009okd-0CxK;
	Thu, 05 Nov 2026 17:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DGDDOafteCMnF/ED0u4XiZ/iqjUu/LT48qOf6yq6+BI=; b=D2cBAARK2PbdMGNUz7sHVx6PPR
	dc/HPZ80TaLfceOxVfRNEWkLYo0Xzgopu9UAkb8efmeDTZ3s/dQ4IsYyCr+z07y7CjWJI+OYMx2y8
	6tAgbcMT+S8sv8AoPydkNPhhslYHpCXmtkB563mKiJy6l9UUNx8+zOFlRxYWR5e52r4cgVKChro0S
	gOFT8n7WbC8/YfTIsK9mZJBCJDfaBPgkcJ74EXqMeGse5VEit/Vp5oHMMKTU2LMf+oAtRGVd++a74
	4ASmeehsJPnL999tdl3cAQw6hugDJiiVqWqldU95+SIMFrq7NKyZeHiHQdtujj9i4En8/XbrBqFaQ
	tNqmHXBg==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP11T-00000003Jnq-044I;
	Thu, 05 Nov 2026 17:13:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E95B21A0C98;
	Thu,  5 Nov 2026 17:13:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7E5E5FF43;
	Thu,  5 Nov 2026 17:13:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E184103292AE;
	Thu,  5 Nov 2026 18:12:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898780; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=DGDDOafteCMnF/ED0u4XiZ/iqjUu/LT48qOf6yq6+BI=;
	b=D9AaXb3GEmJffqpxhMdigP2MrhMV+4y/PaOcSxHluBgFTsp/8WclWOX5pqBFWxkb4hF8nF
	MUaeAsDD1kydpPBfEKItIROcIa4BxTk05H3Y3ges6dJJcwGPjNj/Ebo+sTBaa0IT0fs+QG
	+2cB4R6fTjLh8Qa/8hz2Cu29X2pNzXjyf055SDqSXJ7VXc+WIgfaHMyUF/Too0CVfHVfKU
	uglDid8cXNJrGAf/kYkfIvTA+ZlLHNSW0C3yODI4F1GiyixBAOAogdk+Ykc4Ml4JfAoQXw
	K7F8DGo9TWUXCu06zA3IlGpQRp19VFXLMdFlC4dqkXgfVm/fAwyqXQmsYrN6hg==
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
Subject: [PATCH 09/12] mtd: rawnand: mtk: Remove #ifdef guards for PM related functions
Date: Thu,  5 Nov 2026 18:11:55 +0100
Message-ID: <20261105171158.399247-10-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105171158.399247-1-paul.cercueil@bootlin.com>
References: <20261105171158.399247-1-paul.cercueil@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_171312_537359_7B4339BD 
X-CRM114-Status: GOOD (  14.92  )
X-Spam-Score: -0.2 (/)
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
