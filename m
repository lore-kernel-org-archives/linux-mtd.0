Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB06EC79F8B
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Sep 2026 03:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9bgiRduO+UN0ItmDVxnvNHJKAg8SrS4K8p+QlIyMA5s=; b=B1LKVqhSSYD/1x
	FOqB/gKzlrmDpidIkbEaxnfvSifa9lInZDBNBmk9KunqUGJczK85A+Zr98hCvcRS7gy9RUvynziqt
	uafBxY1jMVuAaQexpJd0Ohd0q3iIcbb97r10MlETKjLYhrcARI6O3A3thHEPyfp856R9M9v+Rv+Tn
	1DJLrfNVGsNFSBNUqja+/mJTgshj/8N6DNoo4HnBsBxZuhsh+s3b1IVvr1+XN1Z3Qyu+TuXaBuOf2
	6a+8WtCDWd4h7dRN92MiKTxqGpqfRjc9YjUxtBjUKkvT7znpalJjQ40hgQ74Ep4bbgOfP0oAMqPSt
	ytkbyue4OucTTVMLMlwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33JK-00000004alS-0rbp;
	Sun, 06 Sep 2026 03:12:50 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33JF-00000004aiY-3WWs;
	Sun, 06 Sep 2026 03:12:48 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hcwGK6zWmzKHMS4;
	Sun,  6 Sep 2026 11:11:37 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id DF08B40590;
	Sun,  6 Sep 2026 11:12:35 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.85.155])
	by APP1 (Coremail) with UTF8SMTPSA id cCh0CgBnUAsW2pxqmzytAw--.18069S9;
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
Subject: [PATCH v4 5/8] jffs2: add write verification to direct page writes in flash_writev
Date: Sun,  6 Sep 2026 11:03:41 +0800
Message-ID: <20260906030344.2448622-6-zhouminqiang2@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260906030344.2448622-1-zhouminqiang2@huawei.com>
References: <20260906030344.2448622-1-zhouminqiang2@huawei.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgBnUAsW2pxqmzytAw--.18069S9
X-Coremail-Antispam: 1UD129KBjvJXoWxCrWfKry8WryfWr48Cr4rZrb_yoWrtFW5pr
	ZIkr15Ar4fKryfGFsayFs8Z343Kay8Gr1Igr43C348Xa1Fvr17KayYgFy8ArWrArZ7Xw40
	krsak345Jr1Yq3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CRM114-CacheID: sfid-20260905_201246_241759_D3DEBC1F 
X-CRM114-Status: GOOD (  14.78  )
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
mtd_write() to cover this gap. Also add __GFP_NOWARN to the kmalloc
in jffs2_verify_write() to suppress high-order allocation warnings
when verifying summary writes on large-erasesize NAND.

Signed-off-by: zhouminqiang <zhouminqiang2@huawei.com>
---
 fs/jffs2/wbuf.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index b2ce642e9bc5..c146ece15660 100644
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
+	verify_buf = kmalloc(len, GFP_NOFS | __GFP_NOWARN);
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
