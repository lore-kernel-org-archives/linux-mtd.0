Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07810C04FDF
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Aug 2023 08:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzjto+aRK8zNweEc4KBWHbonfu/vFYjC2WnjZ0ZOmEs=; b=m5WrGKKq9GAh9j
	xZUkN3pITmgzBdriYQPKtQgMUuBkcEop3RD/1b3mUNeHCp3ac7U3zD2ufwJBq++L7frdETdQNs7ED
	F4Mpf/QKPg8/PtYt036U2M24/o2p4nZZNwC8ZEssPo3/TEzXOdsyyftucxh2E47uHcaQiVBaYayMN
	2X8El+Hkwz8X2yQLq4oI8OkX/caSldj9jvwlfHnJprLmisbE0+sYjbKRL3cul82sxMBZdwLuyoYOl
	i0cdnokDovHK/xcTEu7oSgd/yVwVHyb/M2TuWjqJlXLZuqzIOsn1Y7ev9S5qf9RIrcJ6Ptp7qO9ZW
	DhkETU1qUCSiCTG2r+Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUjb8-00Cto3-08;
	Sat, 12 Aug 2023 08:03:46 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUjb3-00CtkG-1f
	for linux-mtd@lists.infradead.org;
	Sat, 12 Aug 2023 08:03:44 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RNCkd3ZKyzNmWv;
	Sat, 12 Aug 2023 16:00:09 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 12 Aug
 2023 16:03:38 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 06/12] ubi: fastmap: Wait until there are enough free PEBs before filling pools
Date: Sat, 12 Aug 2023 15:59:59 +0800
Message-ID: <20230812080005.3162125-7-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230812080005.3162125-1-chengzhihao1@huawei.com>
References: <20230812080005.3162125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_010341_905538_D72A7362 
X-CRM114-Status: GOOD (  14.73  )
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
The minimum number of free PEBs to wait is total reserved PEBs in UBI:
WL_RESERVED_PEBS + EBA_RESERVED_PEBS + ubi->fm_size / ubi->leb_size - 1

Besides, this patch is a preparetion for fixing large erase counter in
fastmap data block and fixing lapsed wear leveling for first 64 PEBs.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=217787
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/eba.c        |  3 --
 drivers/mtd/ubi/fastmap-wl.c | 53 ++++++++++++++++++++++++++++++++++--
 drivers/mtd/ubi/fastmap.c    |  6 +---
 drivers/mtd/ubi/ubi.h        |  5 +++-
 4 files changed, 56 insertions(+), 11 deletions(-)

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
index 4611a75f1241..18e46a1edf0a 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -97,6 +97,48 @@ struct ubi_wl_entry *ubi_wl_get_fm_peb(struct ubi_device *ubi, int anchor)
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
+	int free, expect_free, works_count;
+	/*
+	 * There are at least following free pebs which reserved by UBI:
+	 * 1. WL_RESERVED_PEBS[1]
+	 * 2. EBA_RESERVED_PEBS[1]
+	 * 3. fm pebs - 1: Twice fastmap size deducted by fastmap and fm_anchor
+	 * 4. beb_rsvd_pebs: This value should be get under lock ubi->wl_lock
+	 */
+	int min_expect_free = WL_RESERVED_PEBS + EBA_RESERVED_PEBS +
+			      ubi->fm_size / ubi->leb_size - 1;
+
+	do {
+		spin_lock(&ubi->wl_lock);
+		free = ubi->free_count;
+		free += pool->size - pool->used + wl_pool->size - wl_pool->used;
+		expect_free = min_expect_free + ubi->beb_rsvd_pebs;
+		works_count = ubi->works_count;
+		spin_unlock(&ubi->wl_lock);
+
+		/*
+		 * At least, there should be min. free PEBs to satisfy pool,
+		 * wl_pool and fastmap data PEBs.
+		 */
+		if (!works_count && free >= min_expect_free)
+			break;
+
+		do_work(ubi);
+	} while (free < expect_free);
+}
+
 /*
  * has_enough_free_count - whether ubi has enough free pebs to fill fm pools
  * @ubi: UBI device description object
@@ -119,16 +161,23 @@ static bool has_enough_free_count(struct ubi_device *ubi)
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
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
