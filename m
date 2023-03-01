Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17403C7EE2D
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Mar 2023 12:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IXgnbsi32g+xQ+clDRRTr2X1Lg7R8B9gjdqnwPC2mu8=; b=dZUz78mOodaadD
	Dk0vGIDSl1uXiLYMdi23zx50Rf4SkQS3gNhGUxGKzmr8WsAAmMLgCtkGvzDm4+2JA9vN/t3sluk6h
	3+T/327HiGPYeRWUfuGHcT2NpMCxHSDd85bOxkPo/QN1QZ7xLaqD959n//4bJW3V9ADwD0Yb8ayN6
	VlouEdr67suWhlsn2rGu/5N0DCwKY2uAcOKU39AQX/gdUg/lTy4D6EdjnTTpdhpuR/aQsmeF5Jy/T
	tjr7DvBR2YbMcBwuJfE74VvZGpJmsHcBK+rbb8Y7HG/MP6qa/cJXjL9K7HGZ4rCBtNVgLEVyGPtOu
	iEh8bkffwC/3LNdyl3LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXLDx-00G37G-V5; Wed, 01 Mar 2023 12:06:21 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXLDv-00G35L-13
	for linux-mtd@lists.infradead.org; Wed, 01 Mar 2023 12:06:21 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4PRXv00sPBz16NxP;
	Wed,  1 Mar 2023 20:03:24 +0800 (CST)
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 1 Mar
 2023 20:06:02 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <s.hauer@pengutronix.de>, <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>
Subject: [PATCH -next 1/2] Revert "ubifs: dirty_cow_znode: Fix memleak in error handling path"
Date: Wed, 1 Mar 2023 20:29:18 +0800
Message-ID: <20230301122919.266818-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230301122919.266818-1-chengzhihao1@huawei.com>
References: <20230301122919.266818-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_040619_313979_9FE7525F 
X-CRM114-Status: GOOD (  10.07  )
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

This reverts commit 122deabfe1428 (ubifs: dirty_cow_znode: Fix memleak
in error handling path).
After commit 122deabfe1428 applied, if insert_old_idx() failed, old
index neither exists in TNC nor in old-index tree. Which means that
old index node could be overwritten in layout_leb_in_gaps(), then
ubifs image will be corrupted in power-cut.

Fixes: 122deabfe1428 (ubifs: dirty_cow_znode: Fix memleak ... path)
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/tnc.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 2469f72eeaab..2df56bbc6865 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -267,18 +267,11 @@ static struct ubifs_znode *dirty_cow_znode(struct ubifs_info *c,
 	if (zbr->len) {
 		err = insert_old_idx(c, zbr->lnum, zbr->offs);
 		if (unlikely(err))
-			/*
-			 * Obsolete znodes will be freed by tnc_destroy_cnext()
-			 * or free_obsolete_znodes(), copied up znodes should
-			 * be added back to tnc and freed by
-			 * ubifs_destroy_tnc_subtree().
-			 */
-			goto out;
+			return ERR_PTR(err);
 		err = add_idx_dirt(c, zbr->lnum, zbr->len);
 	} else
 		err = 0;
 
-out:
 	zbr->znode = zn;
 	zbr->lnum = 0;
 	zbr->offs = 0;
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
