Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63300C32771
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Sep 2022 08:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rnGEKNcgmAAxXkT1mjr/on2DK+HYozJK1+7WP8q3qfg=; b=fcrIjfG5Ehk/pc
	/XJAhijFggLc/2rPnQ/Lai+mdK3BnB7NpEUVTMF7Xq48RmQ8aj4FoBWKIN8M2ewWLWx/556lbmSz5
	VqKhD/zBl8NJ9KMRZnOuiezi6aUc6xz9dZAEYKgCYZRoraqJ8KCKVOU7x8QXlGXExMCOWpUAah7Hh
	z7ZpnK/Pnf+j518TijIFvnN7CoIp0298JFrF8z8hzFqcQWDJoFJuqWLGlP/faBdqYAuJqOuEPB6kw
	z2OjzROI8rt8xu31i76klOua3OqXtJDgns8luu1HN7g7CnQelswCgrZNZ0yklnU3H6xpNqo20DpP8
	alW/xVFFquzbx5oidjng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocjgK-003Gal-NZ; Mon, 26 Sep 2022 08:41:40 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocjgH-003GUr-Dp
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2022 08:41:39 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MbbjJ4WxMzWhB0;
	Mon, 26 Sep 2022 16:37:24 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 16:41:26 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 16:41:25 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <stefan@agner.ch>, <dev@lynxeye.de>, <miquel.raynal@bootlin.com>,
	<vigneshr@ti.com>
CC: <richard@nod.at>, <linux-tegra@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
Subject: [PATCH -next] mtd: rawnand: Fix PM disable depth imbalance in tegra_nand_probe
Date: Mon, 26 Sep 2022 16:44:56 +0800
Message-ID: <20220926084456.98160-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_014137_677435_0F466C10 
X-CRM114-Status: UNSURE (   8.62  )
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

The pm_runtime_enable will increase power disable depth. Thus
a pairing decrement is needed on the error handling path to
keep it balanced according to context.

Fixes:d7d9f8ec77fe9 ("mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/mtd/nand/raw/tegra_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index e12f9f580a15..a9b9031ce616 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1181,7 +1181,7 @@ static int tegra_nand_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 	err = pm_runtime_resume_and_get(&pdev->dev);
 	if (err)
-		return err;
+		goto err_dis_pm;
 
 	err = reset_control_reset(rst);
 	if (err) {
@@ -1215,6 +1215,8 @@ static int tegra_nand_probe(struct platform_device *pdev)
 err_put_pm:
 	pm_runtime_put_sync_suspend(ctrl->dev);
 	pm_runtime_force_suspend(ctrl->dev);
+err_dis_pm:
+	pm_runtime_disable(&pdev->dev);
 	return err;
 }
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
