Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0291C388F7
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 22:10:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FADB2072C
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 22:10:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MIHielc/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1RoOPYe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FADB2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uWUaOzSjRo5yb86CGmcF0GNHknpkhsa88u71f1U9eeA=; b=MIHielc/SClHjQ+H7kRxPC46X
	0vXbEMgy1v/oUU41YPjU1EZ/tD/R3qmZE9q6MaN2WAj8Wf1jisNWK0v4lAQJJ7zsCWJenB23PjPEi
	J00sHZ16AbXTGnSKOn6bCzsuInievWlmnGr7Dd0bVa1B94PI8AfxovIMq/+Zp0r6LVDGnD2bi9uhQ
	H79KHNntwOdb+t2CedGu2qgNQCGZjhrpcW0Eku11HwuEzWlKNpTTLZgGx0prkRroQwWU1mYQGtqBq
	YsrQtP2PeqUdxzx7zUF0Wn7bi4+PSbdMeZZBeVl3dlv1NXDpWV8ni4BOLuyQnZ9UvnQeBfs2GlKl1
	O/RmPVrBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYz4Y-0007OI-0r; Sat, 31 Oct 2020 22:10:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYz4M-0007KZ-Hh
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2020 22:09:57 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2AE0720756;
 Sat, 31 Oct 2020 22:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604182193;
 bh=rU+aQd863qXgTgg3hGulWwJk5oa2mDPQJIsHKpV+I4Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e1RoOPYelXSZ+AeuHj9scyBO5qXxK2jxeYhbsL/NiBv3vNV9nOTCebeosJXxl38YT
 De2GY8ARKf+e56sw+mOSN+YyuSw26uHLylHg/WRRj8tL0Whln2bQ1Gb6H8xhliiebv
 lECfHcuHEfgxuzrBFZu86pIB3fkSxiH/oiCMaq8w=
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Subject: [PATCH 4.19 2/5] fscrypt: fix race allowing rename() and link() of
 ciphertext dentries
Date: Sat, 31 Oct 2020 15:05:50 -0700
Message-Id: <20201031220553.1085782-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201031220553.1085782-1-ebiggers@kernel.org>
References: <20201031220553.1085782-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_180954_851127_D968DB0F 
X-CRM114-Status: GOOD (  16.58  )
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

commit 968dd6d0c6d6b6a989c6ddb9e2584a031b83e7b5 upstream.

Close some race conditions where fscrypt allowed rename() and link() on
ciphertext dentries that had been looked up just prior to the key being
concurrently added.  It's better to return -ENOKEY in this case.

This avoids doing the nonsensical thing of encrypting the names a second
time when searching for the actual on-disk dir entries.  It also
guarantees that DCACHE_ENCRYPTED_NAME dentries are never rename()d, so
the dcache won't have support all possible combinations of moving
DCACHE_ENCRYPTED_NAME around during __d_move().

Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Theodore Ts'o <tytso@mit.edu>
---
 fs/crypto/hooks.c               | 12 +++++++++++-
 include/linux/fscrypt.h         |  2 +-
 include/linux/fscrypt_notsupp.h |  4 ++--
 include/linux/fscrypt_supp.h    |  3 ++-
 4 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index a9492f75bbe13..2e7498a821a48 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -49,7 +49,8 @@ int fscrypt_file_open(struct inode *inode, struct file *filp)
 }
 EXPORT_SYMBOL_GPL(fscrypt_file_open);
 
-int __fscrypt_prepare_link(struct inode *inode, struct inode *dir)
+int __fscrypt_prepare_link(struct inode *inode, struct inode *dir,
+			   struct dentry *dentry)
 {
 	int err;
 
@@ -57,6 +58,10 @@ int __fscrypt_prepare_link(struct inode *inode, struct inode *dir)
 	if (err)
 		return err;
 
+	/* ... in case we looked up ciphertext name before key was added */
+	if (dentry->d_flags & DCACHE_ENCRYPTED_NAME)
+		return -ENOKEY;
+
 	if (!fscrypt_has_permitted_context(dir, inode))
 		return -EXDEV;
 
@@ -78,6 +83,11 @@ int __fscrypt_prepare_rename(struct inode *old_dir, struct dentry *old_dentry,
 	if (err)
 		return err;
 
+	/* ... in case we looked up ciphertext name(s) before key was added */
+	if ((old_dentry->d_flags | new_dentry->d_flags) &
+	    DCACHE_ENCRYPTED_NAME)
+		return -ENOKEY;
+
 	if (old_dir != new_dir) {
 		if (IS_ENCRYPTED(new_dir) &&
 		    !fscrypt_has_permitted_context(new_dir,
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index c83e4dc55c062..af52a240c7399 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -97,7 +97,7 @@ static inline int fscrypt_prepare_link(struct dentry *old_dentry,
 				       struct dentry *dentry)
 {
 	if (IS_ENCRYPTED(dir))
-		return __fscrypt_prepare_link(d_inode(old_dentry), dir);
+		return __fscrypt_prepare_link(d_inode(old_dentry), dir, dentry);
 	return 0;
 }
 
diff --git a/include/linux/fscrypt_notsupp.h b/include/linux/fscrypt_notsupp.h
index ee8b43e4c15a6..15bbbd7c52b8b 100644
--- a/include/linux/fscrypt_notsupp.h
+++ b/include/linux/fscrypt_notsupp.h
@@ -183,8 +183,8 @@ static inline int fscrypt_file_open(struct inode *inode, struct file *filp)
 	return 0;
 }
 
-static inline int __fscrypt_prepare_link(struct inode *inode,
-					 struct inode *dir)
+static inline int __fscrypt_prepare_link(struct inode *inode, struct inode *dir,
+					 struct dentry *dentry)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/include/linux/fscrypt_supp.h b/include/linux/fscrypt_supp.h
index 6456c6b2005f4..b8443a2e47dc4 100644
--- a/include/linux/fscrypt_supp.h
+++ b/include/linux/fscrypt_supp.h
@@ -184,7 +184,8 @@ extern int fscrypt_zeroout_range(const struct inode *, pgoff_t, sector_t,
 
 /* hooks.c */
 extern int fscrypt_file_open(struct inode *inode, struct file *filp);
-extern int __fscrypt_prepare_link(struct inode *inode, struct inode *dir);
+extern int __fscrypt_prepare_link(struct inode *inode, struct inode *dir,
+				  struct dentry *dentry);
 extern int __fscrypt_prepare_rename(struct inode *old_dir,
 				    struct dentry *old_dentry,
 				    struct inode *new_dir,
-- 
2.29.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
