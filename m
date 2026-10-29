Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9482C60A2639
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 16:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QGWVHieu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lZ/NtxuW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EQS1yLHfvKYbFE62j7jOcxVZC57jbenMqgkNv5jajJM=; b=QGWVHieuQmwMn7iWEv49hGXcnI
	Ce1YcdP/QHmB9aZ6VquhRy21bxsFrs4HX3yhQUrg/UNBK/OTvyjsPfGIE6xsTWpleuO0CIKBYSlYf
	mbaQuTRTZnfOwbQ3CWlq55zUAt5jb/INDFC3atFT1sZaPKdUBBdXdmTHJ7efER3X+b7YOzOqDf9Kl
	B08m58Hj8VjUUDwiBJGomZV4dG/DixN1S33cAyMYJk3KEuGdLEx0eAdz+x2KjMkY4/leN5wh5dIEJ
	sFuXcme85ObFcg9aQe42mhMOTUnHC0n3C+2jbsjUEGHWbm3stRH4SkoFo+sgo7VO8yJmkkuIblUso
	lA6HiHrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSfW-00000009kA1-1KpR;
	Thu, 29 Oct 2026 16:07:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSfV-00000009k90-1bFc
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 16:07:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 03AE043BDD;
	Thu, 29 Oct 2026 16:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B3F1F01829;
	Thu, 29 Oct 2026 16:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793290075;
	bh=zxzMnAfr+mLITGlXVw2HHwWaLKEq9rk+KQbTmA0gnZc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lZ/NtxuW+whuET0o12ey+U43ax2RjET2OlE1sxt2rJYT5lAhZhE7nCGkk3w6L4uwG
	 Gpv/NOomzhz109Zgzhq4ZopFhZ2MqmhhfkdciraP6cyN0KAKmTutcGeVw8Xkpm47h+
	 FdROUWFWq9PkGga8qYGhHhY5JrKfsEITLjdQLo1hWaee+eT0E47r3yYiQ+/tVof5F7
	 y9Fg4mwMp73+2lplQrwS8LKDTmw+4HTlimsHI+cMqnEXzXwpqtu0Hh1YDQkP1I24Jx
	 KHO1QAvKX55syZQXI09EsjRMmKBALzT1TAqTfLVEWIXBaCchpAjEV6fwXEikbormVj
	 gommYd3qzRDIw==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 29 Oct 2026 17:06:59 +0100
Subject: [PATCH v2 08/34] exfat: keep the current mount options on remount
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-work-fs-sb_rdonly-v2-8-2f44f64f0b66@kernel.org>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
In-Reply-To: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
To: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, 
 linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
 linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, linux-mm@kvack.org, 
 ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
 linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
 linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-xfs@vger.kernel.org, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3964; i=brauner@kernel.org;
 h=from:subject:message-id; bh=mZbazIJ3QS8ZQ3YBus7040jsx8ku0rcjHK0u0BKdtWQ=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQ9ztfvmdgeu79zf5Tfy+ctSyx97ngf2HGVPWRfrAuD/
 OtDnxz/dJSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAExkWg3D/4gbJytOb0pfIrqu
 /PG8B9lxZzaeb1ZeLBr68J/43z6faRYM/1Qf1nipbj/0ZfLEa0cn9U5Ybb4iodhmjjoXt5SzQpP
 xeyYA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
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

exfat_init_fs_context() only inherits uid, gid, fmask and dmask for a
reconfigure. But exfat_reconfigure() refuses to change iocharset,
keep_last_dots, sys_tz, time_offset and allow_utime. So every remount
that doesn't repeat a non-default value for one of them fails with
EINVAL, including emergency remount (sysrq u) which passes no options at
all. And an option-less remount silently resets errors=, zero_size_dir
and discard.

So start a reconfigure from the current options like gfs2 does. The
iocharset string stays NULL in the new context because
->init_fs_context() runs without s_umount for mount(2) and a concurrent
remount could free it. It's only compared if the remount names one. A
shutdown turns discard off for good so exfat_reconfigure() keeps it off.

The next patch stops exfat from setting SB_RDONLY after errors. An
errored exfat then stays read-write and emergency remount would run into
this as well.

Fixes: e6fd5d3a4317 ("exfat: support modifying mount options via remount")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/exfat/super.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index 4943cef97741..44d2000007df 100644
--- a/fs/exfat/super.c
+++ b/fs/exfat/super.c
@@ -797,14 +797,12 @@ static int exfat_reconfigure(struct fs_context *fc)
 		mutex_unlock(&sbi->s_lock);
 	}
 
-	if (new_opts->allow_utime == (unsigned short)-1)
-		new_opts->allow_utime = ~new_opts->fs_dmask & 0022;
-
 	/*
 	 * Since the old settings of these mount options are cached in
 	 * inodes or dentries, they cannot be modified dynamically.
 	 */
-	if (strcmp(new_opts->iocharset, cur_opts->iocharset) ||
+	if ((new_opts->iocharset &&
+	     strcmp(new_opts->iocharset, cur_opts->iocharset)) ||
 	    new_opts->keep_last_dots != cur_opts->keep_last_dots ||
 	    new_opts->sys_tz != cur_opts->sys_tz ||
 	    new_opts->time_offset != cur_opts->time_offset ||
@@ -815,6 +813,10 @@ static int exfat_reconfigure(struct fs_context *fc)
 	    new_opts->allow_utime != cur_opts->allow_utime)
 		return -EINVAL;
 
+	/* A shutdown turned discard off for good. */
+	if (exfat_forced_shutdown(sb))
+		new_opts->discard = 0;
+
 	if (new_opts->discard != cur_opts->discard &&
 	    new_opts->discard &&
 	    !bdev_max_discard_sectors(sb->s_bdev)) {
@@ -823,6 +825,8 @@ static int exfat_reconfigure(struct fs_context *fc)
 	}
 
 	swap(*cur_opts, *new_opts);
+	/* The iocharset can't change, keep the current string. */
+	swap(cur_opts->iocharset, new_opts->iocharset);
 
 	return 0;
 }
@@ -849,23 +853,24 @@ static int exfat_init_fs_context(struct fs_context *fc)
 
 	if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE && fc->root) {
 		struct super_block *sb = fc->root->d_sb;
-		struct exfat_mount_options *cur_opts = &EXFAT_SB(sb)->options;
 
-		sbi->options.fs_uid = cur_opts->fs_uid;
-		sbi->options.fs_gid = cur_opts->fs_gid;
-		sbi->options.fs_fmask = cur_opts->fs_fmask;
-		sbi->options.fs_dmask = cur_opts->fs_dmask;
+		/*
+		 * Start from the current options so a remount only changes
+		 * what it specifies. The iocharset string stays with the
+		 * superblock, see exfat_reconfigure().
+		 */
+		sbi->options = EXFAT_SB(sb)->options;
+		sbi->options.iocharset = NULL;
 	} else {
 		sbi->options.fs_uid = current_uid();
 		sbi->options.fs_gid = current_gid();
 		sbi->options.fs_fmask = current->fs->umask;
 		sbi->options.fs_dmask = current->fs->umask;
+		sbi->options.allow_utime = -1;
+		sbi->options.errors = EXFAT_ERRORS_RO;
+		exfat_set_iocharset(&sbi->options, exfat_default_iocharset);
 	}
 
-	sbi->options.allow_utime = -1;
-	sbi->options.errors = EXFAT_ERRORS_RO;
-	exfat_set_iocharset(&sbi->options, exfat_default_iocharset);
-
 	fc->s_fs_info = sbi;
 	fc->ops = &exfat_context_ops;
 	return 0;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
