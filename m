Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2C8C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Dec 2021 03:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gikW1s+wzp1Sg7oqaaVvfLpchXurlhfgimdZrHfR+FQ=; b=mx1ygW0EYPwSqJ
	Qpgd+VPtzMpMDKbziOPNpCFsjYneiBISaV0Po0oRReK3286oBwtvW7cS8oAJZL3q4xsHVK9TGJE8E
	QTMULCqM0PYtT9H/5ieI1KPUK2RavXshJOwt1AOV2ijMV4oGzM4iMeyVS/b/0LI4FATeZxKjaxFNe
	35amFMewDWQUvNcOjph9W2V+lazOTxYco68xM3O40ZGo3dVOI4kNjJdkwkvcLvoq/2v8i0xtTNZ3h
	7MVoW6JVd+sko4p37C3/1e7b6R7WTf06jN6RM+Dpeyi2tRCtBWgqP8WN8ZzH1R/8sJ0epG23Sbuhi
	lWyD04MpngVo0TBg4O4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1gTq-00G4zu-L6; Mon, 27 Dec 2021 03:15:22 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1gQm-00G3yg-JO
 for linux-mtd@lists.infradead.org; Mon, 27 Dec 2021 03:12:17 +0000
Received: from kwepemi100008.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JMjL90GKjzZdql;
 Mon, 27 Dec 2021 11:08:49 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi100008.china.huawei.com (7.221.188.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 27 Dec 2021 11:12:03 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 27 Dec
 2021 11:12:02 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <kirill.shutemov@linux.intel.com>,
 <s.hauer@pengutronix.de>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 03/15] ubifs: Fix wrong number of inodes locked by ui_mutex
 in ubifs_inode comment
Date: Mon, 27 Dec 2021 11:22:34 +0800
Message-ID: <20211227032246.2886878-4-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211227032246.2886878-1-chengzhihao1@huawei.com>
References: <20211227032246.2886878-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_191212_847514_FB97EC68 
X-CRM114-Status: GOOD (  10.44  )
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

Since 9ec64962afb1702f75b("ubifs: Implement RENAME_EXCHANGE") and
9e0a1fff8db56eaaebb("ubifs: Implement RENAME_WHITEOUT") are applied,
ubifs_rename locks and changes 4 ubifs inodes, correct the comment
for ui_mutex in ubifs_inode.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/ubifs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index c38066ce9ab0..972e41daff01 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -372,7 +372,7 @@ struct ubifs_gced_idx_leb {
  * @ui_mutex exists for two main reasons. At first it prevents inodes from
  * being written back while UBIFS changing them, being in the middle of an VFS
  * operation. This way UBIFS makes sure the inode fields are consistent. For
- * example, in 'ubifs_rename()' we change 3 inodes simultaneously, and
+ * example, in 'ubifs_rename()' we change 4 inodes simultaneously, and
  * write-back must not write any of them before we have finished.
  *
  * The second reason is budgeting - UBIFS has to budget all operations. If an
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
