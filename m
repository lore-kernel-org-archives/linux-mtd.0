Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B198C43465
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 02:03:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B7EE23119
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 02:03:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LLiePgKI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jhgf80D+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B7EE23119
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4ASTKcshnWoPcP+Lv6kSlN+tVsVGv2pewG/ZTp0EWt0=; b=LLiePgKIiE0O08z40ySpkWLnk
	1ERkq3N2xNPAe1mpbFKLteBU7UWt1YPXL/rFqL5sBKd9/NC8Uh9kiInCA91kHyV2c1b9yNVE6QZcy
	ZqfNfeDWeiurMXtMxyizoBNsVvG79lbVM/AZcmIqRq3iJRmIoFIBr/yTUnjpq1/uZlKXh6+Mh8P5X
	X5hFH5qbTUoF3LjcFaPDxv3bqk0Q/052aXCtxEF7/Xl6X3RhwzOH3qtcd9ZIPIhxeTu4b6Ni+DBQa
	K/de2P9Ch3mlohwnKBVG+FKo37xAhQX0l+Y1rmrKA1TZygdkhZFYJcxrYOgNGlKkCLhxdHVJSnAd6
	HciJtYMDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ5j8-00022Q-1P; Fri, 18 Sep 2020 02:02:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ5j6-00021f-5S
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2020 02:02:17 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D4AC02087D;
 Fri, 18 Sep 2020 02:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394535;
 bh=CodYcYEdWrMWmpfJqrFkdGnumjQOmQXaR8r6FX2z2mY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Jhgf80D+vG3S5Pn3bBC7LD/3G3eWCw3GwCaLvGgMH6izw0wTRxTIht/JTNGSgTQDU
 edZGOTttiBXYP0q2HM5UoFZEyPS5mroWxssHlPp6LfJA5tmJkfAIxLeJNljf7+l/Gd
 RvQi5r/X6xoinFV/diYFmsTYx9668UJzcqql0rKI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 054/330] ubi: Fix producing anchor PEBs
Date: Thu, 17 Sep 2020 21:56:34 -0400
Message-Id: <20200918020110.2063155-54-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_220216_333585_EAF13E7E 
X-CRM114-Status: GOOD (  29.56  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Richard Weinberger <richard@nod.at>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Sascha Hauer <s.hauer@pengutronix.de>

[ Upstream commit f9c34bb529975fe9f85b870a80c53a83a3c5a182 ]

When a new fastmap is about to be written UBI must make sure it has a
free block for a fastmap anchor available. For this ubi_update_fastmap()
calls ubi_ensure_anchor_pebs(). This stopped working with 2e8f08deabbc
("ubi: Fix races around ubi_refill_pools()"), with this commit the wear
leveling code is blocked and can no longer produce free PEBs. UBI then
more often than not falls back to write the new fastmap anchor to the
same block it was already on which means the same erase block gets
erased during each fastmap write and wears out quite fast.

As the locking prevents us from producing the anchor PEB when we
actually need it, this patch changes the strategy for creating the
anchor PEB. We no longer create it on demand right before we want to
write a fastmap, but instead we create an anchor PEB right after we have
written a fastmap. This gives us enough time to produce a new anchor PEB
before it is needed. To make sure we have an anchor PEB for the very
first fastmap write we call ubi_ensure_anchor_pebs() during
initialisation as well.

Fixes: 2e8f08deabbc ("ubi: Fix races around ubi_refill_pools()")
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mtd/ubi/fastmap-wl.c | 31 ++++++++++++++++++-------------
 drivers/mtd/ubi/fastmap.c    | 14 +++++---------
 drivers/mtd/ubi/ubi.h        |  6 ++++--
 drivers/mtd/ubi/wl.c         | 32 ++++++++++++++------------------
 drivers/mtd/ubi/wl.h         |  1 -
 5 files changed, 41 insertions(+), 43 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index c44c8470247e1..426820ab9afe1 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -57,18 +57,6 @@ static void return_unused_pool_pebs(struct ubi_device *ubi,
 	}
 }
 
-static int anchor_pebs_available(struct rb_root *root)
-{
-	struct rb_node *p;
-	struct ubi_wl_entry *e;
-
-	ubi_rb_for_each_entry(p, e, root, u.rb)
-		if (e->pnum < UBI_FM_MAX_START)
-			return 1;
-
-	return 0;
-}
-
 /**
  * ubi_wl_get_fm_peb - find a physical erase block with a given maximal number.
  * @ubi: UBI device description object
@@ -277,8 +265,26 @@ static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
 int ubi_ensure_anchor_pebs(struct ubi_device *ubi)
 {
 	struct ubi_work *wrk;
+	struct ubi_wl_entry *anchor;
 
 	spin_lock(&ubi->wl_lock);
+
+	/* Do we already have an anchor? */
+	if (ubi->fm_anchor) {
+		spin_unlock(&ubi->wl_lock);
+		return 0;
+	}
+
+	/* See if we can find an anchor PEB on the list of free PEBs */
+	anchor = ubi_wl_get_fm_peb(ubi, 1);
+	if (anchor) {
+		ubi->fm_anchor = anchor;
+		spin_unlock(&ubi->wl_lock);
+		return 0;
+	}
+
+	/* No luck, trigger wear leveling to produce a new anchor PEB */
+	ubi->fm_do_produce_anchor = 1;
 	if (ubi->wl_scheduled) {
 		spin_unlock(&ubi->wl_lock);
 		return 0;
@@ -294,7 +300,6 @@ int ubi_ensure_anchor_pebs(struct ubi_device *ubi)
 		return -ENOMEM;
 	}
 
-	wrk->anchor = 1;
 	wrk->func = &wear_leveling_worker;
 	__schedule_ubi_work(ubi, wrk);
 	return 0;
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 604772fc4a965..53f448e7433a9 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1543,14 +1543,6 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 		return 0;
 	}
 
-	ret = ubi_ensure_anchor_pebs(ubi);
-	if (ret) {
-		up_write(&ubi->fm_eba_sem);
-		up_write(&ubi->work_sem);
-		up_write(&ubi->fm_protect);
-		return ret;
-	}
-
 	new_fm = kzalloc(sizeof(*new_fm), GFP_KERNEL);
 	if (!new_fm) {
 		up_write(&ubi->fm_eba_sem);
@@ -1621,7 +1613,8 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 	}
 
 	spin_lock(&ubi->wl_lock);
-	tmp_e = ubi_wl_get_fm_peb(ubi, 1);
+	tmp_e = ubi->fm_anchor;
+	ubi->fm_anchor = NULL;
 	spin_unlock(&ubi->wl_lock);
 
 	if (old_fm) {
@@ -1673,6 +1666,9 @@ out_unlock:
 	up_write(&ubi->work_sem);
 	up_write(&ubi->fm_protect);
 	kfree(old_fm);
+
+	ubi_ensure_anchor_pebs(ubi);
+
 	return ret;
 
 err:
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 721b6aa7936cf..a173eb707bddb 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -491,6 +491,8 @@ struct ubi_debug_info {
  * @fm_work: fastmap work queue
  * @fm_work_scheduled: non-zero if fastmap work was scheduled
  * @fast_attach: non-zero if UBI was attached by fastmap
+ * @fm_anchor: The next anchor PEB to use for fastmap
+ * @fm_do_produce_anchor: If true produce an anchor PEB in wl
  *
  * @used: RB-tree of used physical eraseblocks
  * @erroneous: RB-tree of erroneous used physical eraseblocks
@@ -599,6 +601,8 @@ struct ubi_device {
 	struct work_struct fm_work;
 	int fm_work_scheduled;
 	int fast_attach;
+	struct ubi_wl_entry *fm_anchor;
+	int fm_do_produce_anchor;
 
 	/* Wear-leveling sub-system's stuff */
 	struct rb_root used;
@@ -789,7 +793,6 @@ struct ubi_attach_info {
  * @vol_id: the volume ID on which this erasure is being performed
  * @lnum: the logical eraseblock number
  * @torture: if the physical eraseblock has to be tortured
- * @anchor: produce a anchor PEB to by used by fastmap
  *
  * The @func pointer points to the worker function. If the @shutdown argument is
  * not zero, the worker has to free the resources and exit immediately as the
@@ -805,7 +808,6 @@ struct ubi_work {
 	int vol_id;
 	int lnum;
 	int torture;
-	int anchor;
 };
 
 #include "debug.h"
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 3fcdefe2714d0..5d77a38dba542 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -339,13 +339,6 @@ static struct ubi_wl_entry *find_wl_entry(struct ubi_device *ubi,
 		}
 	}
 
-	/* If no fastmap has been written and this WL entry can be used
-	 * as anchor PEB, hold it back and return the second best WL entry
-	 * such that fastmap can use the anchor PEB later. */
-	if (prev_e && !ubi->fm_disabled &&
-	    !ubi->fm && e->pnum < UBI_FM_MAX_START)
-		return prev_e;
-
 	return e;
 }
 
@@ -656,9 +649,6 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 {
 	int err, scrubbing = 0, torture = 0, protect = 0, erroneous = 0;
 	int erase = 0, keep = 0, vol_id = -1, lnum = -1;
-#ifdef CONFIG_MTD_UBI_FASTMAP
-	int anchor = wrk->anchor;
-#endif
 	struct ubi_wl_entry *e1, *e2;
 	struct ubi_vid_io_buf *vidb;
 	struct ubi_vid_hdr *vid_hdr;
@@ -698,11 +688,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 	}
 
 #ifdef CONFIG_MTD_UBI_FASTMAP
-	/* Check whether we need to produce an anchor PEB */
-	if (!anchor)
-		anchor = !anchor_pebs_available(&ubi->free);
-
-	if (anchor) {
+	if (ubi->fm_do_produce_anchor) {
 		e1 = find_anchor_wl_entry(&ubi->used);
 		if (!e1)
 			goto out_cancel;
@@ -719,6 +705,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 		self_check_in_wl_tree(ubi, e1, &ubi->used);
 		rb_erase(&e1->u.rb, &ubi->used);
 		dbg_wl("anchor-move PEB %d to PEB %d", e1->pnum, e2->pnum);
+		ubi->fm_do_produce_anchor = 0;
 	} else if (!ubi->scrub.rb_node) {
 #else
 	if (!ubi->scrub.rb_node) {
@@ -1051,7 +1038,6 @@ static int ensure_wear_leveling(struct ubi_device *ubi, int nested)
 		goto out_cancel;
 	}
 
-	wrk->anchor = 0;
 	wrk->func = &wear_leveling_worker;
 	if (nested)
 		__schedule_ubi_work(ubi, wrk);
@@ -1093,8 +1079,15 @@ static int __erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk)
 	err = sync_erase(ubi, e, wl_wrk->torture);
 	if (!err) {
 		spin_lock(&ubi->wl_lock);
-		wl_tree_add(e, &ubi->free);
-		ubi->free_count++;
+
+		if (!ubi->fm_anchor && e->pnum < UBI_FM_MAX_START) {
+			ubi->fm_anchor = e;
+			ubi->fm_do_produce_anchor = 0;
+		} else {
+			wl_tree_add(e, &ubi->free);
+			ubi->free_count++;
+		}
+
 		spin_unlock(&ubi->wl_lock);
 
 		/*
@@ -1882,6 +1875,9 @@ int ubi_wl_init(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	if (err)
 		goto out_free;
 
+#ifdef CONFIG_MTD_UBI_FASTMAP
+	ubi_ensure_anchor_pebs(ubi);
+#endif
 	return 0;
 
 out_free:
diff --git a/drivers/mtd/ubi/wl.h b/drivers/mtd/ubi/wl.h
index a9e2d669acd81..c93a532937863 100644
--- a/drivers/mtd/ubi/wl.h
+++ b/drivers/mtd/ubi/wl.h
@@ -2,7 +2,6 @@
 #ifndef UBI_WL_H
 #define UBI_WL_H
 #ifdef CONFIG_MTD_UBI_FASTMAP
-static int anchor_pebs_available(struct rb_root *root);
 static void update_fastmap_work_fn(struct work_struct *wrk);
 static struct ubi_wl_entry *find_anchor_wl_entry(struct rb_root *root);
 static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
