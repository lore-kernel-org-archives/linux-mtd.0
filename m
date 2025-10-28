Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A687CCD1BF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 09:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wmHe/tAlbCCBnmD4CTBpE2AhBp/Fvk86apo8/EqvsgU=; b=b1aWdFKQHebc4U
	Hl6roHVXmkSipObKswL3OtJgPe3f/91k7KlnbvAHZhkea8fZs0QgSnx3Dy4BovqYeRacf6cYXMxhY
	pJp+vlNnXmEQ6T0f+cu50MviwK3EoAoRikcJHOP3OL1JwCJp6VgdVuOHi9wqRSnZXhQET3q0znW3j
	MBIJ1TwuPb0wP3SfzC1PtROYHLc+dx09NF9/2FGFSxKsV/7iORsiCixtmutrKFXfwvHxfN6jp7MOA
	N38gqJ/gObC6iMsz7xnrEK0QHYOBC8beVnKEodfAlOexYmj5ahxxqOlpzSWRQlRoXCPpFT1ggLhz4
	W4kQ/p/VC7QGk7w+sAsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgJm-0000000FfPv-04aJ;
	Tue, 28 Oct 2025 09:48:42 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgJi-0000000FfPC-20rZ;
	Tue, 28 Oct 2025 09:48:41 +0000
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowACHZrlukQBpRIpCBA--.6967S2;
	Tue, 28 Oct 2025 17:48:32 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com
Cc: dmitry.torokhov@gmail.com,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] mtd: rawnand: lpc32xx_slc: fix GPIO descriptor leak on probe error and remove
Date: Tue, 28 Oct 2025 17:47:47 +0800
Message-ID: <20251028094747.1089-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowACHZrlukQBpRIpCBA--.6967S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFWfZw1xXrW5tryDCF47XFb_yoW8Gr45pa
	18ArWjkr4UCr47Kan2ka18AF1Fyw40yrWYqr92k34F93Z8AryUXF95XayYvF4DKFWrGF4a
	vFs7tF1rAr1DZr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjFfO7UUUUU==
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAgJA2kAjysG1gAAsT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_024838_885683_42569C3C 
X-CRM114-Status: UNSURE (   9.51  )
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

The driver calls gpiod_get_optional() in the probe function but
never calls gpiod_put() in the remove function or in the probe
error path. This leads to a GPIO descriptor resource leak.
The lpc32xx_mlc.c driver in the same directory handles this
correctly by calling gpiod_put() on both paths.

Add gpiod_put() in the remove function and in the probe error path
to fix the resource leak.

Fixes: 6b923db2867c ("mtd: rawnand: lpc32xx_slc: switch to using gpiod API")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/mtd/nand/raw/lpc32xx_slc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index b54d76547ffb..fea3705a2138 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -937,6 +937,7 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	dma_release_channel(host->dma_chan);
 enable_wp:
 	lpc32xx_wp_enable(host);
+	gpiod_put(host->wp_gpio);
 
 	return res;
 }
@@ -962,6 +963,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 	writel(tmp, SLC_CTRL(host->io_base));
 
 	lpc32xx_wp_enable(host);
+	gpiod_put(host->wp_gpio);
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)
-- 
2.50.1.windows.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
