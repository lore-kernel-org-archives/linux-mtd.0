Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FA4EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 19:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dQuWRrgNsKEXkNm3yUe3aTai2OlKJsGzsdiPnpbIQOE=; b=BN6FsBomB062r8
	sc2V7hflN37e4vuHezb8U26wWIifEpp9ANkZSeP21YlYnp1XAf3G4wIeIUfs/S26dChKVMgNiG6zO
	T26dealU4M8QpiVNhdfya1lOMzGGaYAY83bW0hUlToQpITJrarJojfM5DKXHxBKDRg92towMjWw6v
	JHAOATIqaSMV+y8EGRJGKy9+fThUMEWmI4rvImmacNdCT0ThGxQVFI2BXevC5P/zOQUCBHsgLGzIq
	2b1U1bLaCbuW195cUivDVbgUVWQc8xcCIPUUi3mDdQjlxzLmP87ZfEzJK+IPlO2QSn77OSY49Mgb6
	J33ZqMUrwINjREKIUrxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH7mg-00GqAm-1N;
	Wed, 05 Jul 2023 19:03:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH7mc-00Gq9e-30
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jul 2023 19:03:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 719EB616EE;
	Wed,  5 Jul 2023 19:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94634C433C8;
	Wed,  5 Jul 2023 19:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688583802;
	bh=xf8Hi6LLQ8Uft364NbD0ve0c8ZqVR4Xzt1FbU/Spvec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YeMu90xYX+J/DSpr4IEpPdjE0VhxjToh+dxnB6lIUKKzFPcDwLtfLqKprheME36Au
	 GwtAsEj1J48EJ+u7bhE8nllzBjY6eaN33Z7CFu7g9eBJBejJ9bJayxiBj/WF4aqxR1
	 ev8b72N50v378o9db6zZTHiX/IHmwUKC2RbwSvs+YbfDWVAWa+2HfqyyLEdQE8H6hH
	 sLvE6sIM7+NfFVYFnqbPdsVR3GGg6Nd+De74SfHuZRvzgUXYOA3NicY4g1GrO+AubB
	 x9RH15V52pkaLIQ5VhK+BEDjWAP0FZpk8dpHisGouC+BG+MA2V60Iplhx1Vt2GRlgB
	 4+1tVVOQCzaRA==
From: Jeff Layton <jlayton@kernel.org>
To: Christian Brauner <brauner@kernel.org>,
	Richard Weinberger <richard@nod.at>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 10/92] ubifs: convert to simple_rename_timestamp
Date: Wed,  5 Jul 2023 15:00:35 -0400
Message-ID: <20230705190309.579783-8-jlayton@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705190309.579783-1-jlayton@kernel.org>
References: <20230705185755.579053-1-jlayton@kernel.org>
 <20230705190309.579783-1-jlayton@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_120323_054009_C263CF9C 
X-CRM114-Status: GOOD (  14.51  )
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

A rename potentially involves updating 4 different inode timestamps.
Convert to the new simple_rename_timestamp helper function.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ubifs/dir.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index ef0499edc248..7ec25310bd8a 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1414,8 +1414,7 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 	 * Like most other Unix systems, set the @i_ctime for inodes on a
 	 * rename.
 	 */
-	time = current_time(old_dir);
-	old_inode->i_ctime = time;
+	simple_rename_timestamp(old_dir, old_dentry, new_dir, new_dentry);
 
 	/* We must adjust parent link count when renaming directories */
 	if (is_dir) {
@@ -1444,13 +1443,11 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 
 	old_dir->i_size -= old_sz;
 	ubifs_inode(old_dir)->ui_size = old_dir->i_size;
-	old_dir->i_mtime = old_dir->i_ctime = time;
-	new_dir->i_mtime = new_dir->i_ctime = time;
 
 	/*
 	 * And finally, if we unlinked a direntry which happened to have the
 	 * same name as the moved direntry, we have to decrement @i_nlink of
-	 * the unlinked inode and change its ctime.
+	 * the unlinked inode.
 	 */
 	if (unlink) {
 		/*
@@ -1462,7 +1459,6 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 			clear_nlink(new_inode);
 		else
 			drop_nlink(new_inode);
-		new_inode->i_ctime = time;
 	} else {
 		new_dir->i_size += new_sz;
 		ubifs_inode(new_dir)->ui_size = new_dir->i_size;
@@ -1557,7 +1553,6 @@ static int ubifs_xrename(struct inode *old_dir, struct dentry *old_dentry,
 	int sync = IS_DIRSYNC(old_dir) || IS_DIRSYNC(new_dir);
 	struct inode *fst_inode = d_inode(old_dentry);
 	struct inode *snd_inode = d_inode(new_dentry);
-	struct timespec64 time;
 	int err;
 	struct fscrypt_name fst_nm, snd_nm;
 
@@ -1588,11 +1583,7 @@ static int ubifs_xrename(struct inode *old_dir, struct dentry *old_dentry,
 
 	lock_4_inodes(old_dir, new_dir, NULL, NULL);
 
-	time = current_time(old_dir);
-	fst_inode->i_ctime = time;
-	snd_inode->i_ctime = time;
-	old_dir->i_mtime = old_dir->i_ctime = time;
-	new_dir->i_mtime = new_dir->i_ctime = time;
+	simple_rename_timestamp(old_dir, old_dentry, new_dir, new_dentry);
 
 	if (old_dir != new_dir) {
 		if (S_ISDIR(fst_inode->i_mode) && !S_ISDIR(snd_inode->i_mode)) {
-- 
2.41.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
