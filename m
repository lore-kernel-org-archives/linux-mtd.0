Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4057C61DD6
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Aug 2026 06:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jji4O5RfUO/pS5n4itnfEDkD76ZVui/kk8kX7Rd7p6c=; b=DqPDjIvpl88SSD
	AZjCtGS+MHk7WgXXpu0tZ8/qwnF6P3m2pXujyQ2ldBwz3rBARkFmInLuasFjJBo3+/dZCyYodU6CG
	M9iURN0gr/2lnG04CHdY5H4wd0kgwM8sStAzmcVb2UueeMPg7JlsJ/RfO48Pkfk88okIEMmnmbIzB
	gU7nM1pJmWXUs6iU8I44cuLAc4i2Ljaw/gV8HPasosWPX+NYTFIG5foGNLv2YC8JuhmXDVEPzU/Tt
	p7sh4/KE5+doJhaIjk5PnULuw1FuMf2CZ9x/rWA6I6je/TjZDCMu6b82RPl2eQ4ly6ag2gUZpV9Tf
	BNg9ZCfM9y96RdxTEbIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0CVt-00000006mck-3SpX;
	Sat, 29 Aug 2026 06:26:01 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0CVb-00000006mPe-45Qr;
	Sat, 29 Aug 2026 06:25:45 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=74q66HJmMWJN55dn20FZdYOLy1Mwgl/UEzgpiDTNZVM=;
	b=REYZhobGY6OwtWYxQq2Chhx1HTa/A7qWytRXir4V3heVxGFQNYBNrnYKaQyMWXAkc3i/q+VLZ
	jEJjJp9Kd7DUqaion7AFqCFvv6soKHNWbfjJbgB2PTyIbVgV+Fi/gdKQqKc8bnFr18jWJP6Wis1
	vpWsCTK0V6+bkzxtwYXZoQ4=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hX4jH4NvBz1prKd;
	Sat, 29 Aug 2026 14:14:43 +0800 (CST)
Received: from dggpemr100018.china.huawei.com (unknown [7.185.36.64])
	by mail.maildlp.com (Postfix) with ESMTPS id DC99A40537;
	Sat, 29 Aug 2026 14:25:32 +0800 (CST)
Received: from huawei.com (10.50.85.155) by dggpemr100018.china.huawei.com
 (7.185.36.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Sat, 29 Aug
 2026 14:25:32 +0800
From: zhouminqiang <zhouminqiang2@huawei.com>
To: <linux@armlinux.org.uk>, <vz@mleia.com>, <piotr.wojtaszczyk@timesys.com>,
	<maddy@linux.ibm.com>, <dwmw2@infradead.org>, <richard@nod.at>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-mtd@lists.infradead.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH v2 4/7] jffs2: add write verification to direct page writes in flash_writev
Date: Sat, 29 Aug 2026 14:16:54 +0800
Message-ID: <20260829061658.306854-5-zhouminqiang2@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260829061658.306854-1-zhouminqiang2@huawei.com>
References: <20260829061658.306854-1-zhouminqiang2@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.85.155]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemr100018.china.huawei.com (7.185.36.64)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_232544_333724_5C92ED13 
X-CRM114-Status: GOOD (  15.64  )
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

jffs2_flash_writev() performs writes in three phases: phase 1 fills
the write buffer and flushes it when full, phase 2 writes full pages
directly via mtd_write() bypassing the buffer, and phase 3 fills the
remaining data into the write buffer.

Phases 1 and 3 both invoke __jffs2_flush_wbuf() when the buffer is
full, which includes write-back verification when
CONFIG_JFFS2_FS_WBUF_VERIFY is enabled. However phase 2, which
handles the bulk of the write data, calls mtd_write() directly
without any verification.

Phase 2 direct writes may span multiple wbuf_pagesize pages. Extend
jffs2_verify_write() with a len parameter to specify the data length
to verify, and add the verification call after the phase 2
mtd_write() to cover this gap.

Signed-off-by: zhouminqiang <zhouminqiang2@huawei.com>
---
 fs/jffs2/wbuf.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 74e169dedab7..81f3538ca258 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -228,38 +228,38 @@ static struct jffs2_raw_node_ref **jffs2_incore_replace_raw(struct jffs2_sb_info
 
 #ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
 static int jffs2_verify_write(struct jffs2_sb_info *c, unsigned char *buf,
-			      uint32_t ofs)
+			      uint32_t ofs, size_t len)
 {
 	int ret;
 	size_t retlen, i;
 	char *eccstr;
 	void *verify_buf;
 
-	verify_buf = kmalloc(c->wbuf_pagesize, GFP_NOFS);
+	verify_buf = kmalloc(len, GFP_NOFS);
 	if (!verify_buf) {
 		pr_warn("%s(): verify buffer allocation failed, skipping verification\n",
 			__func__);
 		return 0;
 	}
 
-	ret = mtd_read(c->mtd, ofs, c->wbuf_pagesize, &retlen, verify_buf);
+	ret = mtd_read(c->mtd, ofs, len, &retlen, verify_buf);
 
 	if (ret && ret != -EUCLEAN && ret != -EBADMSG) {
 		pr_warn("%s(): Read back of page at %08x failed: %d\n",
 			__func__, ofs, ret);
 		goto out_free;
-	} else if (retlen != c->wbuf_pagesize) {
-		pr_warn("%s(): Read back of page at %08x gave short read: %zu not %d\n",
-			__func__, ofs, retlen, c->wbuf_pagesize);
+	} else if (retlen != len) {
+		pr_warn("%s(): Read back of page at %08x gave short read: %zu not %zu\n",
+			__func__, ofs, retlen, len);
 		ret = -EIO;
 		goto out_free;
 	}
-	if (!memcmp(buf, verify_buf, c->wbuf_pagesize)) {
+	if (!memcmp(buf, verify_buf, len)) {
 		ret = 0;
 		goto out_free;
 	}
 
-	for (i = 0; i < c->wbuf_pagesize; i++) {
+	for (i = 0; i < len; i++) {
 		uint8_t c1 = ((uint8_t *)buf)[i];
 		uint8_t c2 = ((uint8_t *)verify_buf)[i];
 		int dump_len;
@@ -274,9 +274,9 @@ static int jffs2_verify_write(struct jffs2_sb_info *c, unsigned char *buf,
 		else
 			eccstr = "OK or unused";
 
-		dump_len = min_t(int, 128, c->wbuf_pagesize - i);
-		pr_warn("Write verify error (ECC %s) at %08x (+%zu/%d). Wrote:\n",
-			eccstr, ofs, i, c->wbuf_pagesize);
+		dump_len = min_t(int, 128, len - i);
+		pr_warn("Write verify error (ECC %s) at %08x (+%zu/%zu). Wrote:\n",
+			eccstr, ofs, i, len);
 		print_hex_dump(KERN_WARNING, "", DUMP_PREFIX_OFFSET, 16, 1,
 			       buf + i, dump_len, 0);
 
@@ -293,7 +293,7 @@ static int jffs2_verify_write(struct jffs2_sb_info *c, unsigned char *buf,
 	return ret;
 }
 #else
-#define jffs2_verify_write(c,b,o) (0)
+#define jffs2_verify_write(c,b,o,l) (0)
 #endif
 
 /* Recover from failure to write wbuf. Recover the nodes up to the
@@ -458,7 +458,7 @@ static void jffs2_wbuf_recover(struct jffs2_sb_info *c)
 			ret = mtd_write(c->mtd, ofs, towrite, &retlen,
 					rewrite_buf);
 
-		if (ret || retlen != towrite || jffs2_verify_write(c, rewrite_buf, ofs)) {
+		if (ret || retlen != towrite || jffs2_verify_write(c, rewrite_buf, ofs, towrite)) {
 			/* Argh. We tried. Really we did. */
 			pr_crit("Recovery of wbuf failed due to a second write error. Data loss ensues.\n");
 			kfree(buf);
@@ -676,7 +676,10 @@ static int __jffs2_flush_wbuf(struct jffs2_sb_info *c, int pad)
 			retlen, c->wbuf_pagesize);
 		ret = -EIO;
 		goto wfail;
-	} else if ((ret = jffs2_verify_write(c, c->wbuf, c->wbuf_ofs))) {
+	}
+
+	ret = jffs2_verify_write(c, c->wbuf, c->wbuf_ofs, c->wbuf_pagesize);
+	if (ret) {
 	wfail:
 		jffs2_wbuf_recover(c);
 
@@ -908,6 +911,10 @@ int jffs2_flash_writev(struct jffs2_sb_info *c, const struct kvec *invecs,
 			if (ret < 0 || wbuf_retlen != PAGE_DIV(vlen))
 				goto outfile;
 
+			ret = jffs2_verify_write(c, v, outvec_to, PAGE_DIV(vlen));
+			if (ret)
+				goto outfile;
+
 			vlen -= wbuf_retlen;
 			outvec_to += wbuf_retlen;
 			c->wbuf_ofs = outvec_to;
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
