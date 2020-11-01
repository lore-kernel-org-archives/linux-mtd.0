Return-Path: <SRS0=Psr0=EH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B97BC2D0A3
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Nov 2020 10:39:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED91B2071A
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Nov 2020 10:39:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cU5wtiQD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPR8/IsR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED91B2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:From:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=kPq2v2nW/Z37ylRU95J0vOmZByuD+N1yVqYdCEZpDA4=; b=cU5wtiQDOCHT6mt/K495o7ibO
	/1SJeSNuoP8vXPn0SstqND7t1DHlMJzQ79pCOnoCJOm3noPeVAYSy824MM8pJU2f6XXElLfzMeeA4
	Kt45a4QOI9J/EujE/JHAzVWQGp+t9a2DA92mIczRt2sm4U8YzEh0Ak9ka+Y1C+GrzjvMdfjzNW59W
	dL6UXDtli8oVDMR8iBjiKOEFTTEJgQ6EPH+aleF5I7WHu4SMbM+S9S+tQhsyX3XOMQ6k8lUeN/+XD
	+xU3VCtsWk/TiekQR1iAdmYfYQ8gF99YYPDra8UhwgR/Nuj/G5g9IH79ItkGuG4dlQTCkG02+gECV
	J6kHJYQXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZAkk-0003LW-A3; Sun, 01 Nov 2020 10:38:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZAkh-0003Kb-9R
 for linux-mtd@lists.infradead.org; Sun, 01 Nov 2020 10:38:25 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A0342072C;
 Sun,  1 Nov 2020 10:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604227102;
 bh=S2B1OU5saTu5WgIQoA1aP/CQTnc+dvCPHLM2+ciLpcQ=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=kPR8/IsRJt/u2NJehNzs5zseRCIxGlHSq7mAfH5mN+kQPqxJV1Ge+VjgkDWQjIwL4
 H2xJ4jM44u9iznH3L4UtwSpKrx9eBUDpftHMUoqZX44CiY+UezpvkxSlv01RnLqSIk
 ga7EXFd0ByzH+EaXTSGAas7ZC7OhcCc5xxzG7EoA=
Subject: Patch "fscrypt: clean up and improve dentry revalidation" has been
 added to the 4.19-stable tree
To: ebiggers@google.com, ebiggers@kernel.org, gregkh@linuxfoundation.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 tytso@mit.edu
From: <gregkh@linuxfoundation.org>
Date: Sun, 01 Nov 2020 11:39:02 +0100
In-Reply-To: <20201031220553.1085782-2-ebiggers@kernel.org>
Message-ID: <1604227142207110@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_053823_520870_F7750F27 
X-CRM114-Status: GOOD (  29.24  )
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

    fscrypt: clean up and improve dentry revalidation

to the 4.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     fscrypt-clean-up-and-improve-dentry-revalidation.patch
and it can be found in the queue-4.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Sun Nov  1 11:35:18 AM CET 2020
From: Eric Biggers <ebiggers@kernel.org>
Date: Sat, 31 Oct 2020 15:05:49 -0700
Subject: fscrypt: clean up and improve dentry revalidation
To: stable@vger.kernel.org
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org, Theodore Ts'o <tytso@mit.edu>
Message-ID: <20201031220553.1085782-2-ebiggers@kernel.org>

From: Eric Biggers <ebiggers@google.com>

commit 6cc248684d3d23bbd073ae2fa73d3416c0558909 upstream.

Make various improvements to fscrypt dentry revalidation:

- Don't try to handle the case where the per-directory key is removed,
  as this can't happen without the inode (and dentries) being evicted.

- Flag ciphertext dentries rather than plaintext dentries, since it's
  ciphertext dentries that need the special handling.

- Avoid doing unnecessary work for non-ciphertext dentries.

- When revalidating ciphertext dentries, try to set up the directory's
  i_crypt_info to make sure the key is really still absent, rather than
  invalidating all negative dentries as the previous code did.  An old
  comment suggested we can't do this for locking reasons, but AFAICT
  this comment was outdated and it actually works fine.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/crypto/crypto.c      |   58 ++++++++++++++++++++++++------------------------
 fs/crypto/hooks.c       |    4 +--
 include/linux/dcache.h  |    2 -
 include/linux/fscrypt.h |    6 +---
 4 files changed, 35 insertions(+), 35 deletions(-)

--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -314,45 +314,47 @@ int fscrypt_decrypt_page(const struct in
 EXPORT_SYMBOL(fscrypt_decrypt_page);
 
 /*
- * Validate dentries for encrypted directories to make sure we aren't
- * potentially caching stale data after a key has been added or
- * removed.
+ * Validate dentries in encrypted directories to make sure we aren't potentially
+ * caching stale dentries after a key has been added.
  */
 static int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
 {
 	struct dentry *dir;
-	int dir_has_key, cached_with_key;
+	int err;
+	int valid;
+
+	/*
+	 * Plaintext names are always valid, since fscrypt doesn't support
+	 * reverting to ciphertext names without evicting the directory's inode
+	 * -- which implies eviction of the dentries in the directory.
+	 */
+	if (!(dentry->d_flags & DCACHE_ENCRYPTED_NAME))
+		return 1;
+
+	/*
+	 * Ciphertext name; valid if the directory's key is still unavailable.
+	 *
+	 * Although fscrypt forbids rename() on ciphertext names, we still must
+	 * use dget_parent() here rather than use ->d_parent directly.  That's
+	 * because a corrupted fs image may contain directory hard links, which
+	 * the VFS handles by moving the directory's dentry tree in the dcache
+	 * each time ->lookup() finds the directory and it already has a dentry
+	 * elsewhere.  Thus ->d_parent can be changing, and we must safely grab
+	 * a reference to some ->d_parent to prevent it from being freed.
+	 */
 
 	if (flags & LOOKUP_RCU)
 		return -ECHILD;
 
 	dir = dget_parent(dentry);
-	if (!IS_ENCRYPTED(d_inode(dir))) {
-		dput(dir);
-		return 0;
-	}
-
-	spin_lock(&dentry->d_lock);
-	cached_with_key = dentry->d_flags & DCACHE_ENCRYPTED_WITH_KEY;
-	spin_unlock(&dentry->d_lock);
-	dir_has_key = (d_inode(dir)->i_crypt_info != NULL);
+	err = fscrypt_get_encryption_info(d_inode(dir));
+	valid = !fscrypt_has_encryption_key(d_inode(dir));
 	dput(dir);
 
-	/*
-	 * If the dentry was cached without the key, and it is a
-	 * negative dentry, it might be a valid name.  We can't check
-	 * if the key has since been made available due to locking
-	 * reasons, so we fail the validation so ext4_lookup() can do
-	 * this check.
-	 *
-	 * We also fail the validation if the dentry was created with
-	 * the key present, but we no longer have the key, or vice versa.
-	 */
-	if ((!cached_with_key && d_is_negative(dentry)) ||
-			(!cached_with_key && dir_has_key) ||
-			(cached_with_key && !dir_has_key))
-		return 0;
-	return 1;
+	if (err < 0)
+		return err;
+
+	return valid;
 }
 
 const struct dentry_operations fscrypt_d_ops = {
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -101,9 +101,9 @@ int __fscrypt_prepare_lookup(struct inod
 	if (err)
 		return err;
 
-	if (fscrypt_has_encryption_key(dir)) {
+	if (!fscrypt_has_encryption_key(dir)) {
 		spin_lock(&dentry->d_lock);
-		dentry->d_flags |= DCACHE_ENCRYPTED_WITH_KEY;
+		dentry->d_flags |= DCACHE_ENCRYPTED_NAME;
 		spin_unlock(&dentry->d_lock);
 	}
 
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -210,7 +210,7 @@ struct dentry_operations {
 
 #define DCACHE_MAY_FREE			0x00800000
 #define DCACHE_FALLTHRU			0x01000000 /* Fall through to lower layer */
-#define DCACHE_ENCRYPTED_WITH_KEY	0x02000000 /* dir is encrypted with a valid key */
+#define DCACHE_ENCRYPTED_NAME		0x02000000 /* Encrypted name (dir key was unavailable) */
 #define DCACHE_OP_REAL			0x04000000
 
 #define DCACHE_PAR_LOOKUP		0x10000000 /* being looked up (with parent locked shared) */
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -145,10 +145,8 @@ static inline int fscrypt_prepare_rename
  * filenames are presented in encrypted form.  Therefore, we'll try to set up
  * the directory's encryption key, but even without it the lookup can continue.
  *
- * To allow invalidating stale dentries if the directory's encryption key is
- * added later, we also install a custom ->d_revalidate() method and use the
- * DCACHE_ENCRYPTED_WITH_KEY flag to indicate whether a given dentry is a
- * plaintext name (flag set) or a ciphertext name (flag cleared).
+ * This also installs a custom ->d_revalidate() method which will invalidate the
+ * dentry if it was created without the key and the key is later added.
  *
  * Return: 0 on success, -errno if a problem occurred while setting up the
  * encryption key


Patches currently in stable-queue which might be from ebiggers@kernel.org are

queue-4.19/fscrypt-only-set-dentry_operations-on-ciphertext-dentries.patch
queue-4.19/fscrypt-clean-up-and-improve-dentry-revalidation.patch
queue-4.19/fscrypt-fix-race-allowing-rename-and-link-of-ciphertext-dentries.patch
queue-4.19/fs-fscrypt-clear-dcache_encrypted_name-when-unaliasing-directory.patch
queue-4.19/fscrypt-fix-race-where-lookup-marks-plaintext-dentry-as-ciphertext.patch

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
