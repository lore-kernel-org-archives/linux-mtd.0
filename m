Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FCBC27C7A
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Aug 2023 11:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HJE6cNqvnpD+HqyJJeNwUy5wb7FVK8AMPv+lhd9ABTc=; b=Nx1CpYCRMilhvb
	4SnPSPXeS5Cck89hogfelqOXZoV1iBtuJxa8cgFtjrUSz0aCsIHSbqsDDH5u0YzlIvxh5Zj94Tv8H
	NrL6GJHr39gJSetmDMm4SUrcz1zFz+CcTFJ7QJM3drNjUEknVU8byeE2UN1ls1gbssoIO2hVA4Kii
	tRYVesK5m24EChLyzWdk8lIg2Gu1hxezxuh4DhV3Ry0eZIGSjN5eN3K2u16T6yBcrVd75ZgkjnS3M
	jeng6Ea9TuqP4jWkPoojlSWbrS1lJwT3CRF6NqYqlKTowzPgZXR3bA3j4jFuKhRugVVdG8vT9sss9
	wjglkI2JR2fxqzYtMrKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWbf2-006KfN-1G;
	Thu, 17 Aug 2023 11:59:32 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWbew-006KeT-1y
	for linux-mtd@lists.infradead.org;
	Thu, 17 Aug 2023 11:59:29 +0000
Received: from kwepemm600014.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RRNmY3J0WzrSG4;
	Thu, 17 Aug 2023 19:57:49 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.175.28) by
 kwepemm600014.china.huawei.com (7.193.23.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 17 Aug 2023 19:59:11 +0800
From: Yi Yang <yiyang13@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<David.Woodhouse@intel.com>, <vireshk@kernel.org>
CC: <martin.blumenstingl@googlemail.com>, <robh@kernel.org>,
	<jernej.skrabec@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: rawnand: fsmc: handle clk prepare error in fsmc_nand_resume()
Date: Thu, 17 Aug 2023 19:58:39 +0800
Message-ID: <20230817115839.10192-1-yiyang13@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.175.28]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_045926_905063_E93AC52C 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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

In fsmc_nand_resume(), the return value of clk_prepare_enable() should be
checked since it might fail.

Fixes: e25da1c07dfb ("mtd: fsmc_nand: Add clk_{un}prepare() support")
Signed-off-by: Yi Yang <yiyang13@huawei.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index 7b4742420dfc..2e33ae77502a 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -1200,9 +1200,14 @@ static int fsmc_nand_suspend(struct device *dev)
 static int fsmc_nand_resume(struct device *dev)
 {
 	struct fsmc_nand_data *host = dev_get_drvdata(dev);
+	int ret;
 
 	if (host) {
-		clk_prepare_enable(host->clk);
+		ret = clk_prepare_enable(host->clk);
+		if (ret) {
+			dev_err(dev, "failed to enable clk\n");
+			return ret;
+		}
 		if (host->dev_timings)
 			fsmc_nand_setup(host, host->dev_timings);
 		nand_reset(&host->nand, 0);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
