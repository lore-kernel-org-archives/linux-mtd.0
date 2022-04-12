Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9ECC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 09:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mRQgzx/qffDs3CDpdP71H8/a3kiLnIP5dz5aN1OwLxo=; b=Lc3Av5/EKjQl4E
	xtzp5hBVBn1otiGNUzZlDGLe7nnAa6GQb4Gozl7ypprYw8h7VvWzLbShgm3vO8Tyr8PrbzmfTJ6Du
	WO08qVvX4RZaqCuEpL+GfcbXFCR5yDXI4okpGQfVoXfSfgJTPuObmi78nN47JJTllY5MV3zR2H92N
	yENzrrvRxZk456gjQw5syyaI+IPRUFCh2akywHLNSt7tzvMoT0aman1fJ5o38jyhXB50jeOh/pShu
	VKbVRuAsKqaadLJmI7LB6ImtgbleH7jzDTsEeKojb0Yhll+hkFVsbn0ZPOPBFqVfpTcgkQWlUzqe7
	e2XJOiMI9cC8jj20jz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neCkc-00CtYg-BL; Tue, 12 Apr 2022 09:23:54 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neCkZ-00CtWI-0a
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 09:23:53 +0000
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Kd0Xx1fN9zBsGq;
 Tue, 12 Apr 2022 17:19:29 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 12 Apr
 2022 17:23:45 +0800
From: Baokun Li <libaokun1@huawei.com>
To: <richard@nod.at>, <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
CC: <libaokun1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH -next] jffs2: fix memory leak in jffs2_do_fill_super
Date: Tue, 12 Apr 2022 17:38:16 +0800
Message-ID: <20220412093816.2280678-1-libaokun1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_022351_255569_E74FDF86 
X-CRM114-Status: UNSURE (   5.99  )
X-CRM114-Notice: Please train this message.
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

If jffs2_iget() or d_make_root() in jffs2_do_fill_super() returns
an error, we can observe the following kmemleak report:

--------------------------------------------
unreferenced object 0xffff888105a65340 (size 64):
  comm "mount", pid 710, jiffies 4302851558 (age 58.239s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff859c45e5>] kmem_cache_alloc_trace+0x475/0x8a0
    [<ffffffff86160146>] jffs2_sum_init+0x96/0x1a0
    [<ffffffff86140e25>] jffs2_do_mount_fs+0x745/0x2120
    [<ffffffff86149fec>] jffs2_do_fill_super+0x35c/0x810
    [<ffffffff8614aae9>] jffs2_fill_super+0x2b9/0x3b0
    [...]
unreferenced object 0xffff8881bd7f0000 (size 65536):
  comm "mount", pid 710, jiffies 4302851558 (age 58.239s)
  hex dump (first 32 bytes):
    bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
    bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
  backtrace:
    [<ffffffff858579ba>] kmalloc_order+0xda/0x110
    [<ffffffff85857a11>] kmalloc_order_trace+0x21/0x130
    [<ffffffff859c2ed1>] __kmalloc+0x711/0x8a0
    [<ffffffff86160189>] jffs2_sum_init+0xd9/0x1a0
    [<ffffffff86140e25>] jffs2_do_mount_fs+0x745/0x2120
    [<ffffffff86149fec>] jffs2_do_fill_super+0x35c/0x810
    [<ffffffff8614aae9>] jffs2_fill_super+0x2b9/0x3b0
    [...]
--------------------------------------------

This is because the resources allocated in jffs2_sum_init() are not
released. Call jffs2_sum_exit() to release these resources to solve
the problem.

Fixes: e631ddba5887 ("[JFFS2] Add erase block summary support (mount time improvement)")
Signed-off-by: Baokun Li <libaokun1@huawei.com>
---
 fs/jffs2/fs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 71f03a5d36ed..f83a468b6488 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -604,6 +604,7 @@ int jffs2_do_fill_super(struct super_block *sb, struct fs_context *fc)
 	jffs2_free_raw_node_refs(c);
 	kvfree(c->blocks);
 	jffs2_clear_xattr_subsystem(c);
+	jffs2_sum_exit(c);
  out_inohash:
 	kfree(c->inocache_list);
  out_wbuf:
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
