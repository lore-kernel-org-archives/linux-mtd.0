Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1902D2E9CB
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 09:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nGu6gAchj/Cw0F2bwMdW+l0V/shDZyN2Msl0OPRNUxI=; b=2eg0Dm/FxtWaOA
	RpJYgxaiVhN4l1Ouxs32q2a+qdZzepbL6IZ9+2BqZqc4AQXvvcIOkpEQRa8Dc3sN4fk5JX/qwpA3Q
	5GJ0UePJhku8jr5rL+WlCV3mKf5GPj2hjJD/DtR7syiADH58Y7sPuZVYpf4EZ3n6jSy1QPTh2Rd50
	72f8ekqjnkIfVWei2CgN3eSGiIsAeJ/4jUr9BDAOZAz6826+JPkDheWFx20jTAdOoraial1UQRDb5
	aLb1rA6n7b765NwvpSzsnJWlxdBhkV35Jx9gDmudCfq3H0GKwwoBE4Kcp2V11MorYEgLWdTODKEIQ
	07/jT7G54iTJqVSq0jnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQl1-0000000H6EC-0uy3;
	Mon, 11 Nov 2024 09:30:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOV6-0000000GZv9-3jHR
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:06:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vPh1BMzth0qju58pQfc56WN6HYd4RC/qwhQMvpwG4cg=; b=gPbdoP9+jmrj2VFraf2Gyp1uX2
	mzpJsM9OADRkZ7pHgtTzTPUNfbB21qLgKfU0hbyP7g6NzI2wus7q7gooAuYMNpu4zkbClfgl0LuqA
	/YWta6t/zu8VfxwjblSPthwpkUdh4dht85pchr78zkdUHr7vuq1ScLb9NJVRaw9VMbNi+qN2ppf1T
	QIg24exL+ik79bYzQBbeTj3u+qjbkezdhLXW2wKJO1XVNbUnduHAZObw6M8jIIOu2dwAnxXARp3aV
	EwKlRr6F4N/HGQKDn1nkHjDlu2LetPHGZhxq6n+QAyi/cVAYv/LNA5X/flulYl1gVX7X2jtTkOF3l
	V6uOr3IQ==;
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUo-0000000CmMJ-1hAO
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:06:10 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Xn0s26HglzQsrX;
	Mon, 11 Nov 2024 15:04:06 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 479DF18007C;
	Mon, 11 Nov 2024 15:05:19 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:18 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 036/102] ubifs-utils: Adapt budget.c in libubifs
Date: Mon, 11 Nov 2024 15:02:39 +0800
Message-ID: <20241111070346.1314122-37-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070603_979421_8012C25A 
X-CRM114-Status: GOOD (  18.82  )
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

Adapt budget.c in libubifs, compared with linux kernel implementations:
 1. Remove writeback related functions, there are no dirty pages/inodes
    for UBIFS in userspace process.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/libubifs/budget.c | 133 +++---------------------------------------
 1 file changed, 7 insertions(+), 126 deletions(-)

diff --git a/ubifs-utils/libubifs/budget.c b/ubifs-utils/libubifs/budget.c
index d76eb7b3..54392a93 100644
--- a/ubifs-utils/libubifs/budget.c
+++ b/ubifs-utils/libubifs/budget.c
@@ -18,9 +18,11 @@
  * approximations are used.
  */
 
+#include "bitops.h"
 #include "ubifs.h"
-#include <linux/writeback.h>
-#include <linux/math64.h>
+#include "defs.h"
+#include "debug.h"
+#include "misc.h"
 
 /*
  * When pessimistic budget calculations say that there is no enough space,
@@ -30,31 +32,6 @@
  */
 #define MAX_MKSPC_RETRIES 3
 
-/*
- * The below constant defines amount of dirty pages which should be written
- * back at when trying to shrink the liability.
- */
-#define NR_TO_WRITE 16
-
-/**
- * shrink_liability - write-back some dirty pages/inodes.
- * @c: UBIFS file-system description object
- * @nr_to_write: how many dirty pages to write-back
- *
- * This function shrinks UBIFS liability by means of writing back some amount
- * of dirty inodes and their pages.
- *
- * Note, this function synchronizes even VFS inodes which are locked
- * (@i_mutex) by the caller of the budgeting function, because write-back does
- * not touch @i_mutex.
- */
-static void shrink_liability(struct ubifs_info *c, int nr_to_write)
-{
-	down_read(&c->vfs_sb->s_umount);
-	writeback_inodes_sb_nr(c->vfs_sb, nr_to_write, WB_REASON_FS_FREE_SPACE);
-	up_read(&c->vfs_sb->s_umount);
-}
-
 /**
  * run_gc - run garbage collector.
  * @c: UBIFS file-system description object
@@ -80,23 +57,6 @@ static int run_gc(struct ubifs_info *c)
 }
 
 /**
- * get_liability - calculate current liability.
- * @c: UBIFS file-system description object
- *
- * This function calculates and returns current UBIFS liability, i.e. the
- * amount of bytes UBIFS has "promised" to write to the media.
- */
-static long long get_liability(struct ubifs_info *c)
-{
-	long long liab;
-
-	spin_lock(&c->space_lock);
-	liab = c->bi.idx_growth + c->bi.data_growth + c->bi.dd_growth;
-	spin_unlock(&c->space_lock);
-	return liab;
-}
-
-/**
  * make_free_space - make more free space on the file-system.
  * @c: UBIFS file-system description object
  *
@@ -117,24 +77,8 @@ static long long get_liability(struct ubifs_info *c)
 static int make_free_space(struct ubifs_info *c)
 {
 	int err, retries = 0;
-	long long liab1, liab2;
 
 	do {
-		liab1 = get_liability(c);
-		/*
-		 * We probably have some dirty pages or inodes (liability), try
-		 * to write them back.
-		 */
-		dbg_budg("liability %lld, run write-back", liab1);
-		shrink_liability(c, NR_TO_WRITE);
-
-		liab2 = get_liability(c);
-		if (liab2 < liab1)
-			return -EAGAIN;
-
-		dbg_budg("new liability %lld (not shrunk)", liab2);
-
-		/* Liability did not shrink again, try GC */
 		dbg_budg("Run GC");
 		err = run_gc(c);
 		if (!err)
@@ -254,12 +198,10 @@ long long ubifs_calc_available(const struct ubifs_info *c, int min_idx_lebs)
  * This function checks whether current user is allowed to use reserved pool.
  * Returns %1  current user is allowed to use reserved pool and %0 otherwise.
  */
-static int can_use_rp(struct ubifs_info *c)
+static int can_use_rp(__unused struct ubifs_info *c)
 {
-	if (uid_eq(current_fsuid(), c->rp_uid) || capable(CAP_SYS_RESOURCE) ||
-	    (!gid_eq(c->rp_gid, GLOBAL_ROOT_GID) && in_group_p(c->rp_gid)))
-		return 1;
-	return 0;
+	/* Fsck can always use reserved pool. */
+	return c->program_type != MKFS_PROGRAM_TYPE;
 }
 
 /**
@@ -556,49 +498,6 @@ void ubifs_release_budget(struct ubifs_info *c, struct ubifs_budget_req *req)
 }
 
 /**
- * ubifs_convert_page_budget - convert budget of a new page.
- * @c: UBIFS file-system description object
- *
- * This function converts budget which was allocated for a new page of data to
- * the budget of changing an existing page of data. The latter is smaller than
- * the former, so this function only does simple re-calculation and does not
- * involve any write-back.
- */
-void ubifs_convert_page_budget(struct ubifs_info *c)
-{
-	spin_lock(&c->space_lock);
-	/* Release the index growth reservation */
-	c->bi.idx_growth -= c->max_idx_node_sz << UBIFS_BLOCKS_PER_PAGE_SHIFT;
-	/* Release the data growth reservation */
-	c->bi.data_growth -= c->bi.page_budget;
-	/* Increase the dirty data growth reservation instead */
-	c->bi.dd_growth += c->bi.page_budget;
-	/* And re-calculate the indexing space reservation */
-	c->bi.min_idx_lebs = ubifs_calc_min_idx_lebs(c);
-	spin_unlock(&c->space_lock);
-}
-
-/**
- * ubifs_release_dirty_inode_budget - release dirty inode budget.
- * @c: UBIFS file-system description object
- * @ui: UBIFS inode to release the budget for
- *
- * This function releases budget corresponding to a dirty inode. It is usually
- * called when after the inode has been written to the media and marked as
- * clean. It also causes the "no space" flags to be cleared.
- */
-void ubifs_release_dirty_inode_budget(struct ubifs_info *c,
-				      struct ubifs_inode *ui)
-{
-	struct ubifs_budget_req req;
-
-	memset(&req, 0, sizeof(struct ubifs_budget_req));
-	/* The "no space" flags will be cleared because dd_growth is > 0 */
-	req.dd_growth = c->bi.inode_budget + ALIGN(ui->data_len, 8);
-	ubifs_release_budget(c, &req);
-}
-
-/**
  * ubifs_reported_space - calculate reported free space.
  * @c: the UBIFS file-system description object
  * @free: amount of free space
@@ -694,21 +593,3 @@ long long ubifs_get_free_space_nolock(struct ubifs_info *c)
 		free = 0;
 	return free;
 }
-
-/**
- * ubifs_get_free_space - return amount of free space.
- * @c: UBIFS file-system description object
- *
- * This function calculates and returns amount of free space to report to
- * user-space.
- */
-long long ubifs_get_free_space(struct ubifs_info *c)
-{
-	long long free;
-
-	spin_lock(&c->space_lock);
-	free = ubifs_get_free_space_nolock(c);
-	spin_unlock(&c->space_lock);
-
-	return free;
-}
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
