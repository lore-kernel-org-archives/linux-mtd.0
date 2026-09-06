Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DF0C79FA1
	for <linux-mtd@archiver.kernel.org>; Sun,  6 Sep 2026 03:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0t3f2fcJAyRH4WQlVEWJfJDLG+UD1l+eeoCcYXvcnTI=; b=ID7XRl4IN4cB0Y
	fKgGQGNbNdGKF3MPx516bkKCmux+gD3s8zLk/MGqFIHy3cwONaSa2QOoOOSBpxWohuJvu6LFuM6Hy
	g/g6NxGgO7suW3JxvyDr56KamOAQYwvBr276TzAtHlNynvWkWbUh5elkF+Jej3YCj5zrZQIJJJ3J3
	L6241DhAX0DQmGKGum5EtR2bFP1eyC7+OF+xXVwn+mE2KMZcUllftHBid2EtJhx3V2sntJEbh958A
	u/h+ttX8uZXl4kd3kTwJLtcDDSG+aukBFyWEHls+V+25eqleKHk3BmygvKU7KylbmhasaJB7FHLcN
	JbYEDEfDbRZfex44ClOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33JK-00000004alZ-1o1A;
	Sun, 06 Sep 2026 03:12:50 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33JF-00000004aiX-2Mdp;
	Sun, 06 Sep 2026 03:12:48 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hcwGK50hyzKHMRB;
	Sun,  6 Sep 2026 11:11:37 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 99AB54058D;
	Sun,  6 Sep 2026 11:12:35 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.85.155])
	by APP1 (Coremail) with UTF8SMTPSA id cCh0CgBnUAsW2pxqmzytAw--.18069S6;
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
Subject: [PATCH v4 2/8] jffs2: wbuf: fix OBSOLETE under-coverage on recovery failure
Date: Sun,  6 Sep 2026 11:03:38 +0800
Message-ID: <20260906030344.2448622-3-zhouminqiang2@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260906030344.2448622-1-zhouminqiang2@huawei.com>
References: <20260906030344.2448622-1-zhouminqiang2@huawei.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgBnUAsW2pxqmzytAw--.18069S6
X-Coremail-Antispam: 1UD129KBjvJXoWxArW3ZrykJry3Jw1kWrWruFg_yoW5Jw1Dpr
	yfAry3Gr1DGFyrWFnrAFy5t345Cr4rGrWIqayfJryxX3ZYvr1Sga4qgFnYvry8A3yvqr4j
	9r4UtFyUGF1UGFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmlb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2
	WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkE
	bVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7
	AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF04k20xvEw4C26cxK6c8Ij28IcwCFx2IqxVCF
	s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
	1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8
	JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rV
	WUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
	JbIYCTnIWIevJa73UjIFyTuYvjxUo8nYUUUUU
X-CM-SenderInfo: 52kr3z5lqtxttqj6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_201245_984995_A5C8D0B1 
X-CRM114-Status: GOOD (  13.15  )
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

In jffs2_wbuf_recover(), when the recovery write to the new erase
block also fails, the code marks the already-written portion as
REF_OBSOLETE via jffs2_add_physical_node_ref(). However, the length
passed is ref_totlen(c, jeb, first_raw), which is the length of a
single node on the old block, rather than the full range of data
that was attempted to be written to the new block.

On the recovery target block the layout is:

        ref_totlen(first_raw)
        |<------------->|
    ofs +---------------+-------+-------+     +--------+
        |     node 1    |node 2 |node 3 | ... |erased  |
        +---------------+-------+-------+     +--------+
        |    OBSOLETE   |                              |
        |<-towrite (page-aligned)->|                   |
        |<-------- end - start -------->|              |
                                        |<-truly free->|

When the recovery buffer contains multiple nodes, ref_totlen only
accounts for the first node's length, which can be much smaller than
the total range. This under-deducts free_size, so the next write
lands at the start of node 2, which is already programmed on NAND,
and the AND operation corrupts both the old and new data.

With towrite as the OBSOLETE length, the next write lands right
after towrite in truly free space. However, node 3's header has
been written within the towrite region while its data extends beyond
it due to page-alignment truncation. On remount, the scanner finds
node 3's header, validates its CRC, and trusts its totlen -- skipping
PAD(totlen_node3) bytes. This skip extends past towrite into the
area where the subsequent write was placed, creating a shadow zone
that causes the newly written data to be silently lost.

Use end - start as the OBSOLETE length, which covers the full range
of data that was attempted to be written to the new block, so that
neither the NAND AND corruption nor the scanner shadow zone can
occur.

Fixes: b64335f2b740 ("[JFFS2] Add length argument to jffs2_add_physical_node_ref().")
Signed-off-by: zhouminqiang <zhouminqiang2@huawei.com>
---
 fs/jffs2/wbuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 61e3dbd4cd7b..ab247117ec77 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -437,7 +437,7 @@ static void jffs2_wbuf_recover(struct jffs2_sb_info *c)
 			kfree(buf);
 
 			if (retlen)
-				jffs2_add_physical_node_ref(c, ofs | REF_OBSOLETE, ref_totlen(c, jeb, first_raw), NULL);
+				jffs2_add_physical_node_ref(c, ofs | REF_OBSOLETE, end-start, NULL);
 
 			c->wbuf_len = 0;
 			return;
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
