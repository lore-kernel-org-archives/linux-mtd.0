Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4CAC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 13 May 2022 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BCYUauhWWyF4LpfzWDMwMDS0QCbuaNeiuPJOkuftHaM=; b=HJZ7v+uAQAsL+S
	xMdkAYHRrJ0FjP5TO9efIm4b5oYhw/3Gv6+l598q8zDtb3z52ucK4T44Cx5NG7c53m3g4XvySoTD/
	smqIkIOdlabULkB6AKtmoht9b1axTGAoYFONoD95mt4xXh136EWVxR85LcOJx5mp8s/1AsiziiCq7
	U3LdxLvz8sOPMnYU81exfkx/8RFrnisiL/IzmZQhMU8OwqvmXOPXE9q2IjXk5x5PyYqfu89+sWM88
	GP8t/D8lpmPpiqdsoNo+OHxOcm8/1QtMiZMvfD+r3e2iiexufOp+e47FHyXLU1Zq8SpNlkzDKH9t/
	MpGDfyexsxSypLlC+9tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npRxy-00FRGQ-T2; Fri, 13 May 2022 09:52:10 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npRxv-00FRAe-AG
 for linux-mtd@lists.infradead.org; Fri, 13 May 2022 09:52:09 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4L03mg0k7pzfbMc;
 Fri, 13 May 2022 17:50:43 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 13 May 2022 17:51:58 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 13 May
 2022 17:51:57 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: [PATCH -next] mtd: st_spi_fsm: add missing clk_disable_unprepare()
 stfsm_remove()
Date: Fri, 13 May 2022 18:03:22 +0800
Message-ID: <20220513100322.2664431-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_025207_552652_47D65E9F 
X-CRM114-Status: UNSURE (   7.94  )
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
in probe function, but no disable or unprepare in remove function.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
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
