Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497E7606A8AD
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 12:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FQ27hiEz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=elY+zSgx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tVP/LaJ8CYFQ2jxzqgjmp3O8QLCNLwFy8esIwvfAj1w=; b=FQ27hiEzcUh8+3QaMfZQPStVqu
	ReduWRB05WYztLhFIL3eI2GlMwsQ8QmQElDiQ+Zzd2IrYVEPkhoAwWJd1djNVqCd98aJSe1VnviPD
	n0fsCIHossce5Aw7ZLDeVwlzllwwff9W6vM4FgTn2NfqiCa1D/Cy8WROtB+Y7/9kaBwPkZIFlnrTU
	YGZWVSp/lLsRsJXFRVQZqOnJZ3tjpl9TGDvkLTpsMJexP5S+LexuhseX4KP7uWh1UBpEdyavtIq8N
	PsKKQ0xXZfffG0KF6OjXUOv02ZW1WDHAZXQriR8jr/X2n4JkwUWh5vVsNlqj8x034izatTgMwXkg4
	Q8owvlIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpyF-0000000CcXQ-01XA;
	Fri, 13 Nov 2026 12:01:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpyC-0000000CcWN-3CBm
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 12:01:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 847054037D;
	Fri, 13 Nov 2026 12:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF461F000C5;
	Fri, 13 Nov 2026 12:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794571288;
	bh=a4eB5Dae7Sw/Y7CJq0k+uuFPd5FO+2UZBB1BVu7ssxw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=elY+zSgx46kAT30TrktLqFL52t/0jLP66/o7rayM9UjLNOvIrptChzKfVlig/t/A8
	 TkOlcTA3QtyTLtgujK0u8UWI6NtCkHEnWYt2Nrl7wtWHp5ky/Rq4nZghfWk5KLFRXC
	 DjLP9XrYXK2nvKDdyCIYIwXN5osA3Rn4RJX1xx1nqMb46qFxuGkZm4vqzkENZvXsj9
	 ANgBqIeNwdB/GnfiLfE0bupPa9Mn7ovVkMOZs8uDD+NaQ34J4TZxiVLeYoEAddQ3Vn
	 oOhD5SAVdmT8PNqtR2Oc9MbCOz0h0eHzeLLzu/qOaoFZF72Se7aquy2VhDjs2Vg1HI
	 9vWV3eDNl2gJQ==
From: Christian Brauner <brauner@kernel.org>
Date: Fri, 13 Nov 2026 12:59:14 +0100
Subject: [PATCH v3 18/33] hpfs: don't set SB_RDONLY after filesystem errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-work-fs-sb_rdonly-v3-18-0be92bb73709@kernel.org>
References: <20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org>
In-Reply-To: <20261113-work-fs-sb_rdonly-v3-0-0be92bb73709@kernel.org>
To: linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, 
 linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
 linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, linux-mm@kvack.org, 
 ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
 linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev, 
 linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-xfs@vger.kernel.org, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4436; i=brauner@kernel.org;
 h=from:subject:message-id; bh=AS7fasJ+R2NTq4wSuHXyshwNLuujPLnebXBr0XQhoiw=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWR9+73u0CSHSp1ZybYrOvoZPsxjunNmxsrrR6c8X3Dz7
 fuKbNaY7x2lLAxiXAyyYoosDu0m4XLLeSo2G2VqwMxhZQIZwsDFKQATqbnLyLAtIJZL/TFfgtCC
 FRtEHpTdcHg2wV5ieWBN3K3qCKbrDvIM/2vW7zha831q9ZSHmp9+MtyOvP3Ad5H4w3c2zuIH8mM
 WMLACAA==
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

With errors=remount-ro, the hpfs default, hpfs_error() sets SB_RDONLY on
the first error without holding s_umount. If that happens while the
filesystem is frozen through bdev_freeze() thaw_super() sees a read-only
superblock and leaves the s_writers rwsems locked so every writer hangs.

hpfs_error() is also called from hpfs_fill_super() where nothing can
freeze the superblock yet, so keep setting SB_RDONLY there. After that
call sb_set_emergency_ro() instead and let the VFS refuse modifications.
FITRIM is refused and unmark_dirty() does nothing in that state so the
next mount reports the volume as improperly stopped. hpfs_map_dnode()
and hpfs_lookup() treat the state like read-only so lookups behave as
before.

After a remount to read-only a remount to read-write fails until umount.
A plain remount to read-write right after the error succeeds but the
filesystem stays read-only. A remount to read-only doesn't write the
spare block. Writes through file descriptors opened before the error
fail with EROFS.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 fs/hpfs/alloc.c |  4 ++--
 fs/hpfs/dir.c   |  2 +-
 fs/hpfs/map.c   |  3 ++-
 fs/hpfs/super.c | 11 +++++++++--
 4 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/fs/hpfs/alloc.c b/fs/hpfs/alloc.c
index f5150372618ed..15b12afa856a4 100644
--- a/fs/hpfs/alloc.c
+++ b/fs/hpfs/alloc.c
@@ -539,7 +539,7 @@ int hpfs_trim_fs(struct super_block *s, u64 start, u64 end, u64 minlen, unsigned
 		return 0;
 	if (start < sbi->sb_dirband_start + sbi->sb_dirband_size && end > sbi->sb_dirband_start) {
 		hpfs_lock(s);
-		if (sb_rdonly(s)) {
+		if (sb_rdonly_any(s)) {
 			err = -EROFS;
 			goto unlock_1;
 		}
@@ -560,7 +560,7 @@ int hpfs_trim_fs(struct super_block *s, u64 start, u64 end, u64 minlen, unsigned
 	end_bmp = (end + 0x3fff) >> 14;
 	while (start_bmp < end_bmp && !err) {
 		hpfs_lock(s);
-		if (sb_rdonly(s)) {
+		if (sb_rdonly_any(s)) {
 			err = -EROFS;
 			goto unlock_2;
 		}
diff --git a/fs/hpfs/dir.c b/fs/hpfs/dir.c
index 3bf11202e2d3c..a82c06635b891 100644
--- a/fs/hpfs/dir.c
+++ b/fs/hpfs/dir.c
@@ -265,7 +265,7 @@ struct dentry *hpfs_lookup(struct inode *dir, struct dentry *dentry, unsigned in
 	hpfs_result = hpfs_i(result);
 	if (!de->directory) hpfs_result->i_parent_dir = dir->i_ino;
 
-	if (de->has_acl || de->has_xtd_perm) if (!sb_rdonly(dir->i_sb)) {
+	if ((de->has_acl || de->has_xtd_perm) && !sb_rdonly_any(dir->i_sb)) {
 		hpfs_error(result->i_sb, "ACLs or XPERM found. This is probably HPFS386. This driver doesn't support it now. Send me some info on these structures");
 		iput(result);
 		result = ERR_PTR(-EINVAL);
diff --git a/fs/hpfs/map.c b/fs/hpfs/map.c
index be73233502f81..9cfda43215cc9 100644
--- a/fs/hpfs/map.c
+++ b/fs/hpfs/map.c
@@ -288,7 +288,8 @@ struct dnode *hpfs_map_dnode(struct super_block *s, unsigned secno,
 					goto bail;
 				}
 				if (((31 + de->namelen + de->down*4 + 3) & ~3) != le16_to_cpu(de->length)) {
-					if (((31 + de->namelen + de->down*4 + 3) & ~3) < le16_to_cpu(de->length) && s->s_flags & SB_RDONLY) goto ok;
+					if (((31 + de->namelen + de->down*4 + 3) & ~3) < le16_to_cpu(de->length) &&
+					    sb_rdonly_any(s)) goto ok;
 					hpfs_error(s, "namelen does not match dirent size in dnode %08x, dirent %03x, last %03x", secno, p, pp);
 					goto bail;
 				}
diff --git a/fs/hpfs/super.c b/fs/hpfs/super.c
index 8fbdbf0806276..a9e26ae2e3752 100644
--- a/fs/hpfs/super.c
+++ b/fs/hpfs/super.c
@@ -44,7 +44,7 @@ static void unmark_dirty(struct super_block *s)
 {
 	struct buffer_head *bh;
 	struct hpfs_spare_block *sb;
-	if (sb_rdonly(s)) return;
+	if (sb_rdonly_any(s)) return;
 	sync_blockdev(s->s_bdev);
 	if ((sb = hpfs_map_sector(s, 17, &bh, 0))) {
 		sb->dirty = hpfs_sb(s)->sb_chkdsk > 1 - hpfs_sb(s)->sb_was_error;
@@ -81,7 +81,14 @@ void hpfs_error(struct super_block *s, const char *fmt, ...)
 			else {
 				pr_cont("; remounting read-only\n");
 				mark_dirty(s, 0);
-				s->s_flags |= SB_RDONLY;
+				/*
+				 * Before SB_BORN the mounter holds s_umount,
+				 * later see sb_set_emergency_ro().
+				 */
+				if (s->s_flags & SB_BORN)
+					sb_set_emergency_ro(s);
+				else
+					s->s_flags |= SB_RDONLY;
 			}
 		} else if (sb_rdonly(s))
 				pr_cont("; going on - but anything won't be destroyed because it's read-only\n");

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
