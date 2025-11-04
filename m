Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A95ACCFA03
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Nov 2025 01:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fJXrRZn47RGuvFg/cOvM3c+EkWvCO0InTQJRU/GX+yQ=; b=F2vRE0SjK9L1ij
	qujZze+Veh50OtjM1MWjI9Pw0AZXW7Dl88A1V51PhBCXDYdHAW/by+xELNrhZVCIkXrPmXfG74nxu
	da+I+W6+VNlUKkJx0UE0xpKH8YHNd/+gRcLW/zaL4tCJc+hNmUioLVBnExw0l1G1X/RAc2MPGuNBg
	sjg0WDv03/avScqXNBR19slVrf+ipVKi8l2o9z18Xa8l8dkz4NmFeFSYVebzv0og18OSIy7SG6tLn
	S667jGfeJTUXfj772ryEafmRGaF4wtsO3sMFRemH4hd378owTBodmMVMBMT5n8jG63PgSMYOfeZ3H
	Ocd6gM8NCVNKn8rXcBqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG63F-0000000AwWe-3HgM;
	Tue, 04 Nov 2025 01:41:37 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG63C-0000000AwVW-0h4x;
	Tue, 04 Nov 2025 01:41:35 +0000
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAA3pfPIWQlpa4FbAQ--.16754S2;
	Tue, 04 Nov 2025 09:41:29 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com
Cc: linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH v2] mtd: rawnand: lpc32xx_slc: fix GPIO descriptor leak
Date: Tue,  4 Nov 2025 09:40:42 +0800
Message-ID: <20251104014042.1389-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20251028094747.1089-1-vulab@iscas.ac.cn>
References: <20251028094747.1089-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAA3pfPIWQlpa4FbAQ--.16754S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFWfZw1xXrW5Zw18Zw4fXwb_yoW8GrWUpa
	yUAFWjkr1DCr429FsFga18AF1Fka10yrWUKryjg34Y9wn8ZrWUtas5Kr15ZF12kFZ5GF4Y
	vF4kJw1rCrykZw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUtVW8ZwCY02Avz4vE14v_KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnU
	UI43ZEXa7VU1xu4UUUUUU==
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwsQA2kJRL9QgwAAsX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_174134_569750_345452A0 
X-CRM114-Status: GOOD (  12.82  )
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

The driver calls gpiod_get_optional() in the probe function but
never calls gpiod_put() in the remove function or in the probe
error path. This leads to a GPIO descriptor resource leak.
The lpc32xx_mlc.c driver in the same directory handles this
correctly by calling gpiod_put() on both paths.

Switch to devm_gpiod_get_optional() to automatically manage
GPIO descriptor resource.

Fixes: 6b923db2867c ("mtd: rawnand: lpc32xx_slc: switch to using gpiod API")
Suggested by: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

---
Changes in v2:
 -Switch to devm_gpiod_get_optional()
---
 drivers/mtd/nand/raw/lpc32xx_slc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index b54d76547ffb..3ca30e7dce33 100644
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
-- 
2.50.1.windows.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
