Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B639EC61DD7
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Aug 2026 06:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9I95ItgvyvLUlD0rC9iChhlnjmIUQtkrNVZOWAMr+WU=; b=vFYOEakmzjn7b0
	9hiOkznGlEuvsxVvQKUhuKtJaI8TfdzI4l6XF0jbgtmYta4Y2MNrX1v86HoCpyDVP8lz43WoEyPuo
	IpxLPUcDwbDma3BNd+aZqyhIpERf+sWbqIB2g7IGGufUsvvW8j2peYqzT90TpfMvs8IGrOXPik16d
	hUVjQod4jA1DEE8CQ54GCRd3qwKH6ZFu5glSAjeO0ugg6tfHd8HFDUgzgpnV9lK9R2xBPPyNDG+ge
	vG57PtMUyEAOoGPn9ELGAw2+oIaSOW60lzicPj6Y8RufIl23XH0P4cqPWDoFFIrnrWy/qmKG0YLj5
	ZiVazBfa1Bprlv1mrynA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0CVu-00000006mdx-1Wxc;
	Sat, 29 Aug 2026 06:26:02 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0CVd-00000006mPf-3yim;
	Sat, 29 Aug 2026 06:25:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9NpBB7CEIjqjyGCb4SVckgVeutjU9azjoaZgEVa947o=;
	b=sLIQWxtrS8w5ERuoFDXmbubInkswYa662b4wJY61Zn7xeDFflLoibLq4MWzVHCe0KOiu45zz/
	WsF0/wDXGz+6Irxls6bqJzT51YJ9VpzdmO28F/hdacMD9/6HUBU+B/lIjOaXLBS1rXND9jmd36W
	gmNkFosl91edLNaX6LjQcZk=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hX4jH4tCWz1cyPY;
	Sat, 29 Aug 2026 14:14:43 +0800 (CST)
Received: from dggpemr100018.china.huawei.com (unknown [7.185.36.64])
	by mail.maildlp.com (Postfix) with ESMTPS id 7539A40572;
	Sat, 29 Aug 2026 14:25:30 +0800 (CST)
Received: from huawei.com (10.50.85.155) by dggpemr100018.china.huawei.com
 (7.185.36.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Sat, 29 Aug
 2026 14:25:29 +0800
From: zhouminqiang <zhouminqiang2@huawei.com>
To: <linux@armlinux.org.uk>, <vz@mleia.com>, <piotr.wojtaszczyk@timesys.com>,
	<maddy@linux.ibm.com>, <dwmw2@infradead.org>, <richard@nod.at>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-mtd@lists.infradead.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH v2 1/7] jffs2: wbuf: clear wbuf on recovery failure paths
Date: Sat, 29 Aug 2026 14:16:51 +0800
Message-ID: <20260829061658.306854-2-zhouminqiang2@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260829061658.306854-1-zhouminqiang2@huawei.com>
References: <20260829061658.306854-1-zhouminqiang2@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.85.155]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemr100018.china.huawei.com (7.185.36.64)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_232546_387481_283E032E 
X-CRM114-Status: GOOD (  14.56  )
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
