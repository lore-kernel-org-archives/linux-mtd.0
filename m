Return-Path: <SRS0=Kb5f=GC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABD3C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Dec 2020 15:42:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D6F8207A6
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Dec 2020 15:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D6F8207A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:From:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=deansFAHVcnnYMSSXs0uVW0b0o5SRylRuNbYprf5afE=; b=ZgZ5i4tDesRWTTVhn3pXJsVXy
	malplfJt6rnPf3KBerdRsBYiO+GwFCr6nTYWCFeCthe7C/sjYKQQ8zWHwwv7rBmBho4N1+xot6JuQ
	EhHkRGWDvNJuJ5qqdRwDj4cu8QvITM61m0dpjRAcA4PVg7X1+WkoapDF2OZx31L29Nx46CGKl1R4K
	S4TPT9opBZEfu0YrikonbdLwypMqWyhVp0CTpWjBwykvhVHLKP/rwDEqF7wTTnb/Qfbg3uzLJCnqX
	6fXbDaP2WzPf78nCMhLcTH/6qspr68Rz8q9TK07qWFVaVAMUUD6qhr+8aA+Ujj0UvWTznNEhIrrCf
	1RY0ShVPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kudat-0004EO-Ui; Wed, 30 Dec 2020 15:40:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kudak-0004Bj-Kj
 for linux-mtd@lists.infradead.org; Wed, 30 Dec 2020 15:40:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 828E4221F8;
 Wed, 30 Dec 2020 15:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1609342850;
 bh=6oWinRAClkcBVeQ4FIaMy3MJ5bBAnAuQxAeDf0gqE04=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=tATsiVGM7PZ+zW+JsmvWBuGphWLBUz2Au71A7ylm5MNA0MDjkj1QzrAwYdd5ny6dk
 M4PDBzNVmomYoeZc8ZjKtAulalGRw/Uy6AV1iJcmw2+K8KHqXZfZPy8SkdFOsOhdZM
 lgVhQ8ZuR4gdFrP4YAxgLkg9hjHHOHctns+yss5E=
Subject: Patch "fscrypt: add fscrypt_is_nokey_name()" has been added to the
 4.19-stable tree
To: ebiggers@google.com, ebiggers@kernel.org, gregkh@linuxfoundation.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org
From: <gregkh@linuxfoundation.org>
Date: Wed, 30 Dec 2020 16:42:04 +0100
In-Reply-To: <20201228191211.138300-2-ebiggers@kernel.org>
Message-ID: <160934292422776@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_104051_124148_6A928C0F 
X-CRM114-Status: GOOD (  24.45  )
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

    fscrypt: add fscrypt_is_nokey_name()

to the 4.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     fscrypt-add-fscrypt_is_nokey_name.patch
and it can be found in the queue-4.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Wed Dec 30 04:40:58 PM CET 2020
From: Eric Biggers <ebiggers@kernel.org>
Date: Mon, 28 Dec 2020 11:12:08 -0800
Subject: fscrypt: add fscrypt_is_nokey_name()
To: stable@vger.kernel.org
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org
Message-ID: <20201228191211.138300-2-ebiggers@kernel.org>

From: Eric Biggers <ebiggers@google.com>

commit 159e1de201b6fca10bfec50405a3b53a561096a8 upstream.

It's possible to create a duplicate filename in an encrypted directory
by creating a file concurrently with adding the encryption key.

Specifically, sys_open(O_CREAT) (or sys_mkdir(), sys_mknod(), or
sys_symlink()) can lookup the target filename while the directory's
encryption key hasn't been added yet, resulting in a negative no-key
dentry.  The VFS then calls ->create() (or ->mkdir(), ->mknod(), or
->symlink()) because the dentry is negative.  Normally, ->create() would
return -ENOKEY due to the directory's key being unavailable.  However,
if the key was added between the dentry lookup and ->create(), then the
filesystem will go ahead and try to create the file.

If the target filename happens to already exist as a normal name (not a
no-key name), a duplicate filename may be added to the directory.

In order to fix this, we need to fix the filesystems to prevent
->create(), ->mkdir(), ->mknod(), and ->symlink() on no-key names.
(->rename() and ->link() need it too, but those are already handled
correctly by fscrypt_prepare_rename() and fscrypt_prepare_link().)

In preparation for this, add a helper function fscrypt_is_nokey_name()
that filesystems can use to do this check.  Use this helper function for
the existing checks that fs/crypto/ does for rename and link.

Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20201118075609.120337-2-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/crypto/hooks.c               |   10 +++++-----
 include/linux/fscrypt_notsupp.h |    5 +++++
 include/linux/fscrypt_supp.h    |   29 +++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+), 5 deletions(-)

--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -58,8 +58,8 @@ int __fscrypt_prepare_link(struct inode
 	if (err)
 		return err;
 
-	/* ... in case we looked up ciphertext name before key was added */
-	if (dentry->d_flags & DCACHE_ENCRYPTED_NAME)
+	/* ... in case we looked up no-key name before key was added */
+	if (fscrypt_is_nokey_name(dentry))
 		return -ENOKEY;
 
 	if (!fscrypt_has_permitted_context(dir, inode))
@@ -83,9 +83,9 @@ int __fscrypt_prepare_rename(struct inod
 	if (err)
 		return err;
 
-	/* ... in case we looked up ciphertext name(s) before key was added */
-	if ((old_dentry->d_flags | new_dentry->d_flags) &
-	    DCACHE_ENCRYPTED_NAME)
+	/* ... in case we looked up no-key name(s) before key was added */
+	if (fscrypt_is_nokey_name(old_dentry) ||
+	    fscrypt_is_nokey_name(new_dentry))
 		return -ENOKEY;
 
 	if (old_dir != new_dir) {
--- a/include/linux/fscrypt_notsupp.h
+++ b/include/linux/fscrypt_notsupp.h
@@ -24,6 +24,11 @@ static inline bool fscrypt_dummy_context
 	return false;
 }
 
+static inline bool fscrypt_is_nokey_name(const struct dentry *dentry)
+{
+	return false;
+}
+
 /* crypto.c */
 static inline void fscrypt_enqueue_decrypt_work(struct work_struct *work)
 {
--- a/include/linux/fscrypt_supp.h
+++ b/include/linux/fscrypt_supp.h
@@ -58,6 +58,35 @@ static inline bool fscrypt_dummy_context
 		inode->i_sb->s_cop->dummy_context(inode);
 }
 
+/**
+ * fscrypt_is_nokey_name() - test whether a dentry is a no-key name
+ * @dentry: the dentry to check
+ *
+ * This returns true if the dentry is a no-key dentry.  A no-key dentry is a
+ * dentry that was created in an encrypted directory that hasn't had its
+ * encryption key added yet.  Such dentries may be either positive or negative.
+ *
+ * When a filesystem is asked to create a new filename in an encrypted directory
+ * and the new filename's dentry is a no-key dentry, it must fail the operation
+ * with ENOKEY.  This includes ->create(), ->mkdir(), ->mknod(), ->symlink(),
+ * ->rename(), and ->link().  (However, ->rename() and ->link() are already
+ * handled by fscrypt_prepare_rename() and fscrypt_prepare_link().)
+ *
+ * This is necessary because creating a filename requires the directory's
+ * encryption key, but just checking for the key on the directory inode during
+ * the final filesystem operation doesn't guarantee that the key was available
+ * during the preceding dentry lookup.  And the key must have already been
+ * available during the dentry lookup in order for it to have been checked
+ * whether the filename already exists in the directory and for the new file's
+ * dentry not to be invalidated due to it incorrectly having the no-key flag.
+ *
+ * Return: %true if the dentry is a no-key name
+ */
+static inline bool fscrypt_is_nokey_name(const struct dentry *dentry)
+{
+	return dentry->d_flags & DCACHE_ENCRYPTED_NAME;
+}
+
 /* crypto.c */
 extern void fscrypt_enqueue_decrypt_work(struct work_struct *);
 extern struct fscrypt_ctx *fscrypt_get_ctx(const struct inode *, gfp_t);


Patches currently in stable-queue which might be from ebiggers@kernel.org are

queue-4.19/fscrypt-add-fscrypt_is_nokey_name.patch
queue-4.19/ext4-prevent-creating-duplicate-encrypted-filenames.patch
queue-4.19/ubifs-prevent-creating-duplicate-encrypted-filenames.patch
queue-4.19/f2fs-prevent-creating-duplicate-encrypted-filenames.patch

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
