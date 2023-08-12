Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA83AC05052
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Aug 2023 08:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y3dlkzeb1i/NSrTmL/xRKZkJxD85MJUEKsdht8M8TaU=; b=N2n2TCDA0C2OpW
	rzANWgcZ9yALmYrBqhfp3PCum8X0n7iX8y58eFRgjLG6vRh6YKEbtZif1Y0V8bIHJaYbzRozY4eEx
	WaX5CgmgDjtSbvBOq5gwrLyt155ixA3AMSLVCnvMW/t/gfmbB4MGDdwF5nUovJKHPJTMYNtVH1bct
	FUcq0rfxOs2sZZlklf/vNcexSCyyFIilsfdFcEWktAolv2b8WfV/FluJBW2qODZv49bzQ1Lrjmhu2
	gMmbCGUbkwzhLfKetUMv+TI0+3gHXQ0ohAZyMgZIxwMdrZCve14mXxTO9OEyDucr8w4zTZn7DykBO
	fBWyWRJJgI3ZDMbQ5n0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUjbE-00Ctqg-23;
	Sat, 12 Aug 2023 08:03:52 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUjb4-00CtkN-1V
	for linux-mtd@lists.infradead.org;
	Sat, 12 Aug 2023 08:03:47 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RNCnF6vXTz1GDY0;
	Sat, 12 Aug 2023 16:02:25 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 12 Aug
 2023 16:03:40 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 09/12] ubi: fastmap: Get wl PEB even ec beyonds the 'max' if free PEBs are run out
Date: Sat, 12 Aug 2023 16:00:02 +0800
Message-ID: <20230812080005.3162125-10-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230812080005.3162125-1-chengzhihao1@huawei.com>
References: <20230812080005.3162125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_010342_850154_E2D37A4D 
X-CRM114-Status: GOOD (  18.09  )
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

This is the part 2 to fix cyclically reusing single fastmap data PEBs.

Consider one situation, if there are four free PEBs for fm_anchor, pool,
wl_pool and fastmap data PEB with erase counter 100, 100, 100, 5096
(ubi->beb_rsvd_pebs is 0). PEB with erase counter 5096 is always picked
for fastmap data according to the realization of find_wl_entry(), since
fastmap data PEB is not scheduled for wl, finally there are two PEBs
(fm data) with great erase counter than other PEBS.
Get wl PEB even its erase counter exceeds the 'max' in find_wl_entry()
when free PEBs are run out after filling pools and fm data. Then the PEB
with biggest erase conter is taken as wl PEB, it can be scheduled for wl.

Fixes: dbb7d2a88d2a ("UBI: Add fastmap core")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=217787
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/fastmap-wl.c | 44 ++++++++++++++++++++++++++++--------
 drivers/mtd/ubi/wl.c         | 16 ++++++++-----
 2 files changed, 44 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 04872089faa4..937ed684e71c 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -140,23 +140,44 @@ static void wait_free_pebs_for_pool(struct ubi_device *ubi)
 }
 
 /*
- * has_enough_free_count - whether ubi has enough free pebs to fill fm pools
+ * left_free_count - returns the number of free pebs to fill fm pools
  * @ubi: UBI device description object
  *
- * This helper function checks whether there are enough free pebs (deducted
+ * This helper function returns the number of free pebs (deducted
  * by fastmap pebs) to fill fm_pool and fm_wl_pool.
  */
-static bool has_enough_free_count(struct ubi_device *ubi)
+static int left_free_count(struct ubi_device *ubi)
 {
 	int fm_used = 0;	// fastmap non anchor pebs.
 
 	if (!ubi->free.rb_node)
-		return false;
+		return 0;
 
 	if (!ubi->ro_mode && !ubi->fm_disabled)
 		fm_used = ubi->fm_size / ubi->leb_size - 1;
 
-	return ubi->free_count > fm_used;
+	return ubi->free_count - fm_used;
+}
+
+/*
+ * can_fill_pools - whether free PEBs will be left after filling pools
+ * @ubi: UBI device description object
+ * @free: current number of free PEBs
+ *
+ * Return %1 if there are still left free PEBs after filling pools,
+ * otherwise %0 is returned.
+ */
+static int can_fill_pools(struct ubi_device *ubi, int free)
+{
+	struct ubi_fm_pool *wl_pool = &ubi->fm_wl_pool;
+	struct ubi_fm_pool *pool = &ubi->fm_pool;
+	int pool_need = pool->max_size - pool->size +
+			wl_pool->max_size - wl_pool->size;
+
+	if (free - pool_need < 1)
+		return 0;
+
+	return 1;
 }
 
 /**
@@ -201,7 +222,7 @@ void ubi_refill_pools_and_lock(struct ubi_device *ubi)
 	for (;;) {
 		enough = 0;
 		if (pool->size < pool->max_size) {
-			if (!has_enough_free_count(ubi))
+			if (left_free_count(ubi) <= 0)
 				break;
 
 			e = wl_get_wle(ubi);
@@ -214,10 +235,13 @@ void ubi_refill_pools_and_lock(struct ubi_device *ubi)
 			enough++;
 
 		if (wl_pool->size < wl_pool->max_size) {
-			if (!has_enough_free_count(ubi))
+			int left_free = left_free_count(ubi);
+
+			if (left_free <= 0)
 				break;
 
-			e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
+			e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF,
+					  !can_fill_pools(ubi, left_free));
 			self_check_in_wl_tree(ubi, e, &ubi->free);
 			rb_erase(&e->u.rb, &ubi->free);
 			ubi->free_count--;
@@ -357,12 +381,12 @@ static bool need_wear_leveling(struct ubi_device *ubi)
 	if (!e) {
 		if (!ubi->free.rb_node)
 			return false;
-		e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
+		e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF, 0);
 		ec = e->ec;
 	} else {
 		ec = e->ec;
 		if (ubi->free.rb_node) {
-			e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
+			e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF, 0);
 			ec = max(ec, e->ec);
 		}
 	}
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index d8ae6a257af8..05157c54d5ec 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -311,12 +311,14 @@ static void prot_queue_add(struct ubi_device *ubi, struct ubi_wl_entry *e)
  * @ubi: UBI device description object
  * @root: the RB-tree where to look for
  * @diff: maximum possible difference from the smallest erase counter
+ * @pick_max: pick PEB even its erase counter beyonds 'min_ec + @diff'
  *
  * This function looks for a wear leveling entry with erase counter closest to
  * min + @diff, where min is the smallest erase counter.
  */
 static struct ubi_wl_entry *find_wl_entry(struct ubi_device *ubi,
-					  struct rb_root *root, int diff)
+					  struct rb_root *root, int diff,
+					  int pick_max)
 {
 	struct rb_node *p;
 	struct ubi_wl_entry *e;
@@ -330,9 +332,11 @@ static struct ubi_wl_entry *find_wl_entry(struct ubi_device *ubi,
 		struct ubi_wl_entry *e1;
 
 		e1 = rb_entry(p, struct ubi_wl_entry, u.rb);
-		if (e1->ec >= max)
+		if (e1->ec >= max) {
+			if (pick_max)
+				e = e1;
 			p = p->rb_left;
-		else {
+		} else {
 			p = p->rb_right;
 			e = e1;
 		}
@@ -369,7 +373,7 @@ static struct ubi_wl_entry *find_mean_wl_entry(struct ubi_device *ubi,
 		 */
 		e = may_reserve_for_fm(ubi, e, root);
 	} else
-		e = find_wl_entry(ubi, root, WL_FREE_MAX_DIFF/2);
+		e = find_wl_entry(ubi, root, WL_FREE_MAX_DIFF/2, 0);
 
 	return e;
 }
@@ -1042,7 +1046,7 @@ static int ensure_wear_leveling(struct ubi_device *ubi, int nested)
 		 * %UBI_WL_THRESHOLD.
 		 */
 		e1 = rb_entry(rb_first(&ubi->used), struct ubi_wl_entry, u.rb);
-		e2 = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
+		e2 = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF, 0);
 
 		if (!(e2->ec - e1->ec >= UBI_WL_THRESHOLD))
 			goto out_unlock;
@@ -2073,7 +2077,7 @@ static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi)
 {
 	struct ubi_wl_entry *e;
 
-	e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
+	e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF, 0);
 	self_check_in_wl_tree(ubi, e, &ubi->free);
 	ubi->free_count--;
 	ubi_assert(ubi->free_count >= 0);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
