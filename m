Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0F3C43334
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 07:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XMu2zfSBnBKigaqTqpx+yiBVgkhqrwScA2a1xJhxgVI=; b=oRzolm1Ev2xgBc
	fjAFM3GLTBCVUn4TxCoYn/XxFGKfHN6btgELkV7MNELTxLcNF6WMQkndNcNyFgxgFv8wiQoADkTOZ
	gzA7A7zRghLPSDukbZhfoKzn7AAOy/9LHHGmBPOUVWPLrhVV4AiZc/GJGq8gk2j7MTspCOzrfZ5tI
	yJV/S7/pNTuUNUiTWqowjlulj7A8TuuktWq8kmw1fYyQw4NnGe/iKG8Dr5Elqsdua/VZYRBQVpEvX
	MkQeXUr8Uro1wf7NU28E/JKzaeXxvDpAfJW6bY865+MI0/MUI2mORjMPE3pE+3r+P9AEYHxMMB6o0
	w081nO/ti+9riC/JGq0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCFTt-004ojg-9v; Fri, 15 Jul 2022 07:11:21 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCFTq-004oeG-KF
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2022 07:11:20 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LkjDK08K1zFpxR;
	Fri, 15 Jul 2022 15:10:08 +0800 (CST)
Received: from dggphis33418.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 15 Jul 2022 15:11:06 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <cuigaosheng1@huawei.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<gongruiqi1@huawei.com>, <wangweiyang2@huawei.com>
Subject: [PATCH -next] mtd/ftl: Fix memleak in ftl_add_mtd()
Date: Fri, 15 Jul 2022 15:11:05 +0800
Message-ID: <20220715071105.2321311-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_001118_858283_AA0AA0CC 
X-CRM114-Status: UNSURE (   6.52  )
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

When add_mtd_blktrans_dev failed, partition's memory will be freed
by kfree, but there are some structure members that are allocated
for memory independently, such as partition->VirtualBlockMap,
partition->EUNInfo, partition->ZferInfo, and partition->bam_cache,
so kfree(partition) may cause memory leaks, using ftl_freepart(partition)
will fix it.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/mtd/ftl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index f655d2905270..200271bdc7aa 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -1031,6 +1031,7 @@ static void ftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 		partition->mbd.devnum = -1;
 		if (!add_mtd_blktrans_dev(&partition->mbd))
 			return;
+		ftl_freepart(partition);
 	}
 
 	kfree(partition);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
