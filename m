Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1D1C19F2D
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Aug 2022 06:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vsKgp/3JhiedOsxCEFPBz6my20Of8KOEL4aDWyBGcLw=; b=O71rPcOQEFEeTo
	OKx4Kj8+pxiR1ZgyBdmpacPAuedJWTDGIGzWzvUgo1a5Wyg9yzz/8+oNd2jX94wlR0jpeXBVFImgx
	WxTKCfIaq62isrkO0yvqY5fLB+/c6NItMYgDeABc0lGewIbIA8KTj8ekDetGRUKJXAc4L7rXEfbbH
	idwmTPtVWL902QkJjRO2waRoZWgZLZN89rtfdZUbeXr+Sf7X2UrgueEjWjIpAIGNEbeeF53IrXTJS
	jveyQeZgFEp/9FBEsp4Hi/5moxbE0pObL3h1lI44U3BdDGzCeBwHiXuOvNESnRpFd05VpzDtaxSsM
	HT5P7+bYjR07/nQtquBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLJ8v-0028ps-CU; Tue, 09 Aug 2022 06:55:09 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLJ8c-0028aH-6o
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2022 06:55:04 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4M23dV0PqZzlVqJ;
	Tue,  9 Aug 2022 14:51:42 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 9 Aug 2022 14:54:33 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 9 Aug
 2022 14:54:32 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<s.hauer@pengutronix.de>, <arne.edholm@axis.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH] ubi: fastmap: Fix missed fm_anchor PEB in wear-leveling after disabling fastmap
Date: Tue, 9 Aug 2022 15:06:19 +0800
Message-ID: <20220809070619.1565447-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_235450_504727_0B405991 
X-CRM114-Status: GOOD (  10.01  )
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

After disabling fastmap(ubi->fm_disabled = 1), fastmap won't be updated,
fm_anchor PEB is missed being scheduled for erasing. Besides, fm_anchor
PEB may have smallest erase count, it doesn't participate wear-leveling.
The difference of erase count between fm_anchor PEB and other PEBs will
be larger and larger later on.

In which situation fastmap can be disabled? Initially, we have an UBI
image with fastmap. Then the image will be atttached without module
parameter 'fm_autoconvert', ubi turns to full scanning mode in one
random attaching process(eg. bad fastmap caused by powercut), ubi
fastmap is disabled since then.

Fix it by not getting fm_anchor if fastmap is disabled in
ubi_refill_pools().

Fetch a reproducer in [Link].

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216341
Fixes: 4b68bf9a69d22d ("ubi: Select fastmap anchor PEBs considering ...")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/fastmap-wl.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 0ee452275578..863f571f1adb 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -146,13 +146,15 @@ void ubi_refill_pools(struct ubi_device *ubi)
 	if (ubi->fm_anchor) {
 		wl_tree_add(ubi->fm_anchor, &ubi->free);
 		ubi->free_count++;
+		ubi->fm_anchor = NULL;
 	}
 
-	/*
-	 * All available PEBs are in ubi->free, now is the time to get
-	 * the best anchor PEBs.
-	 */
-	ubi->fm_anchor = ubi_wl_get_fm_peb(ubi, 1);
+	if (!ubi->fm_disabled)
+		/*
+		 * All available PEBs are in ubi->free, now is the time to get
+		 * the best anchor PEBs.
+		 */
+		ubi->fm_anchor = ubi_wl_get_fm_peb(ubi, 1);
 
 	for (;;) {
 		enough = 0;
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
