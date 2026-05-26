Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0DACD5BCF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 07:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YK4Fbd0y45cTagoT8F3C/DqfWCpxfgy79SnGUI1yoJc=; b=kQTGAVUiRQYDNz
	O5I4Lx2UZRz8ea0HfPGp4Tu+vCze71rTJeCzXtKZhjiSqm1LU9zPWUn+MzS4655OLkShVQ16Z2r65
	ethpB1dD5qkk6z0S9KbubocVdiq24JKUoosnBBLudEmcP9MZTknrR39j6BTm8O306hqDyTeMPQnXi
	8sUvH3uRtIjzbiV2SLkPGRSt6kiYfFkg/PhGvVdns+RLFAG6ivlngxQzcNn8T64ILCjdhDyzMiYw/
	2zODCjJwF72T2chNByw7Rm6DugGyqB/RWhYD5/YlMlUjrDHoml1sBN5AYaRlV6hBsANdcS1aN1RoY
	nfK/UtUSh/iNrdzmzrjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRlvc-00000001EYD-0FQk;
	Tue, 26 May 2026 07:10:16 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRlvW-00000001EXT-3iKS
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 07:10:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 61A224E411D3;
	Tue, 26 May 2026 07:10:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B6FA60732;
	Tue, 26 May 2026 07:10:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47F571088837C;
	Tue, 26 May 2026 09:10:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779779404; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=sjEQBOO1EyR0cLJj1QKDelX8CN8+HmKMIJ0PENvy3gY=;
	b=dY0bbH4HjD8ezQZJwdA/VkzXbxcw48znO8YabyPrfMd2eF0WR+yONliT+muxVu7XIrwVtC
	Wi+g8fz6SDn3AEsHg+GXHxtAd7/6e94RuHvWj4BxAEBKsDggwkwCjHKfRZbGhcOeuxPWiB
	PX+NFAgYvX7yv8Y1LY/L/ll3JfcXkiwN6udx4jrL6EBOLMW/i61pztHDDglVHk6AKW8N2N
	44B7YIWgUzrDzTIYoAVMmblRU01msMxcQC5Rs5ETr58GnXF32yRHHUXPet2tFk0WRMs2d7
	Mxk3KkrXwTL2LkHufEj9dKg2/gePt+K2I0eKGEX+nqhjj+e3N4R/Jgnn+xmcrA==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
Date: Tue, 26 May 2026 09:10:00 +0200
Subject: [PATCH] mtd: rawnand: pl353: fix probe resource allocation
MIME-Version: 1.0
Message-Id: <20260526-fix-pl35x-probe-v1-1-3baad4f527f2@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyMz3bTMCt2CHGNTIFmUn5Sqa25oaZyUnJZsnmRhogTUVVCUClQCNjE
 6trYWAL4TWK9hAAAA
X-Change-ID: 20260526-fix-pl35x-probe-7193bcfc7b84
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Bastien Curutchet <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_001011_123286_B10B1370 
X-CRM114-Status: GOOD (  11.63  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

During probe(), the devm_ioremap() is called with the parent device
instead of the current one. So when the module is unloaded, the register
area isn't released.

Target the pl35x device in the devm_ioremap() instead of its parent.

Cc: stable@vger.kernel.org
Fixes: 08d8c62164a3 ("mtd: rawnand: pl353: Add support for the ARM PL353 SMC NAND controller")
Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index f2c65eb7a8d9..06f8f1e14b9c 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -1155,7 +1155,7 @@ static int pl35x_nand_probe(struct platform_device *pdev)
 	nfc->controller.ops = &pl35x_nandc_ops;
 	INIT_LIST_HEAD(&nfc->chips);
 
-	nfc->conf_regs = devm_ioremap_resource(&smc_amba->dev, &smc_amba->res);
+	nfc->conf_regs = devm_ioremap_resource(nfc->dev, &smc_amba->res);
 	if (IS_ERR(nfc->conf_regs))
 		return PTR_ERR(nfc->conf_regs);
 

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260526-fix-pl35x-probe-7193bcfc7b84

Best regards,
-- 
Bastien Curutchet <bastien.curutchet@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
