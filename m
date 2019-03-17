Return-Path: <SRS0=af1s=RU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 385F8C43381
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Mar 2019 20:07:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 043CB20896
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Mar 2019 20:07:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gHefEzrL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxABX0hx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 043CB20896
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MYJHzZSzzuoyezOCmyPsd1dUumuoXnlEw9hAYOlChPM=; b=gHefEzrLb9faiU
	PufiKKAS3kCWSp8vxL8sxy1GvhMIqwfJ0O9kB+CQTpoJMmBzYIwCpQgUc6EBqD6bWLa1mjCK8JzNm
	Ntmc3XEErCOZZCpRqqTMXDR89nhAEH3Xbtyrfg/WqL7KzaoyuSISAMuiM+TuYkacrjMqChQEKl2H0
	tuW361pRIvKgWyz9peHxoGM4EiFwPfjwQFt4Wh+jL0bTHlb4euJqNP0Kf0muNMjkCeB6D9MdYYNb0
	HIg64TU5XVapyeqNQz/00cb++tdagrPosx5cUmu8228DaYWXRThj6u0euAxr9Htu644ucOFFwdXbs
	NtmdCzjGFp5ENX1h2FFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5c4E-0003v2-OM; Sun, 17 Mar 2019 20:07:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5c3u-0003g7-0T
 for linux-mtd@lists.infradead.org; Sun, 17 Mar 2019 20:07:15 +0000
Received: from sol.localdomain (c-107-3-167-184.hsd1.ca.comcast.net
 [107.3.167.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1E0221738;
 Sun, 17 Mar 2019 20:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1552853233;
 bh=+FTmdh3+r9UicTas+7YzTbhAvs07mKi3p3bozvdkzeY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fxABX0hxyVc9oXwZygcXaHddoMboSVS4KrmdIwHqS1KWkqHTRHktTJeT0Q8C3/pc2
 BVK6CQNxGahFJrXPNiGmFZ1QaZ4H3FaUGzEeFfOI3iqwuk8z+jLkF0p678iLITjIRu
 JJVbMjQjqpN3oeZgzUc6P7Kx2ED1RI3040ZkHDRk=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH 1/5] fscrypt: clean up and improve dentry revalidation
Date: Sun, 17 Mar 2019 13:04:40 -0700
Message-Id: <20190317200444.5967-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190317200444.5967-1-ebiggers@kernel.org>
References: <20190317200444.5967-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190317_130714_137096_424ED8AC 
X-CRM114-Status: GOOD (  21.54  )
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
Cc: Gao Xiang <gaoxiang25@huawei.com>, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 Sarthak Kukreti <sarthakkukreti@chromium.org>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Make various improvements to fscrypt dentry revalidation:

- Don't try to handle the case where the per-directory key is removed,
  as this can't happen without the inode (and dentries) being evicted.

- Flag ciphertext dentries rather than plaintext dentries, since it's
  ciphertext dentries that need the special handling.

- Avoid doing unnecessary work for non-ciphertext dentries.

- When revalidating ciphertext dentries, try to set up the directory's
  i_crypt_info to make sure the key is really still absent, rather than
  invalidating all negative dentries as the previous code did.  An old
  comment suggested we can't do this locking reasons, but AFAICT this
  comment was outdated and it actually works fine.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/crypto.c      | 54 ++++++++++++++++++++---------------------
 fs/crypto/hooks.c       |  4 +--
 include/linux/dcache.h  |  2 +-
 include/linux/fscrypt.h |  6 ++---
 4 files changed, 31 insertions(+), 35 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 4dc788e3bc96..77410b914c62 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -313,45 +313,43 @@ int fscrypt_decrypt_page(const struct inode *inode, struct page *page,
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
+	 * Note: since fscrypt forbids rename() on ciphertext names, it should
+	 * be safe to access ->d_parent directly here.  But use dget_parent() to
+	 * be on the safe side.
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
+	valid = (d_inode(dir)->i_crypt_info == NULL);
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
diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 56debb1fcf5e..a9492f75bbe1 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -101,9 +101,9 @@ int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry)
 	if (err)
 		return err;
 
-	if (fscrypt_has_encryption_key(dir)) {
+	if (!fscrypt_has_encryption_key(dir)) {
 		spin_lock(&dentry->d_lock);
-		dentry->d_flags |= DCACHE_ENCRYPTED_WITH_KEY;
+		dentry->d_flags |= DCACHE_ENCRYPTED_NAME;
 		spin_unlock(&dentry->d_lock);
 	}
 
diff --git a/include/linux/dcache.h b/include/linux/dcache.h
index 60996e64c579..9b3b75d3bd21 100644
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -212,7 +212,7 @@ struct dentry_operations {
 
 #define DCACHE_MAY_FREE			0x00800000
 #define DCACHE_FALLTHRU			0x01000000 /* Fall through to lower layer */
-#define DCACHE_ENCRYPTED_WITH_KEY	0x02000000 /* dir is encrypted with a valid key */
+#define DCACHE_ENCRYPTED_NAME		0x02000000 /* Encrypted name (dir key was unavailable) */
 #define DCACHE_OP_REAL			0x04000000
 
 #define DCACHE_PAR_LOOKUP		0x10000000 /* being looked up (with parent locked shared) */
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index e5194fc3983e..5a0c3fee1ea2 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -545,10 +545,8 @@ static inline int fscrypt_prepare_rename(struct inode *old_dir,
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
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
