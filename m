Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B38BC63798
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 06:10:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BCD324698
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 06:10:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EObf2uxx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="AW3Z8WWi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BCD324698
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MErED0H+k4t7vifWwLNtfA90GJdT2rvD2bI5hd4hkGM=; b=EObf2uxxEd+x01yd+k1NmO7h7
	XQhAJtAG6tl0Np1UyuLSLIRsNdFMbjC9bfNmBWTi5tOAVWUll/vixq6ZmBLdldWXVa0hnHyJ/e0YP
	QeGDPxw/3C1hZPCgO50Po9nVhGW/5m4QKQLDl3MT0IQGPxh8WVNEbCtljcTYnDRUzPN3hX4nT7Mdq
	+DQQMnZwSP9Gv0flhbRpqm1/1XcxmnwXEhsvDam6DYAZkOQ5xyQ+Yd2mYUUu8ysmZBRU+8TpusIfQ
	lUEqXMM32Upa9bPgDzunyPsKHjBWBDNsC0/BSmGc6cBZWwpj2C/7qhaHNfjgoC+OUT6cAtcCJ8A8A
	5slycWUjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfd8F-0007k7-0R; Thu, 19 Nov 2020 06:09:23 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfd8A-0007hS-DF
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 06:09:20 +0000
Received: by mail-pf1-x449.google.com with SMTP id 190so3050448pfz.16
 for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2020 22:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=ASfozbX9dlgLzgxgwAZr2FPSqoUUc7MVGsIEm0OoYhM=;
 b=AW3Z8WWiOVbD+uQNqVRm2eQiELCwcw1wvO6zPB9mg0x9FiI5ZlmannbAwUUMnCtAkQ
 GTUUf5Lbd+fH/fVT2bq5dttg2FO5uJKDyyBGue09e6hf4yACkyoMDhLC2nwZqyMglyde
 kknBKS2pVb98NYBZibeMbXOmt5l/biiRFvgZFCoM7ZOr/KYmCvybwiREnAkwnxUE+Fut
 U0uJiaBt2OTuymSvnlpAlQw2QBi/w5ZlpXvUSPh8AXlmPF2DdWuDi1aAlUJ4qfbQq1NX
 HJBG6uip98sgZk0Sb6ZUr29HQj4iyQO0kWqX9NBpn8Bo+wVtn4p7DecOp4/6v2iobCcr
 FYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ASfozbX9dlgLzgxgwAZr2FPSqoUUc7MVGsIEm0OoYhM=;
 b=ovN5oKYH1QbHQGGbYPkCtQCFqxRP6/DELwSZpLB4REairXTvRxoGhTyVx+rlxlYu3H
 fo1DF/ciVJ/8X/u1jACFXUNX3J+SQLPgcCKaaKOxhsfTXKwl6+9EoGCVA5Qqf27PlzI9
 cemGJfhc1WZiz4btPaRY8wSaNONu8bFmErmrvZ5In5h7MRkZugoABG2c4lLB/NpE6lHM
 pZfSfM63wdD4U7COLH8zkYa3dSKrH6bIXfQQu2DqzVDm429rBoTLEx34t87SQqJ4mjN5
 Jgl8V5hVPw095e4TcK2K1n1Jtpo3wlOETy22BnSXJjOM7Ge0cHLzSuuvQI7UmD/F3vWl
 2XxQ==
X-Gm-Message-State: AOAM532qiIPvGHO4L2n+42da3KQXcez1GlKybLO5kjp/TwkMlc/LSZ4k
 RGv5ED/I84d86TDbZHVil6A8QVu26iY=
X-Google-Smtp-Source: ABdhPJyhf9nsBfme/+EOPTNEDMTBuG2lheUyKxSfVtCQMLky9zcvZXiSqrCY6Pwd3FQ3qwNi6gxXIpA9X4Q=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:a63:e70c:: with SMTP id
 b12mr6241414pgi.220.1605766151561; 
 Wed, 18 Nov 2020 22:09:11 -0800 (PST)
Date: Thu, 19 Nov 2020 06:09:03 +0000
In-Reply-To: <20201119060904.463807-1-drosen@google.com>
Message-Id: <20201119060904.463807-3-drosen@google.com>
Mime-Version: 1.0
References: <20201119060904.463807-1-drosen@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v4 2/3] fscrypt: Have filesystems handle their d_ops
From: Daniel Rosenberg <drosen@google.com>
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Chao Yu <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_010918_611446_4BE61CC4 
X-CRM114-Status: GOOD (  19.18  )
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
Cc: Daniel Rosenberg <drosen@google.com>, Eric Biggers <ebiggers@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This shifts the responsibility of setting up dentry operations from
fscrypt to the individual filesystems, allowing them to have their own
operations while still setting fscrypt's d_revalidate as appropriate.

Most filesystems can just use generic_set_encrypted_ci_d_ops, unless
they have their own specific dentry operations as well. That operation
will set the minimal d_ops required under the circumstances.

Since the fscrypt d_ops are set later on, we must set all d_ops there,
since we cannot adjust those later on. This should not result in any
change in behavior.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
Acked-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fname.c           | 4 ----
 fs/crypto/fscrypt_private.h | 1 -
 fs/crypto/hooks.c           | 1 -
 fs/ext4/dir.c               | 7 -------
 fs/ext4/ext4.h              | 4 ----
 fs/ext4/namei.c             | 1 +
 fs/ext4/super.c             | 5 -----
 fs/f2fs/dir.c               | 7 -------
 fs/f2fs/f2fs.h              | 3 ---
 fs/f2fs/namei.c             | 1 +
 fs/f2fs/super.c             | 1 -
 fs/ubifs/dir.c              | 1 +
 include/linux/fscrypt.h     | 7 +++++--
 13 files changed, 8 insertions(+), 35 deletions(-)

diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index 1fbe6c24d705..cb3cfa6329ba 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -570,7 +570,3 @@ int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
 	return valid;
 }
 EXPORT_SYMBOL_GPL(fscrypt_d_revalidate);
-
-const struct dentry_operations fscrypt_d_ops = {
-	.d_revalidate = fscrypt_d_revalidate,
-};
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 4f5806a3b73d..df9c48c1fbf7 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -294,7 +294,6 @@ int fscrypt_fname_encrypt(const struct inode *inode, const struct qstr *iname,
 bool fscrypt_fname_encrypted_size(const union fscrypt_policy *policy,
 				  u32 orig_len, u32 max_len,
 				  u32 *encrypted_len_ret);
-extern const struct dentry_operations fscrypt_d_ops;
 
 /* hkdf.c */
 
diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 20b0df47fe6a..9006fa983335 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -117,7 +117,6 @@ int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
 		spin_lock(&dentry->d_lock);
 		dentry->d_flags |= DCACHE_NOKEY_NAME;
 		spin_unlock(&dentry->d_lock);
-		d_set_d_op(dentry, &fscrypt_d_ops);
 	}
 	return err;
 }
diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
index ca50c90adc4c..e757319a4472 100644
--- a/fs/ext4/dir.c
+++ b/fs/ext4/dir.c
@@ -667,10 +667,3 @@ const struct file_operations ext4_dir_operations = {
 	.open		= ext4_dir_open,
 	.release	= ext4_release_dir,
 };
-
-#ifdef CONFIG_UNICODE
-const struct dentry_operations ext4_dentry_ops = {
-	.d_hash = generic_ci_d_hash,
-	.d_compare = generic_ci_d_compare,
-};
-#endif
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index bf9429484462..ad77f01d9e20 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -3380,10 +3380,6 @@ static inline void ext4_unlock_group(struct super_block *sb,
 /* dir.c */
 extern const struct file_operations ext4_dir_operations;
 
-#ifdef CONFIG_UNICODE
-extern const struct dentry_operations ext4_dentry_ops;
-#endif
-
 /* file.c */
 extern const struct inode_operations ext4_file_inode_operations;
 extern const struct file_operations ext4_file_operations;
diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 33509266f5a0..12a417ff5648 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1614,6 +1614,7 @@ static struct buffer_head *ext4_lookup_entry(struct inode *dir,
 	struct buffer_head *bh;
 
 	err = ext4_fname_prepare_lookup(dir, dentry, &fname);
+	generic_set_encrypted_ci_d_ops(dentry);
 	if (err == -ENOENT)
 		return NULL;
 	if (err)
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 6633b20224d5..0288bedf46e1 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -4968,11 +4968,6 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 		goto failed_mount4;
 	}
 
-#ifdef CONFIG_UNICODE
-	if (sb->s_encoding)
-		sb->s_d_op = &ext4_dentry_ops;
-#endif
-
 	sb->s_root = d_make_root(root);
 	if (!sb->s_root) {
 		ext4_msg(sb, KERN_ERR, "get root dentry failed");
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 4b9ef8bbfa4a..71fdf5076461 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -1099,10 +1099,3 @@ const struct file_operations f2fs_dir_operations = {
 	.compat_ioctl   = f2fs_compat_ioctl,
 #endif
 };
-
-#ifdef CONFIG_UNICODE
-const struct dentry_operations f2fs_dentry_ops = {
-	.d_hash = generic_ci_d_hash,
-	.d_compare = generic_ci_d_compare,
-};
-#endif
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index cb700d797296..62b4f31d30e2 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3767,9 +3767,6 @@ static inline void f2fs_update_sit_info(struct f2fs_sb_info *sbi) {}
 #endif
 
 extern const struct file_operations f2fs_dir_operations;
-#ifdef CONFIG_UNICODE
-extern const struct dentry_operations f2fs_dentry_ops;
-#endif
 extern const struct file_operations f2fs_file_operations;
 extern const struct inode_operations f2fs_file_inode_operations;
 extern const struct address_space_operations f2fs_dblock_aops;
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 8fa37d1434de..6edb1ab579a1 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -497,6 +497,7 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 	}
 
 	err = f2fs_prepare_lookup(dir, dentry, &fname);
+	generic_set_encrypted_ci_d_ops(dentry);
 	if (err == -ENOENT)
 		goto out_splice;
 	if (err)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 00eff2f51807..f51d52591c99 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3427,7 +3427,6 @@ static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
 
 		sbi->sb->s_encoding = encoding;
 		sbi->sb->s_encoding_flags = encoding_flags;
-		sbi->sb->s_d_op = &f2fs_dentry_ops;
 	}
 #else
 	if (f2fs_sb_has_casefold(sbi)) {
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 155521e51ac5..7a920434d741 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -203,6 +203,7 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 	dbg_gen("'%pd' in dir ino %lu", dentry, dir->i_ino);
 
 	err = fscrypt_prepare_lookup(dir, dentry, &nm);
+	generic_set_encrypted_ci_d_ops(dentry);
 	if (err == -ENOENT)
 		return d_splice_alias(NULL, dentry);
 	if (err)
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index a8f7a43f031b..e72f80482671 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -741,8 +741,11 @@ static inline int fscrypt_prepare_rename(struct inode *old_dir,
  * directory's encryption key is available, then the lookup is assumed to be by
  * plaintext name; otherwise, it is assumed to be by no-key name.
  *
- * This also installs a custom ->d_revalidate() method which will invalidate the
- * dentry if it was created without the key and the key is later added.
+ * This will set DCACHE_NOKEY_NAME on the dentry if the lookup is by no-key
+ * name.  In this case the filesystem must assign the dentry a dentry_operations
+ * which contains fscrypt_d_revalidate (or contains a d_revalidate method that
+ * calls fscrypt_d_revalidate), so that the dentry will be invalidated if the
+ * directory's encryption key is later added.
  *
  * Return: 0 on success; -ENOENT if the directory's key is unavailable but the
  * filename isn't a valid no-key name, so a negative dentry should be created;
-- 
2.29.2.454.gaff20da3a2-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
