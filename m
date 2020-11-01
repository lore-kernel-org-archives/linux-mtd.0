Return-Path: <SRS0=Psr0=EH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEC3C2D0A3
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Nov 2020 10:39:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BD352071A
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Nov 2020 10:39:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="leifB6GS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="b0vw96aB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BD352071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:From:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=BQA/duuPI/lFj8yYVNONDicNlxpTk4z8Wf9ps9oK9HY=; b=leifB6GSCXF+qQ71oE/mt+oiL
	VP8p9EymkdHIItN6oqjc4l4UjldrvzmZ9bq7etmkNope9NK4LP7B+P/lzcZBKcvltH6MjSt1Bfb7C
	GwX7HxgHWp+JNE9JSYmDBTxbX1WWi7xwi54VAwL9QozzhXCIt/BJcs4+EmLIHbDAVwekEpkydvGW6
	jJ8L3wkJJwLogPBE3u+AXPYizK7bNVJid6BALuOGLJA6VddqnD0EpvnkWCInPTenv74E49Wh41sry
	ZwGrcXz6awLGhJPW8RvLD8x7qfVr1ImHwq0eroAUEZGbXES1m8bDZ2Z7AvRRj/wLK998rCgFZT1Z8
	/RpqsGyAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZAkn-0003MV-Sh; Sun, 01 Nov 2020 10:38:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZAkk-0003LS-03
 for linux-mtd@lists.infradead.org; Sun, 01 Nov 2020 10:38:27 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D5AA520731;
 Sun,  1 Nov 2020 10:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604227105;
 bh=eaB443rEm8dR9x1CWeKO5RamcSe+2dBaJZ1p9MEoMeA=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=b0vw96aBbwgYOmYkk4MaVWq8NqWCaEjxpuSGuJPtLa+ApI+gC4lMN+2z7iPMdyZEW
 tUMURgvo3jfkX7OEWDANRX+5LXI+T1maiwV3MMuxiHdIN2jmoMe3DK/hu7+EyPzHn/
 hfjymMyeTP4Me9diFHrM0NWNbQw5vZmXrPECU5jo=
Subject: Patch "fscrypt: fix race allowing rename() and link() of ciphertext
 dentries" has been added to the 4.19-stable tree
To: ebiggers@google.com, ebiggers@kernel.org, gregkh@linuxfoundation.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 tytso@mit.edu
From: <gregkh@linuxfoundation.org>
Date: Sun, 01 Nov 2020 11:39:02 +0100
In-Reply-To: <20201031220553.1085782-3-ebiggers@kernel.org>
Message-ID: <160422714210845@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_053826_251313_4F820713 
X-CRM114-Status: GOOD (  17.79  )
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


This is a note to let you know that I've just added the patch titled

    fscrypt: fix race allowing rename() and link() of ciphertext dentries

to the 4.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     fscrypt-fix-race-allowing-rename-and-link-of-ciphertext-dentries.patch
and it can be found in the queue-4.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Sun Nov  1 11:35:18 AM CET 2020
From: Eric Biggers <ebiggers@kernel.org>
Date: Sat, 31 Oct 2020 15:05:50 -0700
Subject: fscrypt: fix race allowing rename() and link() of ciphertext dentries
To: stable@vger.kernel.org
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org, Theodore Ts'o <tytso@mit.edu>
Message-ID: <20201031220553.1085782-3-ebiggers@kernel.org>

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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/crypto/hooks.c               |   12 +++++++++++-
 include/linux/fscrypt.h         |    2 +-
 include/linux/fscrypt_notsupp.h |    4 ++--
 include/linux/fscrypt_supp.h    |    3 ++-
 4 files changed, 16 insertions(+), 5 deletions(-)

--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -49,7 +49,8 @@ int fscrypt_file_open(struct inode *inod
 }
 EXPORT_SYMBOL_GPL(fscrypt_file_open);
 
-int __fscrypt_prepare_link(struct inode *inode, struct inode *dir)
+int __fscrypt_prepare_link(struct inode *inode, struct inode *dir,
+			   struct dentry *dentry)
 {
 	int err;
 
@@ -57,6 +58,10 @@ int __fscrypt_prepare_link(struct inode
 	if (err)
 		return err;
 
+	/* ... in case we looked up ciphertext name before key was added */
+	if (dentry->d_flags & DCACHE_ENCRYPTED_NAME)
+		return -ENOKEY;
+
 	if (!fscrypt_has_permitted_context(dir, inode))
 		return -EXDEV;
 
@@ -78,6 +83,11 @@ int __fscrypt_prepare_rename(struct inod
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
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -97,7 +97,7 @@ static inline int fscrypt_prepare_link(s
 				       struct dentry *dentry)
 {
 	if (IS_ENCRYPTED(dir))
-		return __fscrypt_prepare_link(d_inode(old_dentry), dir);
+		return __fscrypt_prepare_link(d_inode(old_dentry), dir, dentry);
 	return 0;
 }
 
--- a/include/linux/fscrypt_notsupp.h
+++ b/include/linux/fscrypt_notsupp.h
@@ -183,8 +183,8 @@ static inline int fscrypt_file_open(stru
 	return 0;
 }
 
-static inline int __fscrypt_prepare_link(struct inode *inode,
-					 struct inode *dir)
+static inline int __fscrypt_prepare_link(struct inode *inode, struct inode *dir,
+					 struct dentry *dentry)
 {
 	return -EOPNOTSUPP;
 }
--- a/include/linux/fscrypt_supp.h
+++ b/include/linux/fscrypt_supp.h
@@ -184,7 +184,8 @@ extern int fscrypt_zeroout_range(const s
 
 /* hooks.c */
 extern int fscrypt_file_open(struct inode *inode, struct file *filp);
-extern int __fscrypt_prepare_link(struct inode *inode, struct inode *dir);
+extern int __fscrypt_prepare_link(struct inode *inode, struct inode *dir,
+				  struct dentry *dentry);
 extern int __fscrypt_prepare_rename(struct inode *old_dir,
 				    struct dentry *old_dentry,
 				    struct inode *new_dir,


Patches currently in stable-queue which might be from ebiggers@kernel.org are

queue-4.19/fscrypt-only-set-dentry_operations-on-ciphertext-dentries.patch
queue-4.19/fscrypt-clean-up-and-improve-dentry-revalidation.patch
queue-4.19/fscrypt-fix-race-allowing-rename-and-link-of-ciphertext-dentries.patch
queue-4.19/fs-fscrypt-clear-dcache_encrypted_name-when-unaliasing-directory.patch
queue-4.19/fscrypt-fix-race-where-lookup-marks-plaintext-dentry-as-ciphertext.patch

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
