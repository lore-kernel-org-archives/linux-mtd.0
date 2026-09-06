Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5E0C79FA2
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Sep 2026 03:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIRsyIqQIqrTNscMBJ6XFqC4TTxaWKNh5S4Zo8tqpg0=; b=DeP8Va07QCrvaR
	INnmpug4TKnCUOOALlmbvIVqMD3lXLqVkRbpFJ7Cui0djnomyLn0PgQfFN/MSWBm4rJyxtbFUYLVC
	uovIyJFdsHRkInUbpuM6atHNYq1pm9+fxM62rFXuGfW0BQV97U404JbnoXMK6QelKQB0+pAfbmocK
	O3KMsFrpLeFRUGRSBz+Ot96WMiCGvvvgF3qXt9FfJOn4kxMgxELtuPenELJIgcda279QJm4H4kr/q
	Gd1TAXZImiODNPu/Sexy79JHpZ8tqmQso87WdzE/UWwdm8tTAGoXaV8X6800Sl2KSdvziQoL+HQpr
	eLOekRuOHl+BGAmAwgxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33JW-00000004aw6-3Y4W;
	Sun, 06 Sep 2026 03:13:02 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33JI-00000004aib-1oPz;
	Sun, 06 Sep 2026 03:12:50 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hcwGK5XsjzKHMRW;
	Sun,  6 Sep 2026 11:11:37 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id AE05C4056B;
	Sun,  6 Sep 2026 11:12:35 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.85.155])
	by APP1 (Coremail) with UTF8SMTPSA id cCh0CgBnUAsW2pxqmzytAw--.18069S7;
	Sun, 06 Sep 2026 11:12:35 +0800 (CST)
From: Zhou Minqiang <zhouminqiang2@huawei.com>
To: linux@armlinux.org.uk,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com,
	maddy@linux.ibm.com,
	dwmw2@infradead.org,
	richard@nod.at
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-mtd@lists.infradead.org,
	chengzhihao1@huawei.com,
	yangerkun@huawei.com,
	yi.zhang@huawei.com,
	zhouminqiang <zhouminqiang2@huawei.com>
Subject: [PATCH v4 3/8] jffs2: replace per-superblock verify buffer with per-write buffer
Date: Sun,  6 Sep 2026 11:03:39 +0800
Message-ID: <20260906030344.2448622-4-zhouminqiang2@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260906030344.2448622-1-zhouminqiang2@huawei.com>
References: <20260906030344.2448622-1-zhouminqiang2@huawei.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgBnUAsW2pxqmzytAw--.18069S7
X-Coremail-Antispam: 1UD129KBjvJXoWxCr4UKry8KFyrGr45tr13Arb_yoWrtw45pF
	sayF13Ar48JryxWrs5tFn5Cw15KrW8Gr1Igr47C348Xa18tr1Iqa4rtFy8ZrWrArZ7Wr1S
	ka9Ikw1rXF1UX37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmGb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUWw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7
	xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Y
	z7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2
	AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l42xK82IY64kExVAvwVAq07x20xyl4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
	WUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
	Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
	JrUvcSsGvfC2KfnxnUUI43ZEXa7IUbdMaUUUUUU==
X-CM-SenderInfo: 52kr3z5lqtxttqj6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_201248_841111_7E83806C 
X-CRM114-Status: GOOD (  12.95  )
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

From: zhouminqiang <zhouminqiang2@huawei.com>

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
index ab247117ec77..7e52241de457 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -233,19 +233,31 @@ static int jffs2_verify_write(struct jffs2_sb_info *c, unsigned char *buf,
 	int ret;
 	size_t retlen;
 	char *eccstr;
+	void *verify_buf;
+
+	verify_buf = kmalloc(c->wbuf_pagesize, GFP_NOFS);
+	if (!verify_buf) {
+		pr_warn("%s(): verify buffer allocation failed, skipping verification\n",
+			__func__);
+		return 0;
+	}
+
+	ret = mtd_read(c->mtd, ofs, c->wbuf_pagesize, &retlen, verify_buf);
 
-	ret = mtd_read(c->mtd, ofs, c->wbuf_pagesize, &retlen, c->wbuf_verify);
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
 
+	kfree(verify_buf);
 	return -EIO;
+
+out_free:
+	kfree(verify_buf);
+	return ret;
 }
 #else
 #define jffs2_verify_write(c,b,o) (0)
@@ -1217,22 +1234,11 @@ int jffs2_nand_flash_setup(struct jffs2_sb_info *c)
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
@@ -1272,14 +1278,6 @@ int jffs2_dataflash_setup(struct jffs2_sb_info *c) {
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
 
@@ -1287,9 +1285,6 @@ int jffs2_dataflash_setup(struct jffs2_sb_info *c) {
 }
 
 void jffs2_dataflash_cleanup(struct jffs2_sb_info *c) {
-#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
-	kfree(c->wbuf_verify);
-#endif
 	kfree(c->wbuf);
 }
 
@@ -1309,20 +1304,10 @@ int jffs2_nor_wbuf_flash_setup(struct jffs2_sb_info *c) {
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
