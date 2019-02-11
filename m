Return-Path: <SRS0=7Ms1=QS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEAF6C169C4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 17:32:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACAFE2229E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 17:32:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bf9EC7vp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmG0hVTQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACAFE2229E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ztJ4amFUj/JawUCUQRNHU8YBqG7/RuHhkXoasi1o4o=; b=Bf9EC7vpTkG+fA
	9ntS0kM5zLV9YE3tbarNNtRIsXVBs6usutu1p08WbUdBNx+DAt9pf5c5PN9TQVlXORYLTQAkt0xdC
	yn+DCB3WMxRBfpY5aIKZi+0bGFe2J3EWPm7iSW2fkaOrJFHPqsKiQu2O3EIfzS1l9mrtYSgW7Itil
	Z1ALpXGrtVKN1xWYESL1VihN6yE4a5qYI+6Qb9r7pEVi7MW/DO2Tv1alEtUvkA0bgrJ+USJ3MeplL
	6XRD7teHr4cT3GzeA8j7EzBA0RPODEcZfwXRlz5LsRq/iliSjp0YZF05qfcsf/FyeuvQyKvzNsbQ1
	Gj9aEdNDU3zC3cco2ZrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtFRc-0002pn-8x; Mon, 11 Feb 2019 17:32:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtFOo-0007K6-QZ
 for linux-mtd@lists.infradead.org; Mon, 11 Feb 2019 17:29:56 +0000
Received: from sol.localdomain (c-107-3-167-184.hsd1.ca.comcast.net
 [107.3.167.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FB0C222AC;
 Mon, 11 Feb 2019 17:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549906182;
 bh=HMrrmjF6M9Ltt70RTzP7HkpSWh9HKW9pvCjqvbBnBpU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JmG0hVTQPIDsaSZ17+1NrCQe1B9Cqhv7QCrXT/n4JUypl1732gDp4mTVHR4t8Xjx3
 6jY4mzZ1YMlMP2iv7lYUmrKp357iSdiFPknM6eWjkDENtvirWefDGOQPGFtcUR32TW
 kxXZdyMwkcTA7uL3AbPNMPdDxUhJhjXQhgs3Rqxg=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [RFC PATCH v2 12/20] fscrypt: add FS_IOC_GET_ENCRYPTION_KEY_STATUS
 ioctl
Date: Mon, 11 Feb 2019 09:27:30 -0800
Message-Id: <20190211172738.4633-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190211172738.4633-1-ebiggers@kernel.org>
References: <20190211172738.4633-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_092943_416391_C057E7E8 
X-CRM114-Status: GOOD (  19.50  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Add a new fscrypt ioctl, FS_IOC_GET_ENCRYPTION_KEY_STATUS.  Given a key
specified by 'struct fscrypt_key_specifier' (the same way a key is
specified for the other fscrypt key management ioctls), it returns
status information in a 'struct fscrypt_get_key_status_arg'.

The main motivation for this is that applications need to be able to
check whether an encrypted directory is "unlocked" or not, so that they
can add the key if it is not, and avoid adding the key (which may
involve prompting the user for a passphrase) if it already is.

It's possible to use some workarounds such as checking whether opening a
regular file fails with ENOKEY, or checking whether the filenames "look
like gibberish" or not.  However, no workaround is usable in all cases.

Like the other key management ioctls, the keyrings syscalls may seem at
first to be a good fit for this.  Unfortunately, they are not.  Even if
we exposed the keyring ID of the ->s_master_keys keyring and gave
everyone Search permission on it (note: currently the keyrings
permission system would also allow everyone to "invalidate" the keyring
too), the fscrypt keys have an additional state that doesn't map cleanly
to the keyrings API: the secret can be removed, but we can be still
tracking the files that were using the key, and the removal can be
re-attempted or the secret added again.

After later patches, some applications will also need a way to determine
whether a key was added by the current user vs. by some other user.
Reserved fields are included in fscrypt_get_key_status_arg for this and
other future extensions.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/keyring.c          | 60 ++++++++++++++++++++++++++++++++++++
 include/linux/fscrypt.h      |  7 +++++
 include/uapi/linux/fscrypt.h | 15 +++++++++
 3 files changed, 82 insertions(+)

diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 82d272c20969..73be8bda49bd 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -11,6 +11,7 @@
  *
  * - FS_IOC_ADD_ENCRYPTION_KEY: add a key
  * - FS_IOC_REMOVE_ENCRYPTION_KEY: remove a key
+ * - FS_IOC_GET_ENCRYPTION_KEY_STATUS: get key status
  */
 
 #include <linux/key-type.h>
@@ -515,6 +516,65 @@ int fscrypt_ioctl_remove_key(struct file *filp, const void __user *uarg)
 }
 EXPORT_SYMBOL_GPL(fscrypt_ioctl_remove_key);
 
+/*
+ * Retrieve the status of an fscrypt master encryption key.
+ *
+ * We set ->status to indicate whether the key is absent, present, or
+ * incompletely removed.  "Incompletely removed" means that the master key
+ * secret has been removed, but some files which had been unlocked with it are
+ * still in use.  This field allows applications to easily determine the state
+ * of an encrypted directory without using a hack such as trying to open a
+ * regular file in it (which can confuse the "incompletely removed" state with
+ * absent or present).
+ */
+int fscrypt_ioctl_get_key_status(struct file *filp, void __user *uarg)
+{
+	struct super_block *sb = file_inode(filp)->i_sb;
+	struct fscrypt_get_key_status_arg arg;
+	struct key *key;
+	struct fscrypt_master_key *mk;
+	int err;
+
+	if (copy_from_user(&arg, uarg, sizeof(arg)))
+		return -EFAULT;
+
+	if (memchr_inv(arg.__reserved, 0, sizeof(arg.__reserved)))
+		return -EINVAL;
+
+	if (!valid_key_spec(&arg.key_spec))
+		return -EINVAL;
+
+	memset(arg.__out_reserved, 0, sizeof(arg.__out_reserved));
+
+	key = fscrypt_find_master_key(sb, &arg.key_spec);
+	if (IS_ERR(key)) {
+		if (key != ERR_PTR(-ENOKEY))
+			return PTR_ERR(key);
+		arg.status = FSCRYPT_KEY_STATUS_ABSENT;
+		err = 0;
+		goto out;
+	}
+	mk = key->payload.data[0];
+	down_read(&key->sem);
+
+	if (!is_master_key_secret_present(&mk->mk_secret)) {
+		arg.status = FSCRYPT_KEY_STATUS_INCOMPLETELY_REMOVED;
+		err = 0;
+		goto out_release_key;
+	}
+
+	arg.status = FSCRYPT_KEY_STATUS_PRESENT;
+	err = 0;
+out_release_key:
+	up_read(&key->sem);
+	key_put(key);
+out:
+	if (!err && copy_to_user(uarg, &arg, sizeof(arg)))
+		err = -EFAULT;
+	return err;
+}
+EXPORT_SYMBOL_GPL(fscrypt_ioctl_get_key_status);
+
 int __init fscrypt_init_keyring(void)
 {
 	return register_key_type(&key_type_fscrypt);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index a8fabae9a5fe..dace3fd1bf19 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -115,6 +115,7 @@ extern int fscrypt_inherit_context(struct inode *, struct inode *,
 /* keyring.c */
 extern int fscrypt_ioctl_add_key(struct file *filp, void __user *arg);
 extern int fscrypt_ioctl_remove_key(struct file *filp, const void __user *arg);
+extern int fscrypt_ioctl_get_key_status(struct file *filp, void __user *arg);
 
 /* keysetup.c */
 extern int fscrypt_get_encryption_info(struct inode *);
@@ -339,6 +340,12 @@ static inline void fscrypt_put_encryption_info(struct inode *inode)
 	return;
 }
 
+static inline int fscrypt_ioctl_get_key_status(struct file *filp,
+					       void __user *arg)
+{
+	return -EOPNOTSUPP;
+}
+
  /* fname.c */
 static inline int fscrypt_setup_filename(struct inode *dir,
 					 const struct qstr *iname,
diff --git a/include/uapi/linux/fscrypt.h b/include/uapi/linux/fscrypt.h
index 3302a407131e..042e70a4ff7e 100644
--- a/include/uapi/linux/fscrypt.h
+++ b/include/uapi/linux/fscrypt.h
@@ -71,11 +71,26 @@ struct fscrypt_remove_key_arg {
 	__u32 __reserved[6];
 };
 
+/* Struct passed to FS_IOC_GET_ENCRYPTION_KEY_STATUS */
+struct fscrypt_get_key_status_arg {
+	/* input */
+	struct fscrypt_key_specifier key_spec;
+	__u32 __reserved[6];
+
+	/* output */
+#define FSCRYPT_KEY_STATUS_ABSENT		1
+#define FSCRYPT_KEY_STATUS_PRESENT		2
+#define FSCRYPT_KEY_STATUS_INCOMPLETELY_REMOVED	3
+	__u32 status;
+	__u32 __out_reserved[15];
+};
+
 #define FS_IOC_SET_ENCRYPTION_POLICY	  _IOR('f', 19, struct fscrypt_policy)
 #define FS_IOC_GET_ENCRYPTION_PWSALT	  _IOW('f', 20, __u8[16])
 #define FS_IOC_GET_ENCRYPTION_POLICY	  _IOW('f', 21, struct fscrypt_policy)
 #define FS_IOC_ADD_ENCRYPTION_KEY	 _IOWR('f', 23, struct fscrypt_add_key_arg)
 #define FS_IOC_REMOVE_ENCRYPTION_KEY	  _IOW('f', 24, struct fscrypt_remove_key_arg)
+#define FS_IOC_GET_ENCRYPTION_KEY_STATUS _IOWR('f', 25, struct fscrypt_get_key_status_arg)
 
 /**********************************************************************/
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
