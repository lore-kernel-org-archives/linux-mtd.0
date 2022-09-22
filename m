Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7846C6FA82
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Sep 2022 15:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HvEbRNdHF4U2gIO3H0MWS6AtqeYz5NswI40V3opMr0k=; b=Ho3go5YzO1zX15
	ZgY+PmW9DGY4lVOZJKKCGF4jeyqJkwYBR/hfxyZFI4mVKtQ4q0iAXQ9IDU3VAxEI+xktclOMu3DVq
	O0DBlAFxV4PM39slFrbqqG7W4lTVkSFl5h9EWcfR0Uf9eTie2TQt6wYQmBci6IDZDLjXdHh6cRxf8
	jHY/LIkIgiLbjz7Me1QoeJrREiC2nZ3dPfaL5A+t2bEH6G2PntfbtNFY9Mz75dt7Exbho+6FAScno
	ixIN6JpJZjHGR7TE66+oeFcYnYvrZUvWgvT+yb9SkuZ7LNw1OWqP+4jWlYHaNhFeuOJm1iKpXxg2m
	YxlrXU3MnwbiVhc+1E2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obNsv-00GL0c-DE; Thu, 22 Sep 2022 15:13:05 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obNjb-00GGGA-CE
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2022 15:03:29 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MYJQ13gYtzHq0J;
	Thu, 22 Sep 2022 23:01:13 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 23:03:24 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 22 Sep
 2022 23:03:23 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <han.xu@nxp.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH -next] mtd: rawnand: gpmi: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
Date: Thu, 22 Sep 2022 23:06:54 +0800
Message-ID: <20220922150654.117568-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_080327_674198_F8127309 
X-CRM114-Status: GOOD (  10.01  )
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

Using the newest pm_runtime_resume_and_get is more appropriate
for simplifing code here.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 93da23682d86..72cdf2623339 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -148,11 +148,9 @@ static int gpmi_init(struct gpmi_nand_data *this)
 	struct resources *r = &this->resources;
 	int ret;
 
-	ret = pm_runtime_get_sync(this->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(this->dev);
+	ret = pm_runtime_resume_and_get(this->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	ret = gpmi_reset_block(r->gpmi_regs, false);
 	if (ret)
@@ -2504,11 +2502,9 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 	for (i = 0; i < GPMI_MAX_TRANSFERS; i++)
 		this->transfers[i].direction = DMA_NONE;
 
-	ret = pm_runtime_get_sync(this->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(this->dev);
+	ret = pm_runtime_resume_and_get(this->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	/*
 	 * This driver currently supports only one NAND chip. Plus, dies share
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
