Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ACF606A336
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2026 08:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xHLMib4V;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=VRaKuVPH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wjk7B089ZfgyxHawQnyRVyAN/12UXZDOZf4hydV7TCQ=; b=xHLMib4V9ZEtBgF78DbG3K0jH/
	fGdfDaJqUflWQr75UcVVuz2Uk0PbV7WLaU3Hyn0g/odbJGVieIVZA2hyh44ScR69X7N2Rq+ymIA8J
	kBPzSUFnVeRifrsLuO4JiIughS5rLmTpK3QOgc0p/q0GH+A/4z9GkowIfFhm0yhE4Ph4Wzlmrkfyf
	6q3dw4joNYbQyBDP0Ttd1l6PIpOHSxFgECldRW/sfpuCU5629A0Cq351FxglEKG1A+A93IYlrPC+B
	10+xktQt90ybUWn5zmFq0ZT7YGLO0HvSQkWXH+hONxm8UW6eOn2vieQTLr88IRB4m8hK26NSsQtpe
	Lptd9grw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWof-00000004nh9-13yO;
	Wed, 04 Nov 2026 08:57:57 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWoa-00000004naL-1P73
	for linux-mtd@lists.infradead.org;
	Wed, 04 Nov 2026 08:57:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=VRaKuVPHtyF+SUq90ZRWm13D5iHZ89zPZoYo0KRoljG8PmCEYWAhQfpW8tgyBk75XfibZJfxCQGka
	 xtYol8l1Dve8JUMoAPhJgaPlImSdtwUIamassf/GABtkSA9Uz1YsltWoLnITnzu3VtbdpFjm6026hf
	 7blJixSZI/+HyFls=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96aeaf3819fd-a1969;
	Wed, 04 Nov 2026 16:57:38 +0800 (CST)
X-RM-TRANSID: 2ee96aeaf3819fd-a1969
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from fedora (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56aeaf37cab6-1bfcb;
	Wed, 04 Nov 2026 16:57:38 +0800 (CST)
X-RM-TRANSID: 2ee56aeaf37cab6-1bfcb
From: Yiqing Wu <wuyiqing@cmss.chinamobile.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	David Howells <dhowells@redhat.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+ae2d1f6d474e1725bdc0@syzkaller.appspotmail.com
Subject: [PATCH v2] jffs2: fix use-after-free in jffs2_garbage_collect_thread
Date: Wed,  4 Nov 2026 16:57:25 +0800
Message-ID: <20261104085725.241655-1-wuyiqing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103090018.157034-1-wuyiqing@cmss.chinamobile.com>
References: <20261103090018.157034-1-wuyiqing@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_005753_970921_37353B27 
X-CRM114-Status: GOOD (  20.57  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

jffs2_do_remount_fs() decides whether to (re)start the garbage collect
thread from the requested flags:

	if (!(fc->sb_flags & SB_RDONLY))
		jffs2_start_garbage_collect_thread(c);

The flags which actually take effect, however, are computed by
reconfigure_super() as

	sb->s_flags = (sb->s_flags & ~fc->sb_flags_mask) |
		      (fc->sb_flags & fc->sb_flags_mask);

and fspick(2) creates its reconfiguration context with both sb_flags
and sb_flags_mask set to zero, i.e. "no change requested".  So after

	fd = fspick(AT_FDCWD, mnt, 0);
	fsconfig(fd, FSCONFIG_CMD_RECONFIGURE, NULL, NULL, 0);

on a filesystem which was mounted read-only, jffs2 starts the GC
thread (because fc->sb_flags carries no SB_RDONLY) while the superblock
keeps its SB_RDONLY (because fc->sb_flags_mask is zero).  The classic
mount(2) remount path is not affected: it always passes a full
MS_RMT_MASK, so the flags it hands to the filesystem do take effect.

jffs2_kill_sb() then refuses to stop the GC thread for a read-only
superblock:

	if (c && !sb_rdonly(sb))
		jffs2_stop_garbage_collect_thread(c);
	kill_mtd_super(sb);
	kfree(c);

so at unmount the thread is neither signalled nor waited for, and
kfree(c) frees the jffs2_sb_info out from under the still-running
jffs2_gcd_mtd%d kthread.  It dereferences the freed object when it
wakes up from its 50 ms idle sleep:

  BUG: KASAN: slab-use-after-free in rt_spin_lock
  Read of size 1 at addr ffff88804f2b02c0 by task jffs2_gcd_mtd0/12364
  Call Trace:
  rt_spin_lock kernel/locking/spinlock_rt.c:56
  spin_lock include/linux/spinlock_rt.h:45 [inline]
  jffs2_garbage_collect_thread fs/jffs2/background.c:94

Fix the desynchronisation, and harden the unmount path against it:

  - jffs2_do_remount_fs() now derives the flags which will be in
    effect after the reconfiguration the same way reconfigure_super()
    does, and only starts the GC thread if the filesystem will
    actually be writable.

  - jffs2_kill_sb() unconditionally stops and waits for the GC thread
    before freeing c.  Without a running GC thread this is a no-op,
    and the thread can no longer outlive the jffs2_sb_info, no matter
    which future path manages to start it on a superblock that stays
    read-only.

Fixes: ec10a24f10c8 ("vfs: Convert jffs2 to use the new mount API")
Reported-by: syzbot+ae2d1f6d474e1725bdc0@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=ae2d1f6d474e1725bdc0
Signed-off-by: Yiqing Wu <wuyiqing@cmss.chinamobile.com>
---
v2:
  - jffs2_fill_super() initialises the superblock locks before the
    rp_size sanity check can fail the mount, so that the now
    unconditional jffs2_stop_garbage_collect_thread() does not take an
    uninitialised c->erase_completion_lock when a mount bails out
    early.  (Read-write mounts with an oversized rp_size already
    reached that path even before this change.)
  - v1: https://lore.kernel.org/all/20261103090018.157034-1-wuyiqing@cmss.chinamobile.com/T/
---
 fs/jffs2/fs.c    | 13 ++++++++++++-
 fs/jffs2/super.c | 16 ++++++++++------
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 05cf860307c7..a124f5309c2b 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -396,6 +396,7 @@ void jffs2_dirty_inode(struct inode *inode, int flags)
 int jffs2_do_remount_fs(struct super_block *sb, struct fs_context *fc)
 {
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
+	unsigned int sb_flags;
 
 	if (c->flags & JFFS2_SB_FLAG_RO && !sb_rdonly(sb))
 		return -EROFS;
@@ -411,7 +412,17 @@ int jffs2_do_remount_fs(struct super_block *sb, struct fs_context *fc)
 		mutex_unlock(&c->alloc_sem);
 	}
 
-	if (!(fc->sb_flags & SB_RDONLY))
+	/*
+	 * Start the GC thread only if the filesystem will actually be
+	 * writable after the reconfiguration.  Note that reconfigure_super()
+	 * applies the flags as
+	 * (sb->s_flags & ~fc->sb_flags_mask) | (fc->sb_flags & fc->sb_flags_mask),
+	 * so a zero sb_flags_mask (as e.g. used by fspick()) leaves the
+	 * superblock read-only.
+	 */
+	sb_flags = (sb->s_flags & ~fc->sb_flags_mask) |
+		   (fc->sb_flags & fc->sb_flags_mask);
+	if (!(sb_flags & SB_RDONLY))
 		jffs2_start_garbage_collect_thread(c);
 
 	fc->sb_flags |= SB_NOATIME;
diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 81396a092ba8..9ac22b6479f7 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -267,12 +267,12 @@ static int jffs2_fill_super(struct super_block *sb, struct fs_context *fc)
 	c->mtd = sb->s_mtd;
 	c->os_priv = sb;
 
-	if (c->mount_opts.rp_size > c->mtd->size)
-		return invalf(fc, "jffs2: Too large reserve pool specified, max is %llu KB",
-			      c->mtd->size / 1024);
-
 	/* Initialize JFFS2 superblock locks, the further initialization will
-	 * be done later */
+	 * be done later.  This must precede any error return: kill_sb() stops
+	 * the GC thread even on mounts which failed before it could start,
+	 * and jffs2_stop_garbage_collect_thread() takes
+	 * c->erase_completion_lock.
+	 */
 	mutex_init(&c->alloc_sem);
 	mutex_init(&c->erase_free_sem);
 	init_waitqueue_head(&c->erase_wait);
@@ -280,6 +280,10 @@ static int jffs2_fill_super(struct super_block *sb, struct fs_context *fc)
 	spin_lock_init(&c->erase_completion_lock);
 	spin_lock_init(&c->inocache_lock);
 
+	if (c->mount_opts.rp_size > c->mtd->size)
+		return invalf(fc, "jffs2: Too large reserve pool specified, max is %llu KB",
+			      c->mtd->size / 1024);
+
 	sb->s_op = &jffs2_super_operations;
 	sb->s_export_op = &jffs2_export_ops;
 	sb->s_flags = sb->s_flags | SB_NOATIME;
@@ -345,7 +349,7 @@ static void jffs2_put_super (struct super_block *sb)
 static void jffs2_kill_sb(struct super_block *sb)
 {
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
-	if (c && !sb_rdonly(sb))
+	if (c)
 		jffs2_stop_garbage_collect_thread(c);
 	kill_mtd_super(sb);
 	kfree(c);
-- 
2.56.0




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
