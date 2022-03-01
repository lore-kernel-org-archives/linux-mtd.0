Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C42C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 04:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wbu8rjsFRkmZ2L3EHCA8kcNEWTU/nQ9i6zwdFIsHHLA=; b=i0pNFb62ZCDENm
	uQkaEtmoDQSXYZDluKXHN35YrW6L7f5sDkFb9NRNkUupx5Z8T4TF6P/uGqSv9QZEMpup7Oq1sX2AM
	2j4TSFi5kKE+d5xKNpY/jFqnEja+uimSiIAv1Cbk1Ly5aCzpyWgjuWnp/PFDugGFVbJ+3WPCz3IP/
	L6Xb4d2ShWDIf2AjFStuWMSfIx4Zw8IUzzfF/QxBrJ0nOBhQREjd/T6hZTd2hiBw2w5Bi/WXDEz9y
	xKHgcFJIeXexeo1OrsmUSlZtq2H+nPJEdnm+3paoXgIPFzE9hHb5tBwYgPV2O42VQ0MpwFJmfEtIr
	OGi7pqvG5szaBiS0QgOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOuQC-00EvLN-FB; Tue, 01 Mar 2022 04:47:36 +0000
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net ([165.227.154.27])
 by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOuQ8-00EvKc-7l; Tue, 01 Mar 2022 04:47:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fudan.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id:MIME-Version:Content-Transfer-Encoding; bh=ppwzFXj+7J
 +K1wSH/RgnQeHvxCuLOmmZ/u/ya/sUCTs=; b=bABrMRZ8+Phni4YOPA+qDurRTr
 0bTUc+ZBAoalLXeC5dtdwlQRAtGHhrhES+iR7/V16bmR030oFSkZuyYwKCxag9VF
 FJSspEmdzWgEoBYrw6WbcpEJSvqfc3mSnxVxOLf7IoL/GFk4cWGL8SkwM0KGodvg
 MfPyB5pZQ6RCbzLzk=
Received: from localhost.localdomain (unknown [10.222.220.36])
 by app1 (Coremail) with SMTP id XAUFCgA34rk4pR1iQ0koCQ--.25183S4;
 Tue, 01 Mar 2022 12:46:54 +0800 (CST)
From: Xin Xiong <xiongx18@fudan.edu.cn>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: yuanxzhang@fudan.edu.cn, Xin Xiong <xiongx18@fudan.edu.cn>,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>, Xin Tan <tanxin.ctf@gmail.com>
Subject: [PATCH v2] mtd: rawnand: atmel: fix refcount issue in
 atmel_nand_controller_init
Date: Tue,  1 Mar 2022 12:45:56 +0800
Message-Id: <20220301044556.36162-1-xiongx18@fudan.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: XAUFCgA34rk4pR1iQ0koCQ--.25183S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw47ZF4DGrW7uF4rZw47urg_yoW8trykpF
 WUtay3ZFWUtFs3ZF12kayxuF1rZ3WkJFyUG39Fqa4xZ3ZxX34jkw1Yqry0qFy8CFyfuF1U
 ZF42q3WUCF1UCFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
 648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
 C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
 wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
 vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
 0xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
 v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOrcfUUUUU
X-CM-SenderInfo: arytiiqsuqiimz6i3vldqovvfxof0/1tbiAg0LEFKp2j3PtgABsw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_204732_844307_21425857 
X-CRM114-Status: GOOD (  11.32  )
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

The reference counting issue happens in several error handling paths
on a refcounted object "nc->dmac". In these paths, the function simply
returns the error code, forgetting to balance the reference count of
"nc->dmac", increased earlier by dma_request_channel(), which may
cause refcount leaks.

Fix it by decrementing the refcount of specific object in those error
paths.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Co-developed-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Co-developed-by: Xin Tan <tanxin.ctf@gmail.com>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
Signed-off-by: Xin Xiong <xiongx18@fudan.edu.cn>
---
V1 -> V2: Rewrited the error handling block
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index f3276ee9e4fe..0efeb5d77be0 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -2060,13 +2060,15 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
 	nc->mck = of_clk_get(dev->parent->of_node, 0);
 	if (IS_ERR(nc->mck)) {
 		dev_err(dev, "Failed to retrieve MCK clk\n");
-		return PTR_ERR(nc->mck);
+		ret = PTR_ERR(nc->mck);
+		goto out_release_dma;
 	}
 
 	np = of_parse_phandle(dev->parent->of_node, "atmel,smc", 0);
 	if (!np) {
 		dev_err(dev, "Missing or invalid atmel,smc property\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out_release_dma;
 	}
 
 	nc->smc = syscon_node_to_regmap(np);
@@ -2074,10 +2076,20 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
 	if (IS_ERR(nc->smc)) {
 		ret = PTR_ERR(nc->smc);
 		dev_err(dev, "Could not get SMC regmap (err = %d)\n", ret);
-		return ret;
+		goto out_release_dma;
 	}
 
 	return 0;
+
+out_release_dma:
+	if (nc->caps->has_dma && !atmel_nand_avoid_dma) {
+		if (nc->dmac) {
+			dma_release_channel(nc->dmac);
+			nc->dmac = NULL;
+		}
+	}
+
+	return ret;
 }
 
 static int
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
