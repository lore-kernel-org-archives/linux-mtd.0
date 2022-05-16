Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75CEC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 16 May 2022 09:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RZm08sWQkp6Po6Xg0CYzYodyeJQrW+Vddoge6s+cTi8=; b=I18y2KGe36u8R+
	b4UCcr9bm7QJWlK5tFZA+EvYUzwRUI3gaOPshJhtXTXLQrjyXEbF0ia/lwsDVEHaa9/ie1ggCTdKt
	TtXOo2RzGQmVI7CJXxk8fVD6s890yhUfSkkaQ48hePcNF/mq3q6PFnuVX+gcHnZlrznQgBrqiuA4i
	jhLJ+Vq1e9fiml1zgGTMuu3APHiPImOYKuw49CbXlMuKA8BETEAe+DBYQVHusaGPExBfjjGClmePL
	Prj99pAqNxCFJNNTADl/kERmBJYoVkjfyMCyVxVR2/fjSOrUL/+dSMZv5bcpKgWBmLrpAIQI6pwAY
	BZJmLx1Cvb80eJXS7hBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqWrk-006rar-QT; Mon, 16 May 2022 09:18:12 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqWrh-006rYh-N6
 for linux-mtd@lists.infradead.org; Mon, 16 May 2022 09:18:11 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L1ttS5rqxzhZJc;
 Mon, 16 May 2022 17:17:04 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 16 May 2022 17:17:51 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 16 May
 2022 17:17:50 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: [PATCH -next v2] mtd: st_spi_fsm: add missing clk_disable_unprepare()
 in stfsm_remove()
Date: Mon, 16 May 2022 17:29:11 +0800
Message-ID: <20220516092911.953066-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_021809_955372_ACB5F249 
X-CRM114-Status: UNSURE (   8.07  )
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

Clock source is prepared and enabled by clk_prepare_enable()
in probe function, but not disabled or unprepared in remove
function.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
v2:
  make the commit message and title more proper.
---
 drivers/mtd/devices/st_spi_fsm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 983999c020d6..d3377b10fc0f 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -2126,6 +2126,8 @@ static int stfsm_remove(struct platform_device *pdev)
 {
 	struct stfsm *fsm = platform_get_drvdata(pdev);
 
+	clk_disable_unprepare(fsm->clk);
+
 	return mtd_device_unregister(&fsm->mtd);
 }
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
