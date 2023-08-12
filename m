Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37ADC05051
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Aug 2023 08:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xu6I36cgnrRANhCPy1vTjRkALgQHvon3Ove2oflQ3y8=; b=J/14q0ah/nSLrM
	9nzVZ+tH1yDMxVMkQ+JCLsvtxoX8aXwuI3/XEq8+6bb5hB9PmErqbqUZgvNN4XhUbjaviS0CdLdxv
	5tnTgRZ5wwbriHzjZTOHmEWpIKqd5UO6LaKiEWrI2/QreTDUGJiT7U+anNhpMPkYudmknNWelMMP0
	dy+aEMlhg4fDJBzKp2suBguHfALORmQEV5Y1q3ln3hhbGLwApqYlMnh7e7X9rQ4ET4x9GS4oHBOls
	Jaw2vkxraoP+HiZJGTwbT1Ag0LtER0LMroeNhSD3bx5xEWfTW6gJiFgMgrsKReIrZB2i+gvSdSr+j
	Q0sTD7x0vd7uxX5sgx6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUjbF-00Ctqt-0f;
	Sat, 12 Aug 2023 08:03:53 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUjb5-00Ctkq-03
	for linux-mtd@lists.infradead.org;
	Sat, 12 Aug 2023 08:03:47 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RNClN1v7dz2Bd11;
	Sat, 12 Aug 2023 16:00:48 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 12 Aug
 2023 16:03:40 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 10/12] ubi: fastmap: Fix lapsed wear leveling for first 64 PEBs
Date: Sat, 12 Aug 2023 16:00:03 +0800
Message-ID: <20230812080005.3162125-11-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230812080005.3162125-1-chengzhihao1@huawei.com>
References: <20230812080005.3162125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_010343_406558_1878988C 
X-CRM114-Status: GOOD (  15.19  )
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

The anchor PEB must be picked from first 64 PEBs, these PEBs could have
large erase counter greater than other PEBs especially when free space
is nearly running out.
The ubi_update_fastmap will be called as long as pool/wl_pool is empty,
old anchor PEB is erased when updating fastmap. Given an UBI device with
N PEBs, free PEBs is nearly running out and pool will be filled with 1
PEB every time ubi_update_fastmap invoked. So t=N/POOL_SIZE[1]/64 means
that in worst case the erase counter of first 64 PEBs is t times greater
than other PEBs in theory.
After running fsstress for 24h, the erase counter statistics for two UBI
devices shown as follow(CONFIG_MTD_UBI_WL_THRESHOLD=128):

Device A(1024 PEBs, pool=50, wl_pool=25):
=========================================================
from              to     count      min      avg      max
---------------------------------------------------------
0        ..        9:        0        0        0        0
10       ..       99:        0        0        0        0
100      ..      999:        0        0        0        0
1000     ..     9999:        0        0        0        0
10000    ..    99999:      960    29224    29282    29362
100000   ..      inf:       64   117897   117934   117940
---------------------------------------------------------
Total               :     1024    29224    34822   117940

Device B(8192 PEBs, pool=256, wl_pool=128):
=========================================================
from              to     count      min      avg      max
---------------------------------------------------------
0        ..        9:        0        0        0        0
10       ..       99:        0        0        0        0
100      ..      999:        0        0        0        0
1000     ..     9999:     8128     2253     2321     2387
10000    ..    99999:       64    35387    35387    35388
100000   ..      inf:        0        0        0        0
---------------------------------------------------------
Total               :     8192     2253     2579    35388

The key point is reducing fastmap updating frequency by enlarging
POOL_SIZE, so let UBI reserve ubi->fm_pool.max_size PEBs during
attaching. Then POOL_SIZE will become ubi->fm_pool.max_size/2 even
in free space running out case.
Given an UBI device with 8192 PEBs(16384\8192\4096 is common
large-capacity flash), t=8192/128/64=1. The fastmap updating will
happen in either wl_pool or pool is empty, so setting fm_pool_rsv_cnt
as ubi->fm_pool.max_size can fill wl_pool in full state.

After pool reservation, running fsstress for 24h:

Device A(1024 PEBs, pool=50, wl_pool=25):
=========================================================
from              to     count      min      avg      max
---------------------------------------------------------
0        ..        9:        0        0        0        0
10       ..       99:        0        0        0        0
100      ..      999:        0        0        0        0
1000     ..     9999:        0        0        0        0
10000    ..    99999:     1024    33801    33997    34056
100000   ..      inf:        0        0        0        0
---------------------------------------------------------
Total               :     1024    33801    33997    34056

Device B(8192 PEBs, pool=256, wl_pool=128):
=========================================================
from              to     count      min      avg      max
---------------------------------------------------------
0        ..        9:        0        0        0        0
10       ..       99:        0        0        0        0
100      ..      999:        0        0        0        0
1000     ..     9999:     8192     2205     2397     2460
10000    ..    99999:        0        0        0        0
100000   ..      inf:        0        0        0        0
---------------------------------------------------------
Total               :     8192     2205     2397     2460

The difference of erase counter between first 64 PEBs and others is
under WL_FREE_MAX_DIFF(2*UBI_WL_THRESHOLD=2*128=256).
  Device A: 34056 - 33801 = 255
  Device B: 2460 - 2205 = 255

Next patch will add a switch to control whether UBI needs to reserve
PEBs for filling pool.

Fixes: dbb7d2a88d2a ("UBI: Add fastmap core")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=217787
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/build.c      | 1 +
 drivers/mtd/ubi/fastmap-wl.c | 3 ++-
 drivers/mtd/ubi/ubi.h        | 2 ++
 drivers/mtd/ubi/wl.h         | 6 ++++--
 4 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 8ee51e49fced..66d7b6a16aad 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -951,6 +951,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 		UBI_FM_MIN_POOL_SIZE);
 
 	ubi->fm_wl_pool.max_size = ubi->fm_pool.max_size / 2;
+	ubi->fm_pool_rsv_cnt = ubi->fm_pool.max_size;
 	ubi->fm_disabled = (!fm_autoconvert || disable_fm) ? 1 : 0;
 	if (fm_debug)
 		ubi_enable_dbg_chk_fastmap(ubi);
diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 937ed684e71c..61a67eaa6e33 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -124,7 +124,8 @@ static void wait_free_pebs_for_pool(struct ubi_device *ubi)
 		spin_lock(&ubi->wl_lock);
 		free = ubi->free_count;
 		free += pool->size - pool->used + wl_pool->size - wl_pool->used;
-		expect_free = min_expect_free + ubi->beb_rsvd_pebs;
+		expect_free = min_expect_free + ubi->beb_rsvd_pebs +
+			      ubi->fm_pool_rsv_cnt;
 		works_count = ubi->works_count;
 		spin_unlock(&ubi->wl_lock);
 
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 423f66c91b1d..6e20a0fee72f 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -494,6 +494,7 @@ struct ubi_debug_info {
  * @fast_attach: non-zero if UBI was attached by fastmap
  * @fm_anchor: The next anchor PEB to use for fastmap
  * @fm_do_produce_anchor: If true produce an anchor PEB in wl
+ * @fm_pool_rsv_cnt: Number of reserved PEBs for filling pool/wl_pool
  *
  * @used: RB-tree of used physical eraseblocks
  * @erroneous: RB-tree of erroneous used physical eraseblocks
@@ -604,6 +605,7 @@ struct ubi_device {
 	int fast_attach;
 	struct ubi_wl_entry *fm_anchor;
 	int fm_do_produce_anchor;
+	int fm_pool_rsv_cnt;
 
 	/* Wear-leveling sub-system's stuff */
 	struct rb_root used;
diff --git a/drivers/mtd/ubi/wl.h b/drivers/mtd/ubi/wl.h
index 5ebe374a08ae..7b6715ef6d4a 100644
--- a/drivers/mtd/ubi/wl.h
+++ b/drivers/mtd/ubi/wl.h
@@ -10,8 +10,10 @@ static bool need_wear_leveling(struct ubi_device *ubi);
 static void ubi_fastmap_close(struct ubi_device *ubi);
 static inline void ubi_fastmap_init(struct ubi_device *ubi, int *count)
 {
-	/* Reserve enough LEBs to store two fastmaps. */
-	*count += (ubi->fm_size / ubi->leb_size) * 2;
+	if (ubi->fm_disabled)
+		ubi->fm_pool_rsv_cnt = 0;
+	/* Reserve enough LEBs to store two fastmaps and to fill pools. */
+	*count += (ubi->fm_size / ubi->leb_size) * 2 + ubi->fm_pool_rsv_cnt;
 	INIT_WORK(&ubi->fm_work, update_fastmap_work_fn);
 }
 static struct ubi_wl_entry *may_reserve_for_fm(struct ubi_device *ubi,
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
