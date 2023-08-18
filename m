Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F87FC05052
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 07:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OoD8zI5CFocdWSBfkS1WVDdBjGdP+5rN7mGglJVCPao=; b=3I13ZKXrYbsATo
	VSUu8jsmbv+iNprzqWE0XGfFZUHQFSDDVu+9GgbULWbGRVvXPxeyTMw8GOlWaGFbKtLiLeo1iEetX
	sqDN8HaYnfcWn3ZaZ2raU4pZYderCYY3rLI40oy4YKZN2af3y0dBG0BLVXdP42mxsrVehQJVhKKuX
	FFv9TSIy1KpcNHLp9HUOxdJmDCPCduh+Cgj/kbRdUKtFhohyb6sjPFOzzrh2R9XHH0zblsAw2Ujl9
	ZJYUybt1dUspRZ4tdSwts45RELeAJO4J/eWi+KrzgCgvP7QlA3J+IFfJjintkyEM/1PJuZaBxbEbT
	rLehuuV+uzwSwR09Onvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuDf-007uz3-2X;
	Fri, 18 Aug 2023 07:48:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuCs-007uNJ-0D;
	Fri, 18 Aug 2023 07:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9zOIP5LXTj4VfqCIwpyGb6b7MLo4e+yDkPQPWOQuUE4=; b=rHZecND4G2CsJJsLaMOZDvRnP9
	Gg/2jKBtIWDr6xKq/AlsE0pCDhsh+SisIGbVW148iS1ZN7nriRHg7oEJVsitvbrOt9F67DF5GiqwP
	d+NDNmbSKl4AVF3yu7FoOjDdDnGEJqfJrA00v74uWvXn6tFKVyz6lsJ3jmRCgH5uYoLzhtFaNGe9O
	n9JmMsx7GKhYNYnb05J5xTvpA9IUsa1ATndJ7Dn90Cf9BHyMg7JWgSWsniDb+qEgMbLIMB+zoPvH+
	XvKrS8GZXU8dkZlt0BYAxCfydScYlJBCLUXGHIctA/+OVa5PlYondwDM6vae5xsVgej2RHOlDsK8X
	z8S9/wLA==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuCi-00FL7s-1A;
	Fri, 18 Aug 2023 07:47:41 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RRv7R3zzrzkX6J;
	Fri, 18 Aug 2023 15:45:55 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 15:47:17 +0800
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
Subject: [PATCH -next v2 12/12] mtd: rawnand: orion: Use helper function devm_clk_get_optional_enabled()
Date: Fri, 18 Aug 2023 15:46:42 +0800
Message-ID: <20230818074642.308166-13-lizetao1@huawei.com>
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
X-CRM114-CacheID: sfid-20230818_084738_688267_D87B07C0 
X-CRM114-Status: GOOD (  11.42  )
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
and enabled clocks"), devm_clk_get_optional() and clk_prepare_enable() can
now be replaced by devm_clk_get_optional_enabled() when driver enable
(and possibly prepare) the clocks for the whole lifetime of the device.
Moreover, it is no longer necessary to unprepare and disable the clock
explicitly, so drop the label "no_dev".

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: This is a new patch.

 drivers/mtd/nand/raw/orion_nand.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 7e0313889b50..2951d81614fd 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -169,16 +169,10 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, info);
 
 	/* Not all platforms can gate the clock, so it is optional. */
-	info->clk = devm_clk_get_optional(&pdev->dev, NULL);
+	info->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
 	if (IS_ERR(info->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(info->clk),
-				     "failed to get clock!\n");
-
-	ret = clk_prepare_enable(info->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to prepare clock!\n");
-		return ret;
-	}
+				     "failed to get and enable clock!\n");
 
 	/*
 	 * This driver assumes that the default ECC engine should be TYPE_SOFT.
@@ -189,19 +183,13 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 
 	ret = nand_scan(nc, 1);
 	if (ret)
-		goto no_dev;
+		return ret;
 
 	mtd->name = "orion_nand";
 	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
-	if (ret) {
+	if (ret)
 		nand_cleanup(nc);
-		goto no_dev;
-	}
-
-	return 0;
 
-no_dev:
-	clk_disable_unprepare(info->clk);
 	return ret;
 }
 
@@ -215,8 +203,6 @@ static void orion_nand_remove(struct platform_device *pdev)
 	WARN_ON(ret);
 
 	nand_cleanup(chip);
-
-	clk_disable_unprepare(info->clk);
 }
 
 #ifdef CONFIG_OF
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
