Return-Path: <SRS0=xoN1=N6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190C6C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Sep 2021 21:53:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C944F60FDA
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Sep 2021 21:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C944F60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7a+rM1jXLghJ7/04oQBoZ8tJw9zzyo8PRYxgnp3Jzb0=; b=INDnhDaAIitnaL
	HRT/5TZFdzq/pozrwbskt95Cdk0bQuonY8GQg5EYjBVE8wCPPS4njjHWWHRp9CTXuVE480vvZCxEj
	IRts/jA0HUaKVu+THZLh0Ny4Bl4oGNUFgCIKRUvPT4MaZeuL2HJ3kbCE9RlwsTBZWuS91RRTEAQBG
	8Ov4TGSSAfKp/IlT9PoN4oN0cOy5nk9+XFRzNDx/FXDQ8FYoBb912IBOxjliyNrLWmw1Y2MCCP+VD
	7xvmbk3JqkOtQnXaF1SolQ2J0oJ9/pw/iV+gOm5cLmO0yPFB5n2BrKZaZOLTbcZcKLXxhxyfTV3fp
	hlBqXOjAKENXeDu9npqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO5Ub-007e8a-Vc; Wed, 08 Sep 2021 21:52:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO5Td-007dwC-Sb
 for linux-mtd@lists.infradead.org; Wed, 08 Sep 2021 21:51:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B055861102;
 Wed,  8 Sep 2021 21:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631137888;
 bh=OQTsB/jVGcQ7Wx3XSHynFYsRG7N4x/1YxYJzvlQNDMI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IVxoJfrQX5DygB+Ym+3nvCCQsgrYaVVmNBmE26tQ3HdynZPian1la1QFCHrC1pov8
 GuqkPsPFgQAz9mwfXOhEUmDKUytXH9CRf5++voXm/X6Y84NexBzZdj/xJCxUQjxDpW
 3xfrrCzhNx37wiJDoZTqNhPzx+mfL5fALqujig0UCibDA8wy10IOSqr1EAOnr6n3Oj
 VPlmvWl/eUbfA6ZEcTokQIfEaD8N679qKg5U+JXvd5M/EUmAtSbeW/FDAlw1Ow1/gL
 0eXr2BxtH8hQpomzQWpBBAfZZUzz7LZ9MKQAvAosQUwl5mOmORGuSZ4eIGx56Q0ia3
 AGKtVLsP9wHkA==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org
Subject: [PATCH 1/4] fscrypt: add fscrypt_symlink_getattr() for computing
 st_size
Date: Wed,  8 Sep 2021 14:50:30 -0700
Message-Id: <20210908215033.1122580-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
In-Reply-To: <20210908215033.1122580-1-ebiggers@kernel.org>
References: <20210908215033.1122580-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_145130_042376_AFE1D904 
X-CRM114-Status: GOOD (  27.36  )
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
 fs/crypto/hooks.c               | 44 +++++++++++++++++++++++++++++++++
 include/linux/fscrypt_notsupp.h |  6 +++++
 include/linux/fscrypt_supp.h    |  1 +
 3 files changed, 51 insertions(+)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index aa86cb2db823..ae7a413c0bdd 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -279,3 +279,47 @@ const char *fscrypt_get_symlink(struct inode *inode, const void *caddr,
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
diff --git a/include/linux/fscrypt_notsupp.h b/include/linux/fscrypt_notsupp.h
index 93304cfeb601..6e95c5a9b7fa 100644
--- a/include/linux/fscrypt_notsupp.h
+++ b/include/linux/fscrypt_notsupp.h
@@ -234,4 +234,10 @@ static inline const char *fscrypt_get_symlink(struct inode *inode,
 	return ERR_PTR(-EOPNOTSUPP);
 }
 
+static inline int fscrypt_symlink_getattr(const struct path *path,
+					  struct kstat *stat)
+{
+	return -EOPNOTSUPP;
+}
+
 #endif	/* _LINUX_FSCRYPT_NOTSUPP_H */
diff --git a/include/linux/fscrypt_supp.h b/include/linux/fscrypt_supp.h
index 0409c14ae1de..f4cb4871a987 100644
--- a/include/linux/fscrypt_supp.h
+++ b/include/linux/fscrypt_supp.h
@@ -231,5 +231,6 @@ extern int __fscrypt_encrypt_symlink(struct inode *inode, const char *target,
 extern const char *fscrypt_get_symlink(struct inode *inode, const void *caddr,
 				       unsigned int max_size,
 				       struct delayed_call *done);
+int fscrypt_symlink_getattr(const struct path *path, struct kstat *stat);
 
 #endif	/* _LINUX_FSCRYPT_SUPP_H */
-- 
2.33.0.153.gba50c8fa24-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
