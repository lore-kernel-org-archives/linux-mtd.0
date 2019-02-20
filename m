Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 441F9C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 10:18:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14B112146E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 10:18:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e5wz0b68"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14B112146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CXNy4xFth6k0ewbRXR2aFGERQ6GkciRnNLzSNwJib5s=; b=e5wz0b68BWo/JA
	Cimk77Kdk5DuThd4CIsVO6YXbR00bCgv3pQzvTxG7YNHe+N8m9K3rO5sg4IFpiJvdLamvjEQ4dgqo
	dbuP3G4ycIfEM/CJ6lrwNWEoQKIQoxV3xi3lq3rktNt7zUPOBACDyx68JKQ3S2wBGyfMnf+yf6fsi
	eRbG7aqevo+Z9xanu0fOBorasKQ6i85w5d5+VDSXh6nfmlmRXfUhDVKDXGUZwnP6B50+BNH0RURkn
	iuz/CqYKcoDeFrk8DE6lSdFZYZcvy5F06Y029ET+zzzX+IStkmEcvLlsGkZm6sQMSUA5g5YPkvkFk
	hc6bvJ+tQ0WXmPdsUHpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwOx6-0008KK-L5; Wed, 20 Feb 2019 10:18:08 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwOwk-0007qu-EY
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 10:17:53 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 2131363613876F9CEA08;
 Wed, 20 Feb 2019 18:17:44 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.408.0; Wed, 20 Feb 2019
 18:17:36 +0800
From: Hou Tao <houtao1@huawei.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] jffs2: protect no-raw-node-ref check of inocache by
 erase_completion_lock
Date: Wed, 20 Feb 2019 18:21:54 +0800
Message-ID: <20190220102154.8031-1-houtao1@huawei.com>
X-Mailer: git-send-email 2.16.2.dirty
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190220_021747_055802_63CEE44D 
X-CRM114-Status: GOOD (  14.17  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, houtao1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In jffs2_do_clear_inode(), we will check whether or not there is any
jffs2_raw_node_ref associated with the current inocache. If there
is no raw-node-ref, the inocache could be freed. And if there are
still some jffs2_raw_node_ref linked in inocache->nodes, the inocache
could not be freed and its free will be decided by
jffs2_remove_node_refs_from_ino_list().

However there is a race between jffs2_do_clear_inode() and
jffs2_remove_node_refs_from_ino_list() as shown in the following
scenario:

CPU 0                   CPU 1
in sys_unlink()         in jffs2_garbage_collect_pass()

jffs2_do_unlink
  f->inocache->pino_nlink = 0
  set_nlink(inode, 0)

                        // contains all raw-node-refs of the unlinked inode
                        start GC a jeb

iput_final
jffs2_evict_inode
jffs2_do_clear_inode
  acquire f->sem
    mark all refs as obsolete

                        GC complete
                        jeb is moved to erase_pending_list
                        jffs2_erase_pending_blocks
                          jffs2_free_jeb_node_refs
                            jffs2_remove_node_refs_from_ino_list

    f->inocache = INO_STATE_CHECKEDABSENT

                              // no raw-node-ref is associated with the
                              // inocache of the unlinked inode
                              ic->nodes == (void *)ic && ic->pino_nlink == 0
                                jffs2_del_ino_cache

    f->inodecache->nodes == f->nodes
      // double-free occurs
      jffs2_del_ino_cache

Double-free of inocache will lead to all kinds of weired behaviours. The
following BUG_ON is one case in which two active inodes are used the same
inocache (the freed inocache is reused by a new inode, then the inocache
is double-freed and reused by another new inode):

  jffs2: Raw node at 0x006c6000 wasn't in node lists for ino #662249
  ------------[ cut here ]------------
  kernel BUG at fs/jffs2/gc.c:645!
  invalid opcode: 0000 [#1] PREEMPT SMP
  Modules linked in: nandsim
  CPU: 0 PID: 15837 Comm: cp Not tainted 4.4.172 #1
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
  RIP: [<ffffffff816f1256>] jffs2_garbage_collect_live+0x1578/0x1593
  Call Trace:
   [<ffffffff8154b8aa>] jffs2_garbage_collect_pass+0xf6a/0x15d0
   [<ffffffff81541bbd>] jffs2_reserve_space+0x2bd/0x8a0
   [<ffffffff81546a62>] jffs2_do_create+0x52/0x480
   [<ffffffff8153c9f2>] jffs2_create+0xe2/0x2a0
   [<ffffffff8133bed7>] vfs_create+0xe7/0x220
   [<ffffffff81340ab4>] path_openat+0x11f4/0x1c00
   [<ffffffff81343635>] do_filp_open+0xa5/0x140
   [<ffffffff813288ed>] do_sys_open+0x19d/0x320
   [<ffffffff81328a96>] SyS_open+0x26/0x30
   [<ffffffff81c3f8f8>] entry_SYSCALL_64_fastpath+0x18/0x73
  ---[ end trace dd5c02f1653e8cac ]---

Fix it by protecting no-raw-node-ref check by erase_completion_lock.
And also need to move the call of jffs2_set_inocache_state() under
erase_completion_lock, else the inocache may be leaked because
jffs2_del_ino_cache() invoked by jffs2_remove_node_refs_from_ino_list()
may find the state of inocache is still INO_STATE_CHECKING and will
not free the inocache.

Cc: stable@vger.kernel.org
Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 fs/jffs2/nodelist.c  |  7 +++++++
 fs/jffs2/readinode.c | 10 +++++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/fs/jffs2/nodelist.c b/fs/jffs2/nodelist.c
index b86c78d178c6..c3b0d56e7007 100644
--- a/fs/jffs2/nodelist.c
+++ b/fs/jffs2/nodelist.c
@@ -469,6 +469,13 @@ void jffs2_del_ino_cache(struct jffs2_sb_info *c, struct jffs2_inode_cache *old)
 	while ((*prev) && (*prev)->ino < old->ino) {
 		prev = &(*prev)->next;
 	}
+
+	/*
+	 * It's possible that we can not find the inocache in
+	 * hash table because it had been removed by
+	 * jffs2_remove_node_refs_from_ino_list(), but it's still not freed,
+	 * so we need go forward and free it.
+	 */
 	if ((*prev) == old) {
 		*prev = old->next;
 	}
diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 0bae0583106e..64613207d3fe 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -1428,8 +1428,16 @@ void jffs2_do_clear_inode(struct jffs2_sb_info *c, struct jffs2_inode_info *f)
 	}
 
 	if (f->inocache && f->inocache->state != INO_STATE_CHECKING) {
-		jffs2_set_inocache_state(c, f->inocache, INO_STATE_CHECKEDABSENT);
+		bool need_del = false;
+
+		spin_lock(&c->erase_completion_lock);
 		if (f->inocache->nodes == (void *)f->inocache)
+			need_del = true;
+		jffs2_set_inocache_state(c, f->inocache,
+					 INO_STATE_CHECKEDABSENT);
+		spin_unlock(&c->erase_completion_lock);
+
+		if (need_del)
 			jffs2_del_ino_cache(c, f->inocache);
 	}
 
-- 
2.16.2.dirty


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
