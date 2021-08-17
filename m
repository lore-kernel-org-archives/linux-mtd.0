Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33E9C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 09:30:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A383460FC3
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 09:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A383460FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ispras.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x+H/bdo9Y/wVP/kTLau5uEyQKquuev+N/LkqOK+8rYo=; b=tp9XIu2dnjxy69
	4njRPXanS1Eivr8E1Rx1HJznfMqxuE9tXlXP284xtYSzlYx/9P4JADnwD6R0Hms/xMaRtROJnVTQk
	0YhOT+69BapvRXMa5U93nNaX7FqPw9eS1yHjZ6PRnAw4/rY9iLJ9LZWC/2o+Fov/ascgMOuZpWgOk
	0WIMNMRlIMZeqYmSKrWfUp+s+I08fpi/bp4odsAW4Ai0kqsXFak9xyu598fkywFh1bNvqpl+a6k6M
	lzA3ylKSxsRvKDOQYuzuEQ77jwEKWq3yrIIm2H8cWQ9N7qjaymiaW0gVWq/2+aO6z2d4cmtt0UJ3k
	0FTnjoFYSCLQ8JrguqFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFvPd-001pgK-Iq; Tue, 17 Aug 2021 09:29:37 +0000
Received: from mail.ispras.ru ([83.149.199.84])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFvPZ-001peJ-1L
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 09:29:34 +0000
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
 by mail.ispras.ru (Postfix) with ESMTPS id 3BED740D4004;
 Tue, 17 Aug 2021 09:29:31 +0000 (UTC)
From: Evgeny Novikov <novikov@ispras.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Evgeny Novikov <novikov@ispras.ru>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Kirill Shilimanov <kirill.shilimanov@huawei.com>,
 Anton Vasilyev <vasilyev@ispras.ru>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org,
 stable@vger.kernel.org
Subject: [PATCH v2] mtd: rawnand: intel: Fix error handling in probe
Date: Tue, 17 Aug 2021 12:29:30 +0300
Message-Id: <20210817092930.23040-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_022933_320530_7B1A0E66 
X-CRM114-Status: GOOD (  11.49  )
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

ebu_nand_probe() did not invoke ebu_dma_cleanup() and
clk_disable_unprepare() on some error handling paths. The patch fixes
that.

Found by Linux Driver Verification project (linuxtesting.org).

Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
Co-developed-by: Kirill Shilimanov <kirill.shilimanov@huawei.com>
Signed-off-by: Kirill Shilimanov <kirill.shilimanov@huawei.com>
Co-developed-by: Anton Vasilyev <vasilyev@ispras.ru>
Signed-off-by: Anton Vasilyev <vasilyev@ispras.ru>
Cc: stable@vger.kernel.org
---
v2: Fix remarks from Miquel Raynal:
    - Add a Fixes: tag.
    - Add a Cc: stable tag.
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 27 +++++++++++++-------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 8b49fd56cf96..29e8a546dcd6 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -631,19 +631,26 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	ebu_host->clk_rate = clk_get_rate(ebu_host->clk);
 
 	ebu_host->dma_tx = dma_request_chan(dev, "tx");
-	if (IS_ERR(ebu_host->dma_tx))
-		return dev_err_probe(dev, PTR_ERR(ebu_host->dma_tx),
-				     "failed to request DMA tx chan!.\n");
+	if (IS_ERR(ebu_host->dma_tx)) {
+		ret = dev_err_probe(dev, PTR_ERR(ebu_host->dma_tx),
+				    "failed to request DMA tx chan!.\n");
+		goto err_disable_unprepare_clk;
+	}
 
 	ebu_host->dma_rx = dma_request_chan(dev, "rx");
-	if (IS_ERR(ebu_host->dma_rx))
-		return dev_err_probe(dev, PTR_ERR(ebu_host->dma_rx),
-				     "failed to request DMA rx chan!.\n");
+	if (IS_ERR(ebu_host->dma_rx)) {
+		ret = dev_err_probe(dev, PTR_ERR(ebu_host->dma_rx),
+				    "failed to request DMA rx chan!.\n");
+		ebu_host->dma_rx = NULL;
+		goto err_cleanup_dma;
+	}
 
 	resname = devm_kasprintf(dev, GFP_KERNEL, "addr_sel%d", cs);
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, resname);
-	if (!res)
-		return -EINVAL;
+	if (!res) {
+		ret = -EINVAL;
+		goto err_cleanup_dma;
+	}
 	ebu_host->cs[cs].addr_sel = res->start;
 	writel(ebu_host->cs[cs].addr_sel | EBU_ADDR_MASK(5) | EBU_ADDR_SEL_REGEN,
 	       ebu_host->ebu + EBU_ADDR_SEL(cs));
@@ -653,7 +660,8 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	mtd = nand_to_mtd(&ebu_host->chip);
 	if (!mtd->name) {
 		dev_err(ebu_host->dev, "NAND label property is mandatory\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_cleanup_dma;
 	}
 
 	mtd->dev.parent = dev;
@@ -681,6 +689,7 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	nand_cleanup(&ebu_host->chip);
 err_cleanup_dma:
 	ebu_dma_cleanup(ebu_host);
+err_disable_unprepare_clk:
 	clk_disable_unprepare(ebu_host->clk);
 
 	return ret;
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
