Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7918CC30658
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jul 2024 09:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eHZXZEZMjnXQy5yqzCERcHy3G1EMVH5tim+oc7/bFzI=; b=ZkB2yxL68l3yTA
	j2CHSLqekv6r1QY0ka/sGkcjIOSbadTqJQJV63wgDj7aDXhf7UOCPWG/GY9KZzzAMd3/wecFBfRlm
	N4trl8UkvYn5GoIcdrCct3j09du5ThIzJ2+cnxfpsr5UK0ZNf9bySW60t/AsYNleKuLecv4IIJ47t
	7LvauB5p98JE78BG7Mr2+Xhzu+yk/zsCjBP/4gr9MIrzb2jvXVQAXUQNbeTYo4bLnEWpq0fJy44Cj
	Pt+UIDG6CfJzsCoqCukXlBKL3q5FoGGtrwKf+YKL1sVUntywkjLr/x6vKX13Tuxn5Rh0LOmq8thJZ
	MORaxlbj0gkHYMwiamSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfPc-0000000FTwe-2P84;
	Fri, 05 Jul 2024 09:39:28 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfPN-0000000FTsY-1jQQ
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jul 2024 09:39:15 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a77b51631adso163184466b.3
        for <linux-mtd@lists.infradead.org>; Fri, 05 Jul 2024 02:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1720172351; x=1720777151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kVl0/ov31Z5c7JuaCdhkQTngl8fcz1FLMuHeeKS/wH0=;
        b=aHXMQu95b5lBHhwQGwfg38yuJUYblBeSC5RZrTY0epo2ukttuzCUKWkZ9+mINKTr0B
         34M/DlXYu3YB/ROnRRiJwj4J8uMhNgYJXKRxw1+ttBjTeNf65FGKZrYxJx2jhQAYpLRH
         rx6PnVC4e+LiTNTaVm7q/UgTps5kvROh1oC6yI82c75K89ahBaiIw+k/vOEGQDxnIGo/
         aYR/fREAJTWguJP8PaxYuJaDDdsZ+oyJJSo1eSLauOYF8oNd/+HJMkO2imKUQ7aC/E08
         B4y8AxirM0XAsgYf80tcyge9fwxCJwZpse57QtCBHca47PjkWRONjmgFo/rv3PO0j28u
         MQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720172351; x=1720777151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kVl0/ov31Z5c7JuaCdhkQTngl8fcz1FLMuHeeKS/wH0=;
        b=ty06cb4aQ5M3Ak8jOTsr5lLqdJJ5wF1RKwDVUXNiuGMJRLVub2sDToScQAEUMhlSk+
         AAAkFz8q+xYedtyneqF9iD//2dzxeyEi2WtBAGQcp28RqhJOjxO/pq83YfjH4ZApn5Vf
         bAihLnlnMAYXMsWbwpQ9GgnBJddkj4pCckA3T603MsD78pawV50ldsE6GqAifVcWCrSK
         zjz6ZggsW9+kgsn7NhqmWVBLcwILWHzlmSfGGYPuDke3nCppLfd8oH57JgQ5twS4hjrc
         RCdGyO6+8K0QD0z4mMazee+e3REmquFYMPfeuuwnDkhB2uw2IOOvD2+OX9kMfuOXH3ab
         LiMw==
X-Forwarded-Encrypted: i=1; AJvYcCXBHhCF7w3ilQ7ApmHijonUKJTccyhAjLvE10Zns5tpb0ef8HOOMIdVQqEcgPscgyu17RjhUXOn9jBS27HQpx/+SlsHvmiT/QujVJ+CIw==
X-Gm-Message-State: AOJu0YyVMaWpw7mwSxArwCHwdVYdRdlMGSeZedcl6KREbw5HE120rnNE
	pMX1oqyLb9iknw91LptTeYZ9z1pe+S22XosgHRLN6+j+i4oxBlA83VY4zXiFDAlzFLbq9/lHR4K
	h
X-Google-Smtp-Source: AGHT+IG52PNgZ6gFh4V9z3FNGhD1C7ZKZqyP5zmMsOxHv5dSPkPU9BQP1vX/iw37RZINd5W4yPauFw==
X-Received: by 2002:a17:906:c147:b0:a77:daa9:408 with SMTP id a640c23a62f3a-a77daa90562mr27338266b.72.1720172351027;
        Fri, 05 Jul 2024 02:39:11 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77da0e33bfsm10823866b.59.2024.07.05.02.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:39:10 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: dan.carpenter@linaro.org
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: lpx32xx: Fix dma_request_chan() error checks
Date: Fri,  5 Jul 2024 11:38:47 +0200
Message-Id: <20240705093851.18107-1-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_023913_457382_A3F3AF46 
X-CRM114-Status: GOOD (  12.19  )
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

Fixes: 7326d3fb1ee3 ("mtd: rawnand: lpx32xx: Request DMA channels
using DT entries")
Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
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
