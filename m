Return-Path: <SRS0=S0OG=Z7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0371C43603
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 21:28:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F7862071E
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 21:28:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XprZL3Bu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="g25a24Ks"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F7862071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eDZtV58ByN+oErkgdheiiHAbJUlTunAH1RMGKr67TYg=; b=XprZL3Bu+hQ6pu
	b/0QN4VNGSCtuUVZo4FS6uQFaGatDNr0eFvUk6Mosibur1aXzC4KO8v9JeRKhGvfWmkoKjqBSDgxc
	AtUV2h5JG8NwYGXnTxEkfF9i13AdtmsxrujXzjfom6ub0cpvFna+GZHmD3u5cnKPJiWpYoygccB5l
	FywJOWyYhGgifxILRDuz9e6yT8BzxbEvFwKDpJL24lB3aSYg/0GK7pixdueqgKlIWv0vYqf3rzyQP
	tvhB1rxLx9trKldZO1U5kOzKPisyzK8fNyoCDwImH791sG+caVZiTwtk38a+Q+v0o6PJMmXWIpDG1
	ELUaWTzcaDlFwqvpiJ7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieQZd-0000ER-9t; Mon, 09 Dec 2019 21:28:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieQZa-0000DV-8d
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2019 21:28:07 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1812206E0;
 Mon,  9 Dec 2019 21:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575926886;
 bh=Frp8QcVy6is/NCPye8pqNlRu3Z5/47R1LsMLNMzigbI=;
 h=From:To:Cc:Subject:Date:From;
 b=g25a24KspPruH8wRsvMoNSKeU1mQgTjrhMMF4ALB99tPc/zwxD9sferf8zPq10X6/
 sM8Egootu/xEz/lpyU8aqN9vw58zfdoKQHzTtVSg0qAmLbZNNUDRrXpbCckPhi/NhK
 WDuDZMXR5TmogxYAWNdpjfsk0+DN9jrAa6ydBJms=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: use IS_ENCRYPTED() instead of
 ubifs_crypt_is_encrypted()
Date: Mon,  9 Dec 2019 13:27:21 -0800
Message-Id: <20191209212721.244396-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_132806_348254_42B42BF4 
X-CRM114-Status: GOOD (  12.27  )
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
Cc: linux-fscrypt@vger.kernel.org,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

There's no need for the ubifs_crypt_is_encrypted() function anymore.
Just use IS_ENCRYPTED() instead, like ext4 and f2fs do.  IS_ENCRYPTED()
checks the VFS-level flag instead of the UBIFS-specific flag, but it
shouldn't change any behavior since the flags are kept in sync.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ubifs/dir.c     | 8 ++++----
 fs/ubifs/file.c    | 4 ++--
 fs/ubifs/journal.c | 6 +++---
 fs/ubifs/ubifs.h   | 7 -------
 4 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index acc4f942d25b6..636c3222c2308 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -81,7 +81,7 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
 	struct ubifs_inode *ui;
 	bool encrypted = false;
 
-	if (ubifs_crypt_is_encrypted(dir)) {
+	if (IS_ENCRYPTED(dir)) {
 		err = fscrypt_get_encryption_info(dir);
 		if (err) {
 			ubifs_err(c, "fscrypt_get_encryption_info failed: %i", err);
@@ -261,7 +261,7 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 		goto done;
 	}
 
-	if (ubifs_crypt_is_encrypted(dir) &&
+	if (IS_ENCRYPTED(dir) &&
 	    (S_ISDIR(inode->i_mode) || S_ISLNK(inode->i_mode)) &&
 	    !fscrypt_has_permitted_context(dir, inode)) {
 		ubifs_warn(c, "Inconsistent encryption contexts: %lu/%lu",
@@ -499,7 +499,7 @@ static int ubifs_readdir(struct file *file, struct dir_context *ctx)
 	struct ubifs_dent_node *dent;
 	struct inode *dir = file_inode(file);
 	struct ubifs_info *c = dir->i_sb->s_fs_info;
-	bool encrypted = ubifs_crypt_is_encrypted(dir);
+	bool encrypted = IS_ENCRYPTED(dir);
 
 	dbg_gen("dir ino %lu, f_pos %#llx", dir->i_ino, ctx->pos);
 
@@ -1618,7 +1618,7 @@ int ubifs_getattr(const struct path *path, struct kstat *stat,
 
 static int ubifs_dir_open(struct inode *dir, struct file *file)
 {
-	if (ubifs_crypt_is_encrypted(dir))
+	if (IS_ENCRYPTED(dir))
 		return fscrypt_get_encryption_info(dir) ? -EACCES : 0;
 
 	return 0;
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index cd52585c8f4fe..c8e8f50c6054f 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -67,7 +67,7 @@ static int read_block(struct inode *inode, void *addr, unsigned int block,
 
 	dlen = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
 
-	if (ubifs_crypt_is_encrypted(inode)) {
+	if (IS_ENCRYPTED(inode)) {
 		err = ubifs_decrypt(inode, dn, &dlen, block);
 		if (err)
 			goto dump;
@@ -647,7 +647,7 @@ static int populate_page(struct ubifs_info *c, struct page *page,
 			dlen = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
 			out_len = UBIFS_BLOCK_SIZE;
 
-			if (ubifs_crypt_is_encrypted(inode)) {
+			if (IS_ENCRYPTED(inode)) {
 				err = ubifs_decrypt(inode, dn, &dlen, page_block);
 				if (err)
 					goto out_err;
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 388fe8f5dc51d..a38e18d3ef1d7 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -727,7 +727,7 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
 	int dlen = COMPRESSED_DATA_NODE_BUF_SZ, allocated = 1;
 	int write_len;
 	struct ubifs_inode *ui = ubifs_inode(inode);
-	bool encrypted = ubifs_crypt_is_encrypted(inode);
+	bool encrypted = IS_ENCRYPTED(inode);
 	u8 hash[UBIFS_HASH_ARR_SZ];
 
 	dbg_jnlk(key, "ino %lu, blk %u, len %d, key ",
@@ -1449,7 +1449,7 @@ static int truncate_data_node(const struct ubifs_info *c, const struct inode *in
 	dlen = old_dlen = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
 	compr_type = le16_to_cpu(dn->compr_type);
 
-	if (ubifs_crypt_is_encrypted(inode)) {
+	if (IS_ENCRYPTED(inode)) {
 		err = ubifs_decrypt(inode, dn, &dlen, block);
 		if (err)
 			goto out;
@@ -1465,7 +1465,7 @@ static int truncate_data_node(const struct ubifs_info *c, const struct inode *in
 		ubifs_compress(c, buf, *new_len, &dn->data, &out_len, &compr_type);
 	}
 
-	if (ubifs_crypt_is_encrypted(inode)) {
+	if (IS_ENCRYPTED(inode)) {
 		err = ubifs_encrypt(inode, dn, out_len, &old_dlen, block);
 		if (err)
 			goto out;
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index c55f212dcb759..bff682309fbef 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -2095,13 +2095,6 @@ int ubifs_decrypt(const struct inode *inode, struct ubifs_data_node *dn,
 
 extern const struct fscrypt_operations ubifs_crypt_operations;
 
-static inline bool ubifs_crypt_is_encrypted(const struct inode *inode)
-{
-	const struct ubifs_inode *ui = ubifs_inode(inode);
-
-	return ui->flags & UBIFS_CRYPT_FL;
-}
-
 /* Normal UBIFS messages */
 __printf(2, 3)
 void ubifs_msg(const struct ubifs_info *c, const char *fmt, ...);
-- 
2.24.0.393.g34dc348eaf-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
