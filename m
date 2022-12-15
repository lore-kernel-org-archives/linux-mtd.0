Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20C1C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Dec 2022 16:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gEPfH9LM643gyhHSTFYbB+kS57GPw9k6EndJhE/OCh8=; b=cUCHeQ7qY6SOWx
	5c/7mmGxE5PsEp36vvSBo2qUk7bMGbnYcNT1zWWFP/C/PsjfXQgRC3tQ2ghwohpyWxGDI5DW/ldwk
	8yJDnpAb0DGEjeMRX/0UKibbP/x/dhXHSbqzlDAcwNot0zjR/3Q/0Mjx/7c+72u3b7xNT2/fJ6OKr
	X/Wf8VOd0MgOkl/J+C03PZKzxjxkNJSUscCUDipP/a258J5YTDL46ct+gND8sDhmrgNuBmFXUGoeJ
	YVCyRXDuVaxeBxQJu9T2+QPpMmDLTZgzSOoKk1ApleApadHyPqlHQjL6za9rI8vDg+x/XwwOV+mpT
	fGFeza13ENMNXDGjkIqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rOd-00AOeu-Mg; Thu, 15 Dec 2022 16:47:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rOa-00AOdr-UB
	for linux-mtd@lists.infradead.org; Thu, 15 Dec 2022 16:47:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5A207B81AAC;
	Thu, 15 Dec 2022 16:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D51C4C433D2;
	Thu, 15 Dec 2022 16:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671122862;
	bh=YUTvOViTEdKdQKeqBkH6WtxB3+C/WVCbQ+PFsOp/k7A=;
	h=From:To:Cc:Subject:Date:From;
	b=GHcj65KDlzl2XP7NCHhDA9/5PbRr5c5TpqBNO2oZHVPX3VlO6lUQQ86MOX7miUv31
	 PSzRVGAKRNyKtShtg3HycnqVY1bByzxKBtJ8vcvR7WMWlmfzymYJmpp1xtk9bVV+94
	 FhNcOmAL4Gxhav9qeEchPQPN2OSfwlWMGehzeUjuPoQQADWFMFDhYEIM7EJCHYGLfB
	 AxdcgABB7MQUf942DCp5c/YC3euz/myZakcuK1pyC7AIr9r6fLhZdVptV5QJ2sOKOM
	 0JoHiPPlvPENSUMB+dMDaF9OmBPKvfJMVRoWnat7PpRUp76pZmtZegIKZZqAta6TU1
	 az85nQ6b9vNtQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Claudius Heine <ch@denx.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: dataflash: remove duplicate SPI ID table
Date: Thu, 15 Dec 2022 17:47:30 +0100
Message-Id: <20221215164736.1315815-1-arnd@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_084745_146036_B191A948 
X-CRM114-Status: GOOD (  12.13  )
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

From: Arnd Bergmann <arnd@arndb.de>

Building with -Werror=override-init revealds that two patches added
the same device ID table to this driver:

drivers/mtd/devices/mtd_dataflash.c:946:27: error: initialized field overwritten [-Werror=override-init]
  946 |         .id_table       = dataflash_spi_ids,
      |                           ^~~~~~~~~~~~~~~~~
drivers/mtd/devices/mtd_dataflash.c:946:27: note: (near initialization for 'dataflash_driver.id_table')

Remove one of the copies.

Fixes: 27a030e87292 ("mtd: dataflash: Add device-tree SPI IDs")
Fixes: ac4f83482afb ("mtd: dataflash: Add SPI ID table")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/devices/mtd_dataflash.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 25bad4318305..3bbaa590c768 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -96,13 +96,6 @@ struct dataflash {
 	struct mtd_info		mtd;
 };
 
-static const struct spi_device_id dataflash_dev_ids[] = {
-	{ "at45" },
-	{ "dataflash" },
-	{ },
-};
-MODULE_DEVICE_TABLE(spi, dataflash_dev_ids);
-
 #ifdef CONFIG_OF
 static const struct of_device_id dataflash_dt_ids[] = {
 	{ .compatible = "atmel,at45", },
@@ -939,8 +932,6 @@ static struct spi_driver dataflash_driver = {
 		.name		= "mtd_dataflash",
 		.of_match_table = of_match_ptr(dataflash_dt_ids),
 	},
-	.id_table = dataflash_dev_ids,
-
 	.probe		= dataflash_probe,
 	.remove		= dataflash_remove,
 	.id_table	= dataflash_spi_ids,
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
