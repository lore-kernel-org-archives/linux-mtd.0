Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1D4CCF9E3
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Nov 2025 10:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HvsdpYupNQbkybvhpnIrb9jSM33+RsykClNf8VxSILY=; b=adXQRudT8+Mm7J
	rTaKQpTNluTjNWAf7dSCR4MkAtG9Y9COadfSEm7NBXv0DDhA38zAIZ7D85xix4nqbVHveJjI9Rjss
	Q5zdhnFfz0j1Plu3Q6GEPustQY3AVMvA7gly8typkhxr3+wQn5KkEMb2+Mq48sEAfNW/FzbpbAhJy
	21HJ0T6xg1vlWXshSru53lc7dZATfwkHvE1kDzid7u3b4fa86FxKHqcBdhnrMTis/gkBGtawXtcPX
	ta+KOP35lGMx9ZqGuph2vCKrAEWTOivcJpu4TkFMJY9lYgR57VkFFziY5j7T8EhKUrFbLcSTUMqh5
	xQNvPlOSkWdFla5xwNyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGE0q-0000000Baa4-2wMP;
	Tue, 04 Nov 2025 10:11:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGE0p-0000000BaZS-0Eri;
	Tue, 04 Nov 2025 10:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=rN5ODJt8gRZPVAZI+k9gdjZVtwbWhw5xcB2Zk2D7cHE=; b=eCbLQzREsNTExVUsczDS0yaJji
	8jm0RZQrBmx2dN38nVun2uezWF8xqcvi34nHY/4r0F5q02SVXcJb94GTeTUoaeorh3B7q9ptq1zC9
	Lxe/PAyVJhy26LJkZmXdxlWgrzmk5PFdgeazWN2Dnjvt8dDTAClB1sc6LL0QiSuiSEX5YCSguydl7
	ILMzU9oMA+WV73tPmvhG5Uq5rxQCyvoXB/xtYU8Pxhq75CHH8n3brqeqTmynGK/mMjXf10FyWXcZI
	CrZDpb2M1rE5eweR85S7rzeCjVrI+RL7sw3g3Xh/gn8kX5MXXce4LBlxz157N5Ta33dWcpoFNm5x4
	8FZ8E5JA==;
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGD92-0000000HMD8-2s7K;
	Tue, 04 Nov 2025 09:16:07 +0000
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowAAnpOst0QlpydtqAQ--.17454S2;
	Tue, 04 Nov 2025 18:10:55 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] mtd: rawnand: lpc32xx_slc: Convert to use devm_gpiod_get_optional()
Date: Tue,  4 Nov 2025 18:08:41 +0800
Message-ID: <20251104100842.369-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAAnpOst0QlpydtqAQ--.17454S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr4rGr18GFyUKw1kXw48Crg_yoW8XFWDpa
	ykAFWIkrWUCF4xKanrWa1kZF1Yy3y0yrWUGrW0934F9w1DXr1jqas5KF1FvFn0yFWrGF4Y
	vFZ7tF1rAw18Zr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	tVW8ZwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfU5FApDUUUU
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgoQA2kJpV+0fgAAsP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_091605_194703_32184537 
X-CRM114-Status: GOOD (  10.38  )
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

The initial fix for a GPIO descriptor leak added manual gpiod_put()
calls in the error path and remove function.

This follow-up patch improves upon the fix by switching to the
resource-managed devm_gpiod_get_optional() API.

Suggested-by: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/mtd/nand/raw/lpc32xx_slc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index fea3705a2138..3ca30e7dce33 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -854,7 +854,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Start with WP disabled, if available */
-	host->wp_gpio = gpiod_get_optional(&pdev->dev, NULL, GPIOD_OUT_LOW);
+	host->wp_gpio = devm_gpiod_get_optional(&pdev->dev, NULL, GPIOD_OUT_LOW);
 	res = PTR_ERR_OR_ZERO(host->wp_gpio);
 	if (res) {
 		if (res != -EPROBE_DEFER)
@@ -937,7 +937,6 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	dma_release_channel(host->dma_chan);
 enable_wp:
 	lpc32xx_wp_enable(host);
-	gpiod_put(host->wp_gpio);
 
 	return res;
 }
@@ -963,7 +962,6 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 	writel(tmp, SLC_CTRL(host->io_base));
 
 	lpc32xx_wp_enable(host);
-	gpiod_put(host->wp_gpio);
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)
-- 
2.50.1.windows.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
