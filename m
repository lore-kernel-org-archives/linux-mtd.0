Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC96C6369E
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 03:28:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 841012469D
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 03:28:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WCYTfLQy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="un4bj2jG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 841012469D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R7MS9jDl8ltjJxuC4UFNSXsn9Hy8VZjSbAO6MRmiOH4=; b=WCYTfLQyvnE5+F1nHjbqDFBrNY
	ObwlkbLchfT7WzlecyTzDRfu5bh4WuotdQOlR5/sRxHb2y2MnASBb9zWPOstO6L3DaMyfyG5r3usC
	P9iN04SF8kMKW3CpYepO8KUgWMVxWo7qub9ZlnuEp2SvZaOe0b7GSpWaChdJvrjO50i42uJ/ft7mb
	/wg81yoFQ4XxIDJ3D65fw9YkbZkvBQcu8vnPxZ7H3WHP2HOwylIZS5Grt52IIJ2spVVRm2M9NTtJ8
	H/brKdq0lavNAnNbYBX76Lt9arvLC8kXEBncJb5V5iP1W/LMeNLtOUHkmJ+0L/r8Uc5SOmO1sUVQl
	NAf5JCcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kerek-0005Qo-Gy; Tue, 17 Nov 2020 03:27:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kerei-0005QB-Fb
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 03:27:45 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47F222469D;
 Tue, 17 Nov 2020 03:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605583662;
 bh=9CwJn8QpyI+D4Gz7jxAZUUcOSO+EMLP20wnVdlB9sy8=;
 h=From:To:Cc:Subject:Date:From;
 b=un4bj2jGvlut+tTTMr0qk+xT8Tw7f9VhIYbcQlYLBhsOAGQiJJQj0umgZWYmpehZC
 Rkhce4A40lU1Hl+gF1GeghWAXLoo175rJLSi7m5PtnXWXkzmp4VCW8ToQR7EWaUv16
 0FifMmt7+NzSyCj04RyCyiDP/ssQ6gqoXsv/twt8=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH] fscrypt: simplify master key locking
Date: Mon, 16 Nov 2020 19:26:26 -0800
Message-Id: <20201117032626.320275-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_222744_699780_54E69726 
X-CRM114-Status: GOOD (  25.31  )
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
Cc: linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

The stated reasons for separating fscrypt_master_key::mk_secret_sem from
the standard semaphore contained in every 'struct key' no longer apply.

First, due to commit a992b20cd4ee ("fscrypt: add
fscrypt_prepare_new_inode() and fscrypt_set_context()"),
fscrypt_get_encryption_info() is no longer called from within a
filesystem transaction.

Second, due to commit d3ec10aa9581 ("KEYS: Don't write out to userspace
while holding key semaphore"), the semaphore for the "keyring" key type
no longer ranks above page faults.

That leaves performance as the only possible reason to keep the separate
mk_secret_sem.  Specifically, having mk_secret_sem reduces the
contention between setup_file_encryption_key() and
FS_IOC_{ADD,REMOVE}_ENCRYPTION_KEY.  However, these ioctls aren't
executed often, so this doesn't seem to be worth the extra complexity.

Therefore, simplify the locking design by just using key->sem instead of
mk_secret_sem.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h | 19 ++++++-------------
 fs/crypto/hooks.c           |  8 +++++---
 fs/crypto/keyring.c         |  8 +-------
 fs/crypto/keysetup.c        | 20 +++++++++-----------
 4 files changed, 21 insertions(+), 34 deletions(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 322ecae9a758..a61d4dbf0a0b 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -439,16 +439,9 @@ struct fscrypt_master_key {
 	 * FS_IOC_REMOVE_ENCRYPTION_KEY can be retried, or
 	 * FS_IOC_ADD_ENCRYPTION_KEY can add the secret again.
 	 *
-	 * Locking: protected by key->sem (outer) and mk_secret_sem (inner).
-	 * The reason for two locks is that key->sem also protects modifying
-	 * mk_users, which ranks it above the semaphore for the keyring key
-	 * type, which is in turn above page faults (via keyring_read).  But
-	 * sometimes filesystems call fscrypt_get_encryption_info() from within
-	 * a transaction, which ranks it below page faults.  So we need a
-	 * separate lock which protects mk_secret but not also mk_users.
+	 * Locking: protected by this master key's key->sem.
 	 */
 	struct fscrypt_master_key_secret	mk_secret;
-	struct rw_semaphore			mk_secret_sem;
 
 	/*
 	 * For v1 policy keys: an arbitrary key descriptor which was assigned by
@@ -467,8 +460,8 @@ struct fscrypt_master_key {
 	 *
 	 * This is NULL for v1 policy keys; those can only be added by root.
 	 *
-	 * Locking: in addition to this keyrings own semaphore, this is
-	 * protected by the master key's key->sem, so we can do atomic
+	 * Locking: in addition to this keyring's own semaphore, this is
+	 * protected by this master key's key->sem, so we can do atomic
 	 * search+insert.  It can also be searched without taking any locks, but
 	 * in that case the returned key may have already been removed.
 	 */
@@ -510,9 +503,9 @@ is_master_key_secret_present(const struct fscrypt_master_key_secret *secret)
 	/*
 	 * The READ_ONCE() is only necessary for fscrypt_drop_inode() and
 	 * fscrypt_key_describe().  These run in atomic context, so they can't
-	 * take ->mk_secret_sem and thus 'secret' can change concurrently which
-	 * would be a data race.  But they only need to know whether the secret
-	 * *was* present at the time of check, so READ_ONCE() suffices.
+	 * take the key semaphore and thus 'secret' can change concurrently
+	 * which would be a data race.  But they only need to know whether the
+	 * secret *was* present at the time of check, so READ_ONCE() suffices.
 	 */
 	return READ_ONCE(secret->size) != 0;
 }
diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 20b0df47fe6a..282dfe52ac99 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -138,6 +138,7 @@ int fscrypt_prepare_setflags(struct inode *inode,
 			     unsigned int oldflags, unsigned int flags)
 {
 	struct fscrypt_info *ci;
+	struct key *key;
 	struct fscrypt_master_key *mk;
 	int err;
 
@@ -153,13 +154,14 @@ int fscrypt_prepare_setflags(struct inode *inode,
 		ci = inode->i_crypt_info;
 		if (ci->ci_policy.version != FSCRYPT_POLICY_V2)
 			return -EINVAL;
-		mk = ci->ci_master_key->payload.data[0];
-		down_read(&mk->mk_secret_sem);
+		key = ci->ci_master_key;
+		mk = key->payload.data[0];
+		down_read(&key->sem);
 		if (is_master_key_secret_present(&mk->mk_secret))
 			err = fscrypt_derive_dirhash_key(ci, mk);
 		else
 			err = -ENOKEY;
-		up_read(&mk->mk_secret_sem);
+		up_read(&key->sem);
 		return err;
 	}
 	return 0;
diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index d7ec52cb3d9a..0b3ffbb4faf4 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -347,7 +347,6 @@ static int add_new_master_key(struct fscrypt_master_key_secret *secret,
 	mk->mk_spec = *mk_spec;
 
 	move_master_key_secret(&mk->mk_secret, secret);
-	init_rwsem(&mk->mk_secret_sem);
 
 	refcount_set(&mk->mk_refcount, 1); /* secret is present */
 	INIT_LIST_HEAD(&mk->mk_decrypted_inodes);
@@ -427,11 +426,8 @@ static int add_existing_master_key(struct fscrypt_master_key *mk,
 	}
 
 	/* Re-add the secret if needed. */
-	if (rekey) {
-		down_write(&mk->mk_secret_sem);
+	if (rekey)
 		move_master_key_secret(&mk->mk_secret, secret);
-		up_write(&mk->mk_secret_sem);
-	}
 	return 0;
 }
 
@@ -975,10 +971,8 @@ static int do_remove_key(struct file *filp, void __user *_uarg, bool all_users)
 	/* No user claims remaining.  Go ahead and wipe the secret. */
 	dead = false;
 	if (is_master_key_secret_present(&mk->mk_secret)) {
-		down_write(&mk->mk_secret_sem);
 		wipe_master_key_secret(&mk->mk_secret);
 		dead = refcount_dec_and_test(&mk->mk_refcount);
-		up_write(&mk->mk_secret_sem);
 	}
 	up_write(&key->sem);
 	if (dead) {
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 31fb08d94f87..50675b42d5b7 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -337,11 +337,11 @@ static int fscrypt_setup_v2_file_key(struct fscrypt_info *ci,
  * Find the master key, then set up the inode's actual encryption key.
  *
  * If the master key is found in the filesystem-level keyring, then the
- * corresponding 'struct key' is returned in *master_key_ret with
- * ->mk_secret_sem read-locked.  This is needed to ensure that only one task
- * links the fscrypt_info into ->mk_decrypted_inodes (as multiple tasks may race
- * to create an fscrypt_info for the same inode), and to synchronize the master
- * key being removed with a new inode starting to use it.
+ * corresponding 'struct key' is returned in *master_key_ret with its semaphore
+ * read-locked.  This is needed to ensure that only one task links the
+ * fscrypt_info into ->mk_decrypted_inodes (as multiple tasks may race to create
+ * an fscrypt_info for the same inode), and to synchronize the master key being
+ * removed with a new inode starting to use it.
  */
 static int setup_file_encryption_key(struct fscrypt_info *ci,
 				     bool need_dirhash_key,
@@ -390,7 +390,7 @@ static int setup_file_encryption_key(struct fscrypt_info *ci,
 	}
 
 	mk = key->payload.data[0];
-	down_read(&mk->mk_secret_sem);
+	down_read(&key->sem);
 
 	/* Has the secret been removed (via FS_IOC_REMOVE_ENCRYPTION_KEY)? */
 	if (!is_master_key_secret_present(&mk->mk_secret)) {
@@ -433,7 +433,7 @@ static int setup_file_encryption_key(struct fscrypt_info *ci,
 	return 0;
 
 out_release_key:
-	up_read(&mk->mk_secret_sem);
+	up_read(&key->sem);
 	key_put(key);
 	return err;
 }
@@ -536,9 +536,7 @@ fscrypt_setup_encryption_info(struct inode *inode,
 	res = 0;
 out:
 	if (master_key) {
-		struct fscrypt_master_key *mk = master_key->payload.data[0];
-
-		up_read(&mk->mk_secret_sem);
+		up_read(&master_key->sem);
 		key_put(master_key);
 	}
 	put_crypt_info(crypt_info);
@@ -712,7 +710,7 @@ int fscrypt_drop_inode(struct inode *inode)
 		return 0;
 
 	/*
-	 * Note: since we aren't holding ->mk_secret_sem, the result here can
+	 * Note: since we aren't holding the key semaphore, the result here can
 	 * immediately become outdated.  But there's no correctness problem with
 	 * unnecessarily evicting.  Nor is there a correctness problem with not
 	 * evicting while iput() is racing with the key being removed, since

base-commit: 3ceb6543e9cf6ed87cc1fbc6f23ca2db903564cd
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
