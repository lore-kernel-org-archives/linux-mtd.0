Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E672D606A327
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 16:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dZ5PknYE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=StoUJS5a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ng4Y/KKtQ9HV4nIWz5Rc05etrwJ+o3onG6MQEq+qNNE=; b=dZ5PknYEsu+Y2mvExEZ9li6pad
	K321wljGc00DZaxoUcYywzlGEct3t8hPxJCgDPHQ0Ia4/2lXixcWdXMwH5VaR744D0e6mijlYAopd
	lICY7BUHUi7lPoRYObUwmSgSCUDYic6gchLPts4bh4Zn5HmtWjYpnnNgwkb/SwWCIOA7CdaqxjdVN
	USbKr7fhKbHUPnuCMZXsJCQylK7Ad217SUQidxDNjNdYiVd9nz74QYJ5VYp86acBc7YkKdu0vrzha
	mr516Hb8nDtMZgpNPp45cCsXF4Qyvk6Ta8IJyUfcWoKraX/Qf6uKqzlG8TAthHM14nCWiYxjZchzu
	bVPnNj/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSh0-00000009lKr-2gfM;
	Thu, 29 Oct 2026 16:09:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSgz-00000009lJt-2cI6
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 16:09:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 63C3443335;
	Thu, 29 Oct 2026 16:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3057E1F031E5;
	Thu, 29 Oct 2026 16:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793290169;
	bh=tghqoO8dgKkXNrANwBfbEQhOH6ptXpRkG83I7JeJUiM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=StoUJS5aez/Dy/p0iLnpmzYRskJI6njG4RHriV4VKwHnEmSuoJpr7bf64RKmoL5kZ
	 LpYsoz5f1fhAS24bkRrkWLnYofAnj8P0THUafKWW7RafHWI2dCVm0A2NrfftU/4EJ4
	 W/a36jiBtQyLdmCJJlDckE5uFA4+djxGxtfNu5HW0DKMCMXrP35nweWjwITAu2twm8
	 Ar8Ozhlu/wg5Jvnl8D2aAP4Pdl8NzfwCxb/DsbUJOTYcGiyhF6CGbKIGj15TD3X0LQ
	 JCblZ8bW5R4fvo7BPU3E1I+l8B02IQOsLnwajPji0+DPvdymSCKmpGwsKnw6kjCi+2
	 J8bcUPJXeTwdA==
From: Christian Brauner <brauner@kernel.org>
Date: Thu, 29 Oct 2026 17:07:21 +0100
Subject: [PATCH v2 30/34] ext4: allow remounting read-only in the emergency
 state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-work-fs-sb_rdonly-v2-30-2f44f64f0b66@kernel.org>
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
 "Christian Brauner (Amutable)" <brauner@kernel.org>, stable@vger.kernel.org, 
 Jan Kara <jack@suse.cz>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2356; i=brauner@kernel.org;
 h=from:subject:message-id; bh=ti3vaFeq1wr2J3gmGLEbz9S2kgER+gU7DSPKbKEcJIw=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQ9zjf41qx6p3hhZPmz/Xlf/a8WR073X8O4NyFMf+t+I
 fspOo5HO0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTACbCa8vIcHxmS8CnWPEZp67N
 5q6/bvdVvq+uhv25WeeDk0V1PSeXvgeqyC7PmRFnnz+z9ejFH64Pv2xW9n99ZfOORsPiqZ2ThaV
 5AQ==
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

__ext4_remount() refuses any change of the read-only state with EROFS
while ext4_emergency_state() is set, i.e. after a shutdown or an error.
Neither sets SB_RDONLY anymore, so a remount to read-only fails and the
filesystem stays read-write. Emergency remount (sysrq u) asks with
SB_FORCE and reconfigure_super() WARNs, a panic with panic_on_warn:

  forced remount of a ext4 fs returned -30

Becoming read-only doesn't need to write anything. So allow it and skip
everything in that branch that would touch the disk: sync_filesystem(),
dquot_suspend(), the s_state update, ext4_mark_recovery_complete() and
the superblock commit without a journal. Going read-write is still
refused.

Note that ext4_emergency_state() only exists since v6.15. Older stable
trees need ext4_forced_shutdown() instead.

Fixes: 95257987a638 ("ext4: drop EXT4_MF_FS_ABORTED flag")
Fixes: d3476f3dad4a ("ext4: don't set SB_RDONLY after filesystem errors")
Cc: stable@vger.kernel.org
Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/ext4/super.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 9cae52471dee..ae5ba6823c01 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -6761,11 +6761,16 @@ static int __ext4_remount(struct fs_context *fc, struct super_block *sb)
 
 	if ((bool)(fc->sb_flags & SB_RDONLY) != sb_rdonly(sb)) {
 		if (ext4_emergency_state(sb)) {
-			err = -EROFS;
-			goto restore_opts;
-		}
-
-		if (fc->sb_flags & SB_RDONLY) {
+			/*
+			 * Going read-only must work for emergency remount
+			 * (sysrq u) but nothing may be written, just flip it.
+			 */
+			if (!(fc->sb_flags & SB_RDONLY)) {
+				err = -EROFS;
+				goto restore_opts;
+			}
+			sb->s_flags |= SB_RDONLY;
+		} else if (fc->sb_flags & SB_RDONLY) {
 			err = sync_filesystem(sb);
 			if (err < 0)
 				goto restore_opts;
@@ -6876,7 +6881,8 @@ static int __ext4_remount(struct fs_context *fc, struct super_block *sb)
 			goto restore_opts;
 	}
 
-	if (sbi->s_journal == NULL && !(old_sb_flags & SB_RDONLY)) {
+	if (sbi->s_journal == NULL && !(old_sb_flags & SB_RDONLY) &&
+	    !ext4_emergency_state(sb)) {
 		err = ext4_commit_super(sb);
 		if (err)
 			goto restore_opts;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
