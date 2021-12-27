Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0FFC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Dec 2021 03:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1uyunDNdkq86UY9PdPH49xeAcS12Vu3bG1BxEiTTxVg=; b=NlC+xQhMR+ACnd
	z8MZAKqLDob6mr2hRkcUUep9wPu1RoOV1dFf+MadAUnKNeDnTpBQtZTjxbcW5VVg7+qzjpJGIwpN6
	EzhxU6fDwTm4G/SCAkEtxa50q0f8pwdatkf5q8O5XpzK2qEuEIjN3sXGStQWfe/i9e2sowRd+k0wf
	/Ih3hlbsn7FG2cHc+6DRUAsyNBo+z+00e/LiuvmvcWxzgc6g+MUOAEHiXqzAGZAKA0MIR5d/DGZxm
	XYinh/1f8QaSVvuqgeOMOCrBeG0Q3qP6M8THSNRmzaCvoLho+C6lFpYHL9qqXRF093kQ95Vx0sn8b
	oWbaG9Rc+MxZCRt3DHeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1gd7-00G6bu-V0; Mon, 27 Dec 2021 03:24:58 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1gQo-00G42T-WF
 for linux-mtd@lists.infradead.org; Mon, 27 Dec 2021 03:12:19 +0000
Received: from kwepemi500010.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JMjLL13VSzZdpR;
 Mon, 27 Dec 2021 11:08:58 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi500010.china.huawei.com (7.221.188.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 27 Dec 2021 11:12:13 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 27 Dec
 2021 11:12:12 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <kirill.shutemov@linux.intel.com>,
 <s.hauer@pengutronix.de>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 15/15] ubi: fastmap: Fix high cpu usage of ubi_bgt by
 making sure wl_pool not empty
Date: Mon, 27 Dec 2021 11:22:46 +0800
Message-ID: <20211227032246.2886878-16-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211227032246.2886878-1-chengzhihao1@huawei.com>
References: <20211227032246.2886878-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_191215_457502_28D27CDC 
X-CRM114-Status: GOOD (  12.26  )
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

There at least 6 PEBs reserved on UBI device:
1. EBA_RESERVED_PEBS[1]
2. WL_RESERVED_PEBS[1]
3. UBI_LAYOUT_VOLUME_EBS[2]
4. MIN_FASTMAP_RESERVED_PEBS[2]

When all ubi volumes take all their PEBs, there are 3 (EBA_RESERVED_PEBS +
WL_RESERVED_PEBS + MIN_FASTMAP_RESERVED_PEBS - MIN_FASTMAP_TAKEN_PEBS[1])
free PEBs. Since f9c34bb529975fe ("ubi: Fix producing anchor PEBs") and
4b68bf9a69d22dd ("ubi: Select fastmap anchor PEBs considering wear level
rules") applied, there is only 1 (3 - FASTMAP_ANCHOR_PEBS[1] -
FASTMAP_NEXT_ANCHOR_PEBS[1]) free PEB to fill pool and wl_pool, after
filling pool, wl_pool is always empty. So, UBI could be stuck in an
infinite loop:

	ubi_thread	   system_wq
wear_leveling_worker <--------------------------------------------------
  get_peb_for_wl							|
    // fm_wl_pool, used = size = 0					|
    schedule_work(&ubi->fm_work)					|
									|
		    update_fastmap_work_fn				|
		      ubi_update_fastmap				|
			ubi_refill_pools				|
			// ubi->free_count - ubi->beb_rsvd_pebs < 5	|
			// wl_pool is not filled with any PEBs		|
			schedule_erase(old_fm_anchor)			|
			ubi_ensure_anchor_pebs				|
			  __schedule_ubi_work(wear_leveling_worker)	|
									|
__erase_worker								|
  ensure_wear_leveling							|
    __schedule_ubi_work(wear_leveling_worker) --------------------------

, which cause high cpu usage of ubi_bgt:
top - 12:10:42 up 5 min,  2 users,  load average: 1.76, 0.68, 0.27
Tasks: 123 total,   3 running,  54 sleeping,   0 stopped,   0 zombie

  PID USER PR   NI VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
 1589 root 20   0   0      0      0 R  45.0  0.0   0:38.86 ubi_bgt0d
  319 root 20   0   0      0      0 I  15.2  0.0   0:15.29 kworker/0:3-eve
  371 root 20   0   0      0      0 I  14.9  0.0   0:12.85 kworker/3:3-eve
   20 root 20   0   0      0      0 I  11.3  0.0   0:05.33 kworker/1:0-eve
  202 root 20   0   0      0      0 I  11.3  0.0   0:04.93 kworker/2:3-eve

The fm_next_anchor always takes one free PEB to prepare for updating
fastmap, fm_anchor and fm_next_anchor are always allocated first of pool
and wl_pool, so UBI can regard these two PEBs as reserved PEBs.

Fix it by:
  1) Adding 2 PEBs reserved for fm_anchor and fm_next_anchor.
  2) Abandoning filling wl_pool until free count belows beb_rsvd_pebs.
Then, there are at least 2(EBA_RESERVED_PEBS + MIN_FASTMAP_RESERVED_PEBS -
MIN_FASTMAP_TAKEN_PEBS[1]) PEBs in pool and 1(WL_RESERVED_PEBS) PEB in
wl_pool after calling ubi_refill_pools() with all erase works done.

This modification will cause a compatibility problem with old UBI image.
If UBI volumes take the maximun number of PEBs for one certain UBI device,
there are no available PEBs to satisfy 2 new reserved PEBs, bad reserved
PEBs are taken firstly, if still not enough, ENOSPC will returned from ubi
initialization.

Fetch a reproducer in [Link].

Fixes: f9c34bb529975fe ("ubi: Fix producing anchor PEBs")
Fixes: 4b68bf9a69d22dd ("ubi: Select fastmap anchor PEBs ... rules")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=215407
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/fastmap-wl.c |  5 +++--
 drivers/mtd/ubi/wl.h         | 11 +++++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 28f55f9cf715..18f23e76fee9 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -134,7 +134,8 @@ void ubi_refill_pools(struct ubi_device *ubi)
 	for (;;) {
 		enough = 0;
 		if (pool->size < pool->max_size) {
-			if (!ubi->free.rb_node)
+			if (!ubi->free.rb_node ||
+			    (ubi->free_count <= ubi->beb_rsvd_pebs))
 				break;
 
 			e = wl_get_wle(ubi);
@@ -148,7 +149,7 @@ void ubi_refill_pools(struct ubi_device *ubi)
 
 		if (wl_pool->size < wl_pool->max_size) {
 			if (!ubi->free.rb_node ||
-			   (ubi->free_count - ubi->beb_rsvd_pebs < 5))
+			    (ubi->free_count <= ubi->beb_rsvd_pebs))
 				break;
 
 			e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
diff --git a/drivers/mtd/ubi/wl.h b/drivers/mtd/ubi/wl.h
index c93a53293786..e6c8f68d5ffb 100644
--- a/drivers/mtd/ubi/wl.h
+++ b/drivers/mtd/ubi/wl.h
@@ -2,14 +2,21 @@
 #ifndef UBI_WL_H
 #define UBI_WL_H
 #ifdef CONFIG_MTD_UBI_FASTMAP
+
+/* Number of physical eraseblocks for fm anchor */
+#define FASTMAP_ANCHOR_PEBS 1
+/* Number of physical eraseblocks for next fm anchor */
+#define FASTMAP_NEXT_ANCHOR_PEBS 1
+
 static void update_fastmap_work_fn(struct work_struct *wrk);
 static struct ubi_wl_entry *find_anchor_wl_entry(struct rb_root *root);
 static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi);
 static void ubi_fastmap_close(struct ubi_device *ubi);
 static inline void ubi_fastmap_init(struct ubi_device *ubi, int *count)
 {
-	/* Reserve enough LEBs to store two fastmaps. */
-	*count += (ubi->fm_size / ubi->leb_size) * 2;
+	/* Reserve enough LEBs to store two fastmaps and anchor fm pebs */
+	*count += (ubi->fm_size / ubi->leb_size) * 2 +
+		  FASTMAP_ANCHOR_PEBS + FASTMAP_NEXT_ANCHOR_PEBS;
 	INIT_WORK(&ubi->fm_work, update_fastmap_work_fn);
 }
 static struct ubi_wl_entry *may_reserve_for_fm(struct ubi_device *ubi,
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
