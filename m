Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E2ECD11C2
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 07:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5eo0eqk+TMLvBFp5gWAIhkTipygRySeb/z75nRpXSw=; b=CRMVuwt7XjGPB7
	fhdUENze1FFbcycsmijpgbePJlMzEsJASbqqXSDeoFUnLZLQQAArSpdjtjjHyo5KFAxbaX5X41m/y
	XywxGlbB4UcCITpJS9yWysGQzyp9aJ+dCk7rjUIhij0RF+DhG6tn37FlICUoSdMepzrNo31Ioo387
	2W3MMm8gegQMhtM28OGBdVvYFGcrGJVGaox4IDHAO3wMbHMHjNDHCfZUpquQ7Q4J9VvPj8NdlzHE9
	XjnpfCUMwT/8rb35AkcJlrxbbPGoDRDpe2BgO6NvvykZ4Kuu4nnXLdSjnhwWTYN2iLXU7boG/9wqD
	VaoWremlzjDAKJr64Y6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSfP-00000005gRY-2rCr;
	Wed, 10 Apr 2024 07:46:47 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSf9-00000005gBx-1XDA
	for linux-mtd@lists.infradead.org;
	Wed, 10 Apr 2024 07:46:34 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4VDvvm5zVGz29khB;
	Wed, 10 Apr 2024 15:43:32 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 99225180064;
	Wed, 10 Apr 2024 15:46:24 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 10 Apr
 2024 15:46:20 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>
Subject: [PATCH 5/9] ubifs: Fix adding orphan entry twice for the same inode
Date: Wed, 10 Apr 2024 15:37:47 +0800
Message-ID: <20240410073751.2522830-6-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240410073751.2522830-1-chengzhihao1@huawei.com>
References: <20240410073751.2522830-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_004631_777083_EC300B2B 
X-CRM114-Status: GOOD (  12.11  )
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

The tmpfile could be added into orphan list twice, first time is
creation, the second time is removing after it is linked. The orphan
entry could be added twice for tmpfile if following sequence is
satisfied:

ubifs_tmpfile
 ubifs_jnl_update
  ubifs_add_orphan // first time to add orphan entry

    P1                        P2
ubifs_link                 do_commit
                            ubifs_orphan_start_commit
			     orphan->cmt = 1
 ubifs_delete_orphan
  orphan_delete
   if (orph->cmt)
    orph->del = 1; // orphan entry is not deleted from tree
    return
ubifs_unlink
 ubifs_jnl_update
  ubifs_add_orphan
   orphan_add // found old orphan entry, second time to add orphan entry
    ubifs_err(c, "orphaned twice")
    return -EINVAL // unlink failed!
                            ubifs_orphan_end_commit
			     erase_deleted // delete old orphan entry
			      rb_erase(&orphan->rb, &c->orph_tree)

Fix it by removing orphan entry from orphan tree in advance, rather than
remove it from orphan tree in committing process.

Fixes: 32fe905c17f0 ("ubifs: Fix O_TMPFILE corner case in ubifs_link()")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=218672
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/orphan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index 6e843e8fc3db..37d206097112 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -136,6 +136,7 @@ static void orphan_delete(struct ubifs_info *c, struct ubifs_orphan *orph)
 
 	if (orph->cmt) {
 		orph->del = 1;
+		rb_erase(&orph->rb, &c->orph_tree);
 		orph->dnext = c->orph_dnext;
 		c->orph_dnext = orph;
 		dbg_gen("delete later ino %lu", (unsigned long)orph->inum);
@@ -461,7 +462,6 @@ static void erase_deleted(struct ubifs_info *c)
 		dnext = orphan->dnext;
 		ubifs_assert(c, !orphan->new);
 		ubifs_assert(c, orphan->del);
-		rb_erase(&orphan->rb, &c->orph_tree);
 		list_del(&orphan->list);
 		c->tot_orphans -= 1;
 		dbg_gen("deleting orphan ino %lu", (unsigned long)orphan->inum);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
