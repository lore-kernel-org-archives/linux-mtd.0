Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23684C54722
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2024 03:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s1/7v4Hj8VVmoXk5zfNclu8ywfBG4hrf0BCf6uNUyTY=; b=a3QHcjcvRrOcWT
	Wjd2IwiXTC2BBTonvEaAMhDCl0ncPF4+ta9kAJ75ZpTbRH92HoVNQRZP5YDk4iSfFV/gdsYcTaB2D
	JmQetECvuVcHY8P/xlXdEC/SaqR7zpCEF9atAMQsh076fysMY9OeUgs04jcfU59gQdROAy53evKB/
	VGrJPy4yaLUDTEt9KZFU/uguxLR6lNOwUIwr3TNCvuo0pYXv5N4hcnPd713SXmXyeEHQwd/ZWWB3H
	dh9m93tjRjPSpr2o5nZcgiScCQ6lvCVNoCZwccq4MzIj46ZOJj06ZgGn/urax0j6glqDC/uzOp95p
	2l6ICXSCsaaZA6iyjguA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sft6x-00000000DN8-3wIQ;
	Mon, 19 Aug 2024 03:31:16 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sft6q-00000000DIV-1oux
	for linux-mtd@lists.infradead.org;
	Mon, 19 Aug 2024 03:31:11 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WnJ0S1mh4zQq5Y;
	Mon, 19 Aug 2024 11:26:16 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id C70E61800C4;
	Mon, 19 Aug 2024 11:30:55 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 19 Aug
 2024 11:30:55 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <daniel@makrotopia.org>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] ubi: fastmap: wl: Schedule fm_work if wear-leveling pool is empty
Date: Mon, 19 Aug 2024 11:26:22 +0800
Message-ID: <20240819032622.2241165-3-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240819032622.2241165-1-chengzhihao1@huawei.com>
References: <20240819032622.2241165-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_203109_053167_F196A5DB 
X-CRM114-Status: GOOD (  13.83  )
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

Since commit 14072ee33d5a ("ubi: fastmap: Check wl_pool for free peb
before wear leveling"), wear_leveling_worker() won't schedule fm_work
if wear-leveling pool is empty, which could temporarily disable the
wear-leveling until the fastmap is updated(eg. pool becomes empty).
Fix it by scheduling fm_work if wl_pool is empty during wear-leveing.

Fixes: 14072ee33d5a ("ubi: fastmap: Check wl_pool for free peb before wear leveling")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/fastmap-wl.c | 19 ++++++++++++++++---
 drivers/mtd/ubi/wl.c         |  2 +-
 drivers/mtd/ubi/wl.h         |  3 ++-
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index 2a9cc9413c42..9bdb6525f128 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -346,14 +346,27 @@ int ubi_wl_get_peb(struct ubi_device *ubi)
  * WL sub-system.
  *
  * @ubi: UBI device description object
+ * @need_fill: whether to fill wear-leveling pool when no PEBs are found
  */
-static struct ubi_wl_entry *next_peb_for_wl(struct ubi_device *ubi)
+static struct ubi_wl_entry *next_peb_for_wl(struct ubi_device *ubi,
+					    bool need_fill)
 {
 	struct ubi_fm_pool *pool = &ubi->fm_wl_pool;
 	int pnum;
 
-	if (pool->used == pool->size)
+	if (pool->used == pool->size) {
+		if (need_fill && !ubi->fm_work_scheduled) {
+			/*
+			 * We cannot update the fastmap here because this
+			 * function is called in atomic context.
+			 * Let's fail here and refill/update it as soon as
+			 * possible.
+			 */
+			ubi->fm_work_scheduled = 1;
+			schedule_work(&ubi->fm_work);
+		}
 		return NULL;
+	}
 
 	pnum = pool->pebs[pool->used];
 	return ubi->lookuptbl[pnum];
@@ -375,7 +388,7 @@ static bool need_wear_leveling(struct ubi_device *ubi)
 	if (!ubi->used.rb_node)
 		return false;
 
-	e = next_peb_for_wl(ubi);
+	e = next_peb_for_wl(ubi, false);
 	if (!e) {
 		if (!ubi->free.rb_node)
 			return false;
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 8a26968aba11..fbd399cf6503 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -683,7 +683,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 	ubi_assert(!ubi->move_to_put);
 
 #ifdef CONFIG_MTD_UBI_FASTMAP
-	if (!next_peb_for_wl(ubi) ||
+	if (!next_peb_for_wl(ubi, true) ||
 #else
 	if (!ubi->free.rb_node ||
 #endif
diff --git a/drivers/mtd/ubi/wl.h b/drivers/mtd/ubi/wl.h
index 7b6715ef6d4a..a69169c35e31 100644
--- a/drivers/mtd/ubi/wl.h
+++ b/drivers/mtd/ubi/wl.h
@@ -5,7 +5,8 @@
 static void update_fastmap_work_fn(struct work_struct *wrk);
 static struct ubi_wl_entry *find_anchor_wl_entry(struct rb_root *root);
 static struct ubi_wl_entry *get_peb_for_wl(struct ubi_device *ubi);
-static struct ubi_wl_entry *next_peb_for_wl(struct ubi_device *ubi);
+static struct ubi_wl_entry *next_peb_for_wl(struct ubi_device *ubi,
+					    bool need_fill);
 static bool need_wear_leveling(struct ubi_device *ubi);
 static void ubi_fastmap_close(struct ubi_device *ubi);
 static inline void ubi_fastmap_init(struct ubi_device *ubi, int *count)
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
