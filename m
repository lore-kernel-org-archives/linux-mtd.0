Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDAAC71153
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Aug 2023 06:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lOGS6wW/UcVTJeauHbEplZoieyCT0hV4nkiTSsvHjCU=; b=xiBd/OJ7afACme
	z0rcbGmGK0r3EPrp5ZybWe6OmiNUKlWdR1e/qfgPN14ybjKS8AkB0/o33yD6VgCJ8ivrx4F5uGmfj
	QSpbJAxrLIwuGG2yLIivH12pftxVwtvJnMRUCg0cBZi6DCUUDatSka26+CUzU4i5l/DRWfg2hyhrW
	0SE5rbr2PvlRLADohe69c8rG5dGD3KmyiZaX3uZttJg5ptQE+58h1Cgwj/5lzvgBhC5BHr7/w80rj
	5OPbgbC2R6RHKjRlq6qr1q36y3sGIXzcqnS1+Zk1vJ1gN0lEuYceB+8BE6cWSsUCj9ASu0XxGhiCI
	JYPuDmK6AqERbuTttaGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVyD-008yJ6-0l;
	Mon, 28 Aug 2023 06:43:29 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVy5-008yB5-16;
	Mon, 28 Aug 2023 06:43:24 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RZ1B65wr5zhZG8;
	Mon, 28 Aug 2023 14:39:26 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 28 Aug
 2023 14:43:15 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <linux-mtd@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <bagasdotme@gmail.com>
Subject: [PATCH v2 06/12] ubi: fastmap: Wait until there are enough free PEBs before filling pools
Date: Mon, 28 Aug 2023 14:38:39 +0800
Message-ID: <20230828063845.3142561-7-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230828063845.3142561-1-chengzhihao1@huawei.com>
References: <20230828063845.3142561-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_234321_762515_E9B92522 
X-CRM114-Status: GOOD (  19.16  )
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

Wait until there are enough free PEBs before filling pool/wl_pool,
sometimes erase_worker is not scheduled in time, which causes two
situations:
 A. There are few PEBs filled in pool, which makes ubi_update_fastmap
    is frequently called and leads first 64 PEBs are erased more times
    than other PEBs. So waiting free PEBs before filling pool reduces
    fastmap updating frequency and prolongs flash service life.
 B. In situation that space is nearly running out, ubi_refill_pools()
    cannot make sure pool and wl_pool are filled with free PEBs, caused
    by the delay of erase_worker. After this patch applied, there must
    exist free PEBs in pool after one call of ubi_update_fastmap.

Besides, this patch is a preparetion for fixing large erase counter in
fastmap data block and fixing lapsed wear leveling for first 64 PEBs.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=217787
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 v1->v2: Change waiting conditions.
 drivers/mtd/ubi/eba.c        |  3 --
 drivers/mtd/ubi/fastmap-wl.c | 53 ++++++++++++++++++++++++++++++++++--
 drivers/mtd/ubi/fastmap.c    |  6 +---
 drivers/mtd/ubi/ubi.h        |  5 +++-
 drivers/mtd/ubi/wl.c         | 14 +++++++---
 5 files changed, 65 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 655ff41863e2..8d1f0e05892c 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -33,9 +33,6 @@
 #include <linux/err.h>
 #include "ubi.h"
 
-/* Number of physical eraseblocks reserved for atomic LEB change operation */
-#define EBA_RESERVED_PEBS 1
-
 /**
  * struct ubi_eba_entry - structure encoding a single LEB -> PEB association
  * @pnum: the physical eraseblock number attached to the LEB
diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 4611a75f1241..12854717915a 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -97,6 +97,46 @@ struct ubi_wl_entry *ubi_wl_get_fm_peb(struct ubi_device *ubi, int anchor)
 	return e;
 }
 
+/*
+ * wait_free_pebs_for_pool - wait until there enough free pebs
+ * @ubi: UBI device description object
+ *
+ * Wait and execute do_work until there are enough free pebs, fill pool
+ * as much as we can. This will reduce pool refilling times, which can
+ * reduce the fastmap updating frequency.
+ */
+static void wait_free_pebs_for_pool(struct ubi_device *ubi)
+{
+	struct ubi_fm_pool *wl_pool = &ubi->fm_wl_pool;
+	struct ubi_fm_pool *pool = &ubi->fm_pool;
+	int free, expect_free, executed;
+	/*
+	 * There are at least following free pebs which reserved by UBI:
+	 * 1. WL_RESERVED_PEBS[1]
+	 * 2. EBA_RESERVED_PEBS[1]
+	 * 3. fm pebs - 1: Twice fastmap size deducted by fastmap and fm_anchor
+	 * 4. beb_rsvd_pebs: This value should be get under lock ubi->wl_lock
+	 */
+	int reserved = WL_RESERVED_PEBS + EBA_RESERVED_PEBS +
+		       ubi->fm_size / ubi->leb_size - 1;
+
+	do {
+		spin_lock(&ubi->wl_lock);
+		free = ubi->free_count;
+		free += pool->size - pool->used + wl_pool->size - wl_pool->used;
+		expect_free = reserved + ubi->beb_rsvd_pebs;
+		spin_unlock(&ubi->wl_lock);
+
+		/*
+		 * Break out if there are no works or work is executed failure,
+		 * given the fact that erase_worker will schedule itself when
+		 * -EBUSY is returned from mtd layer caused by system shutdown.
+		 */
+		if (do_work(ubi, &executed) || !executed)
+			break;
+	} while (free < expect_free);
+}
+
 /*
  * has_enough_free_count - whether ubi has enough free pebs to fill fm pools
  * @ubi: UBI device description object
@@ -119,16 +159,23 @@ static bool has_enough_free_count(struct ubi_device *ubi)
 }
 
 /**
- * ubi_refill_pools - refills all fastmap PEB pools.
+ * ubi_refill_pools_and_lock - refills all fastmap PEB pools and takes fm locks.
  * @ubi: UBI device description object
  */
-void ubi_refill_pools(struct ubi_device *ubi)
+void ubi_refill_pools_and_lock(struct ubi_device *ubi)
 {
 	struct ubi_fm_pool *wl_pool = &ubi->fm_wl_pool;
 	struct ubi_fm_pool *pool = &ubi->fm_pool;
 	struct ubi_wl_entry *e;
 	int enough;
 
+	if (!ubi->ro_mode && !ubi->fm_disabled)
+		wait_free_pebs_for_pool(ubi);
+
+	down_write(&ubi->fm_protect);
+	down_write(&ubi->work_sem);
+	down_write(&ubi->fm_eba_sem);
+
 	spin_lock(&ubi->wl_lock);
 
 	return_unused_pool_pebs(ubi, wl_pool);
@@ -204,7 +251,7 @@ static int produce_free_peb(struct ubi_device *ubi)
 
 	while (!ubi->free.rb_node && ubi->works_count) {
 		dbg_wl("do one work synchronously");
-		err = do_work(ubi);
+		err = do_work(ubi, NULL);
 
 		if (err)
 			return err;
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 8f6052cb3217..2a728c31e6b8 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1491,11 +1491,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 	struct ubi_fastmap_layout *new_fm, *old_fm;
 	struct ubi_wl_entry *tmp_e;
 
-	down_write(&ubi->fm_protect);
-	down_write(&ubi->work_sem);
-	down_write(&ubi->fm_eba_sem);
-
-	ubi_refill_pools(ubi);
+	ubi_refill_pools_and_lock(ubi);
 
 	if (ubi->ro_mode || ubi->fm_disabled) {
 		up_write(&ubi->fm_eba_sem);
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 2f0c0eacc013..423f66c91b1d 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -82,6 +82,9 @@ void ubi_err(const struct ubi_device *ubi, const char *fmt, ...);
 #define UBI_DFS_DIR_NAME "ubi%d"
 #define UBI_DFS_DIR_LEN  (3 + 2 + 1)
 
+/* Number of physical eraseblocks reserved for atomic LEB change operation */
+#define EBA_RESERVED_PEBS 1
+
 /*
  * Error codes returned by the I/O sub-system.
  *
@@ -915,7 +918,7 @@ struct ubi_wl_entry *ubi_wl_get_fm_peb(struct ubi_device *ubi, int anchor);
 int ubi_wl_put_fm_peb(struct ubi_device *ubi, struct ubi_wl_entry *used_e,
 		      int lnum, int torture);
 int ubi_is_erase_work(struct ubi_work *wrk);
-void ubi_refill_pools(struct ubi_device *ubi);
+void ubi_refill_pools_and_lock(struct ubi_device *ubi);
 int ubi_ensure_anchor_pebs(struct ubi_device *ubi);
 int ubi_bitflip_check(struct ubi_device *ubi, int pnum, int force_scrub);
 
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 0c78e09d7960..14edb65ce6a6 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -181,11 +181,13 @@ static void wl_entry_destroy(struct ubi_device *ubi, struct ubi_wl_entry *e)
 /**
  * do_work - do one pending work.
  * @ubi: UBI device description object
+ * @executed: whether there is one work is executed
  *
  * This function returns zero in case of success and a negative error code in
- * case of failure.
+ * case of failure. If @executed is not NULL and there is one work executed,
+ * @executed is set as %1, otherwise @executed is set as %0.
  */
-static int do_work(struct ubi_device *ubi)
+static int do_work(struct ubi_device *ubi, int *executed)
 {
 	int err;
 	struct ubi_work *wrk;
@@ -203,9 +205,13 @@ static int do_work(struct ubi_device *ubi)
 	if (list_empty(&ubi->works)) {
 		spin_unlock(&ubi->wl_lock);
 		up_read(&ubi->work_sem);
+		if (executed)
+			*executed = 0;
 		return 0;
 	}
 
+	if (executed)
+		*executed = 1;
 	wrk = list_entry(ubi->works.next, struct ubi_work, list);
 	list_del(&wrk->list);
 	ubi->works_count -= 1;
@@ -1685,7 +1691,7 @@ int ubi_thread(void *u)
 		}
 		spin_unlock(&ubi->wl_lock);
 
-		err = do_work(ubi);
+		err = do_work(ubi, NULL);
 		if (err) {
 			ubi_err(ubi, "%s: work failed with error code %d",
 				ubi->bgt_name, err);
@@ -2096,7 +2102,7 @@ static int produce_free_peb(struct ubi_device *ubi)
 		spin_unlock(&ubi->wl_lock);
 
 		dbg_wl("do one work synchronously");
-		err = do_work(ubi);
+		err = do_work(ubi, NULL);
 
 		spin_lock(&ubi->wl_lock);
 		if (err)
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
