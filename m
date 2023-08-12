Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AC8C04FE2
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Aug 2023 08:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Q8VmgaYo1k/It9RIaVI0zf2CCyOmMOB/h9pbr+dXHM=; b=HWSRH8QF83yZDW
	ypuukEDIJ9fqKiNfJ67V9845rE5svOkDdiLYADfouJZh7NS2BBowFB4xRRrOnuNUgZ9kZgc+u3Du1
	dJz6LYRIyc6J10kYMu84lhxgNcPIf+da9DKl+URC2RuS1P+MdH9dRXwKjZ23kO82TID+8absC3Aey
	OoSmZvrTzpqF0nE+K1/kPts3zaWDwSxFbM40vXsYPFTT1X75u53SKFg3yMM2EuwysFzNiEV1fY7dw
	5vRJvvGlzufKKcKDYXq6kAxPZ6w88V0IbV+McF/TNE7c0RYwvJ7FsR9DULHupD7lo43LCgLtPqL6F
	jx8EmJnaUTrOQ+A1GQKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUjbD-00Ctpz-1W;
	Sat, 12 Aug 2023 08:03:51 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUjb4-00CtkA-0R
	for linux-mtd@lists.infradead.org;
	Sat, 12 Aug 2023 08:03:46 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RNCnC3V5qz1GDXx;
	Sat, 12 Aug 2023 16:02:23 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 12 Aug
 2023 16:03:37 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 04/12] ubi: Replace erase_block() with sync_erase()
Date: Sat, 12 Aug 2023 15:59:57 +0800
Message-ID: <20230812080005.3162125-5-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230812080005.3162125-1-chengzhihao1@huawei.com>
References: <20230812080005.3162125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_010342_519932_8981F801 
X-CRM114-Status: GOOD (  12.86  )
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

Since erase_block() has same logic with sync_erase(), just replace it
with sync_erase(), also rename 'sync_erase()' to 'ubi_sync_erase()'.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/fastmap.c | 48 ++-------------------------------------
 drivers/mtd/ubi/ubi.h     |  1 +
 drivers/mtd/ubi/wl.c      |  9 ++++----
 3 files changed, 7 insertions(+), 51 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index d64bfb986d40..8f6052cb3217 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1389,50 +1389,6 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	return ret;
 }
 
-/**
- * erase_block - Manually erase a PEB.
- * @ubi: UBI device object
- * @e: the physical eraseblock to erase
- *
- * This function returns zero in case of success and a negative error code in
- * case of failure.
- */
-static int erase_block(struct ubi_device *ubi, struct ubi_wl_entry *e)
-{
-	int err;
-	struct ubi_ec_hdr *ec_hdr;
-	long long ec = e->ec;
-
-	ec_hdr = kzalloc(ubi->ec_hdr_alsize, GFP_NOFS);
-	if (!ec_hdr)
-		return -ENOMEM;
-
-	err = ubi_io_sync_erase(ubi, e->pnum, 0);
-	if (err < 0)
-		goto out;
-
-	ec += err;
-	if (ec > UBI_MAX_ERASECOUNTER) {
-		err = -EINVAL;
-		goto out;
-	}
-
-	ec_hdr->ec = cpu_to_be64(ec);
-	err = ubi_io_write_ec_hdr(ubi, e->pnum, ec_hdr);
-	if (err < 0)
-		goto out;
-
-	e->ec = ec;
-	spin_lock(&ubi->wl_lock);
-	if (e->ec > ubi->max_ec)
-		ubi->max_ec = e->ec;
-	spin_unlock(&ubi->wl_lock);
-
-out:
-	kfree(ec_hdr);
-	return err;
-}
-
 /**
  * invalidate_fastmap - destroys a fastmap.
  * @ubi: UBI device object
@@ -1573,7 +1529,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 
 		if (!tmp_e) {
 			if (old_fm && old_fm->e[i]) {
-				ret = erase_block(ubi, old_fm->e[i]);
+				ret = ubi_sync_erase(ubi, old_fm->e[i], 0);
 				if (ret < 0) {
 					ubi_err(ubi, "could not erase old fastmap PEB");
 
@@ -1625,7 +1581,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 	if (old_fm) {
 		/* no fresh anchor PEB was found, reuse the old one */
 		if (!tmp_e) {
-			ret = erase_block(ubi, old_fm->e[0]);
+			ret = ubi_sync_erase(ubi, old_fm->e[0], 0);
 			if (ret < 0) {
 				ubi_err(ubi, "could not erase old anchor PEB");
 
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index c8f1bd4fa100..2f0c0eacc013 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -902,6 +902,7 @@ int self_check_eba(struct ubi_device *ubi, struct ubi_attach_info *ai_fastmap,
 		   struct ubi_attach_info *ai_scan);
 
 /* wl.c */
+int ubi_sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e, int torture);
 int ubi_wl_get_peb(struct ubi_device *ubi);
 int ubi_wl_put_peb(struct ubi_device *ubi, int vol_id, int lnum,
 		   int pnum, int torture);
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 26a214f016c1..0c78e09d7960 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -427,7 +427,7 @@ static int prot_queue_del(struct ubi_device *ubi, int pnum)
 }
 
 /**
- * sync_erase - synchronously erase a physical eraseblock.
+ * ubi_sync_erase - synchronously erase a physical eraseblock.
  * @ubi: UBI device description object
  * @e: the physical eraseblock to erase
  * @torture: if the physical eraseblock has to be tortured
@@ -435,8 +435,7 @@ static int prot_queue_del(struct ubi_device *ubi, int pnum)
  * This function returns zero in case of success and a negative error code in
  * case of failure.
  */
-static int sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
-		      int torture)
+int ubi_sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e, int torture)
 {
 	int err;
 	struct ubi_ec_hdr *ec_hdr;
@@ -1094,7 +1093,7 @@ static int __erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk)
 	dbg_wl("erase PEB %d EC %d LEB %d:%d",
 	       pnum, e->ec, wl_wrk->vol_id, wl_wrk->lnum);
 
-	err = sync_erase(ubi, e, wl_wrk->torture);
+	err = ubi_sync_erase(ubi, e, wl_wrk->torture);
 	if (!err) {
 		spin_lock(&ubi->wl_lock);
 
@@ -1749,7 +1748,7 @@ static int erase_aeb(struct ubi_device *ubi, struct ubi_ainf_peb *aeb, bool sync
 	ubi->lookuptbl[e->pnum] = e;
 
 	if (sync) {
-		err = sync_erase(ubi, e, false);
+		err = ubi_sync_erase(ubi, e, false);
 		if (err)
 			goto out_free;
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
