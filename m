Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A43D606A834
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2026 10:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ozYMkKjQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=I+FPa/CrgFWT3ujji/WCxuXD+8cWVJbREizqdlxzo+I=; b=ozYMkKjQ7fxVgjowvSm9F+2qDq
	MTUcP3sWSkfQoZSKFQeHBw6NhLtnPPrCWhIVbPh2M4DKF4rLn5jXZ35gYy0Ztgde1Mdd8z4Aa6+Gx
	FFUiC+Oq7LOoid00Ro3b/bhBcTT4BaQytRDPgi8K4qNMkguGjN7+A0571CO8yO54PWED8lTnnzKrm
	ygUWh2FrtH7UUy27YJJdlEghiZNIa+7YCqlRNTXpkc2Jrun0qRTjhF1KB45x/DQBELWTOgDemxiVb
	aCvaPiIByOWzKMGWt1pHWri8m0LM9q7acWdLJE5sicEQE4ixLKi3LK4Nt5p2ucvt0JiZI/nrM2d4k
	ImMjjCeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBOy-00000001sTO-0gXW;
	Tue, 03 Nov 2026 10:06:00 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBOt-00000001sRa-3nzk;
	Tue, 03 Nov 2026 10:05:57 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAAnOJkBsulqf3w7AA--.2834S2;
	Tue, 03 Nov 2026 18:05:53 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: atmel: Release the HSMC clock on legacy init failure
Date: Tue,  3 Nov 2026 10:06:02 +0000
Message-Id: <20261103100602.1310416-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: rQCowAAnOJkBsulqf3w7AA--.2834S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuFy8uFy7GF17Cr1DWF47CFg_yoW5Zw4xpF
	W2qay7Gw1UXF4fuFsrKa1UJFyFqFZ7KayUCws3Ga42vw1FvryqqF1F9FyFqFW5GFWSvw43
	Xa17t3WUCFyrAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9a14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26F4UJVW0owAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6r
	yUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVWxJr0_Gc
	JvcSsGvfC2KfnxnUUI43ZEXa7VU8jQ6JUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAEAA2rpnOFgzgAAse
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_020556_572697_5D8F2612 
X-CRM114-Status: UNSURE (   8.13  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.9 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When atmel_hsmc_nand_controller_legacy_init() fails after acquiring the
NFC clock with of_clk_get(), the error paths return without dropping the
clock reference.  For failures after clk_prepare_enable(), the clock is
also left enabled.  The caller returns the error without running the
controller removal path, so the reference and the enable count are both
leaked.

Add error unwinding that disables the clock when it was prepared and
always puts the reference.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 26 ++++++++++++--------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 0bdbcbb50d94..f798ac7b9c51 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -2185,7 +2185,7 @@ atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
 	if (ret) {
 		dev_err(dev, "Failed to enable the HSMC clock (err = %d)\n",
 			ret);
-		goto out;
+		goto out_put_clk;
 	}
 
 	nc->irq = of_irq_get(nand_np, 0);
@@ -2194,20 +2194,20 @@ atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "Failed to get IRQ number (err = %d)\n",
 				ret);
-		goto out;
+		goto out_disable_clk;
 	}
 
 	ret = of_address_to_resource(nfc_np, 0, &res);
 	if (ret) {
 		dev_err(dev, "Invalid or missing NFC IO resource (err = %d)\n",
 			ret);
-		goto out;
+		goto out_disable_clk;
 	}
 
 	iomem = devm_ioremap_resource(dev, &res);
 	if (IS_ERR(iomem)) {
 		ret = PTR_ERR(iomem);
-		goto out;
+		goto out_disable_clk;
 	}
 
 	regmap_conf.name = "nfc-io";
@@ -2217,20 +2217,20 @@ atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
 		ret = PTR_ERR(nc->io);
 		dev_err(dev, "Could not create NFC IO regmap (err = %d)\n",
 			ret);
-		goto out;
+		goto out_disable_clk;
 	}
 
 	ret = of_address_to_resource(nfc_np, 1, &res);
 	if (ret) {
 		dev_err(dev, "Invalid or missing HSMC resource (err = %d)\n",
 			ret);
-		goto out;
+		goto out_disable_clk;
 	}
 
 	iomem = devm_ioremap_resource(dev, &res);
 	if (IS_ERR(iomem)) {
 		ret = PTR_ERR(iomem);
-		goto out;
+		goto out_disable_clk;
 	}
 
 	regmap_conf.name = "smc";
@@ -2240,24 +2240,30 @@ atmel_hsmc_nand_controller_legacy_init(struct atmel_hsmc_nand_controller *nc)
 		ret = PTR_ERR(nc->base.smc);
 		dev_err(dev, "Could not create NFC IO regmap (err = %d)\n",
 			ret);
-		goto out;
+		goto out_disable_clk;
 	}
 
 	ret = of_address_to_resource(nfc_np, 2, &res);
 	if (ret) {
 		dev_err(dev, "Invalid or missing SRAM resource (err = %d)\n",
 			ret);
-		goto out;
+		goto out_disable_clk;
 	}
 
 	nc->sram.virt = devm_ioremap_resource(dev, &res);
 	if (IS_ERR(nc->sram.virt)) {
 		ret = PTR_ERR(nc->sram.virt);
-		goto out;
+		goto out_disable_clk;
 	}
 
 	nc->sram.dma = res.start;
 
+	goto out;
+
+out_disable_clk:
+	clk_disable_unprepare(nc->clk);
+out_put_clk:
+	clk_put(nc->clk);
 out:
 	of_node_put(nfc_np);
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
