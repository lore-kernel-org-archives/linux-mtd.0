Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5EEC432BE
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 16:42:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6C29601FF
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 16:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6C29601FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uwYDyoDRIPvUyrQJTsudsO98Dt9ZBa5wzQcRrMYFZWY=; b=hbtIskl6u1O5c0
	qvrbSO3AizS0K7hyjGtwi/5kSWXgEY87XhNc2Pb+Che7bfWRMfdeTf1dMeurWXFiHmVYxFhqBsGCS
	xeT00ePNtuwyleX7BiBOG++R7XOHy0Ln1KfkLJskbTEblT0lM/1HOXuN5F970xAC8vGZiZvq4m/7W
	JJCUpEQtuDvX1ihegw7l5piFGFE6z4BboUQht6X7tOGVeSMJ/o3nt8vMplx0UEcvfkTKFJ+WkYqKS
	/1f2Zc/7LIKcBnMWiHJSVVH4NZq+jIv0DgmmZVlA1Nb7uOBarlryQs+fFQj4pO5yDi5qhkVexG4d6
	fcWDRwKLQAYdxIKBYfSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLTJ6-006Yms-Dl; Wed, 01 Sep 2021 16:41:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLTI5-006YW5-JP
 for linux-mtd@lists.infradead.org; Wed, 01 Sep 2021 16:40:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D38556109E;
 Wed,  1 Sep 2021 16:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630514444;
 bh=jVzElqQiJbNMXheESVUoQvKT6Ur1bumRSov7hl3IF2Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZHQ8ATBWiS/RCvGSjbGP57VyehFj3Fqojbmx4JWT/tZLMJvI1GlG9hyi/t3comUUF
 T/TzSZD9PgVFtMSGzr+jD/hF9B5ol/LySW/llVWrIYQcftkI73hnNQSAlvI7FDtVPA
 leA65V2mTQlE753MazHW7fyF+BSrXFTp8IZ4m+bpg7hNDRINgycfHpr+qfEaIVSSnY
 +zLXXYT9XLucN23D/tfmoBNsmGSqKFs3GPvNUHLfaXGcuLp+Y+r/IYxK/adOxs7OIJ
 d5vhXJH4oz1TsN3UNt5tzhc+dXI1ckkXAnoF3U9vx0t4xViGWswEjln2s4M1kFcE0r
 IBhdMK8cBISGg==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org
Subject: [PATCH 5.4 1/4] fscrypt: add fscrypt_symlink_getattr() for computing
 st_size
Date: Wed,  1 Sep 2021 09:40:38 -0700
Message-Id: <20210901164041.176238-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210901164041.176238-1-ebiggers@kernel.org>
References: <20210901164041.176238-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_094045_720644_31D178FC 
X-CRM114-Status: GOOD (  25.79  )
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

From: Eric Biggers <ebiggers@google.com>

commit d18760560593e5af921f51a8c9b64b6109d634c2 upstream.

Add a helper function fscrypt_symlink_getattr() which will be called
from the various filesystems' ->getattr() methods to read and decrypt
the target of encrypted symlinks in order to report the correct st_size.

Detailed explanation:

As required by POSIX and as documented in various man pages, st_size for
a symlink is supposed to be the length of the symlink target.
Unfortunately, st_size has always been wrong for encrypted symlinks
because st_size is populated from i_size from disk, which intentionally
contains the length of the encrypted symlink target.  That's slightly
greater than the length of the decrypted symlink target (which is the
symlink target that userspace usually sees), and usually won't match the
length of the no-key encoded symlink target either.

This hadn't been fixed yet because reporting the correct st_size would
require reading the symlink target from disk and decrypting or encoding
it, which historically has been considered too heavyweight to do in
->getattr().  Also historically, the wrong st_size had only broken a
test (LTP lstat03) and there were no known complaints from real users.
(This is probably because the st_size of symlinks isn't used too often,
and when it is, typically it's for a hint for what buffer size to pass
to readlink() -- which a slightly-too-large size still works for.)

However, a couple things have changed now.  First, there have recently
been complaints about the current behavior from real users:

- Breakage in rpmbuild:
  https://github.com/rpm-software-management/rpm/issues/1682
  https://github.com/google/fscrypt/issues/305

- Breakage in toybox cpio:
  https://www.mail-archive.com/toybox@lists.landley.net/msg07193.html

- Breakage in libgit2: https://issuetracker.google.com/issues/189629152
  (on Android public issue tracker, requires login)

Second, we now cache decrypted symlink targets in ->i_link.  Therefore,
taking the performance hit of reading and decrypting the symlink target
in ->getattr() wouldn't be as big a deal as it used to be, since usually
it will just save having to do the same thing later.

Also note that eCryptfs ended up having to read and decrypt symlink
targets in ->getattr() as well, to fix this same issue; see
commit 3a60a1686f0d ("eCryptfs: Decrypt symlink target for stat size").

So, let's just bite the bullet, and read and decrypt the symlink target
in ->getattr() in order to report the correct st_size.  Add a function
fscrypt_symlink_getattr() which the filesystems will call to do this.

(Alternatively, we could store the decrypted size of symlinks on-disk.
But there isn't a great place to do so, and encryption is meant to hide
the original size to some extent; that property would be lost.)

Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20210702065350.209646-2-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/hooks.c       | 44 +++++++++++++++++++++++++++++++++++++++++
 include/linux/fscrypt.h |  7 +++++++
 2 files changed, 51 insertions(+)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index a5a40a76b8ed7..82575cfbb04db 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -305,3 +305,47 @@ const char *fscrypt_get_symlink(struct inode *inode, const void *caddr,
 	return ERR_PTR(err);
 }
 EXPORT_SYMBOL_GPL(fscrypt_get_symlink);
+
+/**
+ * fscrypt_symlink_getattr() - set the correct st_size for encrypted symlinks
+ * @path: the path for the encrypted symlink being queried
+ * @stat: the struct being filled with the symlink's attributes
+ *
+ * Override st_size of encrypted symlinks to be the length of the decrypted
+ * symlink target (or the no-key encoded symlink target, if the key is
+ * unavailable) rather than the length of the encrypted symlink target.  This is
+ * necessary for st_size to match the symlink target that userspace actually
+ * sees.  POSIX requires this, and some userspace programs depend on it.
+ *
+ * This requires reading the symlink target from disk if needed, setting up the
+ * inode's encryption key if possible, and then decrypting or encoding the
+ * symlink target.  This makes lstat() more heavyweight than is normally the
+ * case.  However, decrypted symlink targets will be cached in ->i_link, so
+ * usually the symlink won't have to be read and decrypted again later if/when
+ * it is actually followed, readlink() is called, or lstat() is called again.
+ *
+ * Return: 0 on success, -errno on failure
+ */
+int fscrypt_symlink_getattr(const struct path *path, struct kstat *stat)
+{
+	struct dentry *dentry = path->dentry;
+	struct inode *inode = d_inode(dentry);
+	const char *link;
+	DEFINE_DELAYED_CALL(done);
+
+	/*
+	 * To get the symlink target that userspace will see (whether it's the
+	 * decrypted target or the no-key encoded target), we can just get it in
+	 * the same way the VFS does during path resolution and readlink().
+	 */
+	link = READ_ONCE(inode->i_link);
+	if (!link) {
+		link = inode->i_op->get_link(dentry, inode, &done);
+		if (IS_ERR(link))
+			return PTR_ERR(link);
+	}
+	stat->size = strlen(link);
+	do_delayed_call(&done);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fscrypt_symlink_getattr);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 032e5bcf97012..0d1a53d6c52dc 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -298,6 +298,7 @@ extern int __fscrypt_encrypt_symlink(struct inode *inode, const char *target,
 extern const char *fscrypt_get_symlink(struct inode *inode, const void *caddr,
 				       unsigned int max_size,
 				       struct delayed_call *done);
+int fscrypt_symlink_getattr(const struct path *path, struct kstat *stat);
 static inline void fscrypt_set_ops(struct super_block *sb,
 				   const struct fscrypt_operations *s_cop)
 {
@@ -585,6 +586,12 @@ static inline const char *fscrypt_get_symlink(struct inode *inode,
 	return ERR_PTR(-EOPNOTSUPP);
 }
 
+static inline int fscrypt_symlink_getattr(const struct path *path,
+					  struct kstat *stat)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline void fscrypt_set_ops(struct super_block *sb,
 				   const struct fscrypt_operations *s_cop)
 {
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
