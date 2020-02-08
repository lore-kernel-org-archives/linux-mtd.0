Return-Path: <SRS0=oRr0=34=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0888C2BA83
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Feb 2020 01:37:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95A8820715
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Feb 2020 01:37:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JPf8tF1Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="V3VcPrxa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95A8820715
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=npY9qH52OiYyoguW9XeLzBqD4ULcZfdh5VNcPkWB2Og=; b=JPf8tF1YuLIm7E
	ZEl54ImP8vsOly2zgZ90xsc9dZIgOayLof5Fu0W4+nZb1BHbmQzwtRWAck4GYk0RQdAcP4atq8VSS
	Z7k/VSsNYo+oWzkHzLFhlljE6nKQsm+MJ2SNQ2mIjQSIWdR/nR3Z+NR3yEmBpWGPHIxTc26CYBQv2
	CV8B8Gn2PDmIGb98PdCSlFHtSA/PcaRCwfhvVk2liE7XJuyaMVH7jCLhyy1flfVfzaA/JpewQ+f8v
	DmghYQ8OWx++jZl4u1zEcFzioSzkld+2Lux9I0BsRKHP2Mt1cSLyEHRdk7ugZOntpGv/vtRgJkuCi
	LtJdMJe1VJNRa4/11XkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j0F3F-0007MI-Vq; Sat, 08 Feb 2020 01:36:53 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j0F2S-0006Lj-RF
 for linux-mtd@lists.infradead.org; Sat, 08 Feb 2020 01:36:06 +0000
Received: by mail-pl1-x649.google.com with SMTP id v16so610369ply.21
 for <linux-mtd@lists.infradead.org>; Fri, 07 Feb 2020 17:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=PM3tD4njKzZSFOsXtyEHPKTwa9poqnCvBDMtgLJDiYs=;
 b=V3VcPrxamqIGePPcOphX6Ppi9D/2lyuNTKI6LvAaJ4b/jlpXpVuJf6GC+d7px1c66X
 Clu6R3PyBOUsLaUyLI3CVLvy5pnfD5x79m3H9q1fx3DIEqQaP12b+R/RMnz00HjsdeAT
 oCAUjTSd8frT/tuS3Wb9ovqKq7Ucsic/oekES7XEy4LVJIzKIE3vNVUJfnTGYgFFb9Hz
 c+lc+UADgfq3xifpfchhpkGdwUslMfpqK9KIUPYnbKjq7KLnTAHZ34Ozf61WXS+2cCEr
 P7vj2/DSDm6OZuDFoQOK3/fLUlbxn8ag0qRgpxwfacjiHOvtzFK+L8RZfB0ers/r+ABJ
 LmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=PM3tD4njKzZSFOsXtyEHPKTwa9poqnCvBDMtgLJDiYs=;
 b=J6xUiN0dyYXvSEIj9vEhCHi1uh3ilWIhmn5lgEViVwZh9dfCWaLEpTHN8YDkjQeFI4
 tRmp/reNlrK4t69hy7JYj/AHUdHab1BhEwCfjQ/c0pJAehyh4O0PZJX47hkB24mz/cOK
 XJSDiLPkwmH90HLnEsratZ8XsZdj2lECsxK9a/PTcUszlmQRn3eO5FZk4ujrwlk2E35b
 nsPWDFQBUJkUrP/QsZLThj/cQu0P4deA3FOM1cgtOCz/E5VZJyqmjlFHutdGHjoqXjWk
 uVUomXDwF+G67dC56vI3QxpJuKnlr7GFSljOor4RP8wBzvchLR2pK7U2TMTRNZgiWiEI
 MC6g==
X-Gm-Message-State: APjAAAV02J3RSlPOKYsxNzwbR5D2FiLgZMo8OucQ/LVCn2z4txp3YMTJ
 3xX0rxNV8YwTjH6Kc6rZN900cYY4kM8=
X-Google-Smtp-Source: APXvYqwl/lEcrrKeOu3wI/xiA2znsv59CFCVINP/2YnIluASYc5rk9Vt0U0ykTANljRsYmxUE/5QlMNKY5s=
X-Received: by 2002:a63:ab04:: with SMTP id p4mr2169862pgf.37.1581125763416;
 Fri, 07 Feb 2020 17:36:03 -0800 (PST)
Date: Fri,  7 Feb 2020 17:35:47 -0800
In-Reply-To: <20200208013552.241832-1-drosen@google.com>
Message-Id: <20200208013552.241832-4-drosen@google.com>
Mime-Version: 1.0
References: <20200208013552.241832-1-drosen@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v7 3/8] f2fs: Use generic casefolding support
From: Daniel Rosenberg <drosen@google.com>
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_173604_964622_581C7E8E 
X-CRM114-Status: GOOD (  16.63  )
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

This switches f2fs over to the generic support provided in
commit 65832afbeaaf ("fs: Add standard casefolding support")

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/f2fs/dir.c           | 63 +++++++----------------------------------
 fs/f2fs/f2fs.h          |  4 ---
 fs/f2fs/hash.c          |  2 +-
 fs/f2fs/super.c         | 10 +++----
 fs/f2fs/sysfs.c         | 10 ++++---
 include/linux/f2fs_fs.h |  3 --
 6 files changed, 22 insertions(+), 70 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 27d0dd7a16d6d..d822c0d5eb182 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -114,8 +114,8 @@ static struct f2fs_dir_entry *find_in_block(struct inode *dir,
 int f2fs_ci_compare(const struct inode *parent, const struct qstr *name,
 				const struct qstr *entry, bool quick)
 {
-	const struct f2fs_sb_info *sbi = F2FS_SB(parent->i_sb);
-	const struct unicode_map *um = sbi->s_encoding;
+	const struct super_block *sb = parent->i_sb;
+	const struct unicode_map *um = sb->s_encoding;
 	int ret;
 
 	if (quick)
@@ -127,7 +127,7 @@ int f2fs_ci_compare(const struct inode *parent, const struct qstr *name,
 		/* Handle invalid character sequence as either an error
 		 * or as an opaque byte sequence.
 		 */
-		if (f2fs_has_strict_mode(sbi))
+		if (sb_has_enc_strict_mode(sb))
 			return -EINVAL;
 
 		if (name->len != entry->len)
@@ -154,7 +154,7 @@ static void f2fs_fname_setup_ci_filename(struct inode *dir,
 	if (!cf_name->name)
 		return;
 
-	cf_name->len = utf8_casefold(sbi->s_encoding,
+	cf_name->len = utf8_casefold(dir->i_sb->s_encoding,
 					iname, cf_name->name,
 					F2FS_NAME_LEN);
 	if ((int)cf_name->len <= 0) {
@@ -173,7 +173,7 @@ static inline bool f2fs_match_name(struct f2fs_dentry_ptr *d,
 {
 #ifdef CONFIG_UNICODE
 	struct inode *parent = d->inode;
-	struct f2fs_sb_info *sbi = F2FS_I_SB(parent);
+	struct super_block *sb = parent->i_sb;
 	struct qstr entry;
 #endif
 
@@ -184,7 +184,7 @@ static inline bool f2fs_match_name(struct f2fs_dentry_ptr *d,
 	entry.name = d->filename[bit_pos];
 	entry.len = de->name_len;
 
-	if (sbi->s_encoding && IS_CASEFOLDED(parent)) {
+	if (sb->s_encoding && IS_CASEFOLDED(parent)) {
 		if (cf_str->name) {
 			struct qstr cf = {.name = cf_str->name,
 					  .len = cf_str->len};
@@ -357,8 +357,8 @@ struct f2fs_dir_entry *f2fs_find_entry(struct inode *dir,
 	int err;
 
 #ifdef CONFIG_UNICODE
-	if (f2fs_has_strict_mode(F2FS_I_SB(dir)) && IS_CASEFOLDED(dir) &&
-			utf8_validate(F2FS_I_SB(dir)->s_encoding, child)) {
+	if (sb_has_enc_strict_mode(dir->i_sb) && IS_CASEFOLDED(dir) &&
+			utf8_validate(dir->i_sb->s_encoding, child)) {
 		*res_page = ERR_PTR(-EINVAL);
 		return NULL;
 	}
@@ -1079,51 +1079,8 @@ const struct file_operations f2fs_dir_operations = {
 };
 
 #ifdef CONFIG_UNICODE
-static int f2fs_d_compare(const struct dentry *dentry, unsigned int len,
-			  const char *str, const struct qstr *name)
-{
-	struct qstr qstr = {.name = str, .len = len };
-	const struct dentry *parent = READ_ONCE(dentry->d_parent);
-	const struct inode *inode = READ_ONCE(parent->d_inode);
-
-	if (!inode || !IS_CASEFOLDED(inode)) {
-		if (len != name->len)
-			return -1;
-		return memcmp(str, name->name, len);
-	}
-
-	return f2fs_ci_compare(inode, name, &qstr, false);
-}
-
-static int f2fs_d_hash(const struct dentry *dentry, struct qstr *str)
-{
-	struct f2fs_sb_info *sbi = F2FS_SB(dentry->d_sb);
-	const struct unicode_map *um = sbi->s_encoding;
-	const struct inode *inode = READ_ONCE(dentry->d_inode);
-	unsigned char *norm;
-	int len, ret = 0;
-
-	if (!inode || !IS_CASEFOLDED(inode))
-		return 0;
-
-	norm = f2fs_kmalloc(sbi, PATH_MAX, GFP_ATOMIC);
-	if (!norm)
-		return -ENOMEM;
-
-	len = utf8_casefold(um, str, norm, PATH_MAX);
-	if (len < 0) {
-		if (f2fs_has_strict_mode(sbi))
-			ret = -EINVAL;
-		goto out;
-	}
-	str->hash = full_name_hash(dentry, norm, len);
-out:
-	kvfree(norm);
-	return ret;
-}
-
 const struct dentry_operations f2fs_dentry_ops = {
-	.d_hash = f2fs_d_hash,
-	.d_compare = f2fs_d_compare,
+	.d_hash = generic_ci_d_hash,
+	.d_compare = generic_ci_d_compare,
 };
 #endif
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5355be6b6755c..e73b8752f9c8d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1284,10 +1284,6 @@ struct f2fs_sb_info {
 	int valid_super_block;			/* valid super block no */
 	unsigned long s_flag;				/* flags for sbi */
 	struct mutex writepages;		/* mutex for writepages() */
-#ifdef CONFIG_UNICODE
-	struct unicode_map *s_encoding;
-	__u16 s_encoding_flags;
-#endif
 
 #ifdef CONFIG_BLK_DEV_ZONED
 	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
diff --git a/fs/f2fs/hash.c b/fs/f2fs/hash.c
index 5bc4dcd8fc03f..28acb24e7a7a8 100644
--- a/fs/f2fs/hash.c
+++ b/fs/f2fs/hash.c
@@ -110,7 +110,7 @@ f2fs_hash_t f2fs_dentry_hash(const struct inode *dir,
 {
 #ifdef CONFIG_UNICODE
 	struct f2fs_sb_info *sbi = F2FS_SB(dir->i_sb);
-	const struct unicode_map *um = sbi->s_encoding;
+	const struct unicode_map *um = dir->i_sb->s_encoding;
 	int r, dlen;
 	unsigned char *buff;
 	struct qstr folded;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 65a7a432dfee2..89b52629bd437 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1213,7 +1213,7 @@ static void f2fs_put_super(struct super_block *sb)
 	for (i = 0; i < NR_PAGE_TYPE; i++)
 		kvfree(sbi->write_io[i]);
 #ifdef CONFIG_UNICODE
-	utf8_unload(sbi->s_encoding);
+	utf8_unload(sb->s_encoding);
 #endif
 	kvfree(sbi);
 }
@@ -3223,7 +3223,7 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
 {
 #ifdef CONFIG_UNICODE
-	if (f2fs_sb_has_casefold(sbi) && !sbi->s_encoding) {
+	if (f2fs_sb_has_casefold(sbi) && !sbi->sb->s_encoding) {
 		const struct f2fs_sb_encodings *encoding_info;
 		struct unicode_map *encoding;
 		__u16 encoding_flags;
@@ -3254,8 +3254,8 @@ static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
 			 "%s-%s with flags 0x%hx", encoding_info->name,
 			 encoding_info->version?:"\b", encoding_flags);
 
-		sbi->s_encoding = encoding;
-		sbi->s_encoding_flags = encoding_flags;
+		sbi->sb->s_encoding = encoding;
+		sbi->sb->s_encoding_flags = encoding_flags;
 		sbi->sb->s_d_op = &f2fs_dentry_ops;
 	}
 #else
@@ -3742,7 +3742,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		kvfree(sbi->write_io[i]);
 
 #ifdef CONFIG_UNICODE
-	utf8_unload(sbi->s_encoding);
+	utf8_unload(sb->s_encoding);
 #endif
 free_options:
 #ifdef CONFIG_QUOTA
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 91d649790b1bc..4e8aae03f26c1 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -175,12 +175,14 @@ static ssize_t encoding_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
 #ifdef CONFIG_UNICODE
+	struct super_block *sb = sbi->sb;
+
 	if (f2fs_sb_has_casefold(sbi))
 		return snprintf(buf, PAGE_SIZE, "%s (%d.%d.%d)\n",
-			sbi->s_encoding->charset,
-			(sbi->s_encoding->version >> 16) & 0xff,
-			(sbi->s_encoding->version >> 8) & 0xff,
-			sbi->s_encoding->version & 0xff);
+			sb->s_encoding->charset,
+			(sb->s_encoding->version >> 16) & 0xff,
+			(sb->s_encoding->version >> 8) & 0xff,
+			sb->s_encoding->version & 0xff);
 #endif
 	return sprintf(buf, "(none)");
 }
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index ac3f4888b3dfa..e8763a955f90d 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -38,9 +38,6 @@
 #define F2FS_MAX_QUOTAS		3
 
 #define F2FS_ENC_UTF8_12_1	1
-#define F2FS_ENC_STRICT_MODE_FL	(1 << 0)
-#define f2fs_has_strict_mode(sbi) \
-	(sbi->s_encoding_flags & F2FS_ENC_STRICT_MODE_FL)
 
 #define F2FS_IO_SIZE(sbi)	(1 << F2FS_OPTION(sbi).write_io_size_bits) /* Blocks */
 #define F2FS_IO_SIZE_KB(sbi)	(1 << (F2FS_OPTION(sbi).write_io_size_bits + 2)) /* KB */
-- 
2.25.0.341.g760bfbb309-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
