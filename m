Return-Path: <SRS0=eEdn=AG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 318CBC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jun 2020 16:01:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7CCB2088E
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jun 2020 16:01:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r7uxVgng"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7CCB2088E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BNYum7vbdoki6PZM+DeYTxzXqxtu4Patp6TNl2GaRt8=; b=r7uxVgngruj8i8RObhorIzUGq
	+2k9I1Vmv/owCEvESVzlT6NPfiI0o/TOhnVvAtlpXsoNZtqgeXSBuDV86REouFT37g98YlMRkfR9B
	cpCiT42zhsufcZFLEdilHTXmSMUb1MGWczj9Ig47b5JK1ZpJheG5Lw3Bj7Yj3znlbpnwqCojkcNQJ
	SpPszpjgvFQm9Siad1Ad3zdx40/DCLbEDvNjscA0HwCYFvxTH3YzEy//lrYspfbfqUMQXksKXKUNU
	5B3i99srnw4aAWk1MtaJl2jWG71sSd3Hq1aF9FdEUJSf4HL6AogFOMNZ+kRenGIT+AYkUxGD19uyB
	th+b/YBgw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joUHt-00071Y-K0; Thu, 25 Jun 2020 15:59:41 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joUHl-00070G-M2
 for linux-mtd@lists.infradead.org; Thu, 25 Jun 2020 15:59:34 +0000
Received: from torbenh by Galois.linutronix.de with local (Exim 4.80)
 (envelope-from <torbenh@linutronix.de>)
 id 1joUHh-0003l0-99; Thu, 25 Jun 2020 17:59:29 +0200
From: Torben Hohn <torben.hohn@linutronix.de>
To: richard@nod.at
Subject: [PATCH 1/1] ubifs: support authentication, for ro mount,
 when no key is given
Date: Thu, 25 Jun 2020 17:59:27 +0200
Message-Id: <20200625155927.28430-2-torben.hohn@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625155927.28430-1-torben.hohn@linutronix.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
MIME-Version: 1.0
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
Cc: bigeasy@linutronix.de, linux-mtd@lists.infradead.org, tglx@linutronix.de,
 s.hauer@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ubifs authentication requires a hmac key, even when a
filesystem is mounted read-only.

Split c->authenticated into _rw and _ro.

Also implement ubifs_init_authentication_read_only(),
which only allocates the structures needed for validating
the hashes. That is called, when no auth_key_name is specified,
only auth_hash_name. It sets c->authenticated_ro to true.

Then implement ubifs_authenticated_read() and
ubifs_authenticated_write(). And change all occurences of
ubifs_authenticated() to the respective read or write version.

ubifs_authenticated_write() verifies, that it is not called
when only c->authenticated_ro is active. (The WARN_ON should
probably be BUG_ON(), though)

Signed-off-by: Torben Hohn <torben.hohn@linutronix.de>
---
 fs/ubifs/auth.c    | 69 ++++++++++++++++++++++++++++++++++++++++++----
 fs/ubifs/gc.c      |  2 +-
 fs/ubifs/journal.c | 12 ++++----
 fs/ubifs/lpt.c     |  4 +--
 fs/ubifs/master.c  |  2 +-
 fs/ubifs/replay.c  |  2 +-
 fs/ubifs/sb.c      | 16 +++++++----
 fs/ubifs/super.c   | 21 ++++++++++----
 fs/ubifs/ubifs.h   | 48 +++++++++++++++++++++-----------
 9 files changed, 133 insertions(+), 43 deletions(-)

diff --git a/fs/ubifs/auth.c b/fs/ubifs/auth.c
index cc5c0abfd536..5429a05f537e 100644
--- a/fs/ubifs/auth.c
+++ b/fs/ubifs/auth.c
@@ -94,7 +94,7 @@ static struct shash_desc *ubifs_get_desc(const struct ubifs_info *c,
 	struct shash_desc *desc;
 	int err;
 
-	if (!ubifs_authenticated(c))
+	if (!ubifs_authenticated_read(c))
 		return NULL;
 
 	desc = kmalloc(sizeof(*desc) + crypto_shash_descsize(tfm), GFP_KERNEL);
@@ -248,6 +248,61 @@ int ubifs_sb_verify_signature(struct ubifs_info *c,
 	return err;
 }
 
+/**
+ * ubifs_init_authentication_read_only - init only the read_only parts
+ *
+ * @c: UBIFS file-system description object
+ *
+ * This function returns 0 for success or a negative error code otherwise.
+ */
+
+int ubifs_init_authentication_read_only(struct ubifs_info *c)
+{
+	int err;
+
+	if (!c->auth_hash_name) {
+		ubifs_err(c, "authentication hash name needed with authentication");
+		return -EINVAL;
+	}
+
+	c->auth_hash_algo = match_string(hash_algo_name, HASH_ALGO__LAST,
+					 c->auth_hash_name);
+	if ((int)c->auth_hash_algo < 0) {
+		ubifs_err(c, "Unknown hash algo %s specified",
+			  c->auth_hash_name);
+		return -EINVAL;
+	}
+
+	c->hash_tfm = crypto_alloc_shash(c->auth_hash_name, 0, 0);
+	if (IS_ERR(c->hash_tfm)) {
+		err = PTR_ERR(c->hash_tfm);
+		ubifs_err(c, "Can not allocate %s: %d",
+			  c->auth_hash_name, err);
+		goto out;
+	}
+
+	c->hash_len = crypto_shash_digestsize(c->hash_tfm);
+	if (c->hash_len > UBIFS_HASH_ARR_SZ) {
+		ubifs_err(c, "hash %s is bigger than maximum allowed hash size (%d > %d)",
+			  c->auth_hash_name, c->hash_len, UBIFS_HASH_ARR_SZ);
+		err = -EINVAL;
+		goto out_free_hash;
+	}
+
+	c->authenticated_ro = true;
+
+	c->log_hash = ubifs_hash_get_desc(c);
+	if (IS_ERR(c->log_hash))
+		goto out_free_hash;
+
+	err = 0;
+out_free_hash:
+	if (err)
+		crypto_free_shash(c->hash_tfm);
+out:
+	return err;
+}
+
 /**
  * ubifs_init_authentication - initialize UBIFS authentication support
  * @c: UBIFS file-system description object
@@ -335,7 +390,7 @@ int ubifs_init_authentication(struct ubifs_info *c)
 	if (err)
 		goto out_free_hmac;
 
-	c->authenticated = true;
+	c->authenticated_rw = true;
 
 	c->log_hash = ubifs_hash_get_desc(c);
 	if (IS_ERR(c->log_hash))
@@ -364,11 +419,15 @@ int ubifs_init_authentication(struct ubifs_info *c)
  */
 void __ubifs_exit_authentication(struct ubifs_info *c)
 {
-	if (!ubifs_authenticated(c))
+	if (!ubifs_authenticated_read(c))
 		return;
 
-	crypto_free_shash(c->hmac_tfm);
 	crypto_free_shash(c->hash_tfm);
+
+	if (!c->authenticated_rw)
+		return;
+
+	crypto_free_shash(c->hmac_tfm);
 	kfree(c->log_hash);
 }
 
@@ -511,7 +570,7 @@ int ubifs_hmac_wkm(struct ubifs_info *c, u8 *hmac)
 	int err;
 	const char well_known_message[] = "UBIFS";
 
-	if (!ubifs_authenticated(c))
+	if (!ubifs_authenticated_write(c))
 		return 0;
 
 	shash->tfm = c->hmac_tfm;
diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 62cb3db44e6e..8616e8ba97d6 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -410,7 +410,7 @@ static int move_nodes(struct ubifs_info *c, struct ubifs_scan_leb *sleb)
 			moved = 1;
 		}
 
-		if (ubifs_authenticated(c) && moved) {
+		if (ubifs_authenticated_write(c) && moved) {
 			struct ubifs_auth_node *auth;
 
 			auth = kmalloc(ubifs_auth_node_sz(c), GFP_NOFS);
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index e5ec1afe1c66..da13e5eb93e1 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -80,7 +80,7 @@ static inline void zero_trun_node_unused(struct ubifs_trun_node *trun)
 
 static void ubifs_add_auth_dirt(struct ubifs_info *c, int lnum)
 {
-	if (ubifs_authenticated(c))
+	if (ubifs_authenticated_write(c))
 		ubifs_add_dirt(c, lnum, ubifs_auth_node_sz(c));
 }
 
@@ -278,7 +278,7 @@ static int write_head(struct ubifs_info *c, int jhead, void *buf, int len,
 	dbg_jnl("jhead %s, LEB %d:%d, len %d",
 		dbg_jhead(jhead), *lnum, *offs, len);
 
-	if (ubifs_authenticated(c)) {
+	if (ubifs_authenticated_write(c)) {
 		err = ubifs_hash_nodes(c, buf, len, c->jheads[jhead].log_hash);
 		if (err)
 			return err;
@@ -572,7 +572,7 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 
 	len = aligned_dlen + aligned_ilen + UBIFS_INO_NODE_SZ;
 	/* Make sure to also account for extended attributes */
-	if (ubifs_authenticated(c))
+	if (ubifs_authenticated_write(c))
 		len += ALIGN(host_ui->data_len, 8) + ubifs_auth_node_sz(c);
 	else
 		len += host_ui->data_len;
@@ -778,7 +778,7 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
 	}
 
 	dlen = UBIFS_DATA_NODE_SZ + out_len;
-	if (ubifs_authenticated(c))
+	if (ubifs_authenticated_write(c))
 		write_len = ALIGN(dlen, 8) + auth_len;
 	else
 		write_len = dlen;
@@ -860,7 +860,7 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 		write_len += UBIFS_INO_NODE_SZ * ui->xattr_cnt;
 	}
 
-	if (ubifs_authenticated(c))
+	if (ubifs_authenticated_write(c))
 		write_len += ALIGN(ilen, 8) + ubifs_auth_node_sz(c);
 	else
 		write_len += ilen;
@@ -1572,7 +1572,7 @@ int ubifs_jnl_truncate(struct ubifs_info *c, const struct inode *inode,
 	/* Must make reservation before allocating sequence numbers */
 	len = UBIFS_TRUN_NODE_SZ + UBIFS_INO_NODE_SZ;
 
-	if (ubifs_authenticated(c))
+	if (ubifs_authenticated_write(c))
 		len += ALIGN(dlen, 8) + ubifs_auth_node_sz(c);
 	else
 		len += dlen;
diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index e21abf250951..f3a7136518d1 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -1660,7 +1660,7 @@ int ubifs_lpt_calc_hash(struct ubifs_info *c, u8 *hash)
 	void *buf;
 	int err;
 
-	if (!ubifs_authenticated(c))
+	if (!ubifs_authenticated_read(c))
 		return 0;
 
 	if (!c->nroot) {
@@ -1750,7 +1750,7 @@ static int lpt_check_hash(struct ubifs_info *c)
 	int err;
 	u8 hash[UBIFS_HASH_ARR_SZ];
 
-	if (!ubifs_authenticated(c))
+	if (!ubifs_authenticated_read(c))
 		return 0;
 
 	err = ubifs_lpt_calc_hash(c, hash);
diff --git a/fs/ubifs/master.c b/fs/ubifs/master.c
index 911d0555b9f2..57304e3f7016 100644
--- a/fs/ubifs/master.c
+++ b/fs/ubifs/master.c
@@ -129,7 +129,7 @@ static int scan_for_master(struct ubifs_info *c)
 	c->mst_offs = offs;
 	ubifs_scan_destroy(sleb);
 
-	if (!ubifs_authenticated(c))
+	if (!ubifs_authenticated_read(c))
 		return 0;
 
 	if (ubifs_hmac_zero(c, c->mst_node->hmac)) {
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index b69ffac7e415..6c1b8739359c 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -595,7 +595,7 @@ static int authenticate_sleb(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 	u8 hash[UBIFS_HASH_ARR_SZ];
 	u8 hmac[UBIFS_HMAC_ARR_SZ];
 
-	if (!ubifs_authenticated(c))
+	if (!ubifs_authenticated_write(c))
 		return sleb->nodes_cnt;
 
 	list_for_each_entry(snod, &sleb->nodes, list) {
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 4b4b65b48c57..52396a92f8af 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -176,7 +176,7 @@ static int create_default_filesystem(struct ubifs_info *c)
 		sup_flags |= UBIFS_FLG_BIGLPT;
 	sup_flags |= UBIFS_FLG_DOUBLE_HASH;
 
-	if (ubifs_authenticated(c)) {
+	if (ubifs_authenticated_write(c)) {
 		sup_flags |= UBIFS_FLG_AUTHENTICATION;
 		sup->hash_algo = cpu_to_le16(c->auth_hash_algo);
 		err = ubifs_hmac_wkm(c, sup->hmac_wkm);
@@ -542,20 +542,20 @@ static int authenticate_sb_node(struct ubifs_info *c,
 	int hash_algo;
 	int err;
 
-	if (c->authenticated && !authenticated) {
+	if (ubifs_authenticated_read(c) && !authenticated) {
 		ubifs_err(c, "authenticated FS forced, but found FS without authentication");
 		return -EINVAL;
 	}
 
-	if (!c->authenticated && authenticated) {
-		ubifs_err(c, "authenticated FS found, but no key given");
+	if (!ubifs_authenticated_read(c) && authenticated) {
+		ubifs_err(c, "authenticated FS found, but no key nor hash name given");
 		return -EINVAL;
 	}
 
 	ubifs_msg(c, "Mounting in %sauthenticated mode",
-		  c->authenticated ? "" : "un");
+		  c->authenticated_rw ? "RW " : (c->authenticated_ro ? "RO " :"un"));
 
-	if (!c->authenticated)
+	if (!ubifs_authenticated_read(c))
 		return 0;
 
 	if (!IS_ENABLED(CONFIG_UBIFS_FS_AUTHENTICATION))
@@ -583,6 +583,10 @@ static int authenticate_sb_node(struct ubifs_info *c,
 	if (ubifs_hmac_zero(c, sup->hmac)) {
 		err = ubifs_sb_verify_signature(c, sup);
 	} else {
+		if (!ubifs_authenticated_write(c)) {
+			ubifs_err(c, "HMAC authenticated FS found, but no key given");
+			return -EINVAL;
+		}
 		err = ubifs_hmac_wkm(c, hmac_wkm);
 		if (err)
 			return err;
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 7fc2f3f07c16..ec95f1f50e5e 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1291,6 +1291,17 @@ static int mount_ubifs(struct ubifs_info *c)
 			err = -EINVAL;
 			goto out_free;
 		}
+	} else if (c->auth_hash_name) {
+		if (IS_ENABLED(CONFIG_UBIFS_FS_AUTHENTICATION)) {
+			err = ubifs_init_authentication_read_only(c);
+			if (err)
+				goto out_free;
+		} else {
+			ubifs_err(c, "auth_hash_name, but UBIFS is built without"
+				  " authentication support");
+			err = -EINVAL;
+			goto out_free;
+		}
 	}
 
 	err = ubifs_read_superblock(c);
@@ -1383,7 +1394,7 @@ static int mount_ubifs(struct ubifs_info *c)
 	 * in the superblock, we can update the offline signed
 	 * superblock with a HMAC version,
 	 */
-	if (ubifs_authenticated(c) && ubifs_hmac_zero(c, c->sup_node->hmac)) {
+	if (c->authenticated_rw && ubifs_hmac_zero(c, c->sup_node->hmac)) {
 		err = ubifs_hmac_wkm(c, c->sup_node->hmac_wkm);
 		if (err)
 			goto out_lpt;
@@ -1430,7 +1441,7 @@ static int mount_ubifs(struct ubifs_info *c)
 		}
 
 		if (c->need_recovery) {
-			if (!ubifs_authenticated(c)) {
+			if (!ubifs_authenticated_write(c)) {
 				err = ubifs_recover_size(c, true);
 				if (err)
 					goto out_orphans;
@@ -1440,7 +1451,7 @@ static int mount_ubifs(struct ubifs_info *c)
 			if (err)
 				goto out_orphans;
 
-			if (ubifs_authenticated(c)) {
+			if (ubifs_authenticated_write(c)) {
 				err = ubifs_recover_size(c, false);
 				if (err)
 					goto out_orphans;
@@ -1686,7 +1697,7 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 		err = ubifs_write_rcvrd_mst_node(c);
 		if (err)
 			goto out;
-		if (!ubifs_authenticated(c)) {
+		if (!ubifs_authenticated_write(c)) {
 			err = ubifs_recover_size(c, true);
 			if (err)
 				goto out;
@@ -1771,7 +1782,7 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 		if (err)
 			goto out;
 
-		if (ubifs_authenticated(c)) {
+		if (ubifs_authenticated_write(c)) {
 			err = ubifs_recover_size(c, false);
 			if (err)
 				goto out;
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index bff682309fbe..0789c859a148 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1040,7 +1040,8 @@ struct ubifs_debug_info;
  * @default_compr: default compression algorithm (%UBIFS_COMPR_LZO, etc)
  * @rw_incompat: the media is not R/W compatible
  * @assert_action: action to take when a ubifs_assert() fails
- * @authenticated: flag indigating the FS is mounted in authenticated mode
+ * @authenticated_rw: flag indigating the FS is mounted in authenticated mode
+ * @authenticated_ro: flag indigating the FS is mounted in read-only authenticated mode (without HMAC)
  *
  * @tnc_mutex: protects the Tree Node Cache (TNC), @zroot, @cnext, @enext, and
  *             @calc_idx_sz
@@ -1293,7 +1294,8 @@ struct ubifs_info {
 	unsigned int default_compr:2;
 	unsigned int rw_incompat:1;
 	unsigned int assert_action:2;
-	unsigned int authenticated:1;
+	unsigned int authenticated_rw:1;
+	unsigned int authenticated_ro:1;
 	unsigned int superblock_need_write:1;
 
 	struct mutex tnc_mutex;
@@ -1506,21 +1508,34 @@ extern const struct inode_operations ubifs_symlink_inode_operations;
 extern struct ubifs_compressor *ubifs_compressors[UBIFS_COMPR_TYPES_CNT];
 
 /* auth.c */
-static inline int ubifs_authenticated(const struct ubifs_info *c)
+static inline int ubifs_authenticated_read(const struct ubifs_info *c)
 {
-	return (IS_ENABLED(CONFIG_UBIFS_FS_AUTHENTICATION)) && c->authenticated;
+	return (IS_ENABLED(CONFIG_UBIFS_FS_AUTHENTICATION)) && (c->authenticated_rw || c->authenticated_ro);
+}
+
+static inline int ubifs_authenticated_write(const struct ubifs_info *c)
+{
+	/*
+	 * Lets make sure, that ubifs does not try to write
+	 * when authenticate_ro is active.
+	 *
+	 * Because this will certeinly be an error.
+	 */
+	WARN_ON(c->authenticated_ro && !c->authenticated_rw);
+
+	return (IS_ENABLED(CONFIG_UBIFS_FS_AUTHENTICATION)) && c->authenticated_rw;
 }
 
 struct shash_desc *__ubifs_hash_get_desc(const struct ubifs_info *c);
 static inline struct shash_desc *ubifs_hash_get_desc(const struct ubifs_info *c)
 {
-	return ubifs_authenticated(c) ? __ubifs_hash_get_desc(c) : NULL;
+	return ubifs_authenticated_read(c) ? __ubifs_hash_get_desc(c) : NULL;
 }
 
 static inline int ubifs_shash_init(const struct ubifs_info *c,
 				   struct shash_desc *desc)
 {
-	if (ubifs_authenticated(c))
+	if (ubifs_authenticated_read(c))
 		return crypto_shash_init(desc);
 	else
 		return 0;
@@ -1532,7 +1547,7 @@ static inline int ubifs_shash_update(const struct ubifs_info *c,
 {
 	int err = 0;
 
-	if (ubifs_authenticated(c)) {
+	if (ubifs_authenticated_read(c)) {
 		err = crypto_shash_update(desc, buf, len);
 		if (err < 0)
 			return err;
@@ -1544,7 +1559,7 @@ static inline int ubifs_shash_update(const struct ubifs_info *c,
 static inline int ubifs_shash_final(const struct ubifs_info *c,
 				    struct shash_desc *desc, u8 *out)
 {
-	return ubifs_authenticated(c) ? crypto_shash_final(desc, out) : 0;
+	return ubifs_authenticated_read(c) ? crypto_shash_final(desc, out) : 0;
 }
 
 int __ubifs_node_calc_hash(const struct ubifs_info *c, const void *buf,
@@ -1552,7 +1567,7 @@ int __ubifs_node_calc_hash(const struct ubifs_info *c, const void *buf,
 static inline int ubifs_node_calc_hash(const struct ubifs_info *c,
 					const void *buf, u8 *hash)
 {
-	if (ubifs_authenticated(c))
+	if (ubifs_authenticated_read(c))
 		return __ubifs_node_calc_hash(c, buf, hash);
 	else
 		return 0;
@@ -1599,17 +1614,18 @@ int __ubifs_node_check_hash(const struct ubifs_info *c, const void *buf,
 static inline int ubifs_node_check_hash(const struct ubifs_info *c,
 					const void *buf, const u8 *expected)
 {
-	if (ubifs_authenticated(c))
+	if (ubifs_authenticated_read(c))
 		return __ubifs_node_check_hash(c, buf, expected);
 	else
 		return 0;
 }
 
+int ubifs_init_authentication_read_only(struct ubifs_info *c);
 int ubifs_init_authentication(struct ubifs_info *c);
 void __ubifs_exit_authentication(struct ubifs_info *c);
 static inline void ubifs_exit_authentication(struct ubifs_info *c)
 {
-	if (ubifs_authenticated(c))
+	if (ubifs_authenticated_read(c))
 		__ubifs_exit_authentication(c);
 }
 
@@ -1638,7 +1654,7 @@ static inline u8 *ubifs_branch_hash(struct ubifs_info *c,
 static inline void ubifs_copy_hash(const struct ubifs_info *c, const u8 *from,
 				   u8 *to)
 {
-	if (ubifs_authenticated(c))
+	if (ubifs_authenticated_read(c))
 		memcpy(to, from, c->hash_len);
 }
 
@@ -1647,7 +1663,7 @@ int __ubifs_node_insert_hmac(const struct ubifs_info *c, void *buf,
 static inline int ubifs_node_insert_hmac(const struct ubifs_info *c, void *buf,
 					  int len, int ofs_hmac)
 {
-	if (ubifs_authenticated(c))
+	if (ubifs_authenticated_write(c))
 		return __ubifs_node_insert_hmac(c, buf, len, ofs_hmac);
 	else
 		return 0;
@@ -1658,7 +1674,7 @@ int __ubifs_node_verify_hmac(const struct ubifs_info *c, const void *buf,
 static inline int ubifs_node_verify_hmac(const struct ubifs_info *c,
 					 const void *buf, int len, int ofs_hmac)
 {
-	if (ubifs_authenticated(c))
+	if (ubifs_authenticated_write(c))
 		return __ubifs_node_verify_hmac(c, buf, len, ofs_hmac);
 	else
 		return 0;
@@ -1674,7 +1690,7 @@ static inline int ubifs_node_verify_hmac(const struct ubifs_info *c,
  */
 static inline int ubifs_auth_node_sz(const struct ubifs_info *c)
 {
-	if (ubifs_authenticated(c))
+	if (ubifs_authenticated_write(c))
 		return sizeof(struct ubifs_auth_node) + c->hmac_desc_len;
 	else
 		return 0;
@@ -1691,7 +1707,7 @@ static inline int ubifs_shash_copy_state(const struct ubifs_info *c,
 					   struct shash_desc *src,
 					   struct shash_desc *target)
 {
-	if (ubifs_authenticated(c))
+	if (ubifs_authenticated_write(c))
 		return __ubifs_shash_copy_state(c, src, target);
 	else
 		return 0;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
