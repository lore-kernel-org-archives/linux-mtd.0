Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE85C1B0FD
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 21:06:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77DC720449
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 21:06:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FE7DUk0r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="CNxuoiZC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77DC720449
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v8tzMGMxNnRMS/e8q/SawHdBxSnFPXjUk0c6an1lv58=; b=FE7DUk0rQB7iZM
	D+oMM7Wvq260tr5wmu4GJocqGD6+CvAUK8TWcJVI6Bms9pubbYWIqRFdiW7TESXaKh8JaFhRm7HT7
	qAB3AoFtrfI2QBBWhdmop3ucMeWj/Hf2Z/8KE9bPOzj/GqutssCCNqX+CrIGm6Bc9aWydyllw/V0D
	nXYM7oOb4gQz5s2n/dHIrJfWHKj+ViqvNDgbMYAblS6biMQurTPQlapiNl5Vj8KZU6PIY5IkUWAKY
	gyM284iiGE7zISFwcy4bxSK2SKUtDBAxMk4HMutsOxk6roxeb80kVHa+gKOm+hZbRUzNhJOM6MAX1
	iTKdBtlIcWiW/Tsb/OSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkbLP-0005Bu-NK; Fri, 18 Jan 2019 21:06:27 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkbLI-00052W-1Z
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 21:06:25 +0000
Received: by mail-lj1-x244.google.com with SMTP id c19-v6so12787361lja.5
 for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2019 13:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K5lyavPbDV0iJg1W50ZkDSeB+HjlRIbMOn2Z/gYczK4=;
 b=CNxuoiZC9gW/DXv+uu9yBig9/tj07y5XzfBDdYCHBmDaYvzfWerjTrnOhy9UqR8/kl
 waP7Y+1aixaI6BGvL8yEpXbG2HI8aMxqYNGaTnnyag8DhnBVL34z1cX2lx+oHankrkLO
 qliPCEqMOjqV2oxRRz+gJZvYNnQWQTLaSSM5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K5lyavPbDV0iJg1W50ZkDSeB+HjlRIbMOn2Z/gYczK4=;
 b=CYRXz+R2VzhcB3IjWcmAjmXqZoyuTt7nYanVIJUNJZuEb1tAebWB2mOGnLpeTrTZWs
 3+s+qwm37k1YIno4hyTMyrvKZg4U0fC7IZet8z2baW3fykvtmECaqhTYs+YPsGN8rfhF
 tziNtB2GK2uoEeQ+VfxUkZ38/BGbsXWhixD9dD6OMAsClv+XecS3mSm0rgl+8Iv47eGu
 eSA/QC4MMj+HeUSYVfiVIwuwsjQCE+IBSCxaP/AoXbFropaBdlnuCzuUm4s6kpZpWRQJ
 +xFY/DS1FZYJsX8Ghuced5uxDUO40sCokvBvzSZVOVz7TAeMS8k4RYBh4r/s19EGhIE6
 XQeg==
X-Gm-Message-State: AJcUukelSHzjVg7oMEjQPsS1lUDDVUNJBs1liiChf0s1H6dKks/Ntltz
 loWiWfYwd/29C05uR8CMm+Ps2Q==
X-Google-Smtp-Source: ALg8bN6FWyNLUzWlyeLIeDc1ELecVbmbOQFVllEC/cR+vghCcRZp7QhNOn4FgfMzV0+gQwXHMC0K9w==
X-Received: by 2002:a2e:7f04:: with SMTP id
 a4-v6mr14043495ljd.156.1547845577941; 
 Fri, 18 Jan 2019 13:06:17 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-ae7b71d5.014-348-6c756e10.bbcust.telenor.se. [213.113.123.174])
 by smtp.gmail.com with ESMTPSA id u21-v6sm914310lju.46.2019.01.18.13.06.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 18 Jan 2019 13:06:16 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: rawnand: fsmc: Disable NAND on remove()
Date: Fri, 18 Jan 2019 22:06:15 +0100
Message-Id: <20190118210615.8286-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_130620_709496_17A0B35B 
X-CRM114-Status: GOOD (  14.73  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This disables the NAND on remove() and the errorpath,
making sure the chipselect gets deasserted when the
NAND is not in use.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 4050843dd35e..118b1b1cd8da 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -979,6 +979,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	dma_cap_mask_t mask;
 	int ret = 0;
 	u32 pid;
+	u32 val;
 	int i;
 
 	/* Allocate memory for the device structure (and zero it) */
@@ -1120,6 +1121,9 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	if (host->mode == USE_DMA_ACCESS)
 		dma_release_channel(host->read_dma_chan);
 disable_clk:
+	val = readl(host->regs_va + FSMC_PC);
+	val &= ~FSMC_ENABLE;
+	writel(val, host->regs_va + FSMC_PC);
 	clk_disable_unprepare(host->clk);
 
 	return ret;
@@ -1131,10 +1135,15 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 static int fsmc_nand_remove(struct platform_device *pdev)
 {
 	struct fsmc_nand_data *host = platform_get_drvdata(pdev);
+	u32 val;
 
 	if (host) {
 		nand_release(&host->nand);
 
+		val = readl(host->regs_va + FSMC_PC);
+		val &= ~FSMC_ENABLE;
+		writel(val, host->regs_va + FSMC_PC);
+
 		if (host->mode == USE_DMA_ACCESS) {
 			dma_release_channel(host->write_dma_chan);
 			dma_release_channel(host->read_dma_chan);
-- 
2.19.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
