Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D472C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 09:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iycWCEpp0TQDzRmN2+wKPGHUx4ULU7kperVda5u4Itc=; b=mCbxVZpnKJo7rf
	PAG0dfJsxdUi0+pL+sArGfHx4a3o/g1yJXMHnVExpJ56TQSE6+xmD64GhCzVqTG2xuwxxBZ2KTtfH
	8ImcFbHTYBqPogQtEGy+mfrEhBCff1nsMkMDPYj4zywvz8JV3bJvF5F6JioQo1pZ3MyyFIMcjTS4e
	wFJXoBBMNgknIVMOJDSZ7UEKX7v3DornfdUdhQWwZu2qZ0kIXg6qUIi+O6SsQQb+dCvqdon1j+Ung
	xGTiflmMG5DotUV7W0PW0Y/nMl3RiK8raVuPv6wdgxPQGL+Gu7h4xWVzqvNlPw9IjLjCCeGgsTYhs
	16+HrfqAU2pwKNFngO0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVUS-00H6hn-Kg; Mon, 14 Nov 2022 09:10:52 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVPj-00H3Vy-7F
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 09:06:00 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N9k123C7PzHw2t;
	Mon, 14 Nov 2022 17:05:26 +0800 (CST)
Received: from kwepemm600005.china.huawei.com (7.193.23.191) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 17:05:52 +0800
Received: from ubuntu1804.huawei.com (10.67.175.30) by
 kwepemm600005.china.huawei.com (7.193.23.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 17:05:51 +0800
From: Hui Tang <tanghui20@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<u.kleine-koenig@pengutronix.de>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<weiyongjun1@huawei.com>, <yusongping@huawei.com>
Subject: [PATCH v2] mtd: lpddr2_nvm: Fix possible null-ptr-deref
Date: Mon, 14 Nov 2022 17:02:40 +0800
Message-ID: <20221114090240.244172-1-tanghui20@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.175.30]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600005.china.huawei.com (7.193.23.191)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_010559_459381_3734E889 
X-CRM114-Status: UNSURE (   8.30  )
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

It will cause null-ptr-deref when resource_size(add_range) invoked,
if platform_get_resource() returns NULL.

Fixes: 96ba9dd65788 ("mtd: lpddr: add driver for LPDDR2-NVM PCM memories")
Signed-off-by: Hui Tang <tanghui20@huawei.com>
---
v1 -> v2:
 - replace IS_ERR(add_range) with !add_range
 - fix commit subject format
---
 drivers/mtd/lpddr/lpddr2_nvm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/lpddr/lpddr2_nvm.c b/drivers/mtd/lpddr/lpddr2_nvm.c
index 367e2d906de0..e71af4c49096 100644
--- a/drivers/mtd/lpddr/lpddr2_nvm.c
+++ b/drivers/mtd/lpddr/lpddr2_nvm.c
@@ -433,6 +433,8 @@ static int lpddr2_nvm_probe(struct platform_device *pdev)
 
 	/* lpddr2_nvm address range */
 	add_range = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!add_range)
+		return -ENODEV;
 
 	/* Populate map_info data structure */
 	*map = (struct map_info) {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
