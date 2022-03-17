Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A59C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Mar 2022 11:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jfaDAh94MKYIn923UXYQV3Gco4/MnIG8lMZORvZ9a+A=; b=wtA8WV662WCUAz
	D3WFSKZQMJdasKPFKdk/G5RKyCoHllMYPVzWMGUiKhm9T46agZss9GqySzMWQqqQ39/W+ppOeiEqU
	iGC++RGA5UIPy6SoRpjfIv0//nhKll6YN98I64QtgkWJCV+woEAxZYfnlu40Xz5RYor78YyoDqxZ9
	dSmLNk0fuP3yOcze/jleJ8+ZXMFdvnj8kJv86Ch831BAQzNzp3yi1o1UodZ80/S3AU84qqGhqjKFE
	AuLJpbQW/sOVIOaN4QfDOIsNA15YQI63BqIfzdi733I1YzQxgsKoBRJkx3UTNrLksUAhzXpe1k3dG
	MsVNy37ey53Z+st/v/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUoVD-00FqN2-Or; Thu, 17 Mar 2022 11:41:11 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUoVB-00FqLH-32
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2022 11:41:10 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KK4tS5V6GzfZ8C;
 Thu, 17 Mar 2022 19:39:28 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 17 Mar 2022 19:40:57 +0800
Received: from ubuntu1804.huawei.com (10.67.174.152) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 17 Mar 2022 19:40:57 +0800
From: Wang Weiyang <wangweiyang2@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <paul@crapouillou.net>
CC: <wangweiyang2@huawei.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] mtd: rawnand: davinci: Remove redundant unsigned
 comparison to zero
Date: Thu, 17 Mar 2022 19:39:07 +0800
Message-ID: <20220317113907.96006-1-wangweiyang2@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.152]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_044109_330776_EA80F1F2 
X-CRM114-Status: UNSURE (   9.56  )
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

Since core_chipsel is uint32_t, comparison to zero is redundant

Signed-off-by: Wang Weiyang <wangweiyang2@huawei.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 45fec8c192ab..3e98e3c255bf 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -727,7 +727,7 @@ static int nand_davinci_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	/* which external chipselect will we be managing? */
-	if (pdata->core_chipsel < 0 || pdata->core_chipsel > 3)
+	if (pdata->core_chipsel > 3)
 		return -ENODEV;
 
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
