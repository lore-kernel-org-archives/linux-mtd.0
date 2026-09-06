Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528B0C624DB
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Sep 2026 03:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amVuX+qlypW9yMtUhfAkwUnJTI/MJsPpE9gkbi+V/GU=; b=x3ccVTg8jNfAzY
	1Gxgl4jYrU9unEqs8oG/DWZQ3aBt6imwuHgkd93WFmGuteYQP2ZyOXg2r68IXktjrXHEkSeqUE4tr
	XOSLkpHfyAt8+pHpsil1MQ3cPuMFaPImsmbVkzRchvm3GuoQM1pfhgGxATPsrErcj9PxzcXp5E+ID
	nqoeeD4HFZroPaWp6y2+g9iDrqxDuh0eJh7lO2xCeBR29f3r3yD2czYp+vjR1I/PHo2jvDPjTccYE
	Hk1YqoscJvzZbNuMrlqoWMTJr9vE72/HCnwl0nRGTNsUqKg71nFXv5ymBxzV6MQvOasWrSAtwDlrD
	Mpm6Yo1UG1tX34yl0wDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33Je-00000004b4g-1Aja;
	Sun, 06 Sep 2026 03:13:10 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33JK-00000004akV-1GWG;
	Sun, 06 Sep 2026 03:12:51 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hcwGL0GTwzKHMRB;
	Sun,  6 Sep 2026 11:11:38 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id EDC534058D;
	Sun,  6 Sep 2026 11:12:35 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.85.155])
	by APP1 (Coremail) with UTF8SMTPSA id cCh0CgBnUAsW2pxqmzytAw--.18069S10;
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
Subject: [PATCH v4 6/8] jffs2: add write verification to NOR direct write paths
Date: Sun,  6 Sep 2026 11:03:42 +0800
Message-ID: <20260906030344.2448622-7-zhouminqiang2@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260906030344.2448622-1-zhouminqiang2@huawei.com>
References: <20260906030344.2448622-1-zhouminqiang2@huawei.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgBnUAsW2pxqmzytAw--.18069S10
X-Coremail-Antispam: 1UD129KBjvJXoWxKrWkJFWUKr4DZryUZw17trb_yoW3CryDpF
	Z0y3sxtrWrG3WxGrnIyFs8X3W5K3yUGr1IgrW3Cw13Za1Fvr1qga90g34jyryrJrZ7Zryj
	gFZY9a45JF15trJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ0b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
	Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
	rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7Cj
	xVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F4
	0Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC
	6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxV
	Aaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l42xK82IY64kExVAvwVAq07x20xyl4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
	WUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
	wI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUxF4iUUUUU
X-CM-SenderInfo: 52kr3z5lqtxttqj6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_201250_719393_B875A67B 
X-CRM114-Status: GOOD (  18.74  )
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

NOR Flash and other non-writebuffered devices write directly through
jffs2_flash_direct_writev() and jffs2_flash_direct_write() without
any write-back verification. If mtd_write() succeeds but the readable
medium differs from JFFS2's source buffer, a later node CRC failure
cannot distinguish transport/program-time corruption from post-commit
media damage.

Move jffs2_verify_write() from wbuf.c to writev.c so it can be shared
by both writebuffered and direct write paths. Add jffs2_verify_writev()
to iterate over kvec entries and verify each one individually. In both
direct write functions, add mtd_write() return value and retlen checks,
and invoke verification after a successful complete write.

In jffs2_flash_direct_writev(), move the mtd_writev() call before
jffs2_sum_add_kvec() so that *retlen is always set by the MTD layer
first. The original ordering let jffs2_sum_add_kvec() return early on
error without ever touching *retlen, leaving the caller's retlen check
to read an uninitialized value. Keep the same order in
jffs2_flash_direct_write().

Signed-off-by: zhouminqiang <zhouminqiang2@huawei.com>
---
 fs/jffs2/os-linux.h |  11 ++++
 fs/jffs2/wbuf.c     |  70 -------------------------
 fs/jffs2/writev.c   | 121 +++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 131 insertions(+), 71 deletions(-)

diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
index 86ab014a349c..e73ef643fd97 100644
--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -192,6 +192,17 @@ int jffs2_flash_direct_writev(struct jffs2_sb_info *c, const struct kvec *vecs,
 int jffs2_flash_direct_write(struct jffs2_sb_info *c, loff_t ofs, size_t len,
 			size_t *retlen, const u_char *buf);
 
+#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
+int jffs2_verify_write(struct jffs2_sb_info *c, const unsigned char *buf,
+		       uint32_t ofs, size_t len);
+int jffs2_verify_writev(struct jffs2_sb_info *c,
+		       const struct kvec *vecs,
+		       unsigned long count, loff_t to);
+#else
+#define jffs2_verify_write(c, b, o, l) (0)
+#define jffs2_verify_writev(c, v, cnt, t) (0)
+#endif
+
 #endif /* __JFFS2_OS_LINUX_H__ */
 
 
diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index c146ece15660..6ad1459fc664 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -226,76 +226,6 @@ static struct jffs2_raw_node_ref **jffs2_incore_replace_raw(struct jffs2_sb_info
 	return NULL;
 }
 
-#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
-static int jffs2_verify_write(struct jffs2_sb_info *c, unsigned char *buf,
-			      uint32_t ofs, size_t len)
-{
-	int ret;
-	size_t retlen, i;
-	char *eccstr;
-	void *verify_buf;
-
-	verify_buf = kmalloc(len, GFP_NOFS | __GFP_NOWARN);
-	if (!verify_buf) {
-		pr_warn("%s(): verify buffer allocation failed, skipping verification\n",
-			__func__);
-		return 0;
-	}
-
-	ret = mtd_read(c->mtd, ofs, len, &retlen, verify_buf);
-
-	if (ret && ret != -EUCLEAN && ret != -EBADMSG) {
-		pr_warn("%s(): Read back of page at %08x failed: %d\n",
-			__func__, ofs, ret);
-		goto out_free;
-	} else if (retlen != len) {
-		pr_warn("%s(): Read back of page at %08x gave short read: %zu not %zu\n",
-			__func__, ofs, retlen, len);
-		ret = -EIO;
-		goto out_free;
-	}
-	if (!memcmp(buf, verify_buf, len)) {
-		ret = 0;
-		goto out_free;
-	}
-
-	for (i = 0; i < len; i++) {
-		uint8_t c1 = ((uint8_t *)buf)[i];
-		uint8_t c2 = ((uint8_t *)verify_buf)[i];
-		int dump_len;
-
-		if (c1 == c2)
-			continue;
-
-		if (ret == -EUCLEAN)
-			eccstr = "corrected";
-		else if (ret == -EBADMSG)
-			eccstr = "correction failed";
-		else
-			eccstr = "OK or unused";
-
-		dump_len = min_t(int, 128, len - i);
-		pr_warn("Write verify error (ECC %s) at %08x (+%zu/%zu). Wrote:\n",
-			eccstr, ofs, i, len);
-		print_hex_dump(KERN_WARNING, "", DUMP_PREFIX_OFFSET, 16, 1,
-			       buf + i, dump_len, 0);
-
-		pr_warn("Read back:\n");
-		print_hex_dump(KERN_WARNING, "", DUMP_PREFIX_OFFSET, 16, 1,
-			       verify_buf + i, dump_len, 0);
-
-		ret = -EIO;
-		goto out_free;
-	}
-
-out_free:
-	kfree(verify_buf);
-	return ret;
-}
-#else
-#define jffs2_verify_write(c,b,o,l) (0)
-#endif
-
 /* Recover from failure to write wbuf. Recover the nodes up to the
  * wbuf, not the one which we were starting to try to write. */
 
diff --git a/fs/jffs2/writev.c b/fs/jffs2/writev.c
index a1bda9dab3f8..e96f10566fe1 100644
--- a/fs/jffs2/writev.c
+++ b/fs/jffs2/writev.c
@@ -10,12 +10,121 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/slab.h>
 #include <linux/mtd/mtd.h>
 #include "nodelist.h"
 
+#ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
+int jffs2_verify_write(struct jffs2_sb_info *c, const unsigned char *buf,
+			      uint32_t ofs, size_t len)
+{
+	int ret;
+	size_t retlen, i;
+	char *eccstr;
+	void *verify_buf;
+
+	verify_buf = kmalloc(len, GFP_NOFS | __GFP_NOWARN);
+	if (!verify_buf) {
+		pr_warn("%s(): verify buffer allocation failed, skipping verification\n",
+			__func__);
+		return 0;
+	}
+
+	ret = mtd_read(c->mtd, ofs, len, &retlen, verify_buf);
+
+	if (ret && ret != -EUCLEAN && ret != -EBADMSG) {
+		pr_warn("%s(): Read back of page at %08x failed: %d\n",
+			__func__, ofs, ret);
+		goto out_free;
+	} else if (retlen != len) {
+		pr_warn("%s(): Read back of page at %08x gave short read: %zu not %zu\n",
+			__func__, ofs, retlen, len);
+		ret = -EIO;
+		goto out_free;
+	}
+	if (!memcmp(buf, verify_buf, len)) {
+		ret = 0;
+		goto out_free;
+	}
+
+	for (i = 0; i < len; i++) {
+		uint8_t c1 = ((uint8_t *)buf)[i];
+		uint8_t c2 = ((uint8_t *)verify_buf)[i];
+		int dump_len;
+
+		if (c1 == c2)
+			continue;
+
+		if (ret == -EUCLEAN)
+			eccstr = "corrected";
+		else if (ret == -EBADMSG)
+			eccstr = "correction failed";
+		else
+			eccstr = "OK or unused";
+
+		dump_len = min_t(int, 128, len - i);
+		pr_warn("Write verify error (ECC %s) at %08x (+%zu/%zu). Wrote:\n",
+			eccstr, ofs, i, len);
+		print_hex_dump(KERN_WARNING, "", DUMP_PREFIX_OFFSET, 16, 1,
+			       buf + i, dump_len, 0);
+
+		pr_warn("Read back:\n");
+		print_hex_dump(KERN_WARNING, "", DUMP_PREFIX_OFFSET, 16, 1,
+			       verify_buf + i, dump_len, 0);
+
+		ret = -EIO;
+		goto out_free;
+	}
+
+out_free:
+	kfree(verify_buf);
+	return ret;
+}
+
+int jffs2_verify_writev(struct jffs2_sb_info *c,
+			const struct kvec *vecs,
+			unsigned long count, loff_t to)
+{
+	loff_t ofs = to;
+	unsigned long i;
+	int ret;
+
+	for (i = 0; i < count; i++) {
+		if (!vecs[i].iov_len)
+			continue;
+		ret = jffs2_verify_write(c, vecs[i].iov_base, ofs,
+					 vecs[i].iov_len);
+		if (ret)
+			return ret;
+		ofs += vecs[i].iov_len;
+	}
+	return 0;
+}
+#endif /* CONFIG_JFFS2_FS_WBUF_VERIFY */
+
 int jffs2_flash_direct_writev(struct jffs2_sb_info *c, const struct kvec *vecs,
 			      unsigned long count, loff_t to, size_t *retlen)
 {
+	int ret;
+
+	ret = mtd_writev(c->mtd, vecs, count, to, retlen);
+
+	if (ret) {
+		pr_warn("%s(): Write failed with %d\n", __func__, ret);
+	} else {
+		size_t totlen = 0;
+		unsigned long i;
+
+		for (i = 0; i < count; i++)
+			totlen += vecs[i].iov_len;
+		if (*retlen != totlen) {
+			pr_warn("%s(): Write was short: %zu instead of %zu\n",
+				__func__, *retlen, totlen);
+			ret = -EIO;
+		} else
+			ret = jffs2_verify_writev(c, vecs, count, to);
+	}
+
 	if (!jffs2_is_writebuffered(c)) {
 		if (jffs2_sum_active()) {
 			int res;
@@ -26,15 +135,25 @@ int jffs2_flash_direct_writev(struct jffs2_sb_info *c, const struct kvec *vecs,
 		}
 	}
 
-	return mtd_writev(c->mtd, vecs, count, to, retlen);
+	return ret;
 }
 
 int jffs2_flash_direct_write(struct jffs2_sb_info *c, loff_t ofs, size_t len,
 			size_t *retlen, const u_char *buf)
 {
 	int ret;
+
 	ret = mtd_write(c->mtd, ofs, len, retlen, buf);
 
+	if (ret) {
+		pr_warn("%s(): Write failed with %d\n", __func__, ret);
+	} else if (*retlen != len) {
+		pr_warn("%s(): Write was short: %zu instead of %zu\n",
+			__func__, *retlen, len);
+		ret = -EIO;
+	} else
+		ret = jffs2_verify_write(c, buf, ofs, len);
+
 	if (jffs2_sum_active()) {
 		struct kvec vecs[1];
 		int res;
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
