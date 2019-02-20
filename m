Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA6DBC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 06:57:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A5C42087B
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 06:57:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rg+KGVo6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZontyBX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A5C42087B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H37x6TK21zhSNVTRDCpY3XEkyNAx+6Xy1e+gw0NU/xE=; b=rg+KGVo6MH4GDC
	97buERAeptSM50yAVT7i9XvHpzaP8J1RVU6g6cnAYDI7SwHMsKo+2PWL5LQOntgxTGO0oCAmA9bpj
	iMYD1ooBQXKKiFHnD3npjCum60pQeqPcHYIDXJ59YJsquqsWhrMOhh5TL8vX6yzlhoCo08rNJd8qx
	/6d8Ll9vmvcLYIgK8h8c94rN+Y/w2Q51m4bDdqnD2WH/tg7iHj31mKWTbYsOfw/jafIz1s2vrx8EN
	JF4UqDdOdJB4spgy5cCjk6iX500FmES1JbEDz4+ovIRfpGGHCLYvzbI7jhq3wFkcaqRltvUO/vQZo
	RztiRZt3WgrhxXgZMFzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwLoh-0006mm-Gv; Wed, 20 Feb 2019 06:57:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwLmH-00032C-6g
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 06:54:52 +0000
Received: from sol.localdomain (c-107-3-167-184.hsd1.ca.comcast.net
 [107.3.167.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF89121917;
 Wed, 20 Feb 2019 06:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550645682;
 bh=pQGi1F1UQ5iygO0I/HeMTMFMllZgYXcN2XSBk1OeH24=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PZontyBXZBYfDlmWUy8JIpGmo5IELJ+2TrvYpyZmOq2te5DOeLdTIcpSlTNPbsRAI
 ceJ9kIN+WQNBBytMXerUHZO/ZS/NdFPoT4+xv/FfOkD9C2Dop9p1Sk8iMZsxq5bUcE
 IDPgiVI+YkEwneLLMUU9bHFC1XSv5kVrBZ8QqSJU=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [RFC PATCH v3 14/18] fscrypt: require that key be added when setting
 a v2 encryption policy
Date: Tue, 19 Feb 2019 22:52:45 -0800
Message-Id: <20190220065249.32099-15-ebiggers@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190220065249.32099-1-ebiggers@kernel.org>
References: <20190220065249.32099-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190219_225445_814255_DA997B21 
X-CRM114-Status: GOOD (  17.01  )
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
Cc: linux-ext4@vger.kernel.org, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

By looking up the master keys in a filesystem-level keyring rather than
in the calling processes' key hierarchy, it becomes possible for a user
to set an encryption policy which refers to some key they don't actually
know, then encrypt their files using that key.  Cryptographically this
isn't much of a problem, but the semantics of this would be a bit weird.
Thus, enforce that a v2 encryption policy can only be set if the user
has previously added the key, or has capable(CAP_FOWNER).

We tolerate that this problem will continue to exist for v1 encryption
policies, however; there is no way around that.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h |  3 +++
 fs/crypto/keyring.c         | 47 +++++++++++++++++++++++++++++++++++++
 fs/crypto/policy.c          |  6 +++++
 3 files changed, 56 insertions(+)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index b81d4a59056d..881b43cb1d59 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -409,6 +409,9 @@ extern struct key *
 fscrypt_find_master_key(struct super_block *sb,
 			const struct fscrypt_key_specifier *mk_spec);
 
+extern int fscrypt_verify_key_added(struct super_block *sb,
+				    const u8 identifier[FSCRYPT_KEY_IDENTIFIER_SIZE]);
+
 extern int __init fscrypt_init_keyring(void);
 extern void fscrypt_exit_keyring(void);
 
diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 48e7ab8a42e5..dae4423c6657 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -556,6 +556,53 @@ int fscrypt_ioctl_add_key(struct file *filp, void __user *_uarg)
 }
 EXPORT_SYMBOL_GPL(fscrypt_ioctl_add_key);
 
+/*
+ * Verify that the current user has added a master key with the given identifier
+ * (returns -ENOKEY if not).  This is needed to prevent a user from encrypting
+ * their files using some other user's key which they don't actually know.
+ * Cryptographically this isn't much of a problem, but the semantics of this
+ * would be a bit weird, so it's best to just forbid it.
+ *
+ * The system administrator (CAP_FOWNER) can override this, which should be
+ * enough for any use cases where encryption policies are being set using keys
+ * that were chosen ahead of time but aren't available at the moment.
+ *
+ * Note that the key may have already removed by the time this returns, but
+ * that's okay; we just care whether the key was there at some point.
+ *
+ * Return: 0 if the key is added, -ENOKEY if it isn't, or another -errno code
+ */
+int fscrypt_verify_key_added(struct super_block *sb,
+			     const u8 identifier[FSCRYPT_KEY_IDENTIFIER_SIZE])
+{
+	struct fscrypt_key_specifier mk_spec;
+	struct key *key, *mk_user;
+	struct fscrypt_master_key *mk;
+	int err;
+
+	mk_spec.type = FSCRYPT_KEY_SPEC_TYPE_IDENTIFIER;
+	memcpy(mk_spec.u.identifier, identifier, FSCRYPT_KEY_IDENTIFIER_SIZE);
+
+	key = fscrypt_find_master_key(sb, &mk_spec);
+	if (IS_ERR(key)) {
+		err = PTR_ERR(key);
+		goto out;
+	}
+	mk = key->payload.data[0];
+	mk_user = find_master_key_user(mk);
+	if (IS_ERR(mk_user)) {
+		err = PTR_ERR(mk_user);
+	} else {
+		key_put(mk_user);
+		err = 0;
+	}
+	key_put(key);
+out:
+	if (err == -ENOKEY && capable(CAP_FOWNER))
+		err = 0;
+	return err;
+}
+
 static void evict_dentries_for_decrypted_inodes(struct fscrypt_master_key *mk)
 {
 	struct fscrypt_info *ci;
diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index 07fec2f7fc72..456c25796844 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -209,6 +209,7 @@ static int set_encryption_policy(struct inode *inode,
 {
 	union fscrypt_context ctx;
 	int ctxsize;
+	int err;
 
 	if (!fscrypt_supported_policy(policy))
 		return -EINVAL;
@@ -227,6 +228,11 @@ static int set_encryption_policy(struct inode *inode,
 		 */
 		pr_warn_once("%s (pid %d) is setting deprecated v1 encryption policy; recommend upgrading to v2.\n",
 			     current->comm, current->pid);
+	} else {
+		err = fscrypt_verify_key_added(inode->i_sb,
+					       policy->v2.master_key_identifier);
+		if (err)
+			return err;
 	}
 
 	ctxsize = fscrypt_new_context_from_policy(&ctx, policy);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
