Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8279D5E392
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ab0Oo2YGMul9ipkfuFnlw4XvoQ7v7Kc7EHUOSzkUTjg=; b=lZMl2FvAPaMxbN
	Yh2WCrSLGmopINVDIKn2WykRXhct7xdMJb0fMDDe6Got2ZYpzCZNu7KAthWUpU+DsWjmLW9SApuB+
	ufSkB2APPG2El/myKV2xyYrSxdeaqLTMXAfQe1JQZDyxpDtp7C4cJtYdgTComMV9lThWKJF3WPea7
	DBn+GN2WAQUw6p8VfonKDggpFuI3GpDHf5hVxMl2CctXy2d05LSeIoZHrWTWiKzueMImW7vKeEOiJ
	TgLqwp3kLXPmqCGUiekSrB6/4mnpWnrxQaPVFDGDoTjmdjA008VC55bjxqZDkAtjGzje3RCz0/cO1
	Rqo32TjVXh+aiyj+UPtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPUG-0000000Gkqi-4AGo;
	Mon, 11 Nov 2024 08:09:29 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPSb-0000000GjYc-2n8j
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 08:08:00 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Xn2DM3TlSz1hwTs;
	Mon, 11 Nov 2024 16:05:55 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 5AD331401F4;
	Mon, 11 Nov 2024 16:07:43 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 16:07:41 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 033/102] ubifs-utils: Adapt auth.c in libubifs
Date: Mon, 11 Nov 2024 16:05:58 +0800
Message-ID: <20241111080621.1394382-19-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_000746_503023_DB563979 
X-CRM114-Status: GOOD (  25.80  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Adapt auth.c in libubifs, compared with linux kernel implementations:
 1. Only keep implementations used by mkfs, other implementations
    are removed.
 2. Adapt functions based on implementations in common/sign.c.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/libubifs/auth.c | 534 +++++++-------------------------------------
 1 file changed, 82 insertions(+), 452 deletions(-)

diff --git a/ubifs-utils/libubifs/auth.c b/ubifs-utils/libubifs/auth.c
index 0d561ecb..fab1dba4 100644
--- a/ubifs-utils/libubifs/auth.c
+++ b/ubifs-utils/libubifs/auth.c
@@ -9,13 +9,51 @@
  * This file implements various helper functions for UBIFS authentication support
  */
 
-#include <linux/verification.h>
-#include <crypto/hash.h>
-#include <crypto/utils.h>
-#include <keys/user-type.h>
-#include <keys/asymmetric-type.h>
-
+#include "linux_err.h"
 #include "ubifs.h"
+#include "sign.h"
+#include "defs.h"
+
+int ubifs_shash_init(const struct ubifs_info *c,
+		     __unused struct shash_desc *desc)
+{
+	if (ubifs_authenticated(c))
+		return hash_digest_init();
+	else
+		return 0;
+}
+
+int ubifs_shash_update(const struct ubifs_info *c,
+		       __unused struct shash_desc *desc,
+		       const void *buf, unsigned int len)
+{
+	int err = 0;
+
+	if (ubifs_authenticated(c)) {
+		err = hash_digest_update(buf, len);
+		if (err < 0)
+			return err;
+	}
+
+	return 0;
+}
+
+int ubifs_shash_final(const struct ubifs_info *c,
+		      __unused struct shash_desc *desc, u8 *out)
+{
+	return ubifs_authenticated(c) ? hash_digest_final(out) : 0;
+}
+
+struct shash_desc *ubifs_hash_get_desc(const struct ubifs_info *c)
+{
+	int err;
+
+	err = ubifs_shash_init(c, NULL);
+	if (err)
+		return ERR_PTR(err);
+
+	return NULL;
+}
 
 /**
  * ubifs_node_calc_hash - calculate the hash of a UBIFS node
@@ -25,101 +63,47 @@
  *
  * Returns 0 for success or a negative error code otherwise.
  */
-int __ubifs_node_calc_hash(const struct ubifs_info *c, const void *node,
-			    u8 *hash)
+int __ubifs_node_calc_hash(__unused const struct ubifs_info *c,
+			   const void *node, u8 *hash)
 {
 	const struct ubifs_ch *ch = node;
 
-	return crypto_shash_tfm_digest(c->hash_tfm, node, le32_to_cpu(ch->len),
-				       hash);
+	return hash_digest(node, le32_to_cpu(ch->len), hash);
 }
 
 /**
- * ubifs_hash_calc_hmac - calculate a HMAC from a hash
- * @c: UBIFS file-system description object
- * @hash: the node to calculate a HMAC for
- * @hmac: the returned HMAC
- *
- * Returns 0 for success or a negative error code otherwise.
- */
-static int ubifs_hash_calc_hmac(const struct ubifs_info *c, const u8 *hash,
-				 u8 *hmac)
-{
-	return crypto_shash_tfm_digest(c->hmac_tfm, hash, c->hash_len, hmac);
-}
-
-/**
- * ubifs_prepare_auth_node - Prepare an authentication node
- * @c: UBIFS file-system description object
+ * ubifs_master_node_calc_hash - calculate the hash of a UBIFS master node
  * @node: the node to calculate a hash for
- * @inhash: input hash of previous nodes
- *
- * This function prepares an authentication node for writing onto flash.
- * It creates a HMAC from the given input hash and writes it to the node.
- *
- * Returns 0 for success or a negative error code otherwise.
+ * @hash: the returned hash
  */
-int ubifs_prepare_auth_node(struct ubifs_info *c, void *node,
-			     struct shash_desc *inhash)
+int ubifs_master_node_calc_hash(const struct ubifs_info *c, const void *node,
+				uint8_t *hash)
 {
-	struct ubifs_auth_node *auth = node;
-	u8 hash[UBIFS_HASH_ARR_SZ];
-	int err;
-
-	{
-		SHASH_DESC_ON_STACK(hash_desc, c->hash_tfm);
-
-		hash_desc->tfm = c->hash_tfm;
-		ubifs_shash_copy_state(c, inhash, hash_desc);
-
-		err = crypto_shash_final(hash_desc, hash);
-		if (err)
-			return err;
-	}
-
-	err = ubifs_hash_calc_hmac(c, hash, auth->hmac);
-	if (err)
-		return err;
+	if (!ubifs_authenticated(c))
+		return 0;
 
-	auth->ch.node_type = UBIFS_AUTH_NODE;
-	ubifs_prepare_node(c, auth, ubifs_auth_node_sz(c), 0);
-	return 0;
+	return hash_digest(node + sizeof(struct ubifs_ch),
+			   UBIFS_MST_NODE_SZ - sizeof(struct ubifs_ch), hash);
 }
 
-static struct shash_desc *ubifs_get_desc(const struct ubifs_info *c,
-					 struct crypto_shash *tfm)
+int ubifs_sign_superblock_node(struct ubifs_info *c, void *node)
 {
-	struct shash_desc *desc;
-	int err;
+	int err, len;
+	struct ubifs_sig_node *sig = node + UBIFS_SB_NODE_SZ;
 
 	if (!ubifs_authenticated(c))
-		return NULL;
-
-	desc = kmalloc(sizeof(*desc) + crypto_shash_descsize(tfm), GFP_KERNEL);
-	if (!desc)
-		return ERR_PTR(-ENOMEM);
-
-	desc->tfm = tfm;
+		return 0;
 
-	err = crypto_shash_init(desc);
-	if (err) {
-		kfree(desc);
-		return ERR_PTR(err);
-	}
+	err = hash_sign_node(c->auth_key_filename, c->auth_cert_filename, node,
+			     &len, sig + 1);
+	if (err)
+		return err;
 
-	return desc;
-}
+	sig->type = UBIFS_SIGNATURE_TYPE_PKCS7;
+	sig->len = cpu_to_le32(len);
+	sig->ch.node_type  = UBIFS_SIG_NODE;
 
-/**
- * __ubifs_hash_get_desc - get a descriptor suitable for hashing a node
- * @c: UBIFS file-system description object
- *
- * This function returns a descriptor suitable for hashing a node. Free after use
- * with kfree.
- */
-struct shash_desc *__ubifs_hash_get_desc(const struct ubifs_info *c)
-{
-	return ubifs_get_desc(c, c->hash_tfm);
+	return 0;
 }
 
 /**
@@ -150,103 +134,6 @@ void ubifs_bad_hash(const struct ubifs_info *c, const void *node, const u8 *hash
 }
 
 /**
- * __ubifs_node_check_hash - check the hash of a node against given hash
- * @c: UBIFS file-system description object
- * @node: the node
- * @expected: the expected hash
- *
- * This function calculates a hash over a node and compares it to the given hash.
- * Returns 0 if both hashes are equal or authentication is disabled, otherwise a
- * negative error code is returned.
- */
-int __ubifs_node_check_hash(const struct ubifs_info *c, const void *node,
-			    const u8 *expected)
-{
-	u8 calc[UBIFS_HASH_ARR_SZ];
-	int err;
-
-	err = __ubifs_node_calc_hash(c, node, calc);
-	if (err)
-		return err;
-
-	if (ubifs_check_hash(c, expected, calc))
-		return -EPERM;
-
-	return 0;
-}
-
-/**
- * ubifs_sb_verify_signature - verify the signature of a superblock
- * @c: UBIFS file-system description object
- * @sup: The superblock node
- *
- * To support offline signed images the superblock can be signed with a
- * PKCS#7 signature. The signature is placed directly behind the superblock
- * node in an ubifs_sig_node.
- *
- * Returns 0 when the signature can be successfully verified or a negative
- * error code if not.
- */
-int ubifs_sb_verify_signature(struct ubifs_info *c,
-			      const struct ubifs_sb_node *sup)
-{
-	int err;
-	struct ubifs_scan_leb *sleb;
-	struct ubifs_scan_node *snod;
-	const struct ubifs_sig_node *signode;
-
-	sleb = ubifs_scan(c, UBIFS_SB_LNUM, UBIFS_SB_NODE_SZ, c->sbuf, 0);
-	if (IS_ERR(sleb)) {
-		err = PTR_ERR(sleb);
-		return err;
-	}
-
-	if (sleb->nodes_cnt == 0) {
-		ubifs_err(c, "Unable to find signature node");
-		err = -EINVAL;
-		goto out_destroy;
-	}
-
-	snod = list_first_entry(&sleb->nodes, struct ubifs_scan_node, list);
-
-	if (snod->type != UBIFS_SIG_NODE) {
-		ubifs_err(c, "Signature node is of wrong type");
-		err = -EINVAL;
-		goto out_destroy;
-	}
-
-	signode = snod->node;
-
-	if (le32_to_cpu(signode->len) > snod->len + sizeof(struct ubifs_sig_node)) {
-		ubifs_err(c, "invalid signature len %d", le32_to_cpu(signode->len));
-		err = -EINVAL;
-		goto out_destroy;
-	}
-
-	if (le32_to_cpu(signode->type) != UBIFS_SIGNATURE_TYPE_PKCS7) {
-		ubifs_err(c, "Signature type %d is not supported\n",
-			  le32_to_cpu(signode->type));
-		err = -EINVAL;
-		goto out_destroy;
-	}
-
-	err = verify_pkcs7_signature(sup, sizeof(struct ubifs_sb_node),
-				     signode->sig, le32_to_cpu(signode->len),
-				     NULL, VERIFYING_UNSPECIFIED_SIGNATURE,
-				     NULL, NULL);
-
-	if (err)
-		ubifs_err(c, "Failed to verify signature");
-	else
-		ubifs_msg(c, "Successfully verified super block signature");
-
-out_destroy:
-	ubifs_scan_destroy(sleb);
-
-	return err;
-}
-
-/**
  * ubifs_init_authentication - initialize UBIFS authentication support
  * @c: UBIFS file-system description object
  *
@@ -254,292 +141,35 @@ out_destroy:
  */
 int ubifs_init_authentication(struct ubifs_info *c)
 {
-	struct key *keyring_key;
-	const struct user_key_payload *ukp;
-	int err;
-	char hmac_name[CRYPTO_MAX_ALG_NAME];
+	int err, hash_len, hash_algo;
 
-	if (!c->auth_hash_name) {
-		ubifs_err(c, "authentication hash name needed with authentication");
-		return -EINVAL;
-	}
+	if (!c->auth_key_filename && !c->auth_cert_filename && !c->hash_algo_name)
+		return 0;
 
-	c->auth_hash_algo = match_string(hash_algo_name, HASH_ALGO__LAST,
-					 c->auth_hash_name);
-	if ((int)c->auth_hash_algo < 0) {
-		ubifs_err(c, "Unknown hash algo %s specified",
-			  c->auth_hash_name);
+	if (!c->auth_key_filename) {
+		ubifs_err(c, "authentication key not given (--auth-key)");
 		return -EINVAL;
 	}
 
-	snprintf(hmac_name, CRYPTO_MAX_ALG_NAME, "hmac(%s)",
-		 c->auth_hash_name);
-
-	keyring_key = request_key(&key_type_logon, c->auth_key_name, NULL);
-
-	if (IS_ERR(keyring_key)) {
-		ubifs_err(c, "Failed to request key: %ld",
-			  PTR_ERR(keyring_key));
-		return PTR_ERR(keyring_key);
-	}
-
-	down_read(&keyring_key->sem);
-
-	if (keyring_key->type != &key_type_logon) {
-		ubifs_err(c, "key type must be logon");
-		err = -ENOKEY;
-		goto out;
-	}
-
-	ukp = user_key_payload_locked(keyring_key);
-	if (!ukp) {
-		/* key was revoked before we acquired its semaphore */
-		err = -EKEYREVOKED;
-		goto out;
-	}
-
-	c->hash_tfm = crypto_alloc_shash(c->auth_hash_name, 0, 0);
-	if (IS_ERR(c->hash_tfm)) {
-		err = PTR_ERR(c->hash_tfm);
-		ubifs_err(c, "Can not allocate %s: %d",
-			  c->auth_hash_name, err);
-		goto out;
-	}
-
-	c->hash_len = crypto_shash_digestsize(c->hash_tfm);
-	if (c->hash_len > UBIFS_HASH_ARR_SZ) {
-		ubifs_err(c, "hash %s is bigger than maximum allowed hash size (%d > %d)",
-			  c->auth_hash_name, c->hash_len, UBIFS_HASH_ARR_SZ);
-		err = -EINVAL;
-		goto out_free_hash;
-	}
-
-	c->hmac_tfm = crypto_alloc_shash(hmac_name, 0, 0);
-	if (IS_ERR(c->hmac_tfm)) {
-		err = PTR_ERR(c->hmac_tfm);
-		ubifs_err(c, "Can not allocate %s: %d", hmac_name, err);
-		goto out_free_hash;
-	}
-
-	c->hmac_desc_len = crypto_shash_digestsize(c->hmac_tfm);
-	if (c->hmac_desc_len > UBIFS_HMAC_ARR_SZ) {
-		ubifs_err(c, "hmac %s is bigger than maximum allowed hmac size (%d > %d)",
-			  hmac_name, c->hmac_desc_len, UBIFS_HMAC_ARR_SZ);
-		err = -EINVAL;
-		goto out_free_hmac;
-	}
-
-	err = crypto_shash_setkey(c->hmac_tfm, ukp->data, ukp->datalen);
-	if (err)
-		goto out_free_hmac;
-
-	c->authenticated = true;
-
-	c->log_hash = ubifs_hash_get_desc(c);
-	if (IS_ERR(c->log_hash)) {
-		err = PTR_ERR(c->log_hash);
-		goto out_free_hmac;
-	}
-
-	err = 0;
-
-out_free_hmac:
-	if (err)
-		crypto_free_shash(c->hmac_tfm);
-out_free_hash:
-	if (err)
-		crypto_free_shash(c->hash_tfm);
-out:
-	up_read(&keyring_key->sem);
-	key_put(keyring_key);
-
-	return err;
-}
-
-/**
- * __ubifs_exit_authentication - release resource
- * @c: UBIFS file-system description object
- *
- * This function releases the authentication related resources.
- */
-void __ubifs_exit_authentication(struct ubifs_info *c)
-{
-	if (!ubifs_authenticated(c))
-		return;
-
-	crypto_free_shash(c->hmac_tfm);
-	crypto_free_shash(c->hash_tfm);
-	kfree(c->log_hash);
-}
-
-/**
- * ubifs_node_calc_hmac - calculate the HMAC of a UBIFS node
- * @c: UBIFS file-system description object
- * @node: the node to insert a HMAC into.
- * @len: the length of the node
- * @ofs_hmac: the offset in the node where the HMAC is inserted
- * @hmac: returned HMAC
- *
- * This function calculates a HMAC of a UBIFS node. The HMAC is expected to be
- * embedded into the node, so this area is not covered by the HMAC. Also not
- * covered is the UBIFS_NODE_MAGIC and the CRC of the node.
- */
-static int ubifs_node_calc_hmac(const struct ubifs_info *c, const void *node,
-				int len, int ofs_hmac, void *hmac)
-{
-	SHASH_DESC_ON_STACK(shash, c->hmac_tfm);
-	int hmac_len = c->hmac_desc_len;
-	int err;
-
-	ubifs_assert(c, ofs_hmac > 8);
-	ubifs_assert(c, ofs_hmac + hmac_len < len);
-
-	shash->tfm = c->hmac_tfm;
-
-	err = crypto_shash_init(shash);
-	if (err)
-		return err;
-
-	/* behind common node header CRC up to HMAC begin */
-	err = crypto_shash_update(shash, node + 8, ofs_hmac - 8);
-	if (err < 0)
-		return err;
-
-	/* behind HMAC, if any */
-	if (len - ofs_hmac - hmac_len > 0) {
-		err = crypto_shash_update(shash, node + ofs_hmac + hmac_len,
-			    len - ofs_hmac - hmac_len);
-		if (err < 0)
-			return err;
+	if (!c->hash_algo_name) {
+		ubifs_err(c, "Hash algorithm not given (--hash-algo)");
+		return -EINVAL;
 	}
 
-	return crypto_shash_final(shash, hmac);
-}
-
-/**
- * __ubifs_node_insert_hmac - insert a HMAC into a UBIFS node
- * @c: UBIFS file-system description object
- * @node: the node to insert a HMAC into.
- * @len: the length of the node
- * @ofs_hmac: the offset in the node where the HMAC is inserted
- *
- * This function inserts a HMAC at offset @ofs_hmac into the node given in
- * @node.
- *
- * This function returns 0 for success or a negative error code otherwise.
- */
-int __ubifs_node_insert_hmac(const struct ubifs_info *c, void *node, int len,
-			    int ofs_hmac)
-{
-	return ubifs_node_calc_hmac(c, node, len, ofs_hmac, node + ofs_hmac);
-}
-
-/**
- * __ubifs_node_verify_hmac - verify the HMAC of UBIFS node
- * @c: UBIFS file-system description object
- * @node: the node to insert a HMAC into.
- * @len: the length of the node
- * @ofs_hmac: the offset in the node where the HMAC is inserted
- *
- * This function verifies the HMAC at offset @ofs_hmac of the node given in
- * @node. Returns 0 if successful or a negative error code otherwise.
- */
-int __ubifs_node_verify_hmac(const struct ubifs_info *c, const void *node,
-			     int len, int ofs_hmac)
-{
-	int hmac_len = c->hmac_desc_len;
-	u8 *hmac;
-	int err;
-
-	hmac = kmalloc(hmac_len, GFP_NOFS);
-	if (!hmac)
-		return -ENOMEM;
-
-	err = ubifs_node_calc_hmac(c, node, len, ofs_hmac, hmac);
+	err = init_authentication(c->hash_algo_name, &hash_len, &hash_algo);
 	if (err) {
-		kfree(hmac);
+		ubifs_err(c, "Init authentication failed");
 		return err;
 	}
 
-	err = crypto_memneq(hmac, node + ofs_hmac, hmac_len);
-
-	kfree(hmac);
-
-	if (!err)
-		return 0;
-
-	return -EPERM;
-}
-
-int __ubifs_shash_copy_state(const struct ubifs_info *c, struct shash_desc *src,
-			     struct shash_desc *target)
-{
-	u8 *state;
-	int err;
-
-	state = kmalloc(crypto_shash_descsize(src->tfm), GFP_NOFS);
-	if (!state)
-		return -ENOMEM;
-
-	err = crypto_shash_export(src, state);
-	if (err)
-		goto out;
-
-	err = crypto_shash_import(target, state);
-
-out:
-	kfree(state);
-
-	return err;
-}
-
-/**
- * ubifs_hmac_wkm - Create a HMAC of the well known message
- * @c: UBIFS file-system description object
- * @hmac: The HMAC of the well known message
- *
- * This function creates a HMAC of a well known message. This is used
- * to check if the provided key is suitable to authenticate a UBIFS
- * image. This is only a convenience to the user to provide a better
- * error message when the wrong key is provided.
- *
- * This function returns 0 for success or a negative error code otherwise.
- */
-int ubifs_hmac_wkm(struct ubifs_info *c, u8 *hmac)
-{
-	SHASH_DESC_ON_STACK(shash, c->hmac_tfm);
-	int err;
-	const char well_known_message[] = "UBIFS";
-
-	if (!ubifs_authenticated(c))
-		return 0;
-
-	shash->tfm = c->hmac_tfm;
-
-	err = crypto_shash_init(shash);
-	if (err)
-		return err;
-
-	err = crypto_shash_update(shash, well_known_message,
-				  sizeof(well_known_message) - 1);
-	if (err < 0)
-		return err;
+	c->hash_len = hash_len;
+	c->hash_algo = hash_algo;
+	c->authenticated = 1;
 
-	err = crypto_shash_final(shash, hmac);
-	if (err)
-		return err;
 	return 0;
 }
 
-/*
- * ubifs_hmac_zero - test if a HMAC is zero
- * @c: UBIFS file-system description object
- * @hmac: the HMAC to test
- *
- * This function tests if a HMAC is zero and returns true if it is
- * and false otherwise.
- */
-bool ubifs_hmac_zero(struct ubifs_info *c, const u8 *hmac)
+void __ubifs_exit_authentication(__unused struct ubifs_info *c)
 {
-	return !memchr_inv(hmac, 0, c->hmac_desc_len);
+	exit_authentication();
 }
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
