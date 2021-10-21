Return-Path: <SRS0=KyYR=PJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258CFC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 12:46:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4EA560F46
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 12:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4EA560F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zB+b4d1cZn0lQfIBfKqGdX1k8UOfvi8iM1U44A+0LJo=; b=0nVcgkRhOgTvjZ
	2cL7kBEVHlNLsOZ4l0nySIR3hcdsKeT05K3NhlmOHYfUvUcsqmM9rFUGmV7IPOw+gOp5aMR3AYup4
	XPEEDSCaN/l9Up+Cs+F0NMi5ui1VUKaWDV0V2EhCf+3ITnZSkeVTTe2hTZ8vSd5IcntC7vYcH6ttG
	pcKduaC9OoR5IRo7ibLtWC9n/bbfDhMpgEH7vkDWRXi9gZaiXeVXS49fj+EHDDC6Na3NSt57Rr4bm
	yjTnc1XfsBBmflVpS9ZwxiczY/IkUVT5864efbhUOQtw3WcgofFYjYkxy3o1iB+xTBV6ktXaoTcGj
	GgausfIGczJ49fT9ISBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdXSO-007XS6-Es; Thu, 21 Oct 2021 12:46:04 +0000
Received: from [2001:4bb8:180:8777:dd70:8011:36d9:4c23] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdXRL-007X1k-GZ; Thu, 21 Oct 2021 12:44:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jan Kara <jack@suse.cz>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH 5/5] mm: simplify bdi refcounting
Date: Thu, 21 Oct 2021 14:44:41 +0200
Message-Id: <20211021124441.668816-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211021124441.668816-1-hch@lst.de>
References: <20211021124441.668816-1-hch@lst.de>
MIME-Version: 1.0
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

Move grabbing and releasing the bdi refcount out of the common
wb_init/wb_exit helpers into code that is only used for the non-default
memcg driven bdi_writeback structures.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/backing-dev.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index 768e9ae489f66..5ccb250898083 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -291,8 +291,6 @@ static int wb_init(struct bdi_writeback *wb, struct backing_dev_info *bdi,
 
 	memset(wb, 0, sizeof(*wb));
 
-	if (wb != &bdi->wb)
-		bdi_get(bdi);
 	wb->bdi = bdi;
 	wb->last_old_flush = jiffies;
 	INIT_LIST_HEAD(&wb->b_dirty);
@@ -316,7 +314,7 @@ static int wb_init(struct bdi_writeback *wb, struct backing_dev_info *bdi,
 
 	err = fprop_local_init_percpu(&wb->completions, gfp);
 	if (err)
-		goto out_put_bdi;
+		return err;
 
 	for (i = 0; i < NR_WB_STAT_ITEMS; i++) {
 		err = percpu_counter_init(&wb->stat[i], 0, gfp);
@@ -330,9 +328,6 @@ static int wb_init(struct bdi_writeback *wb, struct backing_dev_info *bdi,
 	while (i--)
 		percpu_counter_destroy(&wb->stat[i]);
 	fprop_local_destroy_percpu(&wb->completions);
-out_put_bdi:
-	if (wb != &bdi->wb)
-		bdi_put(bdi);
 	return err;
 }
 
@@ -373,8 +368,6 @@ static void wb_exit(struct bdi_writeback *wb)
 		percpu_counter_destroy(&wb->stat[i]);
 
 	fprop_local_destroy_percpu(&wb->completions);
-	if (wb != &wb->bdi->wb)
-		bdi_put(wb->bdi);
 }
 
 #ifdef CONFIG_CGROUP_WRITEBACK
@@ -397,6 +390,7 @@ static void cgwb_release_workfn(struct work_struct *work)
 	struct bdi_writeback *wb = container_of(work, struct bdi_writeback,
 						release_work);
 	struct blkcg *blkcg = css_to_blkcg(wb->blkcg_css);
+	struct backing_dev_info *bdi = wb->bdi;
 
 	mutex_lock(&wb->bdi->cgwb_release_mutex);
 	wb_shutdown(wb);
@@ -416,6 +410,7 @@ static void cgwb_release_workfn(struct work_struct *work)
 
 	percpu_ref_exit(&wb->refcnt);
 	wb_exit(wb);
+	bdi_put(bdi);
 	WARN_ON_ONCE(!list_empty(&wb->b_attached));
 	kfree_rcu(wb, rcu);
 }
@@ -497,6 +492,7 @@ static int cgwb_create(struct backing_dev_info *bdi,
 	INIT_LIST_HEAD(&wb->b_attached);
 	INIT_WORK(&wb->release_work, cgwb_release_workfn);
 	set_bit(WB_registered, &wb->state);
+	bdi_get(bdi);
 
 	/*
 	 * The root wb determines the registered state of the whole bdi and
@@ -528,6 +524,7 @@ static int cgwb_create(struct backing_dev_info *bdi,
 	goto out_put;
 
 err_fprop_exit:
+	bdi_put(bdi);
 	fprop_local_destroy_percpu(&wb->memcg_completions);
 err_ref_exit:
 	percpu_ref_exit(&wb->refcnt);
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
