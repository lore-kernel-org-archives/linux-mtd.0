Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D72C432BE
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 07:43:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4211160249
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 07:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4211160249
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cmacc3VcsDNpkwQklYRTARmQHABOtp1PFuAU+aaFTSI=; b=SBWuSjmq+oTs0v
	5S5OGoKvo6minNawF3+PqYegikam8Kl7wHwZ1yXK08/SZ/Iwn3sSDp2bmsE2w/ZrdSjmDsZKX0Jl9
	7l7y1VSg1mGzFRrZKhEFZpzKOjiUgwZSv9EPBTHo0/q8mxieomexSudK00R7r8qQExH4vP1v4DiHc
	teDny/Eq9bOkp1OKMtQ0/4TC5lAhj73GtzkpX49ntYUlnB9OkB3AMuOOXTxc/CJeCIYdiGOSSwgyn
	X+g0LLXWO6sa8xoT/HvcMnfAj0x9vWswyT+4gnfBuoHt5mxw8BeruNlL0T+oaC97U2jzWGlN+PdGF
	vaNP5sCNLuBDMTtSMOwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLKtZ-004NDe-2j; Wed, 01 Sep 2021 07:42:53 +0000
Received: from mx20.baidu.com ([111.202.115.85] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLKsM-004MZc-3s
 for linux-mtd@lists.infradead.org; Wed, 01 Sep 2021 07:41:39 +0000
Received: from BJHW-Mail-Ex10.internal.baidu.com (unknown [10.127.64.33])
 by Forcepoint Email with ESMTPS id 2874DA8FAD28FD120ABC;
 Wed,  1 Sep 2021 15:41:37 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex10.internal.baidu.com (10.127.64.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 15:41:36 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 15:41:36 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: rawnand: gpmi: Make use of the helper function
 devm_platform_ioremap_resource_byname()
Date: Wed, 1 Sep 2021 15:41:30 +0800
Message-ID: <20210901074130.9083-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex07.internal.baidu.com (10.127.64.17) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex10_2021-09-01 15:41:37:111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_004138_398508_A3CC6FD5 
X-CRM114-Status: UNSURE (   9.68  )
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

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 4d08e4ab5c1b..10cc71829dcb 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -951,11 +951,9 @@ static int acquire_register_block(struct gpmi_nand_data *this,
 {
 	struct platform_device *pdev = this->pdev;
 	struct resources *res = &this->resources;
-	struct resource *r;
 	void __iomem *p;
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res_name);
-	p = devm_ioremap_resource(&pdev->dev, r);
+	p = devm_platform_ioremap_resource_byname(pdev, res_name);
 	if (IS_ERR(p))
 		return PTR_ERR(p);
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
