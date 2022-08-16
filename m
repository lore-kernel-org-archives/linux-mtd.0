Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB12C25B0E
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Aug 2022 14:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=orMOdUGcfyXthd/fmnqRIKDsDEgow3TOkEBMmL+Q2aM=; b=L7I9LYyvNdygRA
	4Lov4L3W875+oOiXTWWZgFvZ2vguiz66XLlgvCB/HSwlaad5GmMPrh3X+tF7uMyglj1OCD4kJuS/M
	mc11juQdUdMkashrwsNthjlCQB46i/Rgqp1RpIIAKwJNk8jsMRhLcJ4nMqBOHyLnOhBc0FXGUjzZB
	tnMMsyKtq6FbjzUIwCElZvFCpH99DLYLntzOzy4vJLnTPBJW851ihnhBmTMVVGF90w8m8zMA4o9r3
	iywVwkw41KXrnbPhrk7MteRK9b8qLAqOhss+khBp/yGDGPyhbZ0unbAY+uPWzC9GycwYCcjzec2eU
	q5V0zAdShz/jLiC64zhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNx6Q-0037bu-It; Tue, 16 Aug 2022 13:59:30 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNx6G-0037UX-Bf
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2022 13:59:28 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4M6Xlm0JDgzGpW8;
	Tue, 16 Aug 2022 21:57:40 +0800 (CST)
Received: from dggphis33418.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 16 Aug 2022 21:59:11 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<cuigaosheng1@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangweiyang2@huawei.com>
Subject: [PATCH -next] mtd: ftl: use container_of() rather than cast
Date: Tue, 16 Aug 2022 21:59:10 +0800
Message-ID: <20220816135910.268016-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_065920_667532_B4747A43 
X-CRM114-Status: UNSURE (   7.81  )
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

The container_of() is much more readable and also safer.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/mtd/ftl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index bec56070039d..7e56c77535e8 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -941,7 +941,7 @@ static int ftl_write(partition_t *part, caddr_t buffer,
 
 static int ftl_getgeo(struct mtd_blktrans_dev *dev, struct hd_geometry *geo)
 {
-	partition_t *part = (void *)dev;
+	partition_t *part = container_of(dev, struct partition_t, mbd);
 	u_long sect;
 
 	/* Sort of arbitrary: round size down to 4KiB boundary */
@@ -969,7 +969,7 @@ static int ftl_writesect(struct mtd_blktrans_dev *dev,
 static int ftl_discardsect(struct mtd_blktrans_dev *dev,
 			   unsigned long sector, unsigned nr_sects)
 {
-	partition_t *part = (void *)dev;
+	partition_t *part = container_of(dev, struct partition_t, mbd);
 	uint32_t bsize = 1 << part->header.EraseUnitSize;
 
 	pr_debug("FTL erase sector %ld for %d sectors\n",
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
