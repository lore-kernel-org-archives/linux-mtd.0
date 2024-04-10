Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DD6CD11C2
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 07:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4wsrjG1HfSv7a+2bWoxvKodSp+ZxBpZxN2MYEPerYA=; b=AvqFg3X4JIowHJ
	PpZk5TSnEJ7KdhvpRiEbx2lFJK1pntwmS75f6GcKWqLlondyJAqHRKRrd82cpw9CkBcWlGH5GbRpr
	11IK2RpeQL7i1eeL7cNRWXpR/px0M7NdDTO4kSULB9JPzrLS6OI3T0obaJIXMmwdW3p2vvZ3031sR
	x6FAgSUAapOgxlur8TxyYK4l87qUgNU+I3w8v3C1iUGSJ/FcjrhYA1jjV7ElRd8RuuhMwO+gy/A0Q
	A3uadMgPKZlo5ipKTTfc/UN/jHaycGzd5qX2+Ppy9RkXqusm5CWjjtbcgixLZEovcpSHnyttodmkw
	akQLEYGfRDzSVLT+SxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSfA-00000005gFO-0FfB;
	Wed, 10 Apr 2024 07:46:32 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSf5-00000005gBj-4A9F
	for linux-mtd@lists.infradead.org;
	Wed, 10 Apr 2024 07:46:30 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4VDvy11JTjz21kfM;
	Wed, 10 Apr 2024 15:45:29 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 89DDF18001A;
	Wed, 10 Apr 2024 15:46:24 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 10 Apr
 2024 15:46:20 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>
Subject: [PATCH 4/9] ubifs: Remove insert_dead_orphan from replaying orphan process
Date: Wed, 10 Apr 2024 15:37:46 +0800
Message-ID: <20240410073751.2522830-5-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240410073751.2522830-1-chengzhihao1@huawei.com>
References: <20240410073751.2522830-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_004628_406234_A03F5990 
X-CRM114-Status: GOOD (  13.61  )
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

UBIFS will do commit at the end of mounting process(rw mode), dead
orphans(added by insert_dead_orphan in replaying orphan) are deleted
by ubifs_orphan_end_commit(). The only reason why dead orphans are
added into orphan list is that old orpans may be lost when powercut
happens in ubifs_orphan_end_commit():
ubifs_orphan_end_commit  // TNC(updated by orphans) is not written yet
 if (c->cmt_orphans != 0)
  commit_orphans
   consolidate // traverse orphan list
  write_orph_nodes // rewrite all orphans by ubifs_leb_change
  // If dead orphans are not in list, they will be lost when powercut
  // happens, then TNC won't be updated by old orphans in next mounting.
Luckily, the condition 'c->cmt_orphans != 0' will never be true in
mounting process, there can't be new orphans added into orphan list
before mounting returned, but commit will be done at the end of mounting.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/orphan.c | 49 -----------------------------------------------
 1 file changed, 49 deletions(-)

diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index 88fbf331ad8c..6e843e8fc3db 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -513,51 +513,6 @@ int ubifs_clear_orphans(struct ubifs_info *c)
 	return 0;
 }
 
-/**
- * insert_dead_orphan - insert an orphan.
- * @c: UBIFS file-system description object
- * @inum: orphan inode number
- *
- * This function is a helper to the 'do_kill_orphans()' function. The orphan
- * must be kept until the next commit, so it is added to the rb-tree and the
- * deletion list.
- */
-static int insert_dead_orphan(struct ubifs_info *c, ino_t inum)
-{
-	struct ubifs_orphan *orphan, *o;
-	struct rb_node **p, *parent = NULL;
-
-	orphan = kzalloc(sizeof(struct ubifs_orphan), GFP_KERNEL);
-	if (!orphan)
-		return -ENOMEM;
-	orphan->inum = inum;
-
-	p = &c->orph_tree.rb_node;
-	while (*p) {
-		parent = *p;
-		o = rb_entry(parent, struct ubifs_orphan, rb);
-		if (inum < o->inum)
-			p = &(*p)->rb_left;
-		else if (inum > o->inum)
-			p = &(*p)->rb_right;
-		else {
-			/* Already added - no problem */
-			kfree(orphan);
-			return 0;
-		}
-	}
-	c->tot_orphans += 1;
-	rb_link_node(&orphan->rb, parent, p);
-	rb_insert_color(&orphan->rb, &c->orph_tree);
-	list_add_tail(&orphan->list, &c->orph_list);
-	orphan->del = 1;
-	orphan->dnext = c->orph_dnext;
-	c->orph_dnext = orphan;
-	dbg_mnt("ino %lu, new %d, tot %d", (unsigned long)inum,
-		c->new_orphans, c->tot_orphans);
-	return 0;
-}
-
 /**
  * do_kill_orphans - remove orphan inodes from the index.
  * @c: UBIFS file-system description object
@@ -655,10 +610,6 @@ static int do_kill_orphans(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 				if (err)
 					goto out_ro;
 			}
-
-			err = insert_dead_orphan(c, inum);
-			if (err)
-				goto out_free;
 		}
 
 		*last_cmt_no = cmt_no;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
