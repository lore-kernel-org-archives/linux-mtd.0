Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C195CDB47E
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Oct 2023 09:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vm87B8C5dW6FkNnpzmWJ615fs21U28F8k9fdSfEkSec=; b=fJCIkaIBESOjDu
	X32srxpr7p1EevFnVqQ5NAEJLHFD7jMFH5l1tzozEE0EQ1M+iTebHssFMixfW66/v+2X1fa4Y98gg
	Lo/okT5DnG9t4X6onjIsTi2h6mJMZzDLtBYqZzmCl/klfnRmPwlwsazBYTvXSCd+VR5ZXblisPy+i
	C8/5SqOznD8P0WdIu6xOY5ND4Av13IlqbxJ725Lqu/UAYgeWqgSvs53wx16/r5UO3s1tD7hEcNPww
	vSsivppyAXINasvFtgwmqOM6thQl/JyrTZ4JaEbSTECICFi9Iqk3qPKgCZZMlRMNApXOwbj0sI3Y7
	9TOUP1J9uxBJBNf2/EVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt2p8-00EGu6-0Y;
	Wed, 18 Oct 2023 09:26:42 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt2p3-00EGsT-2W
	for linux-mtd@lists.infradead.org;
	Wed, 18 Oct 2023 09:26:40 +0000
Received: from kwepemm000014.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4S9QQ35ZgczrTbK;
	Wed, 18 Oct 2023 17:23:39 +0800 (CST)
Received: from huawei.com (10.67.174.78) by kwepemm000014.china.huawei.com
 (7.193.23.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 18 Oct
 2023 17:26:22 +0800
From: Yi Yang <yiyang13@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<martin.blumenstingl@googlemail.com>, <u.kleine-koenig@pengutronix.de>,
	<philmd@linaro.org>, <paul@crapouillou.net>,
	<vadivel.muruganx.ramuthevar@linux.intel.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: rawnand: intel: check return value of devm_kasprintf()
Date: Wed, 18 Oct 2023 09:25:13 +0000
Message-ID: <20231018092513.314971-1-yiyang13@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.78]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000014.china.huawei.com (7.193.23.6)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_022638_509640_93888237 
X-CRM114-Status: UNSURE (   9.79  )
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

The devm_kasprintf() returns a pointer to dynamically allocated memory.
that will return NULL when allocate failed.
Fix it by check return value of devm_kasprintf().

Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Signed-off-by: Yi Yang <yiyang13@huawei.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index cb5d88f42297..765d4c9424cd 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -619,6 +619,11 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	ebu_host->cs_num = cs;
 
 	resname = devm_kasprintf(dev, GFP_KERNEL, "nand_cs%d", cs);
+	if (resname) {
+		dev_err(dev, "Failed to allocate resname\n");
+		ret = -ENOMEM;
+		goto err_of_node_put;
+	}
 	ebu_host->cs[cs].chipaddr = devm_platform_ioremap_resource_byname(pdev,
 									  resname);
 	if (IS_ERR(ebu_host->cs[cs].chipaddr)) {
@@ -649,6 +654,11 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	}
 
 	resname = devm_kasprintf(dev, GFP_KERNEL, "addr_sel%d", cs);
+	if (resname) {
+		dev_err(dev, "Failed to allocate resname\n");
+		ret = -ENOMEM;
+		goto err_cleanup_dma;
+	}
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, resname);
 	if (!res) {
 		ret = -EINVAL;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
