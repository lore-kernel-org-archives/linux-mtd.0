Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBD5C44500
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 08:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F7V7abZ/8wwUHRK9HnSq1wjdm638EBWfN4lJ+tuUt9I=; b=ddKXFS5gzUS/2F
	jQqvkrjvRFfSA566JnwMjANpl0g5CfgxRp509hsM4NLKW08nFZddbcsirwoEkaF0dLa7E07lOQchp
	Jzepea5l83fAgxl6IviRVOc6azMmmrq0HTycXxWZoTt6Pxpa9XUW6eMjR8A56xMiWqOyX6RFdNFak
	Qiqyobv0VtDyvwh86oDq/ByFO5MtbIdqsEa9ZUoKkKoMBdZ+/TdmhCHB8VuflM5wfbRGv9sEZlicx
	f5AmEfaTtsz03VCtgLXWIY8z6i0IG7erbjmMQqfvN3nin5EZvDVwohmZnCKsFkHG251i3iFvZjxA6
	N5+23Nm/XxjD1qM3n+rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfvtc-00000008ITe-021P;
	Sat, 04 Jul 2026 08:38:44 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfvtY-00000008ISQ-1AuR
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 08:38:42 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2gIJPreUpbYliTpZcfceUFrcZHjdJt2sKV7Uw9eu274=;
	b=PqfZ4BHKZSfDe5Cv/5lAPMxgJSuKw43VoRB62H+Eo0+ZtnrZYA1V5Ohz0SKr/XjPfzFXQiJCf
	76TwE7vTiaMXhXG128Ir/ZSWLV+B7EWtHxZLW2yOMjMnn3QpFJii41KvNCXyxauaLKrBKEk085j
	hOjqrjiIpP9uCubc7C1ElS8=
Received: from canpmsgout03.his.huawei.com (unknown [172.19.92.159])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4gskX00KVHz1BFPm
	for <linux-mtd@lists.infradead.org>; Sat,  4 Jul 2026 16:37:36 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2gIJPreUpbYliTpZcfceUFrcZHjdJt2sKV7Uw9eu274=;
	b=PqfZ4BHKZSfDe5Cv/5lAPMxgJSuKw43VoRB62H+Eo0+ZtnrZYA1V5Ohz0SKr/XjPfzFXQiJCf
	76TwE7vTiaMXhXG128Ir/ZSWLV+B7EWtHxZLW2yOMjMnn3QpFJii41KvNCXyxauaLKrBKEk085j
	hOjqrjiIpP9uCubc7C1ElS8=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gskLz311nzpVdx;
	Sat,  4 Jul 2026 16:29:47 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 7A6164058F;
	Sat,  4 Jul 2026 16:38:20 +0800 (CST)
Received: from huawei.com (10.50.85.155) by whupemo200011.china.huawei.com
 (7.152.185.179) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 4 Jul
 2026 16:38:19 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, <chengzhihao1@huawei.com>,
	<yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH 1/2] UBI: Preserve torture flag when rescheduling failed erasures
Date: Sat, 4 Jul 2026 16:30:40 +0800
Message-ID: <20260704083042.459915-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260704083042.459915-1-chengzhihao1@huawei.com>
References: <20260704083042.459915-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.85.155]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_013840_689463_8E9BD731 
X-CRM114-Status: GOOD (  21.15  )
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

In __erase_worker(), when ubi_sync_erase() returns -EINTR, -ENOMEM,
-EAGAIN, or -EBUSY, the physical eraseblock is rescheduled for erasure
via schedule_erase() with the torture flag hardcoded to 0. This
unconditionally drops the torture request.

If the error occurred before torture_peb() completed (e.g., -ENOMEM
from the ec_hdr allocation in ubi_sync_erase(), errors from
self_check_not_bad()/nor_erase_prepare() in ubi_io_sync_erase(), or
torture_peb() failing mid-test because its internal do_sync_erase()/
ubi_io_read()/ubi_io_write() returned one of the above error codes),
the torture test was never finished. Such a PEB may reach the free
pool without being tortured, defeating the purpose of the torture
test for detecting marginally-bad eraseblocks.

If the error occurred after torture_peb() succeeded (the final
do_sync_erase() in ubi_io_sync_erase() or ubi_io_write_ec_hdr() in
ubi_sync_erase() failed), the torture has already been done and need
not be repeated.

Pass the torture flag by pointer to ubi_sync_erase() and
ubi_io_sync_erase(), and clear it to zero once torture_peb() has
completed successfully. __erase_worker() then forwards the updated
wl_wrk->torture to schedule_erase(): torture already done is dropped,
torture not completed is preserved across the reschedule.

Fixes: 784c145444e7 ("UBI: fix error handling in erase worker")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/attach.c  |  4 ++--
 drivers/mtd/ubi/fastmap.c |  6 +++---
 drivers/mtd/ubi/io.c      | 11 +++++++----
 drivers/mtd/ubi/ubi.h     |  4 ++--
 drivers/mtd/ubi/wl.c      | 15 +++++++++------
 5 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 0fa115cbf3ad..0ce7ff7400d3 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -771,7 +771,7 @@ void ubi_remove_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av)
 static int early_erase_peb(struct ubi_device *ubi,
 			   const struct ubi_attach_info *ai, int pnum, int ec)
 {
-	int err;
+	int err, torture = 0;
 	struct ubi_ec_hdr *ec_hdr;
 
 	if ((long long)ec >= UBI_MAX_ERASECOUNTER) {
@@ -790,7 +790,7 @@ static int early_erase_peb(struct ubi_device *ubi,
 
 	ec_hdr->ec = cpu_to_be64(ec);
 
-	err = ubi_io_sync_erase(ubi, pnum, 0);
+	err = ubi_io_sync_erase(ubi, pnum, &torture);
 	if (err < 0)
 		goto out_free;
 
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 3bce1b4d8464..98cc698d9c34 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1488,7 +1488,7 @@ static void return_fm_pebs(struct ubi_device *ubi,
  */
 int ubi_update_fastmap(struct ubi_device *ubi)
 {
-	int ret, i, j;
+	int ret, i, j, torture = 0;
 	struct ubi_fastmap_layout *new_fm, *old_fm;
 	struct ubi_wl_entry *tmp_e;
 
@@ -1526,7 +1526,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 
 		if (!tmp_e) {
 			if (old_fm && old_fm->e[i]) {
-				ret = ubi_sync_erase(ubi, old_fm->e[i], 0);
+				ret = ubi_sync_erase(ubi, old_fm->e[i], &torture);
 				if (ret < 0) {
 					ubi_err(ubi, "could not erase old fastmap PEB");
 
@@ -1578,7 +1578,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 	if (old_fm) {
 		/* no fresh anchor PEB was found, reuse the old one */
 		if (!tmp_e) {
-			ret = ubi_sync_erase(ubi, old_fm->e[0], 0);
+			ret = ubi_sync_erase(ubi, old_fm->e[0], &torture);
 			if (ret < 0) {
 				ubi_err(ubi, "could not erase old anchor PEB");
 
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 915eb64cb001..d70d1313ad4e 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -519,8 +519,10 @@ static int nor_erase_prepare(struct ubi_device *ubi, int pnum)
 /**
  * ubi_io_sync_erase - synchronously erase a physical eraseblock.
  * @ubi: UBI device description object
- * @pnum: physical eraseblock number to erase
- * @torture: if this physical eraseblock has to be tortured
+ * @pnum: the physical eraseblock number to erase
+ * @torture: if this physical eraseblock has to be tortured; cleared to zero
+ *           once the torture test has completed successfully so that a retry
+ *           of the erase does not torture the physical eraseblock again
  *
  * This function synchronously erases physical eraseblock @pnum. If @torture
  * flag is not zero, the physical eraseblock is checked by means of writing
@@ -532,7 +534,7 @@ static int nor_erase_prepare(struct ubi_device *ubi, int pnum)
  * codes in case of other errors. Note, %-EIO means that the physical
  * eraseblock is bad.
  */
-int ubi_io_sync_erase(struct ubi_device *ubi, int pnum, int torture)
+int ubi_io_sync_erase(struct ubi_device *ubi, int pnum, int *torture)
 {
 	int err, ret = 0;
 
@@ -560,10 +562,11 @@ int ubi_io_sync_erase(struct ubi_device *ubi, int pnum, int torture)
 			return err;
 	}
 
-	if (torture) {
+	if (*torture) {
 		ret = torture_peb(ubi, pnum);
 		if (ret < 0)
 			return ret;
+		*torture = 0;
 	}
 
 	err = do_sync_erase(ubi, pnum);
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index af466cd83ae0..80b762892922 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -901,7 +901,7 @@ int self_check_eba(struct ubi_device *ubi, struct ubi_attach_info *ai_fastmap,
 		   struct ubi_attach_info *ai_scan);
 
 /* wl.c */
-int ubi_sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e, int torture);
+int ubi_sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e, int *torture);
 int ubi_wl_get_peb(struct ubi_device *ubi);
 int ubi_wl_put_peb(struct ubi_device *ubi, int vol_id, int lnum,
 		   int pnum, int torture);
@@ -923,7 +923,7 @@ int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
 		int len);
 int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 		 int len);
-int ubi_io_sync_erase(struct ubi_device *ubi, int pnum, int torture);
+int ubi_io_sync_erase(struct ubi_device *ubi, int pnum, int *torture);
 int ubi_io_is_bad(const struct ubi_device *ubi, int pnum);
 int ubi_io_mark_bad(const struct ubi_device *ubi, int pnum);
 int ubi_io_read_ec_hdr(struct ubi_device *ubi, int pnum,
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index e3705db8e570..edfab98f7064 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -443,12 +443,14 @@ static int prot_queue_del(struct ubi_device *ubi, int pnum)
  * ubi_sync_erase - synchronously erase a physical eraseblock.
  * @ubi: UBI device description object
  * @e: the physical eraseblock to erase
- * @torture: if the physical eraseblock has to be tortured
+ * @torture: if the physical eraseblock has to be tortured; cleared to zero
+ *           once the torture test has completed successfully so that a retry
+ *           of the erase does not torture the physical eraseblock again
  *
  * This function returns zero in case of success and a negative error code in
  * case of failure.
  */
-int ubi_sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e, int torture)
+int ubi_sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e, int *torture)
 {
 	int err;
 	struct ubi_ec_hdr *ec_hdr;
@@ -1113,7 +1115,7 @@ static int __erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk)
 	dbg_wl("erase PEB %d EC %d LEB %d:%d",
 	       pnum, e->ec, wl_wrk->vol_id, wl_wrk->lnum);
 
-	err = ubi_sync_erase(ubi, e, wl_wrk->torture);
+	err = ubi_sync_erase(ubi, e, &wl_wrk->torture);
 	if (!err) {
 		spin_lock(&ubi->wl_lock);
 
@@ -1150,7 +1152,8 @@ static int __erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk)
 		int err1;
 
 		/* Re-schedule the LEB for erasure */
-		err1 = schedule_erase(ubi, e, vol_id, lnum, 0, true);
+		err1 = schedule_erase(ubi, e, vol_id, lnum, wl_wrk->torture,
+				      true);
 		if (err1) {
 			spin_lock(&ubi->wl_lock);
 			wl_entry_destroy(ubi, e);
@@ -1757,7 +1760,7 @@ static void shutdown_work(struct ubi_device *ubi)
 static int erase_aeb(struct ubi_device *ubi, struct ubi_ainf_peb *aeb, bool sync)
 {
 	struct ubi_wl_entry *e;
-	int err;
+	int err, torture = 0;
 
 	e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
 	if (!e)
@@ -1768,7 +1771,7 @@ static int erase_aeb(struct ubi_device *ubi, struct ubi_ainf_peb *aeb, bool sync
 	ubi->lookuptbl[e->pnum] = e;
 
 	if (sync) {
-		err = ubi_sync_erase(ubi, e, false);
+		err = ubi_sync_erase(ubi, e, &torture);
 		if (err)
 			goto out_free;
 
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
