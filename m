Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058DAC04A94
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Aug 2023 08:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GkzLKPs6mEE+I3D+v40OMqDS9jfuDNuprTIFy8yvjyE=; b=lV3kDZ6Hg5WZYV
	35XUlNQ4ZblgiNfLnyrJviCVu4XwG7WG9XnWc9ylZ4+x2InctcWG4IGklZU1UiMC3+F1FI6jNXaPr
	bhIT4enRpsfDsAaOogO3tb3I36dXbMZW1u5xJG3R5hFJp1//QoE0ggkbQSrEst4JJIqh7VCdfpvdZ
	pgmlVy9HrhwwWvJfq8bE999jwbYbPtwEBYcaPb0VgDaycgvC01fLq8dDLPClSM0fvNy/3wk5aM3fY
	clgxKc1mDKCSjMnxdamx9qj/jDTnkDAmwjKrfD5K/c8kq7etHEeOAhwOxHtA0Lb7bjUCbxsWsX9BA
	Hx6MenfACa/BG9Q2JLUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUjbC-00Ctpn-31;
	Sat, 12 Aug 2023 08:03:50 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUjb4-00CtkB-0R
	for linux-mtd@lists.infradead.org;
	Sat, 12 Aug 2023 08:03:45 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RNCnC70FJz1GDXy;
	Sat, 12 Aug 2023 16:02:23 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 12 Aug
 2023 16:03:38 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 05/12] ubi: fastmap: Use free pebs reserved for bad block handling
Date: Sat, 12 Aug 2023 15:59:58 +0800
Message-ID: <20230812080005.3162125-6-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230812080005.3162125-1-chengzhihao1@huawei.com>
References: <20230812080005.3162125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_010342_517350_E6F64664 
X-CRM114-Status: GOOD (  13.17  )
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

If new bad PEBs occur, UBI firstly consumes ubi->beb_rsvd_pebs, and then
ubi->avail_pebs, finally UBI becomes read-only if above two items are 0,
which means that the amount of PEBs for user volumes is not effected.
Besides, UBI reserves count of free PBEs is ubi->beb_rsvd_pebs while
filling wl pool or getting free PEBs, but ubi->avail_pebs is not reserved.
So ubi->beb_rsvd_pebs and ubi->avail_pebs have nothing to do with the
usage of free PEBs, UBI can use all free PEBs.

Commit 78d6d497a648 ("UBI: Move fastmap specific functions out of wl.c")
has removed beb_rsvd_pebs checking while filling pool. Now, don't reserve
ubi->beb_rsvd_pebs while filling wl_pool. This will fill more PEBs in pool
and also reduce fastmap updating frequency.

Also remove beb_rsvd_pebs checking in ubi_wl_get_fm_peb.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=217787
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/fastmap-wl.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 863f571f1adb..4611a75f1241 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -76,7 +76,7 @@ struct ubi_wl_entry *ubi_wl_get_fm_peb(struct ubi_device *ubi, int anchor)
 {
 	struct ubi_wl_entry *e = NULL;
 
-	if (!ubi->free.rb_node || (ubi->free_count - ubi->beb_rsvd_pebs < 1))
+	if (!ubi->free.rb_node)
 		goto out;
 
 	if (anchor)
@@ -100,28 +100,22 @@ struct ubi_wl_entry *ubi_wl_get_fm_peb(struct ubi_device *ubi, int anchor)
 /*
  * has_enough_free_count - whether ubi has enough free pebs to fill fm pools
  * @ubi: UBI device description object
- * @is_wl_pool: whether UBI is filling wear leveling pool
  *
  * This helper function checks whether there are enough free pebs (deducted
  * by fastmap pebs) to fill fm_pool and fm_wl_pool, above rule works after
  * there is at least one of free pebs is filled into fm_wl_pool.
- * For wear leveling pool, UBI should also reserve free pebs for bad pebs
- * handling, because there maybe no enough free pebs for user volumes after
- * producing new bad pebs.
  */
-static bool has_enough_free_count(struct ubi_device *ubi, bool is_wl_pool)
+static bool has_enough_free_count(struct ubi_device *ubi)
 {
 	int fm_used = 0;	// fastmap non anchor pebs.
-	int beb_rsvd_pebs;
 
 	if (!ubi->free.rb_node)
 		return false;
 
-	beb_rsvd_pebs = is_wl_pool ? ubi->beb_rsvd_pebs : 0;
 	if (ubi->fm_wl_pool.size > 0 && !(ubi->ro_mode || ubi->fm_disabled))
 		fm_used = ubi->fm_size / ubi->leb_size - 1;
 
-	return ubi->free_count - beb_rsvd_pebs > fm_used;
+	return ubi->free_count > fm_used;
 }
 
 /**
@@ -159,7 +153,7 @@ void ubi_refill_pools(struct ubi_device *ubi)
 	for (;;) {
 		enough = 0;
 		if (pool->size < pool->max_size) {
-			if (!has_enough_free_count(ubi, false))
+			if (!has_enough_free_count(ubi))
 				break;
 
 			e = wl_get_wle(ubi);
@@ -172,7 +166,7 @@ void ubi_refill_pools(struct ubi_device *ubi)
 			enough++;
 
 		if (wl_pool->size < wl_pool->max_size) {
-			if (!has_enough_free_count(ubi, true))
+			if (!has_enough_free_count(ubi))
 				break;
 
 			e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
