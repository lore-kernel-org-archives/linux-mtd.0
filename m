Return-Path: <SRS0=PNEu=GI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BC0C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jan 2021 14:04:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A23722AAA
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jan 2021 14:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A23722AAA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qy28+wPlXc+jrA8Ig73iRVk1ckUmh3gpAHCGtsRSxmc=; b=zojDZhUZOOAPy3j0ZhyIArurae
	+jfSsVwCoShLnjweYFDxZgjA3ecsiz9ms6Ll5vkSEvaxF0jovoqHVjXEdmb4noLB3nF9JLeEGe/2Z
	PUrybcWBWnvj3XZasnBiBUHt67xIuozn6wUrRUpJ022aR1zF6Bff62uJCX0hMkUTTjady2u6tHxDX
	Q8b2tZN5NTfGZxJLq2lix6Vu11gbl6/e5ZjqB1Zgegl9urxqUF7alpC4OQr4bhtEBfK6Qo1D3115R
	z8g1dp9oAPROP57gLiLIhN0+DaLrKsMR3Oq1PdElo3OMcBlR6cf88AvBi3Nd47wzpkmXmz6NrU2v0
	CZd5mW1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwmwE-0002VU-41; Tue, 05 Jan 2021 14:03:54 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwmw4-0002S3-5A
 for linux-mtd@lists.infradead.org; Tue, 05 Jan 2021 14:03:46 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0B248AEBB;
 Tue,  5 Jan 2021 14:03:43 +0000 (UTC)
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jakub Kicinski <kuba@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH 05/10] dma: tx49 removal
Date: Tue,  5 Jan 2021 15:02:50 +0100
Message-Id: <20210105140305.141401-6-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210105140305.141401-1-tsbogend@alpha.franken.de>
References: <20210105140305.141401-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_090344_408364_CB540B96 
X-CRM114-Status: GOOD (  14.32  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 drivers/dma/Kconfig    |  2 +-
 drivers/dma/txx9dmac.h | 10 ----------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index d242c7632621..22fedfb6f5f9 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -601,7 +601,7 @@ config S3C24XX_DMAC
 
 config TXX9_DMAC
 	tristate "Toshiba TXx9 SoC DMA support"
-	depends on MACH_TX49XX || MACH_TX39XX
+	depends on MACH_TX39XX
 	select DMA_ENGINE
 	help
 	  Support the TXx9 SoC internal DMA controller.  This can be
diff --git a/drivers/dma/txx9dmac.h b/drivers/dma/txx9dmac.h
index aa53eafb1519..4acf29f50a29 100644
--- a/drivers/dma/txx9dmac.h
+++ b/drivers/dma/txx9dmac.h
@@ -26,11 +26,6 @@
  * DMA channel.
  */
 
-#ifdef CONFIG_MACH_TX49XX
-static inline bool txx9_dma_have_SMPCHN(void)
-{
-	return true;
-}
 #define TXX9_DMA_USE_SIMPLE_CHAIN
 #else
 static inline bool txx9_dma_have_SMPCHN(void)
@@ -40,13 +35,8 @@ static inline bool txx9_dma_have_SMPCHN(void)
 #endif
 
 #ifdef __LITTLE_ENDIAN
-#ifdef CONFIG_MACH_TX49XX
-#define CCR_LE	TXX9_DMA_CCR_LE
-#define MCR_LE	0
-#else
 #define CCR_LE	0
 #define MCR_LE	TXX9_DMA_MCR_LE
-#endif
 #else
 #define CCR_LE	0
 #define MCR_LE	0
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
