Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174B2C79F9F
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Sep 2026 03:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27RUKMyLlhqFYamCcpyagw5WLr6SEI8xZ0362DfnRGs=; b=Z1IGKpClqelDGt
	aWNEHySftfepxRzwwOuh0HyGjqnlPrzCPTq7XJsaeDledzFxUUP4YcJcRcg9HVE+mNLB32NQ+pNSs
	KanF/jjqpXAtQ8aI3woEAUhryHAjnGxDlLpxtLI1iH5MANppW45ApsFG0Y6gmb8HDP3/Ec7iNJKlY
	866JSjy5dE3hXXbBmt5/ZOJwcSvCsJV+u/T1z6yGsRucxDE6+Oja4tZ7gg6I9x0JLkkqopDyEusXD
	DQ2BAeBRj0ZWgTQky7ZxbXW9HoTarIdlQqlbHsvAqGVYYhkbZnly3D+gn1xjoHxnb6dXbDWGEVKQ9
	4C7eHQ37fYIj4FOyYqMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33JV-00000004ati-1IAm;
	Sun, 06 Sep 2026 03:13:01 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33JH-00000004aia-3UjR;
	Sun, 06 Sep 2026 03:12:49 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hcwGK44gxzKHMPr;
	Sun,  6 Sep 2026 11:11:37 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 7B9A04056E;
	Sun,  6 Sep 2026 11:12:35 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.85.155])
	by APP1 (Coremail) with UTF8SMTPSA id cCh0CgBnUAsW2pxqmzytAw--.18069S5;
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
Subject: [PATCH v4 1/8] jffs2: wbuf: clear wbuf on recovery failure paths
Date: Sun,  6 Sep 2026 11:03:37 +0800
Message-ID: <20260906030344.2448622-2-zhouminqiang2@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260906030344.2448622-1-zhouminqiang2@huawei.com>
References: <20260906030344.2448622-1-zhouminqiang2@huawei.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgBnUAsW2pxqmzytAw--.18069S5
X-Coremail-Antispam: 1UD129KBjvJXoW3AF4UWw17Gw4DKF47try3XFb_yoW7CrW3pr
	ZIyF13Ar45Kr1xJFs5tF15XrW8u3y8Gr1IgrWruw1xXF4vqr1aganaqFy8uFW0yrZ2qa10
	kwsYk3y7Xr1jy3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmlb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGw
	A2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2
	WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkE
	bVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7
	AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCF04k20xvEw4C26cxK6c8Ij28IcwCFx2IqxVCF
	s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
	1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8
	JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rV
	WUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
	JbIYCTnIWIevJa73UjIFyTuYvjxUV0PfDUUUU
X-CM-SenderInfo: 52kr3z5lqtxttqj6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_201248_246824_980B59A8 
X-CRM114-Status: GOOD (  13.64  )
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

Write verification was introduced by commit a6bc432e296d ("[JFFS2]
Add support for write-buffer verification.") to detect transport or
program-time corruption. When verification fails, jffs2_wbuf_recover()
attempts to recover the data: it first calls jffs2_block_refile()
to mark the old eraseblock's remaining space as REF_OBSOLETE,
then rewrites the old block's data along with the new data still
in the wbuf to a new block.  However, when the recovery write
verification also fails, the function returns without clearing
c->wbuf_len, leaving the wbuf still pointing to the refiled old
block, which leads to two kinds of bugs.

Both cases below are illustrated with a filesystem of
erasesize=16KB and wbuf_pagesize=512B.

Case 1: BUG_ON in jffs2_link_node_ref():

    User: Two 1KB writes
      ref0: [A+0,    A+1092) (ri:68B + data:1024B)
      ref1: [A+1092, A+2184)

    User: append 1KB write
      ...
      jffs2_write_dnode
        jffs2_flash_writev
          c->wbuf_ofs = A+2048, c->wbuf_len = 512
          __jffs2_flush_wbuf
            mtd_write                          -> 0-to-1 bit flip
            jffs2_verify_write                 -> verify failed
            jffs2_wbuf_recover
              jffs2_block_refile
                c->nextblock = NULL
                jffs2_link_node_ref            -> mark A remaining
                  ref2: [A+2184, A+16384)         space REF_OBSOLETE,
                                                  jeb_A->free_size = 0
              jffs2_reserve_space_gc
                jffs2_do_reserve_space
                  jffs2_find_nextblock
                    c->nextblock = B
              start = A+1092, end = A+2184
              end - start >= c->wbuf_pagesize  -> recover data in A
              mtd_write
              jffs2_verify_write               -> verify also failed
              return                           -> c->wbuf_ofs = A+2048
                                                  c->wbuf_len = 512
        retry
        jffs2_flash_writev
          if (SECTOR_ADDR(to) != SECTOR_ADDR(c->wbuf_ofs))
                                               -> SECTOR(to) = B
                                               -> SECTOR(c->wbuf_ofs) = A
          __jffs2_flush_wbuf(c, PAD_NOACCOUNT) -> flush residual wbuf data
            wbuf_jeb = A                       -> c->wbuf_ofs still points
                                                  to refiled old block
            mtd_write                          -> succeeds via NAND AND
            jffs2_verify_write                 -> passed
            if (pad)
            jffs2_link_node_ref
              ref_offset(ref) = c->wbuf_ofs + c->wbuf_len = A+2560
              jeb_A->offset = A
              c->sector_size = 16384
              jeb_A->free_size = 0
              ref_offset(ref) != jeb_A->offset +
                c->sector_size - jeb_A->free_size -> BUG

Case 2: deadlock in jffs2_flush_wbuf_pad():

    User: 1KB write
      A_ref0: [A+0,    A+1092) (ri:68B + data:1024B)

    User: append 1K write
      ...
      jffs2_write_dnode
        jffs2_flash_writev
          c->wbuf_ofs = A+1024, c->wbuf_len = 512
          __jffs2_flush_wbuf
            mtd_write                          -> bit flip
            jffs2_verify_write                 -> verify failed
            jffs2_wbuf_recover
              jffs2_block_refile
                c->nextblock = NULL
                jffs2_link_node_ref            -> mark A remaining
                  A_ref1: [A+1092, A+16384)       space as REF_OBSOLETE
              jffs2_reserve_space_gc
                jffs2_do_reserve_space
                  jffs2_find_nextblock
                    c->nextblock = B
              start = A, end = A+1092
              end - start >= c->wbuf_pagesize  -> recover data in A
              mtd_write
              jffs2_verify_write               -> verify also failed
              jffs2_add_physical_node_ref      -> mark written area in
                B_ref0: [B+0, B+1536)             B as REF_OBSOLETE
              return                           -> c->wbuf_ofs = A+1024
                                                  c->wbuf_len = 512
        retry
        jffs2_flash_writev
          down_write(&c->wbuf_sem)
          if (SECTOR_ADDR(to) != SECTOR_ADDR(c->wbuf_ofs))
                                               -> SECTOR(to) = B
                                               -> SECTOR(c->wbuf_ofs) = A
          __jffs2_flush_wbuf(c, PAD_NOACCOUNT) -> flush residual wbuf data
            wbuf_jeb = A                       -> c->wbuf_ofs still points
                                                  to refiled old block
            mtd_write                          -> bit flip
            jffs2_verify_write                 -> verify failed
            jffs2_wbuf_recover
              jffs2_block_refile
                c->nextblock != jeb            -> jeb = A, nextblock = B
                jffs2_link_node_ref            -> append zero-length ref
                  A_ref2: [A+16384, A+16384)      marked REF_OBSOLETE
                                                  after the existing one
              end = jeb_A->last_node           -> inflates to
                                                  eraseblock tail
              start = A, end = A+16384
              jffs2_reserve_space_gc
                minsize = end - start = 16384
                jffs2_do_reserve_space
                  jeb = c->nextblock           -> points to B
                  jeb_B->free_size = 16384 - 1536
                  minsize > jeb_B->free_size   -> first recovery's OBSOLETE
                                                  ref reduced free_size
                  jffs2_wbuf_dirty(c)
                  jffs2_flush_wbuf_pad(c)
                    down_write(&c->wbuf_sem)   -> already held, deadlock

Fix this by setting c->wbuf_len = 0 when jffs2_verify_write fails in
recovery path, and also in the jffs2_reserve_space_gc() and
jffs2_prealloc_raw_node_refs() failure paths, ensuring subsequent
flushes will not attempt writes on refiled blocks.

Signed-off-by: zhouminqiang <zhouminqiang2@huawei.com>
---
 fs/jffs2/wbuf.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 3b7803c75d58..61e3dbd4cd7b 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -390,6 +390,7 @@ static void jffs2_wbuf_recover(struct jffs2_sb_info *c)
 	if (ret) {
 		pr_warn("Failed to allocate space for wbuf recovery. Data loss ensues.\n");
 		kfree(buf);
+		c->wbuf_len = 0;
 		return;
 	}
 
@@ -400,6 +401,7 @@ static void jffs2_wbuf_recover(struct jffs2_sb_info *c)
 	if (ret) {
 		pr_warn("Failed to allocate node refs for wbuf recovery. Data loss ensues.\n");
 		kfree(buf);
+		c->wbuf_len = 0;
 		return;
 	}
 
@@ -431,12 +433,13 @@ static void jffs2_wbuf_recover(struct jffs2_sb_info *c)
 
 		if (ret || retlen != towrite || jffs2_verify_write(c, rewrite_buf, ofs)) {
 			/* Argh. We tried. Really we did. */
-			pr_crit("Recovery of wbuf failed due to a second write error\n");
+			pr_crit("Recovery of wbuf failed due to a second write error. Data loss ensues.\n");
 			kfree(buf);
 
 			if (retlen)
 				jffs2_add_physical_node_ref(c, ofs | REF_OBSOLETE, ref_totlen(c, jeb, first_raw), NULL);
 
+			c->wbuf_len = 0;
 			return;
 		}
 		pr_notice("Recovery of wbuf succeeded to %08x\n", ofs);
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
