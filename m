Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2758DF55803
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2026 09:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BEVF+DVOkmfb1yMK7ttkIyk5FMwYZxh7iujdwrRvDFE=; b=TZn/DDasoZpa+g
	7n9L+SHc4F94BwgFtQrOkRdMfbFcnAuE0LeAeHW7b/L9uoYMhYamoFeD6ZbBztjjyzxvRnow4Y0ov
	0R1FO2YcqgG3KTe+Y4oiJZfY/j7cLEy7Zmu1gNlRldfmZSeXnCUjbneQ5dQjlz68SwKlWH2mZOIj5
	VJ0SUlOLTt0djpbJcnuXfBRJryy30xChMOpPXpCr2EGeXaqaQONFfE3xyPOWAdSxON0dZjz6v7idA
	MewzjPo+DetT+x9iZ/yqZqflIEuPQp6bwWEtZnfXgrFhJJ/IKcD5UwZMOA3lqmL4cxwwP2YptzlsQ
	7MvmwwUdN6g7N6U2piuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wElKX-00000006he5-18dp;
	Mon, 20 Apr 2026 09:54:13 +0000
Received: from mx2.cyberprotect.ru ([176.10.93.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wElKT-00000006hdF-2W2Z
	for linux-mtd@lists.infradead.org;
	Mon, 20 Apr 2026 09:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cyberprotect.ru; s=dkim-r; h=MIME-Version:Date:From:Sender:Reply-To;
	bh=mz9CQHA7o3rjpRsMyGHAcvLiblzyf8jQKOq+34jl4L4=; b=fDLa19TRysc+mC0JjaI3mtxzP/
	iZ41PqyJrcDwkvV0BeY1xC75rcoi4YS54WL8/l+ODGYrKquMZ/H8Y7LqF7OZ5OUHgfx5y4MZC68X0
	XSrYOMHEW3dL7F2vo5Dd8Bt6L9TUL1vWPCBwz6M6NhBN5eqR3DLdTU9CgCHl7p0fe+IELgmpCNeUw
	vtM7xD2JXXjpbc8lRdcivrAiSJeRacEFn2q97zjmbatvcXsyQyDI2YXkrVtnoMycq/TNgsLkUyynZ
	mAJcDVioViyuF5fya/b5i0KtT4srlyZ3utAck3KWxUl2gjnxwtr0Tgx+UtgnqeV17+z5BB6A0KVye
	UT+YxVSg==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cyberprotect.ru; s=dkim; h=MIME-Version:Date:From:Sender:Reply-To;
	bh=mz9CQHA7o3rjpRsMyGHAcvLiblzyf8jQKOq+34jl4L4=; b=cv3z6pPHaqKRLxByNnZndFu0E4
	roSPNk5UTBAkwLvmp4HDHUoEofcKvcS7sXlea+JfYKxC5gR2o26UeWhmgpAQ==;
From: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
To: David Woodhouse <dwmw2@infradead.org>
CC: Richard Weinberger <richard@nod.at>, Al Viro <viro@zeniv.linux.org.uk>,
	David Howells <dhowells@redhat.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH] jffs2: fix BUG_ON in jffs2_start_garbage_collect_thread on reconfigure
Date: Mon, 20 Apr 2026 12:52:20 +0300
Message-ID: <20260420095220.18769-1-Dmitry.Chumachenko@cyberprotect.ru>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Originating-IP: [10.80.0.30]
X-ClientProxiedBy: AIP-EXCH-1.aip.ooo (10.77.28.101) To AIP-EXCH-2.aip.ooo
 (10.77.28.102)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_025410_224195_67DA9EFE 
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

During fuzz testing, the following issue was discovered.

kernel BUG at fs/jffs2/background.c:40!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
CPU: 0 PID: 5060 Comm: syz-executor108 Not tainted 6.8.0-syzkaller-08951-gfe46a7dd189e #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/27/2024
RIP: 0010:jffs2_start_garbage_collect_thread+0x1f5/0x200 fs/jffs2/background.c:40

Call Trace:
 <TASK>
 jffs2_do_remount_fs+0x15b/0x1d0 fs/jffs2/fs.c:415
 reconfigure_super+0x445/0x880 fs/super.c:1071
 vfs_cmd_reconfigure fs/fsopen.c:267 [inline]
 vfs_fsconfig_locked fs/fsopen.c:296 [inline]
 __do_sys_fsconfig fs/fsopen.c:476 [inline]
 __se_sys_fsconfig+0xab5/0xec0 fs/fsopen.c:349
 do_syscall_64+0xfb/0x240
 entry_SYSCALL_64_after_hwframe+0x6d/0x75

When reconfiguring a mount without explicitly setting mount flags,
fc->sb_flags and fc->sb_flags_mask are both zero. jffs2_do_remount_fs()
skips stopping the GC thread because the superblock is read-only, but
starts a new one because fc->sb_flags lacks SB_RDONLY. The superblock
remains read-only, so on the next reconfigure the same path triggers
BUG_ON(c->gc_task) since the previous thread is still running.

Fix this by computing the effective new superblock flags using the same
formula as reconfigure_super() so the start decision reflects the
actual future state of the superblock.

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Fixes: ec10a24f10c8 ("vfs: Convert jffs2 to use the new mount API")
Signed-off-by: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
---
 fs/jffs2/fs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index d175cccb7c55..abfe6eead880 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -396,6 +396,8 @@ void jffs2_dirty_inode(struct inode *inode, int flags)
 int jffs2_do_remount_fs(struct super_block *sb, struct fs_context *fc)
 {
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
+	unsigned long s_flags_new = (sb->s_flags & ~fc->sb_flags_mask) |
+				    (fc->sb_flags & fc->sb_flags_mask);
 
 	if (c->flags & JFFS2_SB_FLAG_RO && !sb_rdonly(sb))
 		return -EROFS;
@@ -411,7 +413,7 @@ int jffs2_do_remount_fs(struct super_block *sb, struct fs_context *fc)
 		mutex_unlock(&c->alloc_sem);
 	}
 
-	if (!(fc->sb_flags & SB_RDONLY))
+	if (!(s_flags_new & SB_RDONLY))
 		jffs2_start_garbage_collect_thread(c);
 
 	fc->sb_flags |= SB_NOATIME;
-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
