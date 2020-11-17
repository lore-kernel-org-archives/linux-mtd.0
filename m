Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7086C2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 04:04:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ECD82468E
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 04:04:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0syv/l8P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="lo6Hp6Hj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3ECD82468E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eDXo9JV8OuggdRxnyYze0qK9Ujh21Gq/Apj+H5Yh6s8=; b=0syv/l8PxR0Lwtt5771s0Osqc
	OcE+UMHliqD2L3AVOmSYWxdwSTiQR+4RzhKy4QoCRFpFpWm499A8yBg6vqZJKagfHI52AHneO9qDC
	vpoapswmPejqdTT+bfmoG1uzbejIPGRc3fleAsuFwN3eG4n9BW+GwQ3paoKWiJwDdH82GXC+OokfS
	0iEi3h2QHpL7kw2wjMbC3CYkYXbbzgmlfUwlxOASGAUFLboIAIgF8DKa9Q83VhYUqoYeXOM06JrAt
	jcO0yXCSKFYLh4kfxKLuyURJw/DSyTrkgr4soc2GCFqVK53CLclgDMnDTZzbfl8qzfisIhoHpAO5Z
	1KBcp91Cg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kesDJ-0008M3-Lt; Tue, 17 Nov 2020 04:03:29 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kesDG-0008K5-IH
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 04:03:27 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id k196so23192410ybf.9
 for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2020 20:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=gzCJA6FqLl3nkuvOHTVZeH8gGGfX2dPlscli3OX7uLA=;
 b=lo6Hp6HjNG5Jt3pE5c18TKsHXgnFqTZ2YtakKks63lKFMTm6mVU/p+wJ7JrHSH47SS
 3sEfDTM7hsR2uc5QhSAFcTge3MqXsfUEPEvvNDk8mbm6LY6fJBy7dslOzH8pBAehz/S9
 WsDYBKAU5/2ljE2sLoxWc/oot/Kgl1So2TCWvq5nMa5yRt4fc+eY5vCrSA+nw/edl+/d
 q7ZeYlGf2RG4uU47oBzm8ukovXXgsqkC3VPKDVigtPNTgWNITIyGW/845lQTpq4zTtMG
 bmMTr4jDx9tPEm6lKa4uCWAwGx7wX61Zj6BTlF19Nx0dtpWtIrx8XAqXxbJTgtZjMm86
 bHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=gzCJA6FqLl3nkuvOHTVZeH8gGGfX2dPlscli3OX7uLA=;
 b=DHobUddsZs+ME9RaSJ/S8hBf9Tw0G9AlWxBZH2ff9Yuq/p8jDwio6m1A2opr4ZBTrL
 k7MyMnyoyYPkkhsQymcLPhLULyYjrQDs6vZz0qfNALFrdahiZDPvxsLV8yqKQDoDS5C5
 SNkr7HJ3D4AZE9Iv1Fpwqv/vyQ1KnbIjVcunK2AzT3HcLuZIXuGAPblFRRFrzerbstzI
 AVb7RzeFA4mvsDX01/P9NYVhxGYZxDuSu+qSlAFE62HdVN+9nvRXf6BKzeXV0GNhdh5w
 fUaXqkeLv+/YKxt9/pubuRd1XObh93bmEckC0vgxVYBN2ufqcXhSl/JFp3En0s5FJD0k
 mT5w==
X-Gm-Message-State: AOAM5331IsPRcyIAha4e028nzaG4y6al6nCV/mrbfwpLGhiGw80/5dvb
 cQCU1RRa51f287xuMUoTbHxrki+RdBY=
X-Google-Smtp-Source: ABdhPJw0SwM5MGsJV/jtnTqWjjdY2f17Hcog1UsIM7NFzIL1dw/rDvglzo1Oq7O/BaulsCjAREBwps0RyFM=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:a25:4686:: with SMTP id
 t128mr28924487yba.109.1605585802776; 
 Mon, 16 Nov 2020 20:03:22 -0800 (PST)
Date: Tue, 17 Nov 2020 04:03:14 +0000
In-Reply-To: <20201117040315.28548-1-drosen@google.com>
Message-Id: <20201117040315.28548-3-drosen@google.com>
Mime-Version: 1.0
References: <20201117040315.28548-1-drosen@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH v2 2/3] fscrypt: Have filesystems handle their d_ops
From: Daniel Rosenberg <drosen@google.com>
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Chao Yu <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_230326_677802_9BB580AB 
X-CRM114-Status: GOOD (  19.17  )
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
Cc: Daniel Rosenberg <drosen@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
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
---
 fs/crypto/fname.c       | 4 ----
 fs/crypto/hooks.c       | 1 -
 fs/ext4/dir.c           | 7 -------
 fs/ext4/ext4.h          | 4 ----
 fs/ext4/namei.c         | 1 +
 fs/ext4/super.c         | 5 -----
 fs/f2fs/dir.c           | 7 -------
 fs/f2fs/f2fs.h          | 3 ---
 fs/f2fs/namei.c         | 1 +
 fs/f2fs/super.c         | 1 -
 fs/ubifs/dir.c          | 1 +
 include/linux/fscrypt.h | 5 +++--
 12 files changed, 6 insertions(+), 34 deletions(-)

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
index a8f7a43f031b..df2c66ca370e 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -741,8 +741,9 @@ static inline int fscrypt_prepare_rename(struct inode *old_dir,
  * directory's encryption key is available, then the lookup is assumed to be by
  * plaintext name; otherwise, it is assumed to be by no-key name.
  *
- * This also installs a custom ->d_revalidate() method which will invalidate the
- * dentry if it was created without the key and the key is later added.
+ * After calling this function, a filesystem should ensure that its dentry
+ * operations contain fscrypt_d_revalidate if DCACHE_ENCRYPTED_NAME was set,
+ * so that the dentry can be invalidated if the key is later added.
  *
  * Return: 0 on success; -ENOENT if the directory's key is unavailable but the
  * filename isn't a valid no-key name, so a negative dentry should be created;
-- 
2.29.2.299.gdc1121823c-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
