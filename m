Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C123AC3271E
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jul 2024 11:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+sl+/xvHJkTGWI3Zc1xaTiEdIhwTqIpF5mYJE3PU+i0=; b=fsVYpSNcblli72
	+u4oIxbsvzuLFIJxe+uCLHPaXVGsDGeCILOfTM0LCqWu+Ki3wZRJz46QgT65bzk1ld2K0OcIABSge
	QxtYUrlDeHt/1lxm0dxMugZhr+KGRpivy+T9jZD+eQp2WWDNTcC9Tjlt0gJE76zI1Zem/ZE03cLFF
	hd2EYlFqojUaSy4Do2WeURmtor4DLQa7d68oYHWUYzvv3XMDfN3NRkF157eh/mWjwZtGY+KWFGRKM
	C5RrKPi6fxzbKlW7XBxgwTpzyT1o4wowjoLYAQUSEMiYD0VRHBM63q33viKoWBqebuVE7Og0jphe9
	QOsa/6GSW8hudwgw+lPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPhTu-0000000FqPG-3GHn;
	Fri, 05 Jul 2024 11:52:02 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPhTg-0000000FqM7-0W4b
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jul 2024 11:51:50 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a77c9c5d68bso75170566b.2
        for <linux-mtd@lists.infradead.org>; Fri, 05 Jul 2024 04:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1720180306; x=1720785106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+QojLwX8k68lmn9KlieWzohao5qbJAQQ4QJADw03ISo=;
        b=cn3Mc4V8uG9J2ESKKcW1aUgC7t/BjCWz9DvhjfPZdPgiLBzm5kkp31LgNkB8PadoYQ
         9aTS/Xyp+bTjNZUCAIOskGZIenRi/2vAzs5dwbyqNm+deLEMgG1subtedNWo+88Z/Gnj
         Oc5J/2Y6p048zfzix5qxPTl7duIblO0687B1bbXSX9vvLHkHXqo/WZs6bIYseNHo/YlS
         IWxN3EHWwVa0ZBzcG0j5imTOrBiklBu17tIrnQ9ZVX4TYxRYFW/kcXljKyvCdkPvjksP
         yHZef9LF2tZh0Zm7x+LGnFL37xD3mB8KWhAT6HeL+2easJt/Z8FvfSkmQFRvrBDgS46i
         adZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720180306; x=1720785106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QojLwX8k68lmn9KlieWzohao5qbJAQQ4QJADw03ISo=;
        b=tRQFa5pFYJQ5RWQhlZ26kCFe6UXIH8HPFQ76OYDjR0jBG15UCU7WFZEuT1swBa6ujF
         yQ09nr0GoqG87ER3Ae8nRCXIrWrR6Cg2qLvJ8SEx9R9mplhlhXgxRvxTz8AmYr4+9rIX
         gHbjt+cWvMD9v5MOhb/8TcmUsDm+LiLHlTr2bIYkDxy75VEQBVd8mIvTvBdWUNE2sayO
         4OCfNdb+pCyx+eR4z9fXCaYg5agPEa1JpmaRun70eeT7uVrso+Uwiev/S/SYjU395O03
         eHRNDALYYfznOfZKyqsj1Rs9RBeD3XrfsfYOxAAuYtEuCU+fugurkqo52WYrGlqFpWiY
         op8g==
X-Forwarded-Encrypted: i=1; AJvYcCVS6nCOSqOSxEIC5faWzLELtL5XgthH1pfP3x1R1S9R316B3d0QTChLgUbJBJasm3Lf+g5Ae2yvXilF91WVF5+qIHg7NqDfqoGus/kv+g==
X-Gm-Message-State: AOJu0YwcNU0pUKnwuZdx82p/GRvSBMUipf3uNvmfZi0R3LqpudeLi13j
	zBTPXjflPQHjTt83DAarWksHKgK/u6Oo30+fVBZQkHfcEnltLhPgb0/+I1snNFk=
X-Google-Smtp-Source: AGHT+IFHA1gnQKRQ18iPmWbS0NPjG9TbNdQHs95PiwC+5AeAhU74MhAe3PLIFlm88Q5NStc5UX6U7A==
X-Received: by 2002:a17:906:4751:b0:a74:e717:4259 with SMTP id a640c23a62f3a-a77ba48db88mr281324166b.41.1720180306439;
        Fri, 05 Jul 2024 04:51:46 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab06531fsm674762866b.100.2024.07.05.04.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 04:51:46 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: miquel.raynal@bootlin.com
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	stable@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [Patch v2] mtd: rawnand: lpx32xx: Fix dma_request_chan() error checks
Date: Fri,  5 Jul 2024 13:51:35 +0200
Message-Id: <20240705115139.126522-1-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_045148_304749_8B430EDB 
X-CRM114-Status: GOOD (  12.09  )
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

The dma_request_chan() returns error pointer in case of error, while
dma_request_channel() returns NULL in case of error therefore different
error checks are needed for the two.

Fixes: 7326d3fb1ee3 ("mtd: rawnand: lpx32xx: Request DMA channels using DT entries")
Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: stable@vger.kernel.org
---
Changes v2:
 - Corrected 'Fixes' tag
 - add Cc: stable 

 drivers/mtd/nand/raw/lpc32xx_mlc.c | 2 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 92cebe871bb4..b9c3adc54c01 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -575,7 +575,7 @@ static int lpc32xx_dma_setup(struct lpc32xx_nand_host *host)
 	dma_cap_mask_t mask;
 
 	host->dma_chan = dma_request_chan(mtd->dev.parent, "rx-tx");
-	if (!host->dma_chan) {
+	if (IS_ERR(host->dma_chan)) {
 		/* fallback to request using platform data */
 		if (!host->pdata || !host->pdata->dma_filter) {
 			dev_err(mtd->dev.parent, "no DMA platform data\n");
diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index 3b7e3d259785..ade971e4cc3b 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -722,7 +722,7 @@ static int lpc32xx_nand_dma_setup(struct lpc32xx_nand_host *host)
 	dma_cap_mask_t mask;
 
 	host->dma_chan = dma_request_chan(mtd->dev.parent, "rx-tx");
-	if (!host->dma_chan) {
+	if (IS_ERR(host->dma_chan)) {
 		/* fallback to request using platform data */
 		if (!host->pdata || !host->pdata->dma_filter) {
 			dev_err(mtd->dev.parent, "no DMA platform data\n");
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
