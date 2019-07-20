Return-Path: <SRS0=5y3D=VR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC226C76188
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jul 2019 06:00:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94AEE20873
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jul 2019 06:00:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c6Z8ho07"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94AEE20873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=57G8/7kL4pzhmu1AkoukDme3kP0KDD5GBm1VMH+hzko=; b=c6Z8ho077oi/SC
	FfM3KXU0C2bMjx9FWdvv6vhCdCf6TBfzTFwPFKs1CJeiq8VgsKXktgw/CQKFLl66LjSsfSn27vZFs
	0rF7KF4CndJBcOh3PvxtkEqIw+qRV5vIqwrw4vbBotW0Nhp2dEbJUN24EmSmeNqEEM2wkAIbvQj05
	Yv/XaU/xQ+AIJhsjDAYzKl1ig76G9Qe93dY5MEmnf9fQdoCMygy9N5QEJo+mBiwpb1LLHqPGuus8V
	1ERdspui26Zrho/k6xD5Ldqq9xpDHCxcFerSsOrj1isYHmR6exi8N+w6xgDez61EXXk/T5xqHopW5
	bHYPjSp0lOM+cNudsKJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hoiPc-0004Q5-EH; Sat, 20 Jul 2019 06:00:04 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hoiPU-0004Oz-Lo
 for linux-mtd@lists.infradead.org; Sat, 20 Jul 2019 05:59:58 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 68C18AD67F3811885278;
 Sat, 20 Jul 2019 13:59:40 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Sat, 20 Jul 2019
 13:59:33 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <s.hauer@pengutronix.de>, <dedekind1@gmail.com>,
 <yi.zhang@huawei.com>
Subject: [PATCH] ubifs: ubifs_tnc_start_commit: Fix OOB in layout_in_gaps
Date: Sat, 20 Jul 2019 14:05:20 +0800
Message-ID: <1563602720-113903-1-git-send-email-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190719_225956_890508_D98D908B 
X-CRM114-Status: GOOD (  14.89  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: chengzhihao1@huawei.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Running stress-test test_2 in mtd-utils on ubi device, sometimes we can
get following oops message:

  BUG: unable to handle page fault for address: ffffffff00000140
  #PF: supervisor read access in kernel mode
  #PF: error_code(0x0000) - not-present page
  PGD 280a067 P4D 280a067 PUD 0
  Oops: 0000 [#1] SMP
  CPU: 0 PID: 60 Comm: kworker/u16:1 Kdump: loaded Not tainted 5.2.0 #13
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.12.0
  -0-ga698c8995f-prebuilt.qemu.org 04/01/2014
  Workqueue: writeback wb_workfn (flush-ubifs_0_0)
  RIP: 0010:rb_next_postorder+0x2e/0xb0
  Code: 80 db 03 01 48 85 ff 0f 84 97 00 00 00 48 8b 17 48 83 05 bc 80 db
  03 01 48 83 e2 fc 0f 84 82 00 00 00 48 83 05 b2 80 db 03 01 <48> 3b 7a
  10 48 89 d0 74 02 f3 c3 48 8b 52 08 48 83 05 a3 80 db 03
  RSP: 0018:ffffc90000887758 EFLAGS: 00010202
  RAX: ffff888129ae4700 RBX: ffff888138b08400 RCX: 0000000080800001
  RDX: ffffffff00000130 RSI: 0000000080800024 RDI: ffff888138b08400
  RBP: ffff888138b08400 R08: ffffea0004a6b920 R09: 0000000000000000
  R10: ffffc90000887740 R11: 0000000000000001 R12: ffff888128d48000
  R13: 0000000000000800 R14: 000000000000011e R15: 00000000000007c8
  FS:  0000000000000000(0000) GS:ffff88813ba00000(0000)
  knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: ffffffff00000140 CR3: 000000013789d000 CR4: 00000000000006f0
  DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
  DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
  Call Trace:
    destroy_old_idx+0x5d/0xa0 [ubifs]
    ubifs_tnc_start_commit+0x4fe/0x1380 [ubifs]
    do_commit+0x3eb/0x830 [ubifs]
    ubifs_run_commit+0xdc/0x1c0 [ubifs]

Above Oops are due to the slab-out-of-bounds happened in do-while of
function layout_in_gaps indirectly called by ubifs_tnc_start_commit. In
function layout_in_gaps, there is a do-while loop placing index nodes
into the gaps created by obsolete index nodes in non-empty index LEBs
until rest index nodes can totally be placed into pre-allocated empty
LEBs. @c->gap_lebs points to a memory area(integer array) which records
LEB numbers used by 'in-the-gaps' method. Whenever a fitable index LEB
is found, corresponding lnum will be incrementally written into the
memory area pointed by @c->gap_lebs. The size
((@c->lst.idx_lebs + 1) * sizeof(int)) of memory area is allocated before
do-while loop and can not be changed in the loop. But @c->lst.idx_lebs
could be increased by function ubifs_change_lp (called by
layout_leb_in_gaps->ubifs_find_dirty_idx_leb->get_idx_gc_leb) during the
loop. So, sometimes oob happens when number of cycles in do-while loop
exceeds the original value of @c->lst.idx_lebs. See detail in
https://bugzilla.kernel.org/show_bug.cgi?id=204229.
This patch fixes oob in layout_in_gaps.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/tnc_commit.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/fs/ubifs/tnc_commit.c b/fs/ubifs/tnc_commit.c
index a384a0f..234be1c 100644
--- a/fs/ubifs/tnc_commit.c
+++ b/fs/ubifs/tnc_commit.c
@@ -212,7 +212,7 @@ static int is_idx_node_in_use(struct ubifs_info *c, union ubifs_key *key,
 /**
  * layout_leb_in_gaps - layout index nodes using in-the-gaps method.
  * @c: UBIFS file-system description object
- * @p: return LEB number here
+ * @p: return LEB number in @c->gap_lebs[p]
  *
  * This function lays out new index nodes for dirty znodes using in-the-gaps
  * method of TNC commit.
@@ -221,7 +221,7 @@ static int is_idx_node_in_use(struct ubifs_info *c, union ubifs_key *key,
  * This function returns the number of index nodes written into the gaps, or a
  * negative error code on failure.
  */
-static int layout_leb_in_gaps(struct ubifs_info *c, int *p)
+static int layout_leb_in_gaps(struct ubifs_info *c, int p)
 {
 	struct ubifs_scan_leb *sleb;
 	struct ubifs_scan_node *snod;
@@ -236,7 +236,7 @@ static int layout_leb_in_gaps(struct ubifs_info *c, int *p)
 		 * filled, however we do not check there at present.
 		 */
 		return lnum; /* Error code */
-	*p = lnum;
+	c->gap_lebs[p] = lnum;
 	dbg_gc("LEB %d", lnum);
 	/*
 	 * Scan the index LEB.  We use the generic scan for this even though
@@ -355,7 +355,7 @@ static int get_leb_cnt(struct ubifs_info *c, int cnt)
  */
 static int layout_in_gaps(struct ubifs_info *c, int cnt)
 {
-	int err, leb_needed_cnt, written, *p;
+	int err, leb_needed_cnt, written, p = 0, old_idx_lebs, *gap_lebs;
 
 	dbg_gc("%d znodes to write", cnt);
 
@@ -364,9 +364,9 @@ static int layout_in_gaps(struct ubifs_info *c, int cnt)
 	if (!c->gap_lebs)
 		return -ENOMEM;
 
-	p = c->gap_lebs;
+	old_idx_lebs = c->lst.idx_lebs;
 	do {
-		ubifs_assert(c, p < c->gap_lebs + c->lst.idx_lebs);
+		ubifs_assert(c, p < c->lst.idx_lebs);
 		written = layout_leb_in_gaps(c, p);
 		if (written < 0) {
 			err = written;
@@ -392,9 +392,29 @@ static int layout_in_gaps(struct ubifs_info *c, int cnt)
 		leb_needed_cnt = get_leb_cnt(c, cnt);
 		dbg_gc("%d znodes remaining, need %d LEBs, have %d", cnt,
 		       leb_needed_cnt, c->ileb_cnt);
+		/*
+		 * Dynamically change the size of @c->gap_lebs to prevent
+		 * oob, because @c->lst.idx_lebs could be increased by
+		 * function @get_idx_gc_leb (called by layout_leb_in_gaps->
+		 * ubifs_find_dirty_idx_leb) during loop. Only enlarge
+		 * @c->gap_lebs when needed.
+		 *
+		 */
+		if (leb_needed_cnt > c->ileb_cnt && p >= old_idx_lebs &&
+		    old_idx_lebs < c->lst.idx_lebs) {
+			old_idx_lebs = c->lst.idx_lebs;
+			gap_lebs = krealloc(c->gap_lebs, sizeof(int) *
+					       (old_idx_lebs + 1), GFP_NOFS);
+			if (!gap_lebs) {
+				kfree(c->gap_lebs);
+				c->gap_lebs = NULL;
+				return -ENOMEM;
+			}
+			c->gap_lebs = gap_lebs;
+		}
 	} while (leb_needed_cnt > c->ileb_cnt);
 
-	*p = -1;
+	c->gap_lebs[p] = -1;
 	return 0;
 }
 
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
