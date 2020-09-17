Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25006C43461
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 04:14:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A95CE22204
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 04:14:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ydwuVLVA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0aZjJ50k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A95CE22204
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hE7GvVU5Ue1PAo+rS3VraIPFEw8q1+A0Ruxs1WVYeEo=; b=ydwuVLVA2cnNHPu2L+mLY7dpa
	vZi3Ar+eZZ+uScvpt7xedM3M91oi32++Mhrzu05hRqf3lq/ewqNjR9R9lCWulv3smJsnhX6k4+phO
	i0AYuiechjrQo08DYgSM3mOAjowOoS4Ho6i3QGxEUpFpoLvce2kmFmvaJeTsWxV3xoCs8NdP4yBSB
	05p6Bf6/asGL4loUdgSJqnyKYYNHQD8cfTZoWuobtqA9sk9kroQnmdI+yD/6dmQ9TrDYPTha1KA4p
	39jG6T2lm/ely5JPw1KTuSL9z6T8MPT1r5rAfm394Tb1PPiLvE7nIL52j+AsgNZGgzWF+ReLvoHnF
	xzVJFrBug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIlIt-0001V8-Ex; Thu, 17 Sep 2020 04:13:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIlIH-0001GE-9e
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 04:13:17 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F35EA221E8;
 Thu, 17 Sep 2020 04:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600315991;
 bh=SHrYUdtm1g7ntgYtdzixMrvNEz6L5/D07nXI8RMvuM4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0aZjJ50kI4WEJr9D62QjYoMh11x5Tz6VA/g+py5rlDxfKeC3rajPvnUPVqMZknrFY
 SuDXRZDPiTFzMBkCxcHGjYVuu5AN236OvZ4HJ4kYKHBG5HEMQlSdjEC39hh/8n1BjV
 V6rVVgLbSNn9KahPShkzKXqNX9H1Ek/XaZTG/iJ0=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v3 11/13] fscrypt: move fscrypt_prepare_symlink() out-of-line
Date: Wed, 16 Sep 2020 21:11:34 -0700
Message-Id: <20200917041136.178600-12-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917041136.178600-1-ebiggers@kernel.org>
References: <20200917041136.178600-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_001313_493573_0450FE15 
X-CRM114-Status: GOOD (  23.82  )
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
Cc: Daniel Rosenberg <drosen@google.com>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

In preparation for moving the logic for "get the encryption policy
inherited by new files in this directory" to a single place, make
fscrypt_prepare_symlink() a regular function rather than an inline
function that wraps __fscrypt_prepare_symlink().

This way, the new function fscrypt_policy_to_inherit() won't need to be
exported to filesystems.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/hooks.c       | 39 ++++++++++++++++++++++---
 include/linux/fscrypt.h | 63 ++++++++++-------------------------------
 2 files changed, 50 insertions(+), 52 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 7748db5092409..a399c54947f28 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -166,12 +166,43 @@ int fscrypt_prepare_setflags(struct inode *inode,
 	return 0;
 }
 
-int __fscrypt_prepare_symlink(struct inode *dir, unsigned int len,
-			      unsigned int max_len,
-			      struct fscrypt_str *disk_link)
+/**
+ * fscrypt_prepare_symlink() - prepare to create a possibly-encrypted symlink
+ * @dir: directory in which the symlink is being created
+ * @target: plaintext symlink target
+ * @len: length of @target excluding null terminator
+ * @max_len: space the filesystem has available to store the symlink target
+ * @disk_link: (out) the on-disk symlink target being prepared
+ *
+ * This function computes the size the symlink target will require on-disk,
+ * stores it in @disk_link->len, and validates it against @max_len.  An
+ * encrypted symlink may be longer than the original.
+ *
+ * Additionally, @disk_link->name is set to @target if the symlink will be
+ * unencrypted, but left NULL if the symlink will be encrypted.  For encrypted
+ * symlinks, the filesystem must call fscrypt_encrypt_symlink() to create the
+ * on-disk target later.  (The reason for the two-step process is that some
+ * filesystems need to know the size of the symlink target before creating the
+ * inode, e.g. to determine whether it will be a "fast" or "slow" symlink.)
+ *
+ * Return: 0 on success, -ENAMETOOLONG if the symlink target is too long,
+ * -ENOKEY if the encryption key is missing, or another -errno code if a problem
+ * occurred while setting up the encryption key.
+ */
+int fscrypt_prepare_symlink(struct inode *dir, const char *target,
+			    unsigned int len, unsigned int max_len,
+			    struct fscrypt_str *disk_link)
 {
 	int err;
 
+	if (!IS_ENCRYPTED(dir) && !fscrypt_get_dummy_context(dir->i_sb)) {
+		disk_link->name = (unsigned char *)target;
+		disk_link->len = len + 1;
+		if (disk_link->len > max_len)
+			return -ENAMETOOLONG;
+		return 0;
+	}
+
 	/*
 	 * To calculate the size of the encrypted symlink target we need to know
 	 * the amount of NUL padding, which is determined by the flags set in
@@ -207,7 +238,7 @@ int __fscrypt_prepare_symlink(struct inode *dir, unsigned int len,
 	disk_link->name = NULL;
 	return 0;
 }
-EXPORT_SYMBOL_GPL(__fscrypt_prepare_symlink);
+EXPORT_SYMBOL_GPL(fscrypt_prepare_symlink);
 
 int __fscrypt_encrypt_symlink(struct inode *inode, const char *target,
 			      unsigned int len, struct fscrypt_str *disk_link)
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 81d6ded243288..39e7397a3f103 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -225,9 +225,9 @@ int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
 			     struct fscrypt_name *fname);
 int fscrypt_prepare_setflags(struct inode *inode,
 			     unsigned int oldflags, unsigned int flags);
-int __fscrypt_prepare_symlink(struct inode *dir, unsigned int len,
-			      unsigned int max_len,
-			      struct fscrypt_str *disk_link);
+int fscrypt_prepare_symlink(struct inode *dir, const char *target,
+			    unsigned int len, unsigned int max_len,
+			    struct fscrypt_str *disk_link);
 int __fscrypt_encrypt_symlink(struct inode *inode, const char *target,
 			      unsigned int len, struct fscrypt_str *disk_link);
 const char *fscrypt_get_symlink(struct inode *inode, const void *caddr,
@@ -520,15 +520,21 @@ static inline int fscrypt_prepare_setflags(struct inode *inode,
 	return 0;
 }
 
-static inline int __fscrypt_prepare_symlink(struct inode *dir,
-					    unsigned int len,
-					    unsigned int max_len,
-					    struct fscrypt_str *disk_link)
+static inline int fscrypt_prepare_symlink(struct inode *dir,
+					  const char *target,
+					  unsigned int len,
+					  unsigned int max_len,
+					  struct fscrypt_str *disk_link)
 {
-	return -EOPNOTSUPP;
+	if (IS_ENCRYPTED(dir))
+		return -EOPNOTSUPP;
+	disk_link->name = (unsigned char *)target;
+	disk_link->len = len + 1;
+	if (disk_link->len > max_len)
+		return -ENAMETOOLONG;
+	return 0;
 }
 
-
 static inline int __fscrypt_encrypt_symlink(struct inode *inode,
 					    const char *target,
 					    unsigned int len,
@@ -793,45 +799,6 @@ static inline int fscrypt_prepare_setattr(struct dentry *dentry,
 	return 0;
 }
 
-/**
- * fscrypt_prepare_symlink() - prepare to create a possibly-encrypted symlink
- * @dir: directory in which the symlink is being created
- * @target: plaintext symlink target
- * @len: length of @target excluding null terminator
- * @max_len: space the filesystem has available to store the symlink target
- * @disk_link: (out) the on-disk symlink target being prepared
- *
- * This function computes the size the symlink target will require on-disk,
- * stores it in @disk_link->len, and validates it against @max_len.  An
- * encrypted symlink may be longer than the original.
- *
- * Additionally, @disk_link->name is set to @target if the symlink will be
- * unencrypted, but left NULL if the symlink will be encrypted.  For encrypted
- * symlinks, the filesystem must call fscrypt_encrypt_symlink() to create the
- * on-disk target later.  (The reason for the two-step process is that some
- * filesystems need to know the size of the symlink target before creating the
- * inode, e.g. to determine whether it will be a "fast" or "slow" symlink.)
- *
- * Return: 0 on success, -ENAMETOOLONG if the symlink target is too long,
- * -ENOKEY if the encryption key is missing, or another -errno code if a problem
- * occurred while setting up the encryption key.
- */
-static inline int fscrypt_prepare_symlink(struct inode *dir,
-					  const char *target,
-					  unsigned int len,
-					  unsigned int max_len,
-					  struct fscrypt_str *disk_link)
-{
-	if (IS_ENCRYPTED(dir) || fscrypt_get_dummy_context(dir->i_sb) != NULL)
-		return __fscrypt_prepare_symlink(dir, len, max_len, disk_link);
-
-	disk_link->name = (unsigned char *)target;
-	disk_link->len = len + 1;
-	if (disk_link->len > max_len)
-		return -ENAMETOOLONG;
-	return 0;
-}
-
 /**
  * fscrypt_encrypt_symlink() - encrypt the symlink target if needed
  * @inode: symlink inode
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
