Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FEDC433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Dec 2021 10:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5SELwFxgSvAkEaOMA4yPfOgELLNTCmZIAOoDg0VqsHM=; b=ECvhpprb/1f7Qh
	RXzCuLJfSU7G9QnJahG+88A3SvR5hgauE0zz/MymqhmIKHtslDRTy8WWcbnE3P9WDfxL4fFD12Tjd
	BUmme6AFUrn62xpRAMnXpdUXBFk4WyAIG5KXolSO9HFJGTArSguqEv+uKzkBpQ/uA9eoUbGSWimRH
	1QEDDM4fgCxy97sbhydOjQ/0F5WOJvGHT1m4VWyzR59G6pUksvK7bH6h8oVFTAsZ4VQuxBqC+8NRq
	maFuDIHiz46aND54WDbTTpv8bTF0aA9dpZMZq5uwk3yFo/oVSka5haoHwpz+t6WeMKw8k3FZwv1g1
	mVBaC2V1a6quLj/w0Q+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myWst-00DVci-WF; Sat, 18 Dec 2021 10:24:12 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myWsQ-00DVPA-CM
 for linux-mtd@lists.infradead.org; Sat, 18 Dec 2021 10:23:44 +0000
Received: from kwepemi500007.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JGMMN5vZDz8vtm;
 Sat, 18 Dec 2021 18:21:20 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi500007.china.huawei.com (7.221.188.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 18 Dec 2021 18:23:36 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Sat, 18 Dec
 2021 18:23:36 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <kirill.shutemov@linux.intel.com>,
 <Artem.Bityutskiy@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>
Subject: [PATCH v4 04/13] ubifs: Add missing iput if do_tmpfile() failed in
 rename whiteout
Date: Sat, 18 Dec 2021 18:35:03 +0800
Message-ID: <20211218103512.370420-5-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211218103512.370420-1-chengzhihao1@huawei.com>
References: <20211218103512.370420-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_022342_622715_071AEE11 
X-CRM114-Status: UNSURE (   7.02  )
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

whiteout inode should be put when do_tmpfile() failed if inode has been
initialized. Otherwise we will get following warning during umount:
  UBIFS error (ubi0:0 pid 1494): ubifs_assert_failed [ubifs]: UBIFS
  assert failed: c->bi.dd_growth == 0, in fs/ubifs/super.c:1930
  VFS: Busy inodes after unmount of ubifs. Self-destruct in 5 seconds.

Fixes: 9e0a1fff8db56ea ("ubifs: Implement RENAME_WHITEOUT")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
Suggested-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/dir.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 2735ad1affed..2cbc5f05f671 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -432,6 +432,8 @@ static int do_tmpfile(struct inode *dir, struct dentry *dentry,
 	make_bad_inode(inode);
 	if (!instantiated)
 		iput(inode);
+	else if (whiteout)
+		iput(*whiteout);
 out_budg:
 	ubifs_release_budget(c, &req);
 	if (!instantiated)
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
