Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C05EC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 10 May 2022 12:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vhIcRi0mPReJZGOSZFTlgNtf9vEHY18qD8rT0vdFAss=; b=v7f5kva/R1+1a9
	Z64BHKce6cEOSP07TCYznqprvjigABLkUr0HzCj1rxUYXCwIJWTZy97UJDir9WSjycQSjHV4UAN45
	kLldUaKINTm1vgPE9i6giYFvYWbri618w+Pv/kjovDVY9eoAZIuN5SnMGD/YuuuakVTwzLzrHjxaN
	c2FVX7c307fVvMRezMGpB4uggsGWQCuuEZeXTFYdTvyQDWDEVIE5fEAxXAHBEd2AJvspg86gAko2M
	YcfnK1rfI4Gp6n1I+eHj7WXQJO5NQyxIxeVyAowjzJOSuQsT903CGkO0Eouw8pAJYTn/SPCx8pOCL
	l1EQ9wtiSWEJaJ1TjjQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noOoE-001nnW-B8; Tue, 10 May 2022 12:17:46 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noOoA-001nlJ-IN
 for linux-mtd@lists.infradead.org; Tue, 10 May 2022 12:17:44 +0000
Received: from kwepemi100005.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KyH8B5yCYz1JBsx;
 Tue, 10 May 2022 20:16:26 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 kwepemi100005.china.huawei.com (7.221.188.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 10 May 2022 20:17:37 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 10 May
 2022 20:17:36 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <kirill.shutemov@linux.intel.com>,
 <s.hauer@pengutronix.de>, <gregkh@linuxfoundation.org>,
 <arne.edholm@axis.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH v3 2/3] ubi: fastmap: Check wl_pool for free peb before wear
 leveling
Date: Tue, 10 May 2022 20:31:25 +0800
Message-ID: <20220510123126.1820335-3-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220510123126.1820335-1-chengzhihao1@huawei.com>
References: <20220510123126.1820335-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_051742_978856_BF937225 
X-CRM114-Status: GOOD (  15.17  )
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

UBI fetches free peb from wl_pool during wear leveling, so UBI should
check wl_pool's empty status before wear leveling. Otherwise, UBI will
miss wear leveling chances when free pebs are run out.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/fastmap-wl.c | 52 ++++++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/wl.c         | 14 ++++++++--
 drivers/mtd/ubi/wl.h         |  2 ++
 3 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 053ab52668e8..0ee452275578 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -275,6 +275,58 @@ int ubi_wl_get_peb(struct ubi_device *ubi)
 	return ret;
 }
 
+/**
+ * next_peb_for_wl - returns next PEB to be used internally by the
+ * WL sub-system.
+ *
+ * @ubi: UBI device description object
+ */
+static struct ubi_wl_entry *next_peb_for_wl(struct ubi_device *ubi)
+{
+	struct ubi_fm_pool *pool = &ubi->fm_wl_pool;
+	int pnum;
+
+	if (pool->used == pool->size)
+		return NULL;
+
+	pnum = pool->pebs[pool->used];
+	return ubi->lookuptbl[pnum];
+}
+
+/**
+ * need_wear_leveling - checks whether to trigger a wear leveling work.
+ * UBI fetches free PEB from wl_pool, we check free PEBs from both 'wl_pool'
+ * and 'ubi->free', because free PEB in 'ubi->free' tree maybe moved into
+ * 'wl_pool' by ubi_refill_pools().
+ *
+ * @ubi: UBI device description object
+ */
+static bool need_wear_leveling(struct ubi_device *ubi)
+{
+	int ec;
+	struct ubi_wl_entry *e;
+
+	if (!ubi->used.rb_node)
+		return false;
+
+	e = next_peb_for_wl(ubi);
+	if (!e) {
+		if (!ubi->free.rb_node)
+			return false;
+		e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
+		ec = e->ec;
+	} else {
+		ec = e->ec;
+		if (ubi->free.rb_node) {
+			e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
+			ec = max(ec, e->ec);
+		}
+	}
+	e = rb_entry(rb_first(&ubi->used), struct ubi_wl_entry, u.rb);
+
+	return ec - e->ec >= UBI_WL_THRESHOLD;
+}
+
 /* get_peb_for_wl - returns a PEB to be used internally by the WL sub-system.
  *
  * @ubi: UBI device description object
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index afcdacb9d0e9..55bae06cf408 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -670,7 +670,11 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 	ubi_assert(!ubi->move_from && !ubi->move_to);
 	ubi_assert(!ubi->move_to_put);
 
+#ifdef CONFIG_MTD_UBI_FASTMAP
+	if (!next_peb_for_wl(ubi) ||
+#else
 	if (!ubi->free.rb_node ||
+#endif
 	    (!ubi->used.rb_node && !ubi->scrub.rb_node)) {
 		/*
 		 * No free physical eraseblocks? Well, they must be waiting in
@@ -1003,8 +1007,6 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 static int ensure_wear_leveling(struct ubi_device *ubi, int nested)
 {
 	int err = 0;
-	struct ubi_wl_entry *e1;
-	struct ubi_wl_entry *e2;
 	struct ubi_work *wrk;
 
 	spin_lock(&ubi->wl_lock);
@@ -1017,6 +1019,13 @@ static int ensure_wear_leveling(struct ubi_device *ubi, int nested)
 	 * the WL worker has to be scheduled anyway.
 	 */
 	if (!ubi->scrub.rb_node) {
+#ifdef CONFIG_MTD_UBI_FASTMAP
+		if (!need_wear_leveling(ubi))
+			goto out_unlock;
+#else
+		struct ubi_wl_entry *e1;
+		struct ubi_wl_entry *e2;
+
 		if (!ubi->used.rb_node || !ubi->free.rb_node)
 			/* No physical eraseblocks - no deal */
 			goto out_unlock;
@@ -1032,6 +1041,7 @@ static int ensure_wear_leveling(struct ubi_device *ubi, int nested)
 
 		if (!(e2->ec - e1->ec >= UBI_WL_THRESHOLD))
 			goto out_unlock;
+#endif
 		dbg_wl("schedule wear-leveling");
 	} else
 		dbg_wl("schedule scrubbing");
diff --git a/drivers/mtd/ubi/wl.h b/drivers/mtd/ubi/wl.h
index c93a53293786..5ebe374a08ae 100644
--- a/drivers/mtd/ubi/wl.h
+++ b/drivers/mtd/ubi/wl.h
@@ -5,6 +5,8 @@
 static void update_fastmap_work_fn(struct work_struct *wrk);
 static struct ubi_wl_entry *find_anchor_wl_entry(struct rb_root *root);
 static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi);
+static struct ubi_wl_entry *next_peb_for_wl(struct ubi_device *ubi);
+static bool need_wear_leveling(struct ubi_device *ubi);
 static void ubi_fastmap_close(struct ubi_device *ubi);
 static inline void ubi_fastmap_init(struct ubi_device *ubi, int *count)
 {
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
