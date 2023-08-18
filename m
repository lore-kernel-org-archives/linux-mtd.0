Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F4CC7112B
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 07:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oLHaFiUdDoGXp8IVK1TyLea2iDRizjyxz95d/ib1/64=; b=NOsJWiwfoR3c9D
	Ss8ODqr5NOGutuaJNGHCbrGuBibYOUxlzKtg62u7ar+jvyXXsgNWvlT8Sy2WAMHNdDliW21Ro4STk
	wS7+ObV5DRPdSFy+Mjtqj5U+P1vCaIZnNqlnCpt75k9j+5xwtL4xHPQ1VIfLsY7sGdetpRIYNpPPX
	4CIxrnaGdd05q3yaYUsZ9ompZRJiLSnRAZac/Ll23y3w4cTG5528vQ/Ug3J1i3PnXwzQ2TKpHvjQE
	O5vUIf9aKovK8TtuiMswuz2s3OqdrKH/jZvTc0EPRvA5Sie+nABwCK4u7S9ISxweYKlfKON2sy04R
	SK6ZMcH5Q2pILgiTstCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuDI-007uil-2w;
	Fri, 18 Aug 2023 07:48:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuCm-007uJf-0L;
	Fri, 18 Aug 2023 07:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HdIvU7Oc2oK1GWsMPOnsk7Vz7Bvz8/jKnHa+Z54F2ZI=; b=FyjtLvQ7r4/17rpDxEjBt9WV/2
	+xQxogkW75nAPb8uyg/+/42ywzitCAdmA+NNP0TfRlo7m5gqWHlcAicpKR+i5G/OAUU5UCbW90bqX
	mpM6sTWcwJnKvMD/PC3R7Y3whD4OhpE97iWWu+c8fhEOa7VuQ96FNAu1kCiAjZ72zFVNJHqmzMXv3
	eDKQK6dbi3k0f2pt1/9Atc677XRUimV5hOgYPqjMWD+5OXC+F0VB61SPaXbtBgllsDqv4aqpUCWMG
	29Xgzc25iFyCuHaqx1lUYEBs6pE7H53PzpkKk9NYhRCnENQJqsxZ5+QRivNBpEGdtG/kF71MdUX6q
	eMOt4H3Q==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWuCg-00FL7k-36;
	Fri, 18 Aug 2023 07:47:34 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RRv4w3dvpzNmyb;
	Fri, 18 Aug 2023 15:43:44 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 15:47:15 +0800
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
Subject: [PATCH -next v2 10/12] mtd: rawnand: vf610_nfc: Use helper function devm_clk_get_enabled()
Date: Fri, 18 Aug 2023 15:46:40 +0800
Message-ID: <20230818074642.308166-11-lizetao1@huawei.com>
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
X-CRM114-CacheID: sfid-20230818_084731_944219_2417DEA2 
X-CRM114-Status: GOOD (  11.16  )
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
no longer necessary to unprepare and disable the clock explicitly, so
drop the label "err_disable_clk".

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Modify commit message.
v1: https://lore.kernel.org/all/20230817024509.3951629-11-lizetao1@huawei.com/

 drivers/mtd/nand/raw/vf610_nfc.c | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index dcdf33dbaef2..1ce9d5c2b1f7 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -834,21 +834,15 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	if (IS_ERR(nfc->regs))
 		return PTR_ERR(nfc->regs);
 
-	nfc->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(nfc->clk))
+	nfc->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(nfc->clk)) {
+		dev_err(nfc->dev, "Unable to get and enable clock!\n");
 		return PTR_ERR(nfc->clk);
-
-	err = clk_prepare_enable(nfc->clk);
-	if (err) {
-		dev_err(nfc->dev, "Unable to enable clock!\n");
-		return err;
 	}
 
 	of_id = of_match_device(vf610_nfc_dt_ids, &pdev->dev);
-	if (!of_id) {
-		err = -ENODEV;
-		goto err_disable_clk;
-	}
+	if (!of_id)
+		return -ENODEV;
 
 	nfc->variant = (enum vf610_nfc_variant)of_id->data;
 
@@ -858,9 +852,8 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 			if (nand_get_flash_node(chip)) {
 				dev_err(nfc->dev,
 					"Only one NAND chip supported!\n");
-				err = -EINVAL;
 				of_node_put(child);
-				goto err_disable_clk;
+				return -EINVAL;
 			}
 
 			nand_set_flash_node(chip, child);
@@ -869,8 +862,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	if (!nand_get_flash_node(chip)) {
 		dev_err(nfc->dev, "NAND chip sub-node missing!\n");
-		err = -ENODEV;
-		goto err_disable_clk;
+		return -ENODEV;
 	}
 
 	chip->options |= NAND_NO_SUBPAGE_WRITE;
@@ -880,7 +872,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	err = devm_request_irq(nfc->dev, irq, vf610_nfc_irq, 0, DRV_NAME, nfc);
 	if (err) {
 		dev_err(nfc->dev, "Error requesting IRQ!\n");
-		goto err_disable_clk;
+		return err;
 	}
 
 	vf610_nfc_preinit_controller(nfc);
@@ -892,7 +884,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	/* Scan the NAND chip */
 	err = nand_scan(chip, 1);
 	if (err)
-		goto err_disable_clk;
+		return err;
 
 	platform_set_drvdata(pdev, nfc);
 
@@ -904,8 +896,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 err_cleanup_nand:
 	nand_cleanup(chip);
-err_disable_clk:
-	clk_disable_unprepare(nfc->clk);
 	return err;
 }
 
@@ -918,7 +908,6 @@ static void vf610_nfc_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 	nand_cleanup(chip);
-	clk_disable_unprepare(nfc->clk);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
