Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAF3C282D0
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 16:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=63hlWqGbhEyhoP2iCPkBBoDX+ECAvOMCkKAFUqcKWyQ=; b=EDPjFZz9QT0FQ5
	RY8qf805KJ5B6KgpB6xWANsSO0AH7fqwMX0drEKny8m3bCRlYtMV8s4yKPpoTbv0b6Jz8PKoYWz6K
	Co6WY/yDL5TKXjhq5jB3KL8Wt3jqN8gwMHrR+dYGX3FDqCWmax1COnE6M3ssIw/myTDDe+7Th7erd
	fOxZ/mCTBVtLOrxVvocIlNJ5ReZGxHwr8jIiFt/mMsb01Rc+HukQZYMkUZdvHFwGbMgNMc5Mr1p9n
	WOluuEmUId+oGMfF+Dl9tNk4IZcTdmzlrjW14/cRdfB+LY02mmMvoP91G8uVnqoRu5mSeIcbDw5Qu
	GiPqZZqV/PzG5Usq/Fag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqafM-0000000EupO-0okO;
	Fri, 07 Mar 2025 16:35:16 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqafI-0000000EumI-0ncR
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 16:35:14 +0000
Received: from localhost.localdomain (unknown [5.181.23.154])
	by mail.ispras.ru (Postfix) with ESMTPSA id 1AA9B407617C;
	Fri,  7 Mar 2025 16:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 1AA9B407617C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1741365304;
	bh=T8X9m9/SoPRw+FqUC2BTZLYWfkd5iHl+7osn9coLRak=;
	h=From:To:Cc:Subject:Date:From;
	b=B5INm3YqclBDN7O6hjsNoe2KB0S6nWIdQ72ISxTLGxkA3xLrTObAYUwjP09azGZwz
	 61B5yOFqEgfZnWuJ3P3EXZETw6wGvuYR98brSGeUaBjHtPkmsYr3wmX1JxLtbgdrTc
	 NVbQfEd2OAW8SsUA2jHh9KOvau59WlKR3HiJ5dr0=
From: Artem Sadovnikov <a.sadovnikov@ispras.ru>
To: linux-mtd@lists.infradead.org
Cc: Artem Sadovnikov <a.sadovnikov@ispras.ru>,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH] jffs2: check that raw node were preallocated before writing summary
Date: Fri,  7 Mar 2025 16:34:09 +0000
Message-ID: <20250307163409.13491-2-a.sadovnikov@ispras.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_083512_788076_558A669B 
X-CRM114-Status: GOOD (  10.57  )
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

Syzkaller detected a kernel bug in jffs2_link_node_ref, caused by fault
injection in jffs2_prealloc_raw_node_refs. jffs2_sum_write_sumnode doesn't
check return value of jffs2_prealloc_raw_node_refs and simply lets any
error propagate into jffs2_sum_write_data, which eventually calls
jffs2_link_node_ref in order to link the summary to an expectedly allocated
node.

kernel BUG at fs/jffs2/nodelist.c:592!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
CPU: 1 PID: 31277 Comm: syz-executor.7 Not tainted 6.1.128-syzkaller-00139-ge10f83ca10a1 #0
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
RIP: 0010:jffs2_link_node_ref+0x570/0x690 fs/jffs2/nodelist.c:592
Call Trace:
 <TASK>
 jffs2_sum_write_data fs/jffs2/summary.c:841 [inline]
 jffs2_sum_write_sumnode+0xd1a/0x1da0 fs/jffs2/summary.c:874
 jffs2_do_reserve_space+0xa18/0xd60 fs/jffs2/nodemgmt.c:388
 jffs2_reserve_space+0x55f/0xaa0 fs/jffs2/nodemgmt.c:197
 jffs2_write_inode_range+0x246/0xb50 fs/jffs2/write.c:362
 jffs2_write_end+0x726/0x15d0 fs/jffs2/file.c:301
 generic_perform_write+0x314/0x5d0 mm/filemap.c:3856
 __generic_file_write_iter+0x2ae/0x4d0 mm/filemap.c:3973
 generic_file_write_iter+0xe3/0x350 mm/filemap.c:4005
 call_write_iter include/linux/fs.h:2265 [inline]
 do_iter_readv_writev+0x20f/0x3c0 fs/read_write.c:735
 do_iter_write+0x186/0x710 fs/read_write.c:861
 vfs_iter_write+0x70/0xa0 fs/read_write.c:902
 iter_file_splice_write+0x73b/0xc90 fs/splice.c:685
 do_splice_from fs/splice.c:763 [inline]
 direct_splice_actor+0x10c/0x170 fs/splice.c:950
 splice_direct_to_actor+0x337/0xa10 fs/splice.c:896
 do_splice_direct+0x1a9/0x280 fs/splice.c:1002
 do_sendfile+0xb13/0x12c0 fs/read_write.c:1255
 __do_sys_sendfile64 fs/read_write.c:1323 [inline]
 __se_sys_sendfile64 fs/read_write.c:1309 [inline]
 __x64_sys_sendfile64+0x1cf/0x210 fs/read_write.c:1309
 do_syscall_x64 arch/x86/entry/common.c:51 [inline]
 do_syscall_64+0x35/0x80 arch/x86/entry/common.c:81
 entry_SYSCALL_64_after_hwframe+0x6e/0xd8

Fix this issue by checking return value of jffs2_prealloc_raw_node_refs
before calling jffs2_sum_write_data.

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Cc: stable@vger.kernel.org
Fixes: 2f785402f39b ("[JFFS2] Reduce visibility of raw_node_ref to upper layers of JFFS2 code.")
Signed-off-by: Artem Sadovnikov <a.sadovnikov@ispras.ru>
---
 fs/jffs2/summary.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
index 4fe64519870f1..d83372d3e1a07 100644
--- a/fs/jffs2/summary.c
+++ b/fs/jffs2/summary.c
@@ -858,7 +858,10 @@ int jffs2_sum_write_sumnode(struct jffs2_sb_info *c)
 	spin_unlock(&c->erase_completion_lock);
 
 	jeb = c->nextblock;
-	jffs2_prealloc_raw_node_refs(c, jeb, 1);
+	ret = jffs2_prealloc_raw_node_refs(c, jeb, 1);
+
+	if (ret)
+		goto out;
 
 	if (!c->summary->sum_num || !c->summary->sum_list_head) {
 		JFFS2_WARNING("Empty summary info!!!\n");
@@ -872,6 +875,8 @@ int jffs2_sum_write_sumnode(struct jffs2_sb_info *c)
 	datasize += padsize;
 
 	ret = jffs2_sum_write_data(c, jeb, infosize, datasize, padsize);
+
+out:
 	spin_lock(&c->erase_completion_lock);
 	return ret;
 }
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
