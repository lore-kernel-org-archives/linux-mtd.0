Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3A6C33CAD
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 14:56:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15CFC207FF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 14:56:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="adOuLV4H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15CFC207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=axis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FIdMUh97If9jsEqUU1ElJ8WtZP3GabqXKAdet1XQqrc=; b=adOuLV4HQ7ZoxF
	uhhvnH0DWByeGYNnveuNle71cV/5TZM/hYgaVnMGEyz3jTUMEKfviQxfpcqN4KX9LCfYJSu+0PARE
	2yscROsZTIExwls2P82lxHFXKooTdsGWr7bH1oqptGwRpRvaU2Dq/26E6RxKeUniC0gIL//diq2o3
	nkDvsL9VicWMkkUS9uQe0fxa5TDMngdoRZGHz24NgUVocZLr6uUxnDfYJf7ia6ShemeJ9IpI2UR4j
	H7MemzOIWByz3N5iAjNEJiU2X5nNDit88qa+oO0ip3ErsRfsHW28b6XErnxrNhWBRBJKxdyT3xZ0c
	jr5Ydr847MLHiMCmATRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir195-0002cG-AW; Mon, 13 Jan 2020 14:56:47 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir190-0002b2-HQ
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 14:56:45 +0000
IronPort-SDR: 476E/49jP70zycdbz/vwy3ppWLWHCbNwTpHwq1oScwLdyLGrEnpg5SCw3/xAAJMArroiTtgcwM
 oVFmEUd26uqncX6t57x9rddguJuQAyLsgK6ZS7DDGlQ3ZZmNlX+wd1fF3+IDjQa507rWiZTgoA
 s5xMNZmPmUNJa573BCkFgkSx68WpkiLuRHrRkALy3YVBjUJkP5ptqX2UH9+cCAYB6g6fAS39KI
 1rtlyKvfygdMWONIF+iGwh9vKRNghi+J/UnC7ujsrfdlVPLvpcayPElrI1PoRFSTdK3qfwrGl1
 nbY=
X-IronPort-AV: E=Sophos;i="5.69,429,1571695200"; 
   d="scan'208";a="4244478"
From: Arne Edholm <arne.edholm@axis.com>
To: <richard@nod.at>
Subject: [PATCH] ubi: Select fastmap anchor PEBs considering wear level rules
Date: Mon, 13 Jan 2020 15:56:22 +0100
Message-ID: <20200113145622.18357-1-arne.edholm@axis.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_065642_915507_503CEF27 
X-CRM114-Status: GOOD (  18.58  )
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
Cc: Arne Edholm <arne.edholm@axis.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There is a risk that the fastmap anchor PEB is alternating between
just two PEBs, the current anchor and the previous anchor that was just
deleted. As the fastmap pools gets the first take on free PEBs, the
pools may leave no free PEBs to be selected as the new anchor,
resulting in the two PEBs alternating behaviour. If the anchor PEBs gets
a high erase count the PEBs will not be used by the pools but remain in
ubi->free, even more increasing the likelihood they will be used as
anchors.

Getting stuck using only a couple of PEBs continuously will result in an
uneven wear, eventually leading to failure.

To fix this:

- Choose the fastmap anchor when the most free PEBs are available. This is
  during rebuilding of the fastmap pools, after the unused pool PEBs are
  added to ubi->free but before the pools are populated again from the
  free PEBs. Also reserve an additional second best PEB as a candidate
  for the next time the fast map anchor is updated. If a better PEB is
  found the next time the fast map anchor is updated, the candidate is
  made available for building the pools.

- Enable anchor move within the anchor area again as it is useful for
  distributing wear.

- The anchor candidate for the next fastmap update is the most suited free
  PEB. Check this PEB's erase count during wear leveling. If the wear
  leveling limit is exceeded, the PEB is considered unsuitable for now. As
  all other non used anchor area PEBs should be even worse, free up the
  used anchor area PEB with the lowest erase count.

Signed-off-by: Arne Edholm <arne.edholm@axis.com>
---
 drivers/mtd/ubi/fastmap-wl.c | 39 ++++++++++++++++++++++++---------------
 drivers/mtd/ubi/fastmap.c    | 11 +++++++++++
 drivers/mtd/ubi/ubi.h        |  4 +++-
 drivers/mtd/ubi/wl.c         | 28 +++++++++++++++++++---------
 4 files changed, 57 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 426820ab9afe..97cb57a12440 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -110,6 +110,21 @@ void ubi_refill_pools(struct ubi_device *ubi)
 	wl_pool->size = 0;
 	pool->size = 0;
 
+	if (ubi->fm_anchor) {
+		wl_tree_add(ubi->fm_anchor, &ubi->free);
+		ubi->free_count++;
+	}
+	if (ubi->fm_next_anchor) {
+		wl_tree_add(ubi->fm_next_anchor, &ubi->free);
+		ubi->free_count++;
+	}
+
+	/* All available PEBs are in ubi->free, now is the time to get
+	 * the best anchor PEBs.
+	 */
+	ubi->fm_anchor = ubi_wl_get_fm_peb(ubi, 1);
+	ubi->fm_next_anchor = ubi_wl_get_fm_peb(ubi, 1);
+
 	for (;;) {
 		enough = 0;
 		if (pool->size < pool->max_size) {
@@ -265,26 +280,20 @@ static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
 int ubi_ensure_anchor_pebs(struct ubi_device *ubi)
 {
 	struct ubi_work *wrk;
-	struct ubi_wl_entry *anchor;
 
 	spin_lock(&ubi->wl_lock);
 
-	/* Do we already have an anchor? */
-	if (ubi->fm_anchor) {
-		spin_unlock(&ubi->wl_lock);
-		return 0;
-	}
-
-	/* See if we can find an anchor PEB on the list of free PEBs */
-	anchor = ubi_wl_get_fm_peb(ubi, 1);
-	if (anchor) {
-		ubi->fm_anchor = anchor;
-		spin_unlock(&ubi->wl_lock);
-		return 0;
+	/* Do we have a next anchor? */
+	if (!ubi->fm_next_anchor) {
+		ubi->fm_next_anchor = ubi_wl_get_fm_peb(ubi, 1);
+		if (!ubi->fm_next_anchor)
+			/* Tell wear leveling to produce a new anchor PEB */
+			ubi->fm_do_produce_anchor = 1;
 	}
 
-	/* No luck, trigger wear leveling to produce a new anchor PEB */
-	ubi->fm_do_produce_anchor = 1;
+	/* Do wear leveling to get a new anchor PEB or check the
+	 * existing next anchor candidate.
+	 */
 	if (ubi->wl_scheduled) {
 		spin_unlock(&ubi->wl_lock);
 		return 0;
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 1c7be4eb3ba6..02332f9ea996 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1220,6 +1220,17 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 		fm_pos += sizeof(*fec);
 		ubi_assert(fm_pos <= ubi->fm_size);
 	}
+	if (ubi->fm_next_anchor) {
+		fec = (struct ubi_fm_ec *)(fm_raw + fm_pos);
+
+		fec->pnum = cpu_to_be32(ubi->fm_next_anchor->pnum);
+		set_seen(ubi, ubi->fm_next_anchor->pnum, seen_pebs);
+		fec->ec = cpu_to_be32(ubi->fm_next_anchor->ec);
+
+		free_peb_count++;
+		fm_pos += sizeof(*fec);
+		ubi_assert(fm_pos <= ubi->fm_size);
+	}
 	fmh->free_peb_count = cpu_to_be32(free_peb_count);
 
 	ubi_for_each_used_peb(ubi, wl_e, tmp_rb) {
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 9688b411c930..a12fdb137fa4 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -491,7 +491,8 @@ struct ubi_debug_info {
  * @fm_work: fastmap work queue
  * @fm_work_scheduled: non-zero if fastmap work was scheduled
  * @fast_attach: non-zero if UBI was attached by fastmap
- * @fm_anchor: The next anchor PEB to use for fastmap
+ * @fm_anchor: The new anchor PEB used during fastmap update
+ * @fm_next_anchor: An anchor PEB candidate for the next time fastmap is updated
  * @fm_do_produce_anchor: If true produce an anchor PEB in wl
  *
  * @used: RB-tree of used physical eraseblocks
@@ -602,6 +603,7 @@ struct ubi_device {
 	int fm_work_scheduled;
 	int fast_attach;
 	struct ubi_wl_entry *fm_anchor;
+	struct ubi_wl_entry *fm_next_anchor;
 	int fm_do_produce_anchor;
 
 	/* Wear-leveling sub-system's stuff */
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 5d77a38dba54..804c434928aa 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -688,20 +688,27 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 	}
 
 #ifdef CONFIG_MTD_UBI_FASTMAP
+	e1 = find_anchor_wl_entry(&ubi->used);
+	if (e1 && ubi->fm_next_anchor &&
+	    (ubi->fm_next_anchor->ec - e1->ec >= UBI_WL_THRESHOLD)) {
+		ubi->fm_do_produce_anchor = 1;
+		/* fm_next_anchor is no longer considered a good anchor
+		 * candidate.
+		 * NULL assignment also prevents multiple wear level checks
+		 * of this PEB.
+		 */
+		wl_tree_add(ubi->fm_next_anchor, &ubi->free);
+		ubi->fm_next_anchor = NULL;
+		ubi->free_count++;
+	}
+
 	if (ubi->fm_do_produce_anchor) {
-		e1 = find_anchor_wl_entry(&ubi->used);
 		if (!e1)
 			goto out_cancel;
 		e2 = get_peb_for_wl(ubi);
 		if (!e2)
 			goto out_cancel;
 
-		/*
-		 * Anchor move within the anchor area is useless.
-		 */
-		if (e2->pnum < UBI_FM_MAX_START)
-			goto out_cancel;
-
 		self_check_in_wl_tree(ubi, e1, &ubi->used);
 		rb_erase(&e1->u.rb, &ubi->used);
 		dbg_wl("anchor-move PEB %d to PEB %d", e1->pnum, e2->pnum);
@@ -1080,8 +1087,11 @@ static int __erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk)
 	if (!err) {
 		spin_lock(&ubi->wl_lock);
 
-		if (!ubi->fm_anchor && e->pnum < UBI_FM_MAX_START) {
-			ubi->fm_anchor = e;
+		if (!ubi->fm_next_anchor && e->pnum < UBI_FM_MAX_START) {
+			/* Abort anchor production, if needed it will be
+			 * enabled again in the wear leveling started below.
+			 */
+			ubi->fm_next_anchor = e;
 			ubi->fm_do_produce_anchor = 0;
 		} else {
 			wl_tree_add(e, &ubi->free);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
