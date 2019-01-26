Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F593C282C7
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Jan 2019 13:11:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F9CD21872
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Jan 2019 13:11:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dXvZiWfg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="PF0jWI4J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F9CD21872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jNaat2iFGIoAawO5LYSQms+YzOnhFCzZ132S/MukUGc=; b=dXvZiWfgkkFWDb
	XuEuKFCFOJ7+H/oKwCRd8sha5DX9QntN5QVRVF7WT4kw4s3w0rRjNIUPLhbGrt2DjtmQAui98yQHp
	uYflUfnjRQqw3ZWX4+IgDYxyX2FGhw7Zt0mvSz97/sOt8E40AN89G5RQDH4er4+qYVqD80peaqkhS
	dn6SuP6VXxo+Bc7h97O5x3qfqhpB54jegoly5A2uFfQCd1A6nAXu6M93R2ChzL0fH4JD0rJZ3W25Q
	4VdC5EvZi3lGA5LkkfLLqOTY7oyy53VwU9dV7lK2bC01zyv5lUWxVlvIByyP1E3/So7bsncmJtPHE
	GGKs7VRczAHLWZqjCpTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gnNk2-0003rf-6I; Sat, 26 Jan 2019 13:11:22 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gnNjq-0003gE-EU
 for linux-mtd@lists.infradead.org; Sat, 26 Jan 2019 13:11:11 +0000
Received: by mail-lj1-x243.google.com with SMTP id s5-v6so10549141ljd.12
 for <linux-mtd@lists.infradead.org>; Sat, 26 Jan 2019 05:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C/3TY6rq/0PZRVa0c05fWF4DRikwplDxAw+KXls7E4o=;
 b=PF0jWI4JGa7MljDBKfcZ3OLncwcKdnFTYk4oThgzI2HVPi04fE51hJJKeV4isxJ3nU
 HNeRz887zKi/VT2pdj5cU1TeYEu7ZzzjtAoNyHWekkVOzhTDbZ8b2QAgkEWfB4Ukk687
 frN3FCracex0vBbf7Ead2sVV8TiHJNVZ4X/vQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C/3TY6rq/0PZRVa0c05fWF4DRikwplDxAw+KXls7E4o=;
 b=gGCnCgtQay6CF9eLhk9HMx7eRJDtt/S31YdPiGEuIUOmGhkfqUuB/6axuPqWWK65HY
 WG5Iqj41xV6G4X4781yKG7IyAaZeu7DN+8ZHV3qkJZxiSvO3bH7Ri/O5eQRR8pQSc0tU
 /P9EHaHUwosli8yU6U26BP6p1drzzgkbrOnNerXiB7J6HKkNj4dJFY3SNI/fsG9B0VLi
 sH5sM1xe0hp3X2yujm6K+xYjsqwk6R5Hnd02T0i1zpkI8W1OtAn85UNufYiKIOIrR7qd
 8d1BS1GyjpFP6Dbsr9dTU9J+ibH3wmI94p6es3+YFiF3yk2z7Vl1/75isAd0Lxb4oyEb
 JMEQ==
X-Gm-Message-State: AJcUukcthbERss/wLRCVB7pIDwkmN7YAwpNgFmK5QqmwABZAf5bjIt7E
 JPccXw6i2V6rYQbc5hd2BAEhP1J5XkQ=
X-Google-Smtp-Source: ALg8bN6zalftc/zMSsEIvBPOe9nCRAxzEh/Cg5rBHW4KGFaLsVMrXLFm4XtsQFry3X3ecAUFH64SMw==
X-Received: by 2002:a2e:2d11:: with SMTP id
 t17-v6mr11994173ljt.159.1548508268449; 
 Sat, 26 Jan 2019 05:11:08 -0800 (PST)
Received: from linux.local (c-ae7b71d5.014-348-6c756e10.bbcust.telenor.se.
 [213.113.123.174])
 by smtp.gmail.com with ESMTPSA id s127sm2109390lfe.8.2019.01.26.05.11.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 26 Jan 2019 05:11:07 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: [PATCH 2/2 v2] mtd: rawnand: fsmc: Disable NAND on remove()
Date: Sat, 26 Jan 2019 14:10:56 +0100
Message-Id: <20190126131056.11364-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190126131056.11364-1-linus.walleij@linaro.org>
References: <20190126131056.11364-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190126_051110_485797_C679C5D8 
X-CRM114-Status: GOOD (  17.02  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This disables the NAND on remove() and the errorpath,
making sure the chipselect gets deasserted when the
NAND is not in use.

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Break out NAND bank disable code into its own function.
---
 drivers/mtd/nand/raw/fsmc_nand.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 4050843dd35e..6c7ca41354be 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -965,6 +965,19 @@ static const struct nand_controller_ops fsmc_nand_controller_ops = {
 	.setup_data_interface = fsmc_setup_data_interface,
 };
 
+/**
+ * fsmc_nand_disable() - Disables the NAND bank
+ * @host: The instance to disable
+ */
+static void fsmc_nand_disable(struct fsmc_nand_data *host)
+{
+	u32 val;
+
+	val = readl(host->regs_va + FSMC_PC);
+	val &= ~FSMC_ENABLE;
+	writel(val, host->regs_va + FSMC_PC);
+}
+
 /*
  * fsmc_nand_probe - Probe function
  * @pdev:       platform device structure
@@ -1120,6 +1133,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	if (host->mode == USE_DMA_ACCESS)
 		dma_release_channel(host->read_dma_chan);
 disable_clk:
+	fsmc_nand_disable(host);
 	clk_disable_unprepare(host->clk);
 
 	return ret;
@@ -1134,6 +1148,7 @@ static int fsmc_nand_remove(struct platform_device *pdev)
 
 	if (host) {
 		nand_release(&host->nand);
+		fsmc_nand_disable(host);
 
 		if (host->mode == USE_DMA_ACCESS) {
 			dma_release_channel(host->write_dma_chan);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
