Return-Path: <SRS0=5rSU=GA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D87C433E6
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Dec 2020 18:56:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF90122AAD
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Dec 2020 18:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF90122AAD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bSmOBeEGF1Fn8RtNojhx1RU86jXrMsV8pibnUdhp6v4=; b=dWdZJMh1g8GRLQ/Dad+koJqa3
	jB/4lQ2jOCFtbCN7aUYFf33KHO+x/nTr/qDALh5URVAA2Rl3zxk/smTJm4eL/eogGTICJlaf7AYQF
	sb8heMNCrBIsQnbka1JsqA9CO3INogb/kS28XVgjjzJvXin9jTao5gDgAgyWhPb6f6ZXyzZF4gJQf
	uuK4ix3R5oT8sdjx5JpLIELsj8GqsrqrsW6j4aMiGU/wFGJ5d1Gry/2d59A+4Av9UHj34i3ZkTUYY
	GiKrFkVrqlepFMNGAULmHuxGsKEBFG5pX1kNbTVN/nbj3ZWD8Pimd9b3QWAvCv3CsS4Z0MgcSIuQW
	Z+2rT9XFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktxgI-0007JG-0L; Mon, 28 Dec 2020 18:55:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktxg6-0007Fg-MX
 for linux-mtd@lists.infradead.org; Mon, 28 Dec 2020 18:55:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82A2A229EF;
 Mon, 28 Dec 2020 18:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609181728;
 bh=3QtK26oljYaFaN7x1voE+S5ExJ3xhJwHdd8ZnwQ1urc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qgn6NBoEXuOmDSwjgKIqSR2zWDHnr75C88qo0hEPcxZ0CwpcQRLEjnE/4wQycoIrc
 JtvC+X5w0W9HtrdqrMrrsUQiTrHqDqq5rF+cic32/wAY6Baoyo+s4MHpN54x6uwNl8
 GsFNRtvvvG7S1D/QioTbuXD0YlbNAnBGaodfOY6bq+pSHZoMoYFztqpFoCe/yQ/qpg
 YSj/2ih13maPL8KoXVL69ClpsfT/Ew9jTbsVnCawwl7603geqJv09RQzlhIy2+vvpK
 FNfqBuIzTu/hJdE6GxODk4gLTnIe6tR6ksNw/uwJBZrS5f4Cv5Ge/tHMq1kOTagjta
 LeibZv519dxgQ==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Subject: [PATCH 5.4 1/4] fscrypt: add fscrypt_is_nokey_name()
Date: Mon, 28 Dec 2020 10:54:30 -0800
Message-Id: <20201228185433.61129-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228185433.61129-1-ebiggers@kernel.org>
References: <20201228185433.61129-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_135534_899895_819D734A 
X-CRM114-Status: GOOD (  22.44  )
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

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
---
 fs/crypto/hooks.c       | 10 +++++-----
 include/linux/fscrypt.h | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index bb3b7fcfdd48a..a5a40a76b8ed7 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -58,8 +58,8 @@ int __fscrypt_prepare_link(struct inode *inode, struct inode *dir,
 	if (err)
 		return err;
 
-	/* ... in case we looked up ciphertext name before key was added */
-	if (dentry->d_flags & DCACHE_ENCRYPTED_NAME)
+	/* ... in case we looked up no-key name before key was added */
+	if (fscrypt_is_nokey_name(dentry))
 		return -ENOKEY;
 
 	if (!fscrypt_has_permitted_context(dir, inode))
@@ -83,9 +83,9 @@ int __fscrypt_prepare_rename(struct inode *old_dir, struct dentry *old_dentry,
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
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index f622f7460ed8c..032e5bcf97012 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -100,6 +100,35 @@ static inline void fscrypt_handle_d_move(struct dentry *dentry)
 	dentry->d_flags &= ~DCACHE_ENCRYPTED_NAME;
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
 extern struct fscrypt_ctx *fscrypt_get_ctx(gfp_t);
@@ -290,6 +319,11 @@ static inline void fscrypt_handle_d_move(struct dentry *dentry)
 {
 }
 
+static inline bool fscrypt_is_nokey_name(const struct dentry *dentry)
+{
+	return false;
+}
+
 /* crypto.c */
 static inline void fscrypt_enqueue_decrypt_work(struct work_struct *work)
 {
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
