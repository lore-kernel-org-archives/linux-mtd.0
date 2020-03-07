Return-Path: <SRS0=A5yI=4Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8BDC10DCE
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Mar 2020 02:37:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45885206CC
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Mar 2020 02:37:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uVzkkDW0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="EccoWQS9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45885206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GbtJ+kriBHKQBZ5RqMtRG5dy9pHCmRYopCB+PTGoFZg=; b=uVzkkDW0/OETtg
	1ERfB8RFggAr2B0rDVMqdcXPf/PQCNyEYzJcQWWTGyP1mj5P529czRL6mI5TaCLWKeEBTffmvJfka
	nBXkRurOKepQTyCQwuBePwwUW94rDXB4d2zh+jvoYStqmUpUDq2x+pdSRakvlJNm/+L4l4xHDF9xy
	lMk+xn7CnY3PNQIuBAkqEXr+HnJ8UsrnB26++4azPmtsDRgSeTcr6WjyMOkrULmGrIGkOb3yFzLxG
	aGgt3K1+TN5uQSoy5Ckj/OSEd1JHsXLBVz9aP3FOrhddiH3PyGDJfhBgf51nI8q37oBFIAFkY29r3
	3kMVUeUbdkVoUQ9BmO0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAPLK-0002Xr-US; Sat, 07 Mar 2020 02:37:34 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAPKX-0001Rb-Qf
 for linux-mtd@lists.infradead.org; Sat, 07 Mar 2020 02:36:47 +0000
Received: by mail-pf1-x449.google.com with SMTP id q135so2799024pfc.13
 for <linux-mtd@lists.infradead.org>; Fri, 06 Mar 2020 18:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=NzaUhXJKxblqI5Gh8t6DIY356EoyrOvF1fo+IUJGt18=;
 b=EccoWQS9AXS5hpeGqbDeRB4+lk5VSQiPuG6A9As+3Sz27I8WtlXC7LFsnBTkqyqscy
 fc8A0NXyynB4xbNC92kgeeMp1g9fvxDOIW9r/O/0XTtY4PAL6UrY6270d/juGsMo3wzS
 Id48ssVCGbe6Ql7ff0nq/tLqCaLFaeV/b+53mZWcesKKQlDvzCIKelbXLc0qz27vVeHD
 JTRdBGExEw1G+NoooIhNmw6AVYyOveSXsv5WLCTTBdXp2/epPotL5URlrY/UCT2V3HlI
 EKcpp6bpVGwX6D4lnw7C82WpWKpIAVs0ZviTE/X4oxpqJ2qOmlKTjoZZXeFRYseEvdm7
 a35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=NzaUhXJKxblqI5Gh8t6DIY356EoyrOvF1fo+IUJGt18=;
 b=Jr1htU88Bu3UlUPrePvhiEI4QV+R7O/TqOelL8e0sG04UPp0HhMbT2xsf0ihFJp6Ay
 pFdiTMi3PHUVUZ6DfDk7MKyqi/cYvNEgmBz5fcdSZsAMuSAf7NIz8nq4vvF/OnBoJJrR
 dygqnvQPUf91MBs/OTt+DXjWy4knSJ5t1JeHtULhNegOYl7w0Oe+3Jtr8E2nVbfuo8eE
 PmJHQTmUQjiQrw0vbBSPyzg30S+xkBhY3KGKQpeGnCIozf3s3a7cp/ZF8B9vDkEUvcN5
 BK/oU6ihYRx70y07c+7T3w93vZaVjBln0kKPFxfaX+YBDOczEAn3KTHcsYXATx413NuN
 qhZQ==
X-Gm-Message-State: ANhLgQ0pcVPz/M/ARAz2PmfZlCcKfyOgsQMklCWqEfsL29rWC/EV7Ex9
 cJKWtlvuashUskboGm3RunZdkwB9vwc=
X-Google-Smtp-Source: ADFU+vupxVhCcnBRX+LRsi80i60l66Dbf4Wv4LxKEgsP+bQwFjA57ttf6c1Wy8uq3io7+mJZmPsncegbrKY=
X-Received: by 2002:a17:90a:8509:: with SMTP id
 l9mr6698441pjn.43.1583548603121; 
 Fri, 06 Mar 2020 18:36:43 -0800 (PST)
Date: Fri,  6 Mar 2020 18:36:07 -0800
In-Reply-To: <20200307023611.204708-1-drosen@google.com>
Message-Id: <20200307023611.204708-5-drosen@google.com>
Mime-Version: 1.0
References: <20200307023611.204708-1-drosen@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v8 4/8] ext4: Use generic casefolding support
From: Daniel Rosenberg <drosen@google.com>
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_183645_879709_7021966F 
X-CRM114-Status: GOOD (  15.83  )
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
Cc: Daniel Rosenberg <drosen@google.com>, linux-doc@vger.kernel.org,
 kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This switches ext4 over to the generic casefolding support provided by
the previous patch.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/ext4/dir.c   | 48 ++----------------------------------------------
 fs/ext4/ext4.h  | 12 ------------
 fs/ext4/hash.c  |  2 +-
 fs/ext4/namei.c | 20 ++++++++------------
 fs/ext4/super.c | 12 ++++++------
 5 files changed, 17 insertions(+), 77 deletions(-)

diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
index 9aa1f75409b02..04fd68c4adc5f 100644
--- a/fs/ext4/dir.c
+++ b/fs/ext4/dir.c
@@ -669,52 +669,8 @@ const struct file_operations ext4_dir_operations = {
 };
 
 #ifdef CONFIG_UNICODE
-static int ext4_d_compare(const struct dentry *dentry, unsigned int len,
-			  const char *str, const struct qstr *name)
-{
-	struct qstr qstr = {.name = str, .len = len };
-	const struct dentry *parent = READ_ONCE(dentry->d_parent);
-	const struct inode *inode = READ_ONCE(parent->d_inode);
-
-	if (!inode || !IS_CASEFOLDED(inode) ||
-	    !EXT4_SB(inode->i_sb)->s_encoding) {
-		if (len != name->len)
-			return -1;
-		return memcmp(str, name->name, len);
-	}
-
-	return ext4_ci_compare(inode, name, &qstr, false);
-}
-
-static int ext4_d_hash(const struct dentry *dentry, struct qstr *str)
-{
-	const struct ext4_sb_info *sbi = EXT4_SB(dentry->d_sb);
-	const struct unicode_map *um = sbi->s_encoding;
-	const struct inode *inode = READ_ONCE(dentry->d_inode);
-	unsigned char *norm;
-	int len, ret = 0;
-
-	if (!inode || !IS_CASEFOLDED(inode) || !um)
-		return 0;
-
-	norm = kmalloc(PATH_MAX, GFP_ATOMIC);
-	if (!norm)
-		return -ENOMEM;
-
-	len = utf8_casefold(um, str, norm, PATH_MAX);
-	if (len < 0) {
-		if (ext4_has_strict_mode(sbi))
-			ret = -EINVAL;
-		goto out;
-	}
-	str->hash = full_name_hash(dentry, norm, len);
-out:
-	kfree(norm);
-	return ret;
-}
-
 const struct dentry_operations ext4_dentry_ops = {
-	.d_hash = ext4_d_hash,
-	.d_compare = ext4_d_compare,
+	.d_hash = generic_ci_d_hash,
+	.d_compare = generic_ci_d_compare,
 };
 #endif
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 61b37a052052b..b912c5611ddad 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -1372,14 +1372,6 @@ struct ext4_super_block {
 
 #define EXT4_ENC_UTF8_12_1	1
 
-/*
- * Flags for ext4_sb_info.s_encoding_flags.
- */
-#define EXT4_ENC_STRICT_MODE_FL	(1 << 0)
-
-#define ext4_has_strict_mode(sbi) \
-	(sbi->s_encoding_flags & EXT4_ENC_STRICT_MODE_FL)
-
 /*
  * fourth extended-fs super-block data in memory
  */
@@ -1429,10 +1421,6 @@ struct ext4_sb_info {
 	struct kobject s_kobj;
 	struct completion s_kobj_unregister;
 	struct super_block *s_sb;
-#ifdef CONFIG_UNICODE
-	struct unicode_map *s_encoding;
-	__u16 s_encoding_flags;
-#endif
 
 	/* Journaling */
 	struct journal_s *s_journal;
diff --git a/fs/ext4/hash.c b/fs/ext4/hash.c
index 3e133793a5a34..143b0073b3f46 100644
--- a/fs/ext4/hash.c
+++ b/fs/ext4/hash.c
@@ -275,7 +275,7 @@ int ext4fs_dirhash(const struct inode *dir, const char *name, int len,
 		   struct dx_hash_info *hinfo)
 {
 #ifdef CONFIG_UNICODE
-	const struct unicode_map *um = EXT4_SB(dir->i_sb)->s_encoding;
+	const struct unicode_map *um = dir->i_sb->s_encoding;
 	int r, dlen;
 	unsigned char *buff;
 	struct qstr qstr = {.name = name, .len = len };
diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index b05ea72f38fd1..1a1c4fdcfd3ee 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1286,8 +1286,8 @@ static void dx_insert_block(struct dx_frame *frame, u32 hash, ext4_lblk_t block)
 int ext4_ci_compare(const struct inode *parent, const struct qstr *name,
 		    const struct qstr *entry, bool quick)
 {
-	const struct ext4_sb_info *sbi = EXT4_SB(parent->i_sb);
-	const struct unicode_map *um = sbi->s_encoding;
+	const struct super_block *sb = parent->i_sb;
+	const struct unicode_map *um = sb->s_encoding;
 	int ret;
 
 	if (quick)
@@ -1299,7 +1299,7 @@ int ext4_ci_compare(const struct inode *parent, const struct qstr *name,
 		/* Handle invalid character sequence as either an error
 		 * or as an opaque byte sequence.
 		 */
-		if (ext4_has_strict_mode(sbi))
+		if (sb_has_enc_strict_mode(sb))
 			return -EINVAL;
 
 		if (name->len != entry->len)
@@ -1316,7 +1316,7 @@ void ext4_fname_setup_ci_filename(struct inode *dir, const struct qstr *iname,
 {
 	int len;
 
-	if (!IS_CASEFOLDED(dir) || !EXT4_SB(dir->i_sb)->s_encoding) {
+	if (!needs_casefold(dir)) {
 		cf_name->name = NULL;
 		return;
 	}
@@ -1325,7 +1325,7 @@ void ext4_fname_setup_ci_filename(struct inode *dir, const struct qstr *iname,
 	if (!cf_name->name)
 		return;
 
-	len = utf8_casefold(EXT4_SB(dir->i_sb)->s_encoding,
+	len = utf8_casefold(dir->i_sb->s_encoding,
 			    iname, cf_name->name,
 			    EXT4_NAME_LEN);
 	if (len <= 0) {
@@ -1362,7 +1362,7 @@ static inline bool ext4_match(const struct inode *parent,
 #endif
 
 #ifdef CONFIG_UNICODE
-	if (EXT4_SB(parent->i_sb)->s_encoding && IS_CASEFOLDED(parent)) {
+	if (needs_casefold(parent)) {
 		if (fname->cf_name.name) {
 			struct qstr cf = {.name = fname->cf_name.name,
 					  .len = fname->cf_name.len};
@@ -2171,9 +2171,6 @@ static int ext4_add_entry(handle_t *handle, struct dentry *dentry,
 	struct buffer_head *bh = NULL;
 	struct ext4_dir_entry_2 *de;
 	struct super_block *sb;
-#ifdef CONFIG_UNICODE
-	struct ext4_sb_info *sbi;
-#endif
 	struct ext4_filename fname;
 	int	retval;
 	int	dx_fallback=0;
@@ -2190,9 +2187,8 @@ static int ext4_add_entry(handle_t *handle, struct dentry *dentry,
 		return -EINVAL;
 
 #ifdef CONFIG_UNICODE
-	sbi = EXT4_SB(sb);
-	if (ext4_has_strict_mode(sbi) && IS_CASEFOLDED(dir) &&
-	    sbi->s_encoding && utf8_validate(sbi->s_encoding, &dentry->d_name))
+	if (sb_has_enc_strict_mode(sb) && IS_CASEFOLDED(dir) &&
+	    sb->s_encoding && utf8_validate(sb->s_encoding, &dentry->d_name))
 		return -EINVAL;
 #endif
 
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 0c7c4adb664ec..11a7af11d8aee 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1112,7 +1112,7 @@ static void ext4_put_super(struct super_block *sb)
 	kfree(sbi->s_blockgroup_lock);
 	fs_put_dax(sbi->s_daxdev);
 #ifdef CONFIG_UNICODE
-	utf8_unload(sbi->s_encoding);
+	utf8_unload(sb->s_encoding);
 #endif
 	kfree(sbi);
 }
@@ -3926,7 +3926,7 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 		goto failed_mount;
 
 #ifdef CONFIG_UNICODE
-	if (ext4_has_feature_casefold(sb) && !sbi->s_encoding) {
+	if (ext4_has_feature_casefold(sb) && !sb->s_encoding) {
 		const struct ext4_sb_encodings *encoding_info;
 		struct unicode_map *encoding;
 		__u16 encoding_flags;
@@ -3957,8 +3957,8 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 			 "%s-%s with flags 0x%hx", encoding_info->name,
 			 encoding_info->version?:"\b", encoding_flags);
 
-		sbi->s_encoding = encoding;
-		sbi->s_encoding_flags = encoding_flags;
+		sb->s_encoding = encoding;
+		sb->s_encoding_flags = encoding_flags;
 	}
 #endif
 
@@ -4571,7 +4571,7 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 	}
 
 #ifdef CONFIG_UNICODE
-	if (sbi->s_encoding)
+	if (sb->s_encoding)
 		sb->s_d_op = &ext4_dentry_ops;
 #endif
 
@@ -4766,7 +4766,7 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 		crypto_free_shash(sbi->s_chksum_driver);
 
 #ifdef CONFIG_UNICODE
-	utf8_unload(sbi->s_encoding);
+	utf8_unload(sb->s_encoding);
 #endif
 
 #ifdef CONFIG_QUOTA
-- 
2.25.1.481.gfbce0eb801-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
