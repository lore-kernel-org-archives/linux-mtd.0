Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B820EE49A4
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Aug 2023 03:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CdJHBOEcB8k2UgmF19rxQ+PZO6+wLiXNap4eW12ePHs=; b=2Mn+Tb0svdUcKu
	bRGfazCzGtCF0I7au9oJqiyiAWw/Fyx+BqyRcOUBByBak8AsMTEI322NT40U/WwoPaf1ED80qcN3Q
	+Bc37DFFZl6O43BRazi0qrVrGrbMXs09Zpm8+tHA3NOURoddS8tBvHsXUDumNFFot6zYoqbuUWKse
	BlbMOFYhQj1krXOQfbopgAdydvQL+2pjNcDyRwl9Y0yW0yy75pnzS9K3x1tO/4NGUWw/0NLn4OTxq
	0dcXyKVui/zoudXUkHHUgGcvPs2qSmGw71vOameu25ggNMDLSlTTOAOCUJalfdmcl2QHVJWRrgrTJ
	ceUOTOzVj3PjMoeKoLHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXvRD-00Cwu8-22;
	Mon, 21 Aug 2023 03:18:43 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXvQf-00CwVE-0d;
	Mon, 21 Aug 2023 03:18:12 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RTd0S64RfzVk92;
	Mon, 21 Aug 2023 11:15:52 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 21 Aug
 2023 11:18:04 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <miquel.raynal@bootlin.com>
CC: <alexandre.torgue@foss.st.com>, <angelogioacchino.delregno@collabora.com>,
	<christophe.kerello@foss.st.com>, <christophe.leroy@csgroup.eu>,
	<dmitry.torokhov@gmail.com>, <frank.li@vivo.com>, <geert+renesas@glider.be>,
	<heiko@sntech.de>, <jernej.skrabec@gmail.com>, <jinpu.wang@ionos.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-sunxi@lists.linux.dev>, <lizetao1@huawei.com>,
	<martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
	<mcoquelin.stm32@gmail.com>, <michael@walle.cc>, <michal.simek@amd.com>,
	<paul@crapouillou.net>, <philmd@linaro.org>, <pratyush@kernel.org>,
	<richard@nod.at>, <robh@kernel.org>, <rogerq@kernel.org>,
	<samuel@sholland.org>, <stefan@agner.ch>, <tudor.ambarus@linaro.org>,
	<u.kleine-koenig@pengutronix.de>, <vigneshr@ti.com>, <vz@mleia.com>,
	<wens@csie.org>, <yangyingliang@huawei.com>
Subject: [PATCH -next v3 10/12] mtd: rawnand: vf610_nfc: Use helper function devm_clk_get_enabled()
Date: Mon, 21 Aug 2023 11:17:35 +0800
Message-ID: <20230821031737.1973183-11-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821031737.1973183-1-lizetao1@huawei.com>
References: <20230818101004.4f2cd343@xps-13>
 <20230821031737.1973183-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230820_201809_626968_109EDED2 
X-CRM114-Status: GOOD (  11.47  )
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
replaced by devm_clk_get_enabled() when driver enables (and possibly
prepares) the clocks for the whole lifetime of the device. Moreover, it is
no longer necessary to unprepare and disable the clocks explicitly, so drop
the label "err_disable_clk".

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v2 -> v3: Modify the syntax error in the commit message.
v2: https://lore.kernel.org/all/20230818074642.308166-11-lizetao1@huawei.com/
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
