Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A39C982D0
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2026 10:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WAR1CNqOgj8dreHVbbavLZMRn5976aBfSkSu+sN6ma8=; b=XGIvSYC2qJ79Js
	dR2HgYzLu4P9AV4EY3dsMAH582PPHA4OKLaH6fDSC7o556lc6zEyVBuzZ74yACKAvfF/+twZiQa+V
	8s8yPtkCbFiXjP1WTOSVKLomwPsOEGhJUyidxwCvv/MpF371V64WEAZc1EAiZwodPN3hYt30J7uvN
	ezbqdmRBRWoQCqZV7jPRS+gUNunpkp+Ic/s9YGyjc7fi44E6Rw10AVcsUVsbCehO4PNk3w0HUXXCd
	6WtDkXNsvZZ/rCIkkpCfm5MBkpTUX7WOjyfZ7RqwHAe+MXnBTRc0HDGL5ewdVWHJkBXp786U/yOzm
	+DqZmmy1LFZfk2kw1eUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79Lg-0000000B6PJ-0yw4;
	Thu, 17 Sep 2026 10:28:12 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79La-0000000B6Nk-3mw7;
	Thu, 17 Sep 2026 10:28:10 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAAXgDq0wKtqR5x+CA--.63922S2;
	Thu, 17 Sep 2026 18:28:04 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: alexandre.belloni@bootlin.com
Cc: bbrezillon@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	nicolas.ferre@microchip.com,
	richard@nod.at,
	vigneshr@ti.com,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: atmel: Fix HSMC clock leak in legacy controller init
Date: Thu, 17 Sep 2026 10:28:04 +0000
Message-Id: <20260917102804.2146887-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAXgDq0wKtqR5x+CA--.63922S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJF47Aw1UXryxKFyfJFyrJFb_yoW5uFyxpF
	W7XFWxGw18XayfZFZrKa1UWF1FqFs7KFyDCwsxW34fZw4aqryqyF1rZFyFqFW5GFWfXw43
	Za17t3W8CFn5A3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPvb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxV
	W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0E0s8F02x267IIx4CEVc8vx2IErcIFxwAC
	I402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrw
	CF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtV
	W8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r4UJVWxJr1lIxAIcVC2z280aVCY1x0267AKxVW0oVCq3bIYCTnIWIevJa73UjIFyTuY
	vjxUqdHjUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBggNA2qrq3ZOXQABsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_032809_558165_6DF8121B 
X-CRM114-Status: UNSURE (   8.59  )
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

atmel_hsmc_nand_controller_legacy_init() takes a reference to the
HSMC clock with of_clk_get() and enables it, but the error paths
that follow only release the device node, so both the reference and
the enable are leaked whenever the controller cannot be fully
initialized.  The probe fails in that case and never reaches
atmel_hsmc_nand_controller_remove(), which is where the clock is
normally disabled and put.

Add an err_disable_clk path that disables and releases the clock
before jumping to the existing out path.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 25 +++++++++++++-------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index e7fdf532c5fe..87d9227f6ecc 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -2184,6 +2184,7 @@ atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
 	if (ret) {
 		dev_err(dev, "Failed to enable the HSMC clock (err = %d)\n",
 			ret);
+		clk_put(nc->clk);
 		goto out;
 	}
 
@@ -2193,20 +2194,20 @@ atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "Failed to get IRQ number (err = %d)\n",
 				ret);
-		goto out;
+		goto err_disable_clk;
 	}
 
 	ret = of_address_to_resource(nfc_np, 0, &res);
 	if (ret) {
 		dev_err(dev, "Invalid or missing NFC IO resource (err = %d)\n",
 			ret);
-		goto out;
+		goto err_disable_clk;
 	}
 
 	iomem = devm_ioremap_resource(dev, &res);
 	if (IS_ERR(iomem)) {
 		ret = PTR_ERR(iomem);
-		goto out;
+		goto err_disable_clk;
 	}
 
 	regmap_conf.name = "nfc-io";
@@ -2216,20 +2217,20 @@ atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
 		ret = PTR_ERR(nc->io);
 		dev_err(dev, "Could not create NFC IO regmap (err = %d)\n",
 			ret);
-		goto out;
+		goto err_disable_clk;
 	}
 
 	ret = of_address_to_resource(nfc_np, 1, &res);
 	if (ret) {
 		dev_err(dev, "Invalid or missing HSMC resource (err = %d)\n",
 			ret);
-		goto out;
+		goto err_disable_clk;
 	}
 
 	iomem = devm_ioremap_resource(dev, &res);
 	if (IS_ERR(iomem)) {
 		ret = PTR_ERR(iomem);
-		goto out;
+		goto err_disable_clk;
 	}
 
 	regmap_conf.name = "smc";
@@ -2239,20 +2240,20 @@ atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
 		ret = PTR_ERR(nc->base.smc);
 		dev_err(dev, "Could not create NFC IO regmap (err = %d)\n",
 			ret);
-		goto out;
+		goto err_disable_clk;
 	}
 
 	ret = of_address_to_resource(nfc_np, 2, &res);
 	if (ret) {
 		dev_err(dev, "Invalid or missing SRAM resource (err = %d)\n",
 			ret);
-		goto out;
+		goto err_disable_clk;
 	}
 
 	nc->sram.virt = devm_ioremap_resource(dev, &res);
 	if (IS_ERR(nc->sram.virt)) {
 		ret = PTR_ERR(nc->sram.virt);
-		goto out;
+		goto err_disable_clk;
 	}
 
 	nc->sram.dma = res.start;
@@ -2261,6 +2262,12 @@ atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
 	of_node_put(nfc_np);
 
 	return ret;
+
+err_disable_clk:
+	clk_disable_unprepare(nc->clk);
+	clk_put(nc->clk);
+
+	goto out;
 }
 
 static int
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
