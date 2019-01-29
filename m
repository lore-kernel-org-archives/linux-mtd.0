Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E899C282D0
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 12:14:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1B192177E
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 12:14:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CqFAOni/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="KaAkZvBP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1B192177E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=GANbN8g1akxE4+Dv9cO2r84MSvOdnHJ748PBVNGDM8A=; b=CqF
	AOni/x9HYxSRF/DolsBQKQBLzV0C5ueh8QA1hurh0UdFxPsNuDXzN9PaYCDyVBtDAp9Lji9KOqWWg
	HlSkaqn2D9OTdhwqqSBBQgB4rlVkCvm/ayaXzjc7B8Kp9tapWW2eoMfjncY/ofLaduYDmQrgO891/
	6QW20d3Fbh540/GlmQghdidwY/y0UfdeLAq5sETng+bV1YpXo9P7KymKFn3a8cF83bpfQqM4CkN9D
	O5n23Oh/+L79eEGlDVoEo4tD3ZoiQEe/RXaYaHFU2EZT4M6IkAE9kV+yF5ai4/J6+w1ZD2W+UJGSL
	ED2wXHBzdtFaEIf9LeO150+zy0GHTNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goSHZ-0008Hk-Vj; Tue, 29 Jan 2019 12:14:25 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goSHW-0008HM-MY
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2019 12:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=PSjp0GErO0GNC/ycgfVz5U6G4bsI+4ZCjEj6nxYRKWY=; b=KaAkZvBPdoYF
 HXq9ooeS/wm8Yrsi/NguRSqXH7T8nOw6zeiy5zTlfMYEszsBH1UQEJH2+f4lv/InLufXbwJRBQXCc
 U2+olsdfLcdaTI94TK6S2pVVEEPSO/BGfjshaYMMEJ7oJmiTrhKjpwwahcQbqPRnBEYOK06Q46DXr
 ucZRM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1goSHU-0008Ai-AM; Tue, 29 Jan 2019 12:14:20 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id E61F61127D50; Tue, 29 Jan 2019 12:14:19 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Subject: Applied "spi: spi-mem: spi-fsl-qspi: typo fix in author name" to the
 spi tree
In-Reply-To: <1548755607-27544-1-git-send-email-yogeshnarayan.gaur@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190129121419.E61F61127D50@debutante.sirena.org.uk>
Date: Tue, 29 Jan 2019 12:14:19 +0000 (GMT)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_041422_883501_6FB9FE65 
X-CRM114-Status: GOOD (  11.37  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "frieder.schrempf@kontron.de" <frieder.schrempf@kontron.de>,
 linux-spi@vger.kernel.org, "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The patch

   spi: spi-mem: spi-fsl-qspi: typo fix in author name

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From c55d0e8c543bfd21f0dce73024e5f6a9a306b834 Mon Sep 17 00:00:00 2001
From: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Date: Tue, 29 Jan 2019 09:55:27 +0000
Subject: [PATCH] spi: spi-mem: spi-fsl-qspi: typo fix in author name

Typo fix in Author Boris Brezillon last name and update with new
email address.

Fixes: 84d043185dbe ("spi: Add a driver for the Freescale/NXP QuadSPI controller")
Signed-off-by: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-fsl-qspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index f0a340026ba4..6a713f78a62e 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -10,7 +10,7 @@
  *
  * Transition to SPI MEM interface:
  * Authors:
- *     Boris Brezillion <boris.brezillon@bootlin.com>
+ *     Boris Brezillon <bbrezillon@kernel.org>
  *     Frieder Schrempf <frieder.schrempf@kontron.de>
  *     Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
  *     Suresh Gupta <suresh.gupta@nxp.com>
@@ -959,7 +959,7 @@ module_platform_driver(fsl_qspi_driver);
 
 MODULE_DESCRIPTION("Freescale QuadSPI Controller Driver");
 MODULE_AUTHOR("Freescale Semiconductor Inc.");
-MODULE_AUTHOR("Boris Brezillion <boris.brezillon@bootlin.com>");
+MODULE_AUTHOR("Boris Brezillon <bbrezillon@kernel.org>");
 MODULE_AUTHOR("Frieder Schrempf <frieder.schrempf@kontron.de>");
 MODULE_AUTHOR("Yogesh Gaur <yogeshnarayan.gaur@nxp.com>");
 MODULE_AUTHOR("Suresh Gupta <suresh.gupta@nxp.com>");
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
