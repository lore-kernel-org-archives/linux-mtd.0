Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6932C001DE
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 07:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E26+4xR66PViOVsZ6S4sg+8zIalyXejZnRs0dyX1Ryg=; b=FMnMO3BC7sEbMW
	If8iUDhyY9yrUHQjGxAB/0ueBJU1nRYcObowcgkVkDMjByGyRGlbf4AesojD2cpTMog+dSDOcL9eP
	b/W1Z/EDbBeSqzo+NVNwYZQMTjPwd4ijxRcb4JnIOz5v5//IgfBE8aTWDvZZvwVbGUX+9iWw6XbxC
	59OpBbExblQVw5RnZmV6T7Nu9hUqfPis8E63cdl2Lkqf2779E+d3WTIBi9caGUPC27h/86wFIKcmp
	D6t+LtAefWiNiubadBv2qgDiwN1GrwKQhqtN3cDQ/FE8etUEn2TiMwSRwH9p1QdvNAeEvu/zOfqff
	4I53Qr8+71UETgoTQF0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuCc-007uHd-1E;
	Fri, 18 Aug 2023 07:47:26 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuCS-007uCN-0B;
	Fri, 18 Aug 2023 07:47:19 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RRv4j52spzNmrs;
	Fri, 18 Aug 2023 15:43:33 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 15:47:04 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <lizetao1@huawei.com>
CC: <alexandre.torgue@foss.st.com>, <angelogioacchino.delregno@collabora.com>,
	<christophe.kerello@foss.st.com>, <christophe.leroy@csgroup.eu>,
	<dmitry.torokhov@gmail.com>, <frank.li@vivo.com>, <geert+renesas@glider.be>,
	<heiko@sntech.de>, <jernej.skrabec@gmail.com>, <jinpu.wang@ionos.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-sunxi@lists.linux.dev>, <martin.blumenstingl@googlemail.com>,
	<matthias.bgg@gmail.com>, <mcoquelin.stm32@gmail.com>, <michael@walle.cc>,
	<michal.simek@amd.com>, <miquel.raynal@bootlin.com>,
	<nicolas.ferre@microchip.com>, <paul@crapouillou.net>, <philmd@linaro.org>,
	<pratyush@kernel.org>, <richard@nod.at>, <robh@kernel.org>,
	<rogerq@kernel.org>, <samuel@sholland.org>, <stefan@agner.ch>,
	<tudor.ambarus@linaro.org>, <u.kleine-koenig@pengutronix.de>,
	<vigneshr@ti.com>, <vz@mleia.com>, <wens@csie.org>,
	<yangyingliang@huawei.com>
Subject: [PATCH -next v2 01/12] mtd: spear_smi: Use helper function devm_clk_get_enabled()
Date: Fri, 18 Aug 2023 15:46:31 +0800
Message-ID: <20230818074642.308166-2-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818074642.308166-1-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
 <20230818074642.308166-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_004716_619877_981DA0BF 
X-CRM114-Status: UNSURE (   9.63  )
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

Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
replaced by devm_clk_get_enabled() when driver enable (and possibly
prepare) the clocks for the whole lifetime of the device. Moreover, it is
no longer necessary to unprepare and disable the clock explicitly, so drop
the label "err_irq".

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Modify commit message.
v1: https://lore.kernel.org/all/20230817024509.3951629-2-lizetao1@huawei.com/

 drivers/mtd/devices/spear_smi.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index 93bca5225116..0a35e5236ae5 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -993,21 +993,17 @@ static int spear_smi_probe(struct platform_device *pdev)
 		dev->num_flashes = MAX_NUM_FLASH_CHIP;
 	}
 
-	dev->clk = devm_clk_get(&pdev->dev, NULL);
+	dev->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(dev->clk)) {
 		ret = PTR_ERR(dev->clk);
 		goto err;
 	}
 
-	ret = clk_prepare_enable(dev->clk);
-	if (ret)
-		goto err;
-
 	ret = devm_request_irq(&pdev->dev, irq, spear_smi_int_handler, 0,
 			       pdev->name, dev);
 	if (ret) {
 		dev_err(&dev->pdev->dev, "SMI IRQ allocation failed\n");
-		goto err_irq;
+		goto err;
 	}
 
 	mutex_init(&dev->lock);
@@ -1020,14 +1016,11 @@ static int spear_smi_probe(struct platform_device *pdev)
 		ret = spear_smi_setup_banks(pdev, i, pdata->np[i]);
 		if (ret) {
 			dev_err(&dev->pdev->dev, "bank setup failed\n");
-			goto err_irq;
+			goto err;
 		}
 	}
 
 	return 0;
-
-err_irq:
-	clk_disable_unprepare(dev->clk);
 err:
 	return ret;
 }
@@ -1056,8 +1049,6 @@ static int spear_smi_remove(struct platform_device *pdev)
 		WARN_ON(mtd_device_unregister(&flash->mtd));
 	}
 
-	clk_disable_unprepare(dev->clk);
-
 	return 0;
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
