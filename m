Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BFD6C433FF
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 16:34:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27F8D2086D
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 16:34:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pf4+xkfx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/Z2qERE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27F8D2086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2KP4Xmw/VQCjAD+6DEqRAzuCJb85nBmb71vGTB52us=; b=Pf4+xkfxq24SzN
	dKvUCHI70BlTE2g9jgEYeY3EZzg/bs34fpHWB6LbuZVdVLAvOkLeyG1W4IGb7uBERJz+QCkuQ33um
	mwlxQy4ww7EwqFXxu3taYwz8QICsG5cMC7EysXnAE+2lrSlxuvDSgb3tlp5lBw0qJ9f7wWKgnrMLK
	nuRoQgUWTa5idUP2UY9Y+4aMUeCEVMvr2Msyhf11OIYe5lSoUej/41Ix+Ow0yuLVojZpu8oMd26hE
	++HOPUkZpQGZxTP/5j4bn8gHUXljNDHvuwNZcyXnkM+smCaogz7GTI1Y7gj1wJEju3KI625Xn8OkA
	92QPCZk4lPeAmUfa9koA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hufw5-00057o-O5; Mon, 05 Aug 2019 16:34:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hufql-0008UP-11
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2019 16:28:49 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8ABEF21882;
 Mon,  5 Aug 2019 16:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565022517;
 bh=VjAaNT/bB/mmrNPRrRj2ZZRW/GYtz3hszPigcawoqzI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z/Z2qEREoFm/mmXKw0i8w5vAqkR/mAb7ptX3C3G4hUGzHmRT1I+2nh4hBecUKx7qP
 qBhsWoKbVZ1N1GU379pIrI8rEbMfoI9deXoMQu2LigEP21H3iI02xzcwQUzPrjanzh
 kdeLKNiBRCc55d1D1wuKOC8WZUtDl/AbFtSL7UFA=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v8 15/20] fscrypt: add FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS
 ioctl
Date: Mon,  5 Aug 2019 09:25:16 -0700
Message-Id: <20190805162521.90882-16-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
In-Reply-To: <20190805162521.90882-1-ebiggers@kernel.org>
References: <20190805162521.90882-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_092843_675175_8350B50F 
X-CRM114-Status: GOOD (  19.16  )
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
Cc: Satya Tangirala <satyat@google.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-api@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Add a root-only variant of the FS_IOC_REMOVE_ENCRYPTION_KEY ioctl which
removes all users' claims of the key, not just the current user's claim.
I.e., it always removes the key itself, no matter how many users have
added it.

This is useful for forcing a directory to be locked, without having to
figure out which user ID(s) the key was added under.  This is planned to
be used by a command like 'sudo fscrypt lock DIR --all-users' in the
fscrypt userspace tool (http://github.com/google/fscrypt).

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/keyring.c          | 29 ++++++++++++++++++++++++-----
 include/linux/fscrypt.h      |  8 ++++++++
 include/uapi/linux/fscrypt.h |  1 +
 3 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 2f47464f8cf603..86bfcc02b31fcf 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -11,6 +11,7 @@
  *
  * - FS_IOC_ADD_ENCRYPTION_KEY
  * - FS_IOC_REMOVE_ENCRYPTION_KEY
+ * - FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS
  * - FS_IOC_GET_ENCRYPTION_KEY_STATUS
  *
  * See the "User API" section of Documentation/filesystems/fscrypt.rst for more
@@ -699,8 +700,10 @@ static int try_to_lock_encrypted_files(struct super_block *sb,
 /*
  * Try to remove an fscrypt master encryption key.
  *
- * This removes the current user's claim to the key, then removes the key itself
- * if no other users have claims.
+ * FS_IOC_REMOVE_ENCRYPTION_KEY (all_users=false) removes the current user's
+ * claim to the key, then removes the key itself if no other users have claims.
+ * FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS (all_users=true) always removes the
+ * key itself.
  *
  * To "remove the key itself", first we wipe the actual master key secret, so
  * that no more inodes can be unlocked with it.  Then we try to evict all cached
@@ -715,7 +718,7 @@ static int try_to_lock_encrypted_files(struct super_block *sb,
  * For more details, see the "Removing keys" section of
  * Documentation/filesystems/fscrypt.rst.
  */
-int fscrypt_ioctl_remove_key(struct file *filp, void __user *_uarg)
+static int do_remove_key(struct file *filp, void __user *_uarg, bool all_users)
 {
 	struct super_block *sb = file_inode(filp)->i_sb;
 	struct fscrypt_remove_key_arg __user *uarg = _uarg;
@@ -751,9 +754,12 @@ int fscrypt_ioctl_remove_key(struct file *filp, void __user *_uarg)
 
 	down_write(&key->sem);
 
-	/* If relevant, remove current user's claim to the key */
+	/* If relevant, remove current user's (or all users) claim to the key */
 	if (mk->mk_users && mk->mk_users->keys.nr_leaves_on_tree != 0) {
-		err = remove_master_key_user(mk);
+		if (all_users)
+			err = keyring_clear(mk->mk_users);
+		else
+			err = remove_master_key_user(mk);
 		if (err) {
 			up_write(&key->sem);
 			goto out_put_key;
@@ -806,8 +812,21 @@ int fscrypt_ioctl_remove_key(struct file *filp, void __user *_uarg)
 		err = put_user(status_flags, &uarg->removal_status_flags);
 	return err;
 }
+
+int fscrypt_ioctl_remove_key(struct file *filp, void __user *uarg)
+{
+	return do_remove_key(filp, uarg, false);
+}
 EXPORT_SYMBOL_GPL(fscrypt_ioctl_remove_key);
 
+int fscrypt_ioctl_remove_key_all_users(struct file *filp, void __user *uarg)
+{
+	if (!capable(CAP_SYS_ADMIN))
+		return -EACCES;
+	return do_remove_key(filp, uarg, true);
+}
+EXPORT_SYMBOL_GPL(fscrypt_ioctl_remove_key_all_users);
+
 /*
  * Retrieve the status of an fscrypt master encryption key.
  *
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 8b8ff048404297..f622f7460ed8c6 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -143,6 +143,8 @@ extern int fscrypt_inherit_context(struct inode *, struct inode *,
 extern void fscrypt_sb_free(struct super_block *sb);
 extern int fscrypt_ioctl_add_key(struct file *filp, void __user *arg);
 extern int fscrypt_ioctl_remove_key(struct file *filp, void __user *arg);
+extern int fscrypt_ioctl_remove_key_all_users(struct file *filp,
+					      void __user *arg);
 extern int fscrypt_ioctl_get_key_status(struct file *filp, void __user *arg);
 
 /* keysetup.c */
@@ -396,6 +398,12 @@ static inline int fscrypt_ioctl_remove_key(struct file *filp, void __user *arg)
 	return -EOPNOTSUPP;
 }
 
+static inline int fscrypt_ioctl_remove_key_all_users(struct file *filp,
+						     void __user *arg)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int fscrypt_ioctl_get_key_status(struct file *filp,
 					       void __user *arg)
 {
diff --git a/include/uapi/linux/fscrypt.h b/include/uapi/linux/fscrypt.h
index b9fb775e3db8e4..39ccfe9311c387 100644
--- a/include/uapi/linux/fscrypt.h
+++ b/include/uapi/linux/fscrypt.h
@@ -148,6 +148,7 @@ struct fscrypt_get_key_status_arg {
 #define FS_IOC_GET_ENCRYPTION_POLICY_EX		_IOWR('f', 22, __u8[9]) /* size + version */
 #define FS_IOC_ADD_ENCRYPTION_KEY		_IOWR('f', 23, struct fscrypt_add_key_arg)
 #define FS_IOC_REMOVE_ENCRYPTION_KEY		_IOWR('f', 24, struct fscrypt_remove_key_arg)
+#define FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS	_IOWR('f', 25, struct fscrypt_remove_key_arg)
 #define FS_IOC_GET_ENCRYPTION_KEY_STATUS	_IOWR('f', 26, struct fscrypt_get_key_status_arg)
 
 /**********************************************************************/
-- 
2.22.0.770.g0f2c4a37fd-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
