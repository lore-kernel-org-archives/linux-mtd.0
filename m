Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2C1C04FE1
	for <linux-mtd@archiver.kernel.org>; Sat, 12 Aug 2023 08:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XIAXG3Ds86fTqiXqkecTZPLuipU9OwKA3aXLLkeJ3vo=; b=vurSQQXg6Vxiix
	blfetvae1zLfBMggn4jQzH0TcQCFqypskULuBXMCBZDPCvqpoDfy6DIqoBi8k33B+MIjDsqUy7HqF
	OIFA5g6VOFKJkcLps9QshgIQWGWMrxQ6ENNUWkF4+j0nrkCUn8NS+bEeWWx4XKPYGUurxJeqxTjcl
	b7ZHFewc8JqoUJnwUjgAPMDCW8YtLYPMSn4UzFEzVng5gyrWSikPRjx4fSSnul0wuB0BGmkjBvPOP
	LLvx11rYDMvW6SrrnyhueV0tJEwouF20fCZwpKX9/Vle09QoyuKuvSKv1YAww3kOGQ9Z28Q4SNszq
	RUAH7znogNb3jCT5XyqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUjbB-00CtpJ-2w;
	Sat, 12 Aug 2023 08:03:49 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUjb3-00Ctk3-2N
	for linux-mtd@lists.infradead.org;
	Sat, 12 Aug 2023 08:03:45 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RNCkX3mPhztRrN;
	Sat, 12 Aug 2023 16:00:04 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 12 Aug
 2023 16:03:36 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 01/12] ubi: fastmap: Fix missed ec updating after erasing old fastmap data block
Date: Sat, 12 Aug 2023 15:59:54 +0800
Message-ID: <20230812080005.3162125-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230812080005.3162125-1-chengzhihao1@huawei.com>
References: <20230812080005.3162125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_010342_112745_9DFF0DAB 
X-CRM114-Status: GOOD (  14.79  )
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

After running fsstress on ubifs for a long time, UBI(16384 blocks,
fastmap takes 2 blocks) has an erase block with different erase
counters displayed from two views:

From ubiscan view: PEB 8031 has erase counter 31581
=========================================================
from              to     count      min      avg      max
---------------------------------------------------------
0        ..        9:        0        0        0        0
10       ..       99:        0        0        0        0
100      ..      999:    16383      290      315      781
1000     ..     9999:        0        0        0        0
10000    ..    99999:        1    31581    31581    31581
100000   ..      inf:        0        0        0        0
---------------------------------------------------------
Total               :    16384      290      317    31581

From detailed_erase_block_info view: PEB 8031 has erase counter 7
physical_block_number   erase_count
8030                    421
8031                    7   # mem info is different from disk info
8032                    434
8033                    425
8034                    431

Following process missed updating erase counter in wl_entry(in memory):
ubi_update_fastmap
 for (i = 1; i < new_fm->used_blocks; i++) // update fastmap data
  if (!tmp_e)
   if (old_fm && old_fm->e[i])
    erase_block(ubi, old_fm->e[i]->pnum)
     ret = ubi_io_sync_erase(ubi, pnum, 0)
     ec = be64_to_cpu(ec_hdr->ec)
     ec += ret
     ec_hdr->ec = cpu_to_be64(ec)
     ubi_io_write_ec_hdr(ubi, pnum, ec_hdr)  // ec is updated on flash
   // ec is not updated in old_fm->e[i] (in memory)

Fix it by passing wl_enter into erase_block() and updating erase
counter in erase_block().

Fixes: dbb7d2a88d2a ("UBI: Add fastmap core")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/fastmap.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 28c8151a0725..f8c230acc55e 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1392,11 +1392,12 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 /**
  * erase_block - Manually erase a PEB.
  * @ubi: UBI device object
- * @pnum: PEB to be erased
+ * @e: the physical eraseblock to erase
  *
- * Returns the new EC value on success, < 0 indicates an internal error.
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
  */
-static int erase_block(struct ubi_device *ubi, int pnum)
+static int erase_block(struct ubi_device *ubi, struct ubi_wl_entry *e)
 {
 	int ret;
 	struct ubi_ec_hdr *ec_hdr;
@@ -1406,7 +1407,7 @@ static int erase_block(struct ubi_device *ubi, int pnum)
 	if (!ec_hdr)
 		return -ENOMEM;
 
-	ret = ubi_io_read_ec_hdr(ubi, pnum, ec_hdr, 0);
+	ret = ubi_io_read_ec_hdr(ubi, e->pnum, ec_hdr, 0);
 	if (ret < 0)
 		goto out;
 	else if (ret && ret != UBI_IO_BITFLIPS) {
@@ -1414,7 +1415,7 @@ static int erase_block(struct ubi_device *ubi, int pnum)
 		goto out;
 	}
 
-	ret = ubi_io_sync_erase(ubi, pnum, 0);
+	ret = ubi_io_sync_erase(ubi, e->pnum, 0);
 	if (ret < 0)
 		goto out;
 
@@ -1426,11 +1427,16 @@ static int erase_block(struct ubi_device *ubi, int pnum)
 	}
 
 	ec_hdr->ec = cpu_to_be64(ec);
-	ret = ubi_io_write_ec_hdr(ubi, pnum, ec_hdr);
+	ret = ubi_io_write_ec_hdr(ubi, e->pnum, ec_hdr);
 	if (ret < 0)
 		goto out;
 
-	ret = ec;
+	e->ec = ec;
+	spin_lock(&ubi->wl_lock);
+	if (e->ec > ubi->max_ec)
+		ubi->max_ec = e->ec;
+	spin_unlock(&ubi->wl_lock);
+
 out:
 	kfree(ec_hdr);
 	return ret;
@@ -1576,7 +1582,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 
 		if (!tmp_e) {
 			if (old_fm && old_fm->e[i]) {
-				ret = erase_block(ubi, old_fm->e[i]->pnum);
+				ret = erase_block(ubi, old_fm->e[i]);
 				if (ret < 0) {
 					ubi_err(ubi, "could not erase old fastmap PEB");
 
@@ -1628,7 +1634,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 	if (old_fm) {
 		/* no fresh anchor PEB was found, reuse the old one */
 		if (!tmp_e) {
-			ret = erase_block(ubi, old_fm->e[0]->pnum);
+			ret = erase_block(ubi, old_fm->e[0]);
 			if (ret < 0) {
 				ubi_err(ubi, "could not erase old anchor PEB");
 
@@ -1640,7 +1646,6 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 				goto err;
 			}
 			new_fm->e[0] = old_fm->e[0];
-			new_fm->e[0]->ec = ret;
 			old_fm->e[0] = NULL;
 		} else {
 			/* we've got a new anchor PEB, return the old one */
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
