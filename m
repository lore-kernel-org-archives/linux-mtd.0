Return-Path: <SRS0=AYH6=Y5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E512CCA9EC7
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 08:13:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B884120869
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 08:13:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A7B8H4YK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B884120869
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N7ihmsPyqyk+OhvoTaz/VcMpSySdPXLyDJ8F80P6rS8=; b=A7B8H4YKzuv8ku
	fbH6z2v9llyOjbF+zpGTzuSTLMYawIDI0eXaCjpUeUMDeVV7rL1UamOiXR1+qdwA1WH7a7/nq7wOS
	ibzjk6pCGbwE3OWDYV7bMa62q+s++JNreU2GEQP06tS0aaGWP5X3xOxrptZ1K6qNNe+q7E8WcW1WF
	/TU3E9s1S69tdm++/LMsvNBaWNmEOyGsoBkA8e6dLDYdiKMpY0eVhRPBJLfAOGyEkxK9/K+C4fAhN
	D4CrPiivk1YGFA5gJkAZO0dXdrMPWFw/dS4G5G8IPVMWkRvGKOtp0rT36ifpRFqQEYUCoZeZLGKtp
	epzPJHe9xxcbdOqXSqRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRtxp-0000Y7-Fq; Tue, 05 Nov 2019 08:13:21 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRtxT-00008H-BU
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2019 08:13:01 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iRtxO-0004FM-L9; Tue, 05 Nov 2019 09:12:54 +0100
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iRtxO-0000Bo-9Y; Tue, 05 Nov 2019 09:12:54 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubi: Fix producing anchor PEBs
Date: Tue,  5 Nov 2019 09:12:51 +0100
Message-Id: <20191105081251.671-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_001259_572038_6A5CBC13 
X-CRM114-Status: GOOD (  25.87  )
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
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

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
---
 drivers/mtd/ubi/fastmap-wl.c | 31 ++++++++++++++++++-------------
 drivers/mtd/ubi/fastmap.c    | 14 +++++---------
 drivers/mtd/ubi/ubi.h        |  6 ++++--
 drivers/mtd/ubi/wl.c         | 32 ++++++++++++++------------------
 drivers/mtd/ubi/wl.h         |  1 -
 5 files changed, 41 insertions(+), 43 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index c44c8470247e..426820ab9afe 100644
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
index 30621c67721a..1c7be4eb3ba6 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1540,14 +1540,6 @@ int ubi_update_fastmap(struct ubi_device *ubi)
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
@@ -1618,7 +1610,8 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 	}
 
 	spin_lock(&ubi->wl_lock);
-	tmp_e = ubi_wl_get_fm_peb(ubi, 1);
+	tmp_e = ubi->fm_anchor;
+	ubi->fm_anchor = NULL;
 	spin_unlock(&ubi->wl_lock);
 
 	if (old_fm) {
@@ -1670,6 +1663,9 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 	up_write(&ubi->work_sem);
 	up_write(&ubi->fm_protect);
 	kfree(old_fm);
+
+	ubi_ensure_anchor_pebs(ubi);
+
 	return ret;
 
 err:
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 721b6aa7936c..a173eb707bdd 100644
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
index 3fcdefe2714d..5d77a38dba54 100644
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
index a9e2d669acd8..c93a53293786 100644
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
2.24.0.rc1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
