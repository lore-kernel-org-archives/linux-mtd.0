Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5166BC388F9
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 10:51:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EED0C20739
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 10:51:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I38MwOkQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EED0C20739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qWXyKWmgrTe0FeKGDjFZH9CbzcVzh8ASqepA/BUcT3E=; b=I38MwOkQFHVnytwmb1y1d/P41W
	1gCNtSkoNvUC9FGIGl18dqvjZSV75xETkjkOPwH8aFuuwTJ5Gh0al/MSEffAye9MdSIlS6M7msRrX
	dxE4Ttsxrr5ZI9VN4f8936sshQ1GoHe031O3lbEsoXaD7uHmHLokSjjK+e0fYZ9X4O8CZodSEzmeD
	hWeGvlq0nhAsmM+RUT29mg42ZO4pxMLPfhupcUN0llRZyfGrBgKmvG4rwjprNd9ybBKsWcqliwq2l
	Q3k4FbE2xae6K9YpAqY56NVJB5w2Bdk9zsuoadazT94Kxajj240AEMCgXaRO5uECwHrOxyFs5K9z/
	kHTjzjHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYoTP-0002ie-Pz; Sat, 31 Oct 2020 10:51:03 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYoTJ-0002ht-90
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2020 10:50:58 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CNbZ06Wbvz6xFt;
 Sat, 31 Oct 2020 18:50:48 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Sat, 31 Oct 2020
 18:50:41 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <paul@crapouillou.net>, <harveyhuntnexus@gmail.com>,
 <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
Subject: [PATCH] mtd: rawnand: ingenic: remove redundant get_device() in
 ingenic_ecc_get()
Date: Sat, 31 Oct 2020 18:54:39 +0800
Message-ID: <20201031105439.2304211-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_065057_582907_084926FB 
X-CRM114-Status: UNSURE (   6.99  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: yukuai3@huawei.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, yi.zhang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

of_find_device_by_node() already takes a reference to the device, and
ingenic_ecc_release() will drop the reference. So, the get_device() in
ingenic_ecc_get() is redundand.

Fixes: 15de8c6efd0e("mtd: rawnand: ingenic: Separate top-level and SoC specific code")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/mtd/nand/raw/ingenic/ingenic_ecc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
index 8e22cd6ec71f..efe0ffe4f1ab 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_ecc.c
@@ -71,8 +71,6 @@ static struct ingenic_ecc *ingenic_ecc_get(struct device_node *np)
 	if (!pdev || !platform_get_drvdata(pdev))
 		return ERR_PTR(-EPROBE_DEFER);
 
-	get_device(&pdev->dev);
-
 	ecc = platform_get_drvdata(pdev);
 	clk_prepare_enable(ecc->clk);
 
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
