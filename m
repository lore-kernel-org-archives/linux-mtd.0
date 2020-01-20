Return-Path: <SRS0=bf65=3J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA72DC33CAA
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2020 22:34:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93EDD22522
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2020 22:34:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E+ZYliiN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qrVjUaSH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93EDD22522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74X8H1NMc14lp2rAjnO6B6uiBy8v04AHRVbclQ6RFQA=; b=E+ZYliiNDW3iE2
	rDsvgB88OydpKGtKRG/zKu+qGMk5q3ohCRxmVCJrp/IGsu2IqHm99IdZp01eve/qVctCQmadOiwrw
	lbMhSLdMprz6ofn5cliDxgs3WeY4aN/phS8f0Ln4kfQMF+XlOeazQ4q1r7sTwcmdd08QUW9y3Onpc
	GogAxc3y2RXY3Nj2rYg5Wo1n2fjU+qJmCulp1r9oPsYf+cY7RFLaZChbt9ESoDxUi+176LdvbN3CH
	GljCq4FmgMrhHT6/a+jn/vAlhgH7swgrh3CZzuzyP7xkpkIh5vDUwmYMzAoJF267MdNc7QhJrv66D
	T02nigeBE5v5MSYSVcCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itfcu-00072s-Sa; Mon, 20 Jan 2020 22:34:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itfcf-0006pf-Mr
 for linux-mtd@lists.infradead.org; Mon, 20 Jan 2020 22:34:19 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1FAAE22522;
 Mon, 20 Jan 2020 22:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579559657;
 bh=tpX3Z5aTfQYbdolCOLoHxFujgPfupohBTNGUTgTN6rY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qrVjUaSHOVqRokRfV2YwiPbgKmKm7JGX3kotJjBEwQd/vIvpskRgf7I/gVifaFEoB
 UVrcRwntKuUnqMvv4V0WOegwQodT38tGXS3JBuZ5Zj/T4VclxoiMemD5IXroUP2gGb
 AsP39GViKWmYbxmtHnd8+jmldMlGpu1xv6dnvD9M=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v5 1/6] fscrypt: don't allow v1 policies with casefolding
Date: Mon, 20 Jan 2020 14:31:56 -0800
Message-Id: <20200120223201.241390-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120223201.241390-1-ebiggers@kernel.org>
References: <20200120223201.241390-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_143417_787482_96F301BD 
X-CRM114-Status: GOOD (  18.58  )
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
Cc: Daniel Rosenberg <drosen@google.com>,
 Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Daniel Rosenberg <drosen@google.com>

Casefolded encrypted directories will use a new dirhash method that
requires a secret key.  If the directory uses a v2 encryption policy,
it's easy to derive this key from the master key using HKDF.  However,
v1 encryption policies don't provide a way to derive additional keys.

Therefore, don't allow casefolding on directories that use a v1 policy.
Specifically, make it so that trying to enable casefolding on a
directory that has a v1 policy fails, trying to set a v1 policy on a
casefolded directory fails, and trying to open a casefolded directory
that has a v1 policy (if one somehow exists on-disk) fails.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
[EB: improved commit message, updated fscrypt.rst, and other cleanups]
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fscrypt.rst |  4 +++-
 fs/crypto/hooks.c                     | 28 +++++++++++++++++++++++++++
 fs/crypto/policy.c                    |  7 +++++++
 fs/inode.c                            |  3 ++-
 include/linux/fscrypt.h               |  9 +++++++++
 5 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 9c53336d06a43..380a1be9550e1 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -513,7 +513,9 @@ FS_IOC_SET_ENCRYPTION_POLICY can fail with the following errors:
 - ``EEXIST``: the file is already encrypted with an encryption policy
   different from the one specified
 - ``EINVAL``: an invalid encryption policy was specified (invalid
-  version, mode(s), or flags; or reserved bits were set)
+  version, mode(s), or flags; or reserved bits were set); or a v1
+  encryption policy was specified but the directory has the casefold
+  flag enabled (casefolding is incompatible with v1 policies).
 - ``ENOKEY``: a v2 encryption policy was specified, but the key with
   the specified ``master_key_identifier`` has not been added, nor does
   the process have the CAP_FOWNER capability in the initial user
diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index bb3b7fcfdd48a..d96a58f11d2b0 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -122,6 +122,34 @@ int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
 }
 EXPORT_SYMBOL_GPL(__fscrypt_prepare_lookup);
 
+/**
+ * fscrypt_prepare_setflags() - prepare to change flags with FS_IOC_SETFLAGS
+ * @inode: the inode on which flags are being changed
+ * @oldflags: the old flags
+ * @flags: the new flags
+ *
+ * The caller should be holding i_rwsem for write.
+ *
+ * Return: 0 on success; -errno if the flags change isn't allowed or if
+ *	   another error occurs.
+ */
+int fscrypt_prepare_setflags(struct inode *inode,
+			     unsigned int oldflags, unsigned int flags)
+{
+	struct fscrypt_info *ci;
+	int err;
+
+	if (IS_ENCRYPTED(inode) && (flags & ~oldflags & FS_CASEFOLD_FL)) {
+		err = fscrypt_require_key(inode);
+		if (err)
+			return err;
+		ci = inode->i_crypt_info;
+		if (ci->ci_policy.version != FSCRYPT_POLICY_V2)
+			return -EINVAL;
+	}
+	return 0;
+}
+
 int __fscrypt_prepare_symlink(struct inode *dir, unsigned int len,
 			      unsigned int max_len,
 			      struct fscrypt_str *disk_link)
diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index f1cff83c151ac..cf2a9d26ef7da 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -124,6 +124,13 @@ static bool fscrypt_supported_v1_policy(const struct fscrypt_policy_v1 *policy,
 					policy->filenames_encryption_mode))
 		return false;
 
+	if (IS_CASEFOLDED(inode)) {
+		/* With v1, there's no way to derive dirhash keys. */
+		fscrypt_warn(inode,
+			     "v1 policies can't be used on casefolded directories");
+		return false;
+	}
+
 	return true;
 }
 
diff --git a/fs/inode.c b/fs/inode.c
index 96d62d97694ef..ea15c6d9f2742 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -12,6 +12,7 @@
 #include <linux/security.h>
 #include <linux/cdev.h>
 #include <linux/memblock.h>
+#include <linux/fscrypt.h>
 #include <linux/fsnotify.h>
 #include <linux/mount.h>
 #include <linux/posix_acl.h>
@@ -2252,7 +2253,7 @@ int vfs_ioc_setflags_prepare(struct inode *inode, unsigned int oldflags,
 	    !capable(CAP_LINUX_IMMUTABLE))
 		return -EPERM;
 
-	return 0;
+	return fscrypt_prepare_setflags(inode, oldflags, flags);
 }
 EXPORT_SYMBOL(vfs_ioc_setflags_prepare);
 
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 6fe8d0f96a4ac..3984eadd7023f 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -263,6 +263,8 @@ extern int __fscrypt_prepare_rename(struct inode *old_dir,
 				    unsigned int flags);
 extern int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
 				    struct fscrypt_name *fname);
+extern int fscrypt_prepare_setflags(struct inode *inode,
+				    unsigned int oldflags, unsigned int flags);
 extern int __fscrypt_prepare_symlink(struct inode *dir, unsigned int len,
 				     unsigned int max_len,
 				     struct fscrypt_str *disk_link);
@@ -519,6 +521,13 @@ static inline int __fscrypt_prepare_lookup(struct inode *dir,
 	return -EOPNOTSUPP;
 }
 
+static inline int fscrypt_prepare_setflags(struct inode *inode,
+					   unsigned int oldflags,
+					   unsigned int flags)
+{
+	return 0;
+}
+
 static inline int __fscrypt_prepare_symlink(struct inode *dir,
 					    unsigned int len,
 					    unsigned int max_len,

base-commit: 50d9fad73a45a78f8b974b46307712556c9a42d3
-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
