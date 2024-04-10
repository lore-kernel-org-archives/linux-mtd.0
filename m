Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085F0CD129A
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 07:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8JQf/z0f/Q9ML69cqIZIuPH/5Q4IaUYaYA9FO1Gfbfw=; b=d3s3pWWkuYxiFg
	OjWQYhHYUUbRU4Hj/JlrVjEFbUQ4zCUAjAYcSoFYZBKrRHTbI5egNAvn3YHvigO66mPtCboXal/F3
	DPZ2CiyPlv/hnGIRZqx6QD0bwsGlrphTqqkke+MrAL/le9S1CvnA8um507AqkSXfyv+IXdWzlODCS
	rF/7w8venV30nhMIY4ddthKK9qC/b7nqRm74NtwYWTJIyz+fWLutn5hcGzvjJvLTTMtzX3WlvQO0k
	4wpsJDkRMAoklIZhhtvtseVf2TIK+WXlf1jQkhvlhbMEqi+cZIrrbTWaVZtwdYOz9QTY5ww4ptwgS
	cnolXr+64+BgJU3b6z5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSfC-00000005gGt-3aqO;
	Wed, 10 Apr 2024 07:46:34 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSf6-00000005gBm-34cr
	for linux-mtd@lists.infradead.org;
	Wed, 10 Apr 2024 07:46:31 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4VDvy13XFZz21kfS;
	Wed, 10 Apr 2024 15:45:29 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id D729F180063;
	Wed, 10 Apr 2024 15:46:24 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 10 Apr
 2024 15:46:22 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>
Subject: [PATCH 9/9] ubifs: dbg_orphan_check: Fix missed key type checking
Date: Wed, 10 Apr 2024 15:37:51 +0800
Message-ID: <20240410073751.2522830-10-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240410073751.2522830-1-chengzhihao1@huawei.com>
References: <20240410073751.2522830-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_004628_966917_F2927A34 
X-CRM114-Status: GOOD (  10.97  )
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

When selinux/encryption is enabled, xattr entry node is added into TNC
before host inode when creating new file. So it is possible to find
xattr entry without host inode from TNC. Orphan debug checking is called
by ubifs_orphan_end_commit(), at that time, the commit semaphore is
already unlock, so the new creation won't be blocked.

Fixes: d7f0b70d30ff ("UBIFS: Add security.* XATTR support for the UBIFS")
Fixes: d475a507457b ("ubifs: Add skeleton for fscrypto")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/orphan.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index 37d206097112..fb957d963ba6 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -816,8 +816,12 @@ static int dbg_orphan_check(struct ubifs_info *c, struct ubifs_zbranch *zbr,
 
 	inum = key_inum(c, &zbr->key);
 	if (inum != ci->last_ino) {
-		/* Lowest node type is the inode node, so it comes first */
-		if (key_type(c, &zbr->key) != UBIFS_INO_KEY)
+		/*
+		 * Lowest node type is the inode node or xattr entry(when
+		 * selinux/encryption is enabled), so it comes first
+		 */
+		if (key_type(c, &zbr->key) != UBIFS_INO_KEY &&
+		    key_type(c, &zbr->key) != UBIFS_XENT_KEY)
 			ubifs_err(c, "found orphan node ino %lu, type %d",
 				  (unsigned long)inum, key_type(c, &zbr->key));
 		ci->last_ino = inum;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
