Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE68CDB465
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Oct 2023 06:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4/Jy9W6M7bEaZ4wbpsPCoOVGp4UvllzewdzuFcAyzKk=; b=VoJEk8adWjnEfC
	rBNTZ4WUlsRq5pn2A7acRnq7YlOBqyKxPHAbF+OelRTR7jZCphPRpY1jWfso7XbMqmjHvZ3jhcxEJ
	zCjNHC3/8Hrn8ZHcppl/ndN5HoQR6gfyIdJr0Ywy6Mi4otWnu87+FObc6iKlSQip1BTCkLR7FudAQ
	8VtUHz0uLKnRMvxQ/y/FI2UkTTArPlQmhxIy4lObukIZiUOXDZX12aajPFwmqjDNoTHOBTs3BkMNa
	UoCGp5vxDynTdpUTlNIwIslTF42YORwAmuZmTyILj4yOAbyU6i7KjNag3zgS2HmrJuEz/52XHIaWp
	PtB+/DNrnkDL7jUlkFMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtMxy-00GXvP-1i;
	Thu, 19 Oct 2023 06:57:10 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtMxu-00GXsR-34
	for linux-mtd@lists.infradead.org;
	Thu, 19 Oct 2023 06:57:09 +0000
Received: from kwepemm000014.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4S9z0g0fcGzvPww;
	Thu, 19 Oct 2023 14:52:03 +0800 (CST)
Received: from huawei.com (10.67.174.78) by kwepemm000014.china.huawei.com
 (7.193.23.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 19 Oct
 2023 14:56:48 +0800
From: Yi Yang <yiyang13@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<martin.blumenstingl@googlemail.com>, <u.kleine-koenig@pengutronix.de>,
	<philmd@linaro.org>, <paul@crapouillou.net>,
	<vadivel.muruganx.ramuthevar@linux.intel.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3] mtd: rawnand: intel: check return value of devm_kasprintf()
Date: Thu, 19 Oct 2023 06:55:37 +0000
Message-ID: <20231019065537.318391-1-yiyang13@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.78]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm000014.china.huawei.com (7.193.23.6)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_235707_217039_E9DCA4C0 
X-CRM114-Status: GOOD (  10.00  )
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

devm_kasprintf() returns a pointer to dynamically allocated memory
which can be NULL upon failure. Ensure the allocation was successful by
checking the pointer validity.

Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Signed-off-by: Yi Yang <yiyang13@huawei.com>
---
v2:Change commit log, and fix error check code.
v3:No need for error messages upon memory allocation failures.
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index cb5d88f42297..f0ad2308f6d5 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -619,6 +619,11 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	ebu_host->cs_num = cs;
 
 	resname = devm_kasprintf(dev, GFP_KERNEL, "nand_cs%d", cs);
+	if (!resname) {
+		ret = -ENOMEM;
+		goto err_of_node_put;
+	}
+
 	ebu_host->cs[cs].chipaddr = devm_platform_ioremap_resource_byname(pdev,
 									  resname);
 	if (IS_ERR(ebu_host->cs[cs].chipaddr)) {
@@ -649,6 +654,11 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	}
 
 	resname = devm_kasprintf(dev, GFP_KERNEL, "addr_sel%d", cs);
+	if (!resname) {
+		ret = -ENOMEM;
+		goto err_cleanup_dma;
+	}
+
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, resname);
 	if (!res) {
 		ret = -EINVAL;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
