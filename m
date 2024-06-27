Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC880C2BD09
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2024 15:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tq/IQ3pMZLSf7xgKXwkG/4dTihdT3fA7jQDxPWCSVF4=; b=eFLiPS8lvUOVLm
	ZLbiRAxu0Y5NIYczFd3m3YPbmRLuEJ9Ji7qfenyq8lX2iSeGnhlNPtsLbU5500acfGVuIHGRD3EGa
	rjgJBlnY0D3ZGXEekEBAM9HR2UrncVaaQkfuMNTRDQ1YNox3S1t+HAxtdQr0mJedCEB4DJyQ1a0Ca
	GFPxFmps6tO8zuo5aZoNjvqvDjJZUEn8jk+sNCCxhNUsQLocFct2qnSRuhoCEdSy5c79nWGAXIOqc
	x7i6xMgGzxnFhguK5uhl0OhihFbSTD54GZ3QLMvcQrn4fG+BsHG/0ZqfgQyxWPcWK0MEjtLy7Jzj+
	RynTrwv1cwbmxBLcl4XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqg1-0000000Amcu-3OCg;
	Thu, 27 Jun 2024 15:04:45 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqfx-0000000AmZP-3cRE
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jun 2024 15:04:44 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a724b4f1218so697069866b.2
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2024 08:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500680; x=1720105480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kKU0V25b+NdpL5Nxb/CadexmGEKpxevd8xM2vqH8ko=;
        b=i5seAKceJvgeIY4o546fYQ7lvuaqTGFKl7nqJTo12CEyz/T1NwMPCpewx1ZpL379kn
         /Mise/J+xQmJcEGAU1TFPHMB1O0zMTv+TXURVPpv1uu5TgknBCakzPbIqPRilmahB0rI
         //XeGQvk2Tr9WN525hyu5AcM+C00HMRbEpIyPLzCHztpBzlDP4dGeZSvZUkBZT528tX7
         PZrzEh4RQKDLpof/VOBnI6YmR7Qq1nHwNSyLQp8G+r3pKxYoMJaAzV3Hkm7ORqOI5JNw
         QOB4V7A/0sR2+8c1qCc9Xk4uoEJhddoZjy4FdC8beOfVq+oUN/1Yuist8+2JBHiYcuRF
         72WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500680; x=1720105480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0kKU0V25b+NdpL5Nxb/CadexmGEKpxevd8xM2vqH8ko=;
        b=QPGPlu9ML+rYomsOcDE4g5527bBDMkBOjn99gN4BZ1sE+CJJvvpubLzI8IeQLLEzPI
         ZEUSfab6KJmabNVSZ9gPPNCG9Nz6SXMTSgc4TFHDRwHLjn7bxLzKyyJtU9E5SF7BEi8K
         M0Sv5uImv6obvCTla38jSlXaOxMNSfjdgna+WhDC6qhEPRRRPcwirOnJilzwyTebT3Y3
         01+Fu6w+7RdMPlNRg/pZEDj/5js3X8WXWVA0VMnMwSQEIgLs7nxmhI3fX4WBRv1A4EpT
         KGUYCVlYaYt/xENbfM71Vvjso7aQLTDL7qbZkevh3w7uU3GLf58yEWLaB/2bhRhLDySc
         adXg==
X-Forwarded-Encrypted: i=1; AJvYcCW5P4di9vISkm0ayHDhtenoEf9AIXpUNpGXYuCzvyJyYDhA6cQ2NCy1PIUJF+Hmg7VmebTt/TYSviFwgGynvVBkPzWKm5SKW/OhWkv+KQ==
X-Gm-Message-State: AOJu0YwbDE5M6+EuvObaWBBpWertzQaGaYSzhcQz0QfYWHLzHy35dviW
	YtbJhSnVmgE+m5qNgR3LReksZMIaRdCmIE6cR8+8hO34PM29KB9aMZOgv1HKptw=
X-Google-Smtp-Source: AGHT+IEDRv7diooeJV6LJXwf0EjCsVi9YKqxuCA0IYC1Rui0S1k3Zcq9kDuWbuWeuGO8t2Iv/ci0ng==
X-Received: by 2002:a17:906:d509:b0:a6f:5192:6f4d with SMTP id a640c23a62f3a-a7242c4dfd3mr693613366b.8.1719500679193;
        Thu, 27 Jun 2024 08:04:39 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:04:38 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
	Corentin Labbe <clabbe@baylibre.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [Patch v5 10/12] mtd: rawnand: lpx32xx: Request DMA channels using DT entries
Date: Thu, 27 Jun 2024 17:00:28 +0200
Message-Id: <20240627150046.258795-11-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_080442_004712_5FB2DE17 
X-CRM114-Status: GOOD (  14.38  )
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

Move away from pl08x platform data towards device tree.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v5:
- Added fallback dma channel request for backward compatibility with DMA with
  platform data instead DT

Changes for v4:
- This patch is new in v4

 drivers/mtd/nand/raw/lpc32xx_mlc.c | 26 +++++++++++++++-----------
 drivers/mtd/nand/raw/lpc32xx_slc.c | 26 +++++++++++++++-----------
 2 files changed, 30 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 677fcb03f9be..92cebe871bb4 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -574,18 +574,22 @@ static int lpc32xx_dma_setup(struct lpc32xx_nand_host *host)
 	struct mtd_info *mtd = nand_to_mtd(&host->nand_chip);
 	dma_cap_mask_t mask;
 
-	if (!host->pdata || !host->pdata->dma_filter) {
-		dev_err(mtd->dev.parent, "no DMA platform data\n");
-		return -ENOENT;
-	}
-
-	dma_cap_zero(mask);
-	dma_cap_set(DMA_SLAVE, mask);
-	host->dma_chan = dma_request_channel(mask, host->pdata->dma_filter,
-					     "nand-mlc");
+	host->dma_chan = dma_request_chan(mtd->dev.parent, "rx-tx");
 	if (!host->dma_chan) {
-		dev_err(mtd->dev.parent, "Failed to request DMA channel\n");
-		return -EBUSY;
+		/* fallback to request using platform data */
+		if (!host->pdata || !host->pdata->dma_filter) {
+			dev_err(mtd->dev.parent, "no DMA platform data\n");
+			return -ENOENT;
+		}
+
+		dma_cap_zero(mask);
+		dma_cap_set(DMA_SLAVE, mask);
+		host->dma_chan = dma_request_channel(mask, host->pdata->dma_filter, "nand-mlc");
+
+		if (!host->dma_chan) {
+			dev_err(mtd->dev.parent, "Failed to request DMA channel\n");
+			return -EBUSY;
+		}
 	}
 
 	/*
diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index 1c5fa855b9f2..3b7e3d259785 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -721,18 +721,22 @@ static int lpc32xx_nand_dma_setup(struct lpc32xx_nand_host *host)
 	struct mtd_info *mtd = nand_to_mtd(&host->nand_chip);
 	dma_cap_mask_t mask;
 
-	if (!host->pdata || !host->pdata->dma_filter) {
-		dev_err(mtd->dev.parent, "no DMA platform data\n");
-		return -ENOENT;
-	}
-
-	dma_cap_zero(mask);
-	dma_cap_set(DMA_SLAVE, mask);
-	host->dma_chan = dma_request_channel(mask, host->pdata->dma_filter,
-					     "nand-slc");
+	host->dma_chan = dma_request_chan(mtd->dev.parent, "rx-tx");
 	if (!host->dma_chan) {
-		dev_err(mtd->dev.parent, "Failed to request DMA channel\n");
-		return -EBUSY;
+		/* fallback to request using platform data */
+		if (!host->pdata || !host->pdata->dma_filter) {
+			dev_err(mtd->dev.parent, "no DMA platform data\n");
+			return -ENOENT;
+		}
+
+		dma_cap_zero(mask);
+		dma_cap_set(DMA_SLAVE, mask);
+		host->dma_chan = dma_request_channel(mask, host->pdata->dma_filter, "nand-slc");
+
+		if (!host->dma_chan) {
+			dev_err(mtd->dev.parent, "Failed to request DMA channel\n");
+			return -EBUSY;
+		}
 	}
 
 	return 0;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
