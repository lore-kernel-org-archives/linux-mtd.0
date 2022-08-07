Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48287C19F2A
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Aug 2022 21:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S/Nq6DbMae7Jp5TJd2/haGClGs7mcRplK5YCIVuxIIY=; b=4pTl9msH4Laej2
	NNV4wSuu0ixwLrSovEHcsxJy+eLTl8LDASQX7yUiizQKDbjzMs7NUUZbIiYZBErZpAiTwX+bIivuT
	FMx7jrL1hEPCsftmWAIhDa3+yzLc3wYgB6bZuD3SXYiK1UzLDyYJ9OKqzqbartpUVrEyF6Ugkwb/A
	zyEeir3kOMcyUNDgi7Pscwa66lKQjR0/hni+KQvoDelRujvwKhzPsQ5rR9B5WFl63kVEHp5R82evi
	tKOcI0r/VTB5odkw0TWHswIEy0YEKmG9UweGHTKZ5QH/B/nKUzFMhs8BnFxlgVPrUbfzpEqzggmUg
	/Vc/3o5YSl72Pfo8HszQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKnhv-002ont-Gg; Sun, 07 Aug 2022 21:21:11 +0000
Received: from smtp02.smtpout.orange.fr ([80.12.242.124] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKnhm-002oUH-Kz
	for linux-mtd@lists.infradead.org; Sun, 07 Aug 2022 21:21:07 +0000
Received: from pop-os.home ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id KnhdoqJG19qatKnhdouq0Z; Sun, 07 Aug 2022 23:20:58 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 07 Aug 2022 23:20:58 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: orion: Use devm_clk_get_optional()
Date: Sun,  7 Aug 2022 23:20:51 +0200
Message-Id: <a5bde48e3e1165dd65d1d1c1739e03ace1bef5d3.1659907229.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_142102_855260_56951770 
X-CRM114-Status: GOOD (  10.54  )
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

Use devm_clk_get_optional() instead of hand writing it.

While at it, use dev_err_probe() to further simplify the code. This is also
less verbose if clk_get() returns -EPROBE_DEFER.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mtd/nand/raw/orion_nand.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 2c87c7d89205..1bfecf502216 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -170,18 +170,11 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, info);
 
-	/* Not all platforms can gate the clock, so it is not
-	   an error if the clock does not exists. */
-	info->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(info->clk)) {
-		ret = PTR_ERR(info->clk);
-		if (ret == -ENOENT) {
-			info->clk = NULL;
-		} else {
-			dev_err(&pdev->dev, "failed to get clock!\n");
-			return ret;
-		}
-	}
+	/* Not all platforms can gate the clock, so it is optional. */
+	info->clk = devm_clk_get_optional(&pdev->dev, NULL);
+	if (IS_ERR(info->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(info->clk),
+				     "failed to get clock!\n");
 
 	ret = clk_prepare_enable(info->clk);
 	if (ret) {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
