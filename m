Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CBAC5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 07:58:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 510A82080A
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 07:58:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ayfQKOW6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRCSgvfs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 510A82080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nAdNtYYn6E9EWqJRRACqJPBVtxde+7E5hIsYjiN7IGA=; b=ayfQKOW6QN3yz+wLYc7UNmwZb
	uKlsWdgFzMmKmniKODstdtyJNZOYMxjCFiE1qMAcyJ+ydR9/0vmGKMNpLn+YXQ0bRfCpArXjOEbw7
	mcL9uxN6xYLYbUTSJ+W0/1vBuJksGr582zQy58ihKwuYSCGMLaMJ3gao7cyyQLm3xbbZDtgjyndWx
	VazI9aTIP9GvDld1rTSA6FamIDVhDrBv/Wg0Uf7QYjFgO2O23tMB9zcOqIE+UyGs3z901Zh/aXkCB
	QaNNhjDq1WS0IWEL5oysWZpO25YSdXeM5Hmz/SwgMP4B/LzxO8Hf2f/FzQf8aJxq2vrGcfoy6jpbs
	91QEoqdEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfILZ-0002ld-OM; Wed, 18 Nov 2020 07:57:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfILU-0002jI-KS
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 07:57:41 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A66B020872;
 Wed, 18 Nov 2020 07:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605686260;
 bh=FigGyYGVqyexbkViWFXWCBw61iVGnXUSTYihGGdmkRE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eRCSgvfsCg1QTVP5X/naFr2Dfarwmp41S1fV43iSP/OjrT5qpwoEiibmVfG5qqCO1
 Od3miTUeHxuE84xOTJx12qGLmh570Us2zeO5b5g/bqB7xJYav4yunwirLCZJXForrW
 Q7EW77lq7oHivyoQyvlOM136mx+VhyJg8ZMYengk=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH 1/5] fscrypt: add fscrypt_is_nokey_name()
Date: Tue, 17 Nov 2020 23:56:05 -0800
Message-Id: <20201118075609.120337-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201118075609.120337-1-ebiggers@kernel.org>
References: <20201118075609.120337-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_025740_877558_B8FD0FD3 
X-CRM114-Status: GOOD (  24.49  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

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
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/hooks.c       |  5 +++--
 include/linux/fscrypt.h | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 20b0df47fe6a..061418be4b08 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -61,7 +61,7 @@ int __fscrypt_prepare_link(struct inode *inode, struct inode *dir,
 		return err;
 
 	/* ... in case we looked up no-key name before key was added */
-	if (dentry->d_flags & DCACHE_NOKEY_NAME)
+	if (fscrypt_is_nokey_name(dentry))
 		return -ENOKEY;
 
 	if (!fscrypt_has_permitted_context(dir, inode))
@@ -86,7 +86,8 @@ int __fscrypt_prepare_rename(struct inode *old_dir, struct dentry *old_dentry,
 		return err;
 
 	/* ... in case we looked up no-key name(s) before key was added */
-	if ((old_dentry->d_flags | new_dentry->d_flags) & DCACHE_NOKEY_NAME)
+	if (fscrypt_is_nokey_name(old_dentry) ||
+	    fscrypt_is_nokey_name(new_dentry))
 		return -ENOKEY;
 
 	if (old_dir != new_dir) {
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index a8f7a43f031b..8e1d31c959bf 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -111,6 +111,35 @@ static inline void fscrypt_handle_d_move(struct dentry *dentry)
 	dentry->d_flags &= ~DCACHE_NOKEY_NAME;
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
+	return dentry->d_flags & DCACHE_NOKEY_NAME;
+}
+
 /* crypto.c */
 void fscrypt_enqueue_decrypt_work(struct work_struct *);
 
@@ -244,6 +273,11 @@ static inline void fscrypt_handle_d_move(struct dentry *dentry)
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
