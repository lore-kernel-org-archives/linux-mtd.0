Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252ACC5DF82
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2026 10:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8t66RRUl4OgWg9GUZKapv5Pn9xGAJcS0lP9OYIn8FRI=; b=1HkGCj5thxQRrd
	nVcIyMyBlna67JP2iJ4cag8kXbDv0hNpyzn30xQq8d9EaHAaUiWY49Nqw3umfdgba+1ykgFOXe1g0
	QTJwsWaGaGbV1qzJFTcVwVOZQmNeNnm+Uin9sjE7cqO2FoxAVcykoOfhwg/3SqAoyo9B/hzFbOE1/
	CBiF3TOMi6hyw8xkXQgNQIxhdbR/UVOqpk3gi7aObutU5lgqdR4ThltArFSDSTJL4og94Oy+2I4YM
	WMQJCVrbw+nh8+QJ9cGWtl6A3wPWh7N15nFXGcwRwrES0ADNDucndun5bQL2eHm7inyDabgRd5me7
	yFgW7rApGF0Vy2Y9ZWrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0SL-0000000BOb4-0xbP;
	Thu, 20 Aug 2026 10:57:09 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0SH-0000000BOYF-44Sg
	for linux-mtd@lists.infradead.org;
	Thu, 20 Aug 2026 10:57:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=quF9NbDt4UT4axTaHFsmKw/ynG1LA3xITgMxyw7ruVA=;
	b=XgLrhPFOqBO51eUXgJ2ZLYpR5MUCQHvTRv5ZV/N/JfHQrMP4M4HuhTd/mMpb89J5qwdxo5qfu
	CfGyN4d5XHND6gkPA+6Gy0vENi5FKeD4vnBYk+nff0WAU4cyAE6ngqnJR00/CKZ2BG1TuwUbR7d
	e+7thHf81upk5wfVFsCoIsU=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hQg8l5PCkz1K96b;
	Thu, 20 Aug 2026 18:46:15 +0800 (CST)
Received: from dggpemr100018.china.huawei.com (unknown [7.185.36.64])
	by mail.maildlp.com (Postfix) with ESMTPS id D27AB40572;
	Thu, 20 Aug 2026 18:56:57 +0800 (CST)
Received: from huawei.com (10.50.85.155) by dggpemr100018.china.huawei.com
 (7.185.36.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 20 Aug
 2026 18:56:57 +0800
From: zhouminqiang <zhouminqiang2@huawei.com>
To: <dwmw2@infradead.org>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH 1/6] jffs2: replace per-superblock verify buffer with per-write buffer
Date: Thu, 20 Aug 2026 18:49:57 +0800
Message-ID: <20260820105003.2525647-2-zhouminqiang2@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260820105003.2525647-1-zhouminqiang2@huawei.com>
References: <20260820105003.2525647-1-zhouminqiang2@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.85.155]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemr100018.china.huawei.com (7.185.36.64)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_035706_612250_8F3D12B0 
X-CRM114-Status: GOOD (  15.54  )
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

Subsequent patches will extend write verification to additional write
paths that may execute concurrently. A shared per-superblock buffer
would require a coarse lock to serialize all verification, hurting
concurrency.

To avoid this contention, remove the wbuf_verify field from
jffs2_sb_info, along with the scattered kmalloc/kfree of wbuf_verify
in jffs2_nand_flash_setup, jffs2_dataflash_setup,
jffs2_nor_wbuf_flash_setup and their corresponding cleanup functions.

Instead, allocate a temporary buffer inside jffs2_verify_write(),
giving each invocation its own buffer and eliminating the shared state.

Signed-off-by: zhouminqiang <zhouminqiang2@huawei.com>
---
 fs/jffs2/jffs2_fs_sb.h |  3 ---
 fs/jffs2/wbuf.c        | 61 ++++++++++++++++--------------------------
 2 files changed, 23 insertions(+), 41 deletions(-)

diff --git a/fs/jffs2/jffs2_fs_sb.h b/fs/jffs2/jffs2_fs_sb.h
index 5a7091746f68..8a75870d3fc8 100644
--- a/fs/jffs2/jffs2_fs_sb.h
+++ b/fs/jffs2/jffs2_fs_sb.h
@@ -124,9 +124,6 @@ struct jffs2_sb_info {
 
 	uint32_t wbuf_pagesize; /* 0 for NOR and other flashes with no wbuf */
 
-#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
-	unsigned char *wbuf_verify; /* read-back buffer for verification */
-#endif
 #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 	unsigned char *wbuf; /* Write-behind buffer for NAND flash */
 	uint32_t wbuf_ofs;
diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 3b7803c75d58..7e4608b43a4e 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -15,6 +15,7 @@
 
 #include <linux/kernel.h>
 #include <linux/slab.h>
+#include <linux/vmalloc.h>
 #include <linux/mtd/mtd.h>
 #include <linux/crc32.h>
 #include <linux/mtd/rawnand.h>
@@ -233,19 +234,30 @@ static int jffs2_verify_write(struct jffs2_sb_info *c, unsigned char *buf,
 	int ret;
 	size_t retlen;
 	char *eccstr;
+	void *verify_buf;
 
-	ret = mtd_read(c->mtd, ofs, c->wbuf_pagesize, &retlen, c->wbuf_verify);
+	verify_buf = __vmalloc(c->wbuf_pagesize, GFP_NOFS);
+	if (!verify_buf) {
+		pr_warn("%s(): verify buffer allocation failed, skipping verification\n",
+			__func__);
+		return 0;
+	}
+
+	ret = mtd_read(c->mtd, ofs, c->wbuf_pagesize, &retlen, verify_buf);
 	if (ret && ret != -EUCLEAN && ret != -EBADMSG) {
 		pr_warn("%s(): Read back of page at %08x failed: %d\n",
 			__func__, c->wbuf_ofs, ret);
-		return ret;
+		goto out_free;
 	} else if (retlen != c->wbuf_pagesize) {
 		pr_warn("%s(): Read back of page at %08x gave short read: %zd not %d\n",
 			__func__, ofs, retlen, c->wbuf_pagesize);
-		return -EIO;
+		ret = -EIO;
+		goto out_free;
+	}
+	if (!memcmp(buf, verify_buf, c->wbuf_pagesize)) {
+		ret = 0;
+		goto out_free;
 	}
-	if (!memcmp(buf, c->wbuf_verify, c->wbuf_pagesize))
-		return 0;
 
 	if (ret == -EUCLEAN)
 		eccstr = "corrected";
@@ -261,9 +273,14 @@ static int jffs2_verify_write(struct jffs2_sb_info *c, unsigned char *buf,
 
 	pr_warn("Read back:\n");
 	print_hex_dump(KERN_WARNING, "", DUMP_PREFIX_OFFSET, 16, 1,
-		       c->wbuf_verify, c->wbuf_pagesize, 0);
+		       verify_buf, c->wbuf_pagesize, 0);
 
+	vfree(verify_buf);
 	return -EIO;
+
+out_free:
+	vfree(verify_buf);
+	return ret;
 }
 #else
 #define jffs2_verify_write(c,b,o) (0)
@@ -1214,22 +1231,11 @@ int jffs2_nand_flash_setup(struct jffs2_sb_info *c)
 		return -ENOMEM;
 	}
 
-#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
-	c->wbuf_verify = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
-	if (!c->wbuf_verify) {
-		kfree(c->oobbuf);
-		kfree(c->wbuf);
-		return -ENOMEM;
-	}
-#endif
 	return 0;
 }
 
 void jffs2_nand_flash_cleanup(struct jffs2_sb_info *c)
 {
-#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
-	kfree(c->wbuf_verify);
-#endif
 	kfree(c->wbuf);
 	kfree(c->oobbuf);
 }
@@ -1269,14 +1275,6 @@ int jffs2_dataflash_setup(struct jffs2_sb_info *c) {
 	if (!c->wbuf)
 		return -ENOMEM;
 
-#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
-	c->wbuf_verify = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
-	if (!c->wbuf_verify) {
-		kfree(c->wbuf);
-		return -ENOMEM;
-	}
-#endif
-
 	pr_info("write-buffering enabled buffer (%d) erasesize (%d)\n",
 		c->wbuf_pagesize, c->sector_size);
 
@@ -1284,9 +1282,6 @@ int jffs2_dataflash_setup(struct jffs2_sb_info *c) {
 }
 
 void jffs2_dataflash_cleanup(struct jffs2_sb_info *c) {
-#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
-	kfree(c->wbuf_verify);
-#endif
 	kfree(c->wbuf);
 }
 
@@ -1306,20 +1301,10 @@ int jffs2_nor_wbuf_flash_setup(struct jffs2_sb_info *c) {
 	if (!c->wbuf)
 		return -ENOMEM;
 
-#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
-	c->wbuf_verify = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
-	if (!c->wbuf_verify) {
-		kfree(c->wbuf);
-		return -ENOMEM;
-	}
-#endif
 	return 0;
 }
 
 void jffs2_nor_wbuf_flash_cleanup(struct jffs2_sb_info *c) {
-#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
-	kfree(c->wbuf_verify);
-#endif
 	kfree(c->wbuf);
 }
 
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
