Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C276AC5321D
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 09:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uRT07KdmUQc+5EQrfLbdBhWJv3UPe1G/tdzfpP/Ld1A=; b=uHpzescIiRDYE6
	6fdNmxUNDjg/DtsDJ4SMmkhucb0ASd5cyemSvuvgDr1kIlzi/OtBmpDClF8/B14zvm5mdxJouErQN
	zB//jFCnSMluOwx/uiTAbbFhQntmVZzU07vtKsHxH2R+vr4Vi0j1AOevnbq80lJ7uFpzgUHFZnWMM
	t0GpQheX1hsDgmBXWHMTU0Y+mC6vf36YMRAh/YNx+c/S3K1sINap7PJmu9f4bEeR7Zun7sztOdrpa
	CHqbPA1LqDsYed5l+KYiT6/sPDxT3ySL3iTwNh+4jQpizbjLogcKuDpIe6SYA+eyWIDU2Ny3cF/vV
	Dwok+oqwhjRpuvxVV3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siVaG-00000006aQW-2hc9;
	Mon, 26 Aug 2024 09:00:20 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siUaQ-00000006Lqz-2cyi
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 07:56:28 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WsjYH4HlYz20mg2;
	Mon, 26 Aug 2024 15:51:31 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 97E4F140120;
	Mon, 26 Aug 2024 15:56:18 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 26 Aug
 2024 15:56:18 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next] mtd: rawnand: denali: Use the devm_clk_get_enabled() helper function
Date: Mon, 26 Aug 2024 16:04:08 +0800
Message-ID: <20240826080408.2522978-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_005626_945756_9EE823D5 
X-CRM114-Status: GOOD (  11.02  )
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

The devm_clk_get_enabled() helper:
  - calls devm_clk_get()
  - calls clk_prepare_enable() and registers what is needed in order to
    call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/mtd/nand/raw/denali_dt.c | 29 ++++-------------------------
 1 file changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index edac8749bb93..2f5666511fda 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -145,15 +145,15 @@ static int denali_dt_probe(struct platform_device *pdev)
 	if (IS_ERR(denali->host))
 		return PTR_ERR(denali->host);
 
-	dt->clk = devm_clk_get(dev, "nand");
+	dt->clk = devm_clk_get_enabled(dev, "nand");
 	if (IS_ERR(dt->clk))
 		return PTR_ERR(dt->clk);
 
-	dt->clk_x = devm_clk_get(dev, "nand_x");
+	dt->clk_x = devm_clk_get_enabled(dev, "nand_x");
 	if (IS_ERR(dt->clk_x))
 		return PTR_ERR(dt->clk_x);
 
-	dt->clk_ecc = devm_clk_get(dev, "ecc");
+	dt->clk_ecc = devm_clk_get_enabled(dev, "ecc");
 	if (IS_ERR(dt->clk_ecc))
 		return PTR_ERR(dt->clk_ecc);
 
@@ -165,18 +165,6 @@ static int denali_dt_probe(struct platform_device *pdev)
 	if (IS_ERR(dt->rst_reg))
 		return PTR_ERR(dt->rst_reg);
 
-	ret = clk_prepare_enable(dt->clk);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(dt->clk_x);
-	if (ret)
-		goto out_disable_clk;
-
-	ret = clk_prepare_enable(dt->clk_ecc);
-	if (ret)
-		goto out_disable_clk_x;
-
 	denali->clk_rate = clk_get_rate(dt->clk);
 	denali->clk_x_rate = clk_get_rate(dt->clk_x);
 
@@ -187,7 +175,7 @@ static int denali_dt_probe(struct platform_device *pdev)
 	 */
 	ret = reset_control_deassert(dt->rst_reg);
 	if (ret)
-		goto out_disable_clk_ecc;
+		return ret;
 
 	ret = reset_control_deassert(dt->rst);
 	if (ret)
@@ -222,12 +210,6 @@ static int denali_dt_probe(struct platform_device *pdev)
 	reset_control_assert(dt->rst);
 out_assert_rst_reg:
 	reset_control_assert(dt->rst_reg);
-out_disable_clk_ecc:
-	clk_disable_unprepare(dt->clk_ecc);
-out_disable_clk_x:
-	clk_disable_unprepare(dt->clk_x);
-out_disable_clk:
-	clk_disable_unprepare(dt->clk);
 
 	return ret;
 }
@@ -239,9 +221,6 @@ static void denali_dt_remove(struct platform_device *pdev)
 	denali_remove(&dt->controller);
 	reset_control_assert(dt->rst);
 	reset_control_assert(dt->rst_reg);
-	clk_disable_unprepare(dt->clk_ecc);
-	clk_disable_unprepare(dt->clk_x);
-	clk_disable_unprepare(dt->clk);
 }
 
 static struct platform_driver denali_dt_driver = {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
