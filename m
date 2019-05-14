Return-Path: <SRS0=Ul+2=TO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93377C04AB4
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2019 08:33:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 623D620675
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2019 08:33:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hyxL+h0t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 623D620675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FWWeMupMcALYY8Y4iDZqatOwpyvux8WFgjv4uUTjOek=; b=hyxL+h0tnQ5cH6
	GRciK6gN5tK0KYdjaaUCQ8skPLwE0BCqclDQq1p3pyaCAvxv7fuBqIjqfF1LxYaLGmC59FVndaqkq
	mHW/njKEQbYp+yTyST7LqArXoWMpmlPDXSSTlX0n1VpZ5O1HUguEXMbin6MpHbL+OPkAsYYIZA53w
	F/NWglVWLTtAGxMkOWtOr482vKQ9jJ6EVB5gOtsys9NobhWDqIWgrEuZ8RHw9jgylVtt9q2tItKeH
	WKKV8byr4DLXDa5SfdNFXZwIaxY72gUGEHvftdRFvmJjoV0EZyaymHvoyQeSWahyX29nE0UyW8bMb
	llTB1KnHV6xXgzuTJj6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQSsL-0001EX-Fr; Tue, 14 May 2019 08:33:29 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQSsH-0001Dx-Gb
 for linux-mtd@lists.infradead.org; Tue, 14 May 2019 08:33:27 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hQSsF-0004yh-CG; Tue, 14 May 2019 10:33:23 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
 (envelope-from <sha@pengutronix.de>)
 id 1hQSsF-0004S1-4W; Tue, 14 May 2019 10:33:23 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: support offline signed images
Date: Tue, 14 May 2019 10:33:22 +0200
Message-Id: <20190514083322.17035-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_013325_874349_5DB29AD5 
X-CRM114-Status: GOOD (  33.42  )
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
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

HMACs can only be generated on the system the UBIFS image is running on.
To support offline signed images we add a PKCS#7 signature to the UBIFS
image which can be created by mkfs.ubifs.

Both the master node and the superblock need to be authenticated, during
normal runtime both are protected with HMACs. For offline signature
support however only a single signature is desired. We add a signature
covering the superblock node directly behind it. To protect the master
node a hash of the master node is added to the superblock which is used
when the master node doesn't contain a HMAC.

Transition to a read/write filesystem is also supported. During
transition first the master node is rewritten with a HMAC (implicitly,
it is written anyway as the FS is marked dirty). Afterwards the
superblock is rewritten with a HMAC. Once after the image has been
mounted read/write it is HMAC only, the signature is no longer required
or even present on the filesystem.

In an offline signed image the master node is authenticated by the
superblock. In a transition to r/w we have to make sure that the master
node is rewritten before the superblock node. In this case the master
node gets a HMAC and its authenticity no longer depends on the
superblock node. There are some cases in which the current code first
writes the superblock node though, so with this patch writing of the
superblock node is delayed until the master node is written.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/Kconfig       |  3 +-
 fs/ubifs/auth.c        | 86 ++++++++++++++++++++++++++++++++++++++++++
 fs/ubifs/master.c      | 54 +++++++++++++++++++++++---
 fs/ubifs/sb.c          | 52 +++++++++++++------------
 fs/ubifs/super.c       | 41 +++++++++++++++-----
 fs/ubifs/ubifs-media.h | 28 +++++++++++++-
 fs/ubifs/ubifs.h       |  6 ++-
 7 files changed, 226 insertions(+), 44 deletions(-)

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index 9da2f135121b..ae53e02509c6 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -76,8 +76,9 @@ config UBIFS_FS_SECURITY
 
 config UBIFS_FS_AUTHENTICATION
 	bool "UBIFS authentication support"
-	depends on KEYS
+	select KEYS
 	select CRYPTO_HMAC
+	select SYSTEM_DATA_VERIFICATION
 	help
 	  Enable authentication support for UBIFS. This feature offers protection
 	  against offline changes for both data and metadata of the filesystem.
diff --git a/fs/ubifs/auth.c b/fs/ubifs/auth.c
index 5bf5fd08879e..292c61c64b82 100644
--- a/fs/ubifs/auth.c
+++ b/fs/ubifs/auth.c
@@ -10,10 +10,12 @@
  */
 
 #include <linux/crypto.h>
+#include <linux/verification.h>
 #include <crypto/hash.h>
 #include <crypto/sha.h>
 #include <crypto/algapi.h>
 #include <keys/user-type.h>
+#include <keys/asymmetric-type.h>
 
 #include "ubifs.h"
 
@@ -217,6 +219,77 @@ int __ubifs_node_check_hash(const struct ubifs_info *c, const void *node,
 	return 0;
 }
 
+/**
+ * ubifs_sb_verify_signature - verify the signature of a superblock
+ * @c: UBIFS file-system description object
+ * @sup: The superblock node
+ *
+ * To support offline signed images the superblock can be signed with a
+ * PKCS#7 signature. The signature is placed directly behind the superblock
+ * node in an ubifs_sig_node.
+ *
+ * Returns 0 when the signature can be successfully verified or a negative
+ * error code if not.
+ */
+int ubifs_sb_verify_signature(struct ubifs_info *c,
+			      const struct ubifs_sb_node *sup)
+{
+	int err;
+	struct ubifs_scan_leb *sleb;
+	struct ubifs_scan_node *snod;
+	const struct ubifs_sig_node *signode;
+
+	sleb = ubifs_scan(c, UBIFS_SB_LNUM, UBIFS_SB_NODE_SZ, c->sbuf, 0);
+	if (IS_ERR(sleb)) {
+		err = PTR_ERR(sleb);
+		return err;
+	}
+
+	if (sleb->nodes_cnt == 0) {
+		ubifs_err(c, "Unable to find signature node");
+		err = -EINVAL;
+		goto out_destroy;
+	}
+
+	snod = list_first_entry(&sleb->nodes, struct ubifs_scan_node, list);
+
+	if (snod->type != UBIFS_SIG_NODE) {
+		ubifs_err(c, "Signature node is of wrong type");
+		err = -EINVAL;
+		goto out_destroy;
+	}
+
+	signode = snod->node;
+
+	if (le32_to_cpu(signode->len) > snod->len + sizeof(struct ubifs_sig_node)) {
+		ubifs_err(c, "invalid signature len %d", le32_to_cpu(signode->len));
+		err = -EINVAL;
+		goto out_destroy;
+	}
+
+	if (le32_to_cpu(signode->type) != UBIFS_SIGNATURE_TYPE_PKCS7) {
+		ubifs_err(c, "Signature type %d is not supported\n",
+			  le32_to_cpu(signode->type));
+		err = -EINVAL;
+		goto out_destroy;
+	}
+
+	err = verify_pkcs7_signature(sup, sizeof(struct ubifs_sb_node),
+				     signode->sig, le32_to_cpu(signode->len),
+				     NULL, VERIFYING_UNSPECIFIED_SIGNATURE,
+				     NULL, NULL);
+
+	if (err)
+		ubifs_err(c, "Failed to verify signature");
+	else
+		ubifs_msg(c, "Successfully verified super block signature");
+
+out_destroy:
+	ubifs_scan_destroy(sleb);
+
+	return err;
+}
+
 /**
  * ubifs_init_authentication - initialize UBIFS authentication support
  * @c: UBIFS file-system description object
@@ -499,3 +572,16 @@ int ubifs_hmac_wkm(struct ubifs_info *c, u8 *hmac)
 		return err;
 	return 0;
 }
+
+/*
+ * ubifs_hmac_zero - test if a HMAC is zero
+ * @c: UBIFS file-system description object
+ * @hmac: the HMAC to test
+ *
+ * This function tests if a HMAC is zero and returns true if it is
+ * and false otherwise.
+ */
+bool ubifs_hmac_zero(struct ubifs_info *c, const u8 *hmac)
+{
+	return !memchr_inv(hmac, 0, c->hmac_desc_len);
+}
diff --git a/fs/ubifs/master.c b/fs/ubifs/master.c
index 5ea51bbd14c7..5655414a76a7 100644
--- a/fs/ubifs/master.c
+++ b/fs/ubifs/master.c
@@ -60,6 +60,40 @@ int ubifs_compare_master_node(struct ubifs_info *c, void *m1, void *m2)
 	return 0;
 }
 
+/* mst_node_check_hash - Check hash of a master node
+ * @c: UBIFS file-system description object
+ * @mst: The master node
+ * @expected: The expected hash of the master node
+ *
+ * This checks the hash of a master node against a given expected hash.
+ * Note that we have two master nodes on a UBIFS image which have different
+ * sequence numbers and consequently different CRCs. To be able to match
+ * both master nodes we exclude the common node header containing the sequence
+ * number and CRC from the hash.
+ *
+ * Returns 0 if the hashes are equal, a negative error code otherwise.
+ */
+static int mst_node_check_hash(const struct ubifs_info *c,
+			       const struct ubifs_mst_node *mst,
+			       const u8 *expected)
+{
+	u8 calc[UBIFS_MAX_HASH_LEN];
+	const void *node = mst;
+
+	SHASH_DESC_ON_STACK(shash, c->hash_tfm);
+
+	shash->tfm = c->hash_tfm;
+	shash->flags = CRYPTO_TFM_REQ_MAY_SLEEP;
+
+	crypto_shash_digest(shash, node + sizeof(struct ubifs_ch),
+			    UBIFS_MST_NODE_SZ - sizeof(struct ubifs_ch), calc);
+
+	if (ubifs_check_hash(c, expected, calc))
+		return -EPERM;
+
+	return 0;
+}
+
 /**
  * scan_for_master - search the valid master node.
  * @c: UBIFS file-system description object
@@ -114,14 +148,22 @@ static int scan_for_master(struct ubifs_info *c)
 	if (!ubifs_authenticated(c))
 		return 0;
 
-	err = ubifs_node_verify_hmac(c, c->mst_node,
-				     sizeof(struct ubifs_mst_node),
-				     offsetof(struct ubifs_mst_node, hmac));
-	if (err) {
-		ubifs_err(c, "Failed to verify master node HMAC");
-		return -EPERM;
+	if (ubifs_hmac_zero(c, c->mst_node->hmac)) {
+		err = mst_node_check_hash(c, c->mst_node,
+					  c->sup_node->hash_mst);
+		if (err)
+			ubifs_err(c, "Failed to verify master node hash");
+	} else {
+		err = ubifs_node_verify_hmac(c, c->mst_node,
+					sizeof(struct ubifs_mst_node),
+					offsetof(struct ubifs_mst_node, hmac));
+		if (err)
+			ubifs_err(c, "Failed to verify master node HMAC");
 	}
 
+	if (err)
+		return -EPERM;
+
 	return 0;
 
 out:
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 67fac1e8adfb..725b552b35cd 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -590,17 +590,26 @@ static int authenticate_sb_node(struct ubifs_info *c,
 		return -EINVAL;
 	}
 
-	err = ubifs_hmac_wkm(c, hmac_wkm);
-	if (err)
-		return err;
-
-	if (ubifs_check_hmac(c, hmac_wkm, sup->hmac_wkm)) {
-		ubifs_err(c, "provided key does not fit");
-		return -ENOKEY;
+	/*
+	 * The super block node can either be authenticated by a HMAC or
+	 * by a signature in a ubifs_sig_node directly following the
+	 * super block node to support offline image creation.
+	 */
+	if (ubifs_hmac_zero(c, sup->hmac)) {
+		err = ubifs_sb_verify_signature(c, sup);
+	} else {
+		err = ubifs_hmac_wkm(c, hmac_wkm);
+		if (err)
+			return err;
+		if (ubifs_check_hmac(c, hmac_wkm, sup->hmac_wkm)) {
+			ubifs_err(c, "provided key does not fit");
+			return -ENOKEY;
+		}
+		err = ubifs_node_verify_hmac(c, sup, sizeof(*sup),
+					     offsetof(struct ubifs_sb_node,
+						      hmac));
 	}
 
-	err = ubifs_node_verify_hmac(c, sup, sizeof(*sup),
-				     offsetof(struct ubifs_sb_node, hmac));
 	if (err)
 		ubifs_err(c, "Failed to authenticate superblock: %d", err);
 
@@ -758,21 +767,16 @@ int ubifs_read_superblock(struct ubifs_info *c)
 #endif
 
 	/* Automatically increase file system size to the maximum size */
-	c->old_leb_cnt = c->leb_cnt;
 	if (c->leb_cnt < c->vi.size && c->leb_cnt < c->max_leb_cnt) {
+		int old_leb_cnt = c->leb_cnt;
+
 		c->leb_cnt = min_t(int, c->max_leb_cnt, c->vi.size);
-		if (c->ro_mount)
-			dbg_mnt("Auto resizing (ro) from %d LEBs to %d LEBs",
-				c->old_leb_cnt,	c->leb_cnt);
-		else {
-			dbg_mnt("Auto resizing (sb) from %d LEBs to %d LEBs",
-				c->old_leb_cnt, c->leb_cnt);
-			sup->leb_cnt = cpu_to_le32(c->leb_cnt);
-			err = ubifs_write_sb_node(c, sup);
-			if (err)
-				goto out;
-			c->old_leb_cnt = c->leb_cnt;
-		}
+		sup->leb_cnt = cpu_to_le32(c->leb_cnt);
+
+		c->superblock_need_write = 1;
+
+		dbg_mnt("Auto resizing from %d LEBs to %d LEBs",
+			old_leb_cnt, c->leb_cnt);
 	}
 
 	c->log_bytes = (long long)c->log_lebs * c->leb_size;
@@ -930,9 +934,7 @@ int ubifs_fixup_free_space(struct ubifs_info *c)
 	c->space_fixup = 0;
 	sup->flags &= cpu_to_le32(~UBIFS_FLG_SPACE_FIXUP);
 
-	err = ubifs_write_sb_node(c, sup);
-	if (err)
-		return err;
+	c->superblock_need_write = 1;
 
 	ubifs_msg(c, "free space fixup complete");
 	return err;
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 12628184772c..b58f4b83972a 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -580,6 +580,8 @@ static int init_constants_early(struct ubifs_info *c)
 	c->ranges[UBIFS_AUTH_NODE].min_len = UBIFS_AUTH_NODE_SZ;
 	c->ranges[UBIFS_AUTH_NODE].max_len = UBIFS_AUTH_NODE_SZ +
 				UBIFS_MAX_HMAC_LEN;
+	c->ranges[UBIFS_SIG_NODE].min_len = UBIFS_SIG_NODE_SZ;
+	c->ranges[UBIFS_SIG_NODE].max_len = c->leb_size - UBIFS_SB_NODE_SZ;
 
 	c->ranges[UBIFS_INO_NODE].min_len  = UBIFS_INO_NODE_SZ;
 	c->ranges[UBIFS_INO_NODE].max_len  = UBIFS_MAX_INO_NODE_SZ;
@@ -1374,6 +1376,26 @@ static int mount_ubifs(struct ubifs_info *c)
 			goto out_lpt;
 	}
 
+	/*
+	 * Handle offline signed images: Now that the master node is
+	 * written and its validation no longer depends on the hash
+	 * in the superblock, we can update the offline signed
+	 * superblock with a HMAC version,
+	 */
+	if (ubifs_authenticated(c) && ubifs_hmac_zero(c, c->sup_node->hmac)) {
+		err = ubifs_hmac_wkm(c, c->sup_node->hmac_wkm);
+		if (err)
+			goto out_lpt;
+		c->superblock_need_write = 1;
+	}
+
+	if (!c->ro_mount && c->superblock_need_write) {
+		err = ubifs_write_sb_node(c, c->sup_node);
+		if (err)
+			goto out_lpt;
+		c->superblock_need_write = 0;
+	}
+
 	err = dbg_check_idx_size(c, c->bi.old_idx_sz);
 	if (err)
 		goto out_lpt;
@@ -1656,15 +1678,6 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 	if (err)
 		goto out;
 
-	if (c->old_leb_cnt != c->leb_cnt) {
-		struct ubifs_sb_node *sup = c->sup_node;
-
-		sup->leb_cnt = cpu_to_le32(c->leb_cnt);
-		err = ubifs_write_sb_node(c, sup);
-		if (err)
-			goto out;
-	}
-
 	if (c->need_recovery) {
 		ubifs_msg(c, "completing deferred recovery");
 		err = ubifs_write_rcvrd_mst_node(c);
@@ -1696,6 +1709,16 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 			goto out;
 	}
 
+	if (c->superblock_need_write) {
+		struct ubifs_sb_node *sup = c->sup_node;
+
+		err = ubifs_write_sb_node(c, sup);
+		if (err)
+			goto out;
+
+		c->superblock_need_write = 0;
+	}
+
 	c->ileb_buf = vmalloc(c->leb_size);
 	if (!c->ileb_buf) {
 		err = -ENOMEM;
diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
index 8b7c1844014f..da906937dd0d 100644
--- a/fs/ubifs/ubifs-media.h
+++ b/fs/ubifs/ubifs-media.h
@@ -287,6 +287,8 @@ enum {
 #define UBIFS_CS_NODE_SZ   sizeof(struct ubifs_cs_node)
 #define UBIFS_ORPH_NODE_SZ sizeof(struct ubifs_orph_node)
 #define UBIFS_AUTH_NODE_SZ sizeof(struct ubifs_auth_node)
+#define UBIFS_SIG_NODE_SZ  sizeof(struct ubifs_sig_node)
+
 /* Extended attribute entry nodes are identical to directory entry nodes */
 #define UBIFS_XENT_NODE_SZ UBIFS_DENT_NODE_SZ
 /* Only this does not have to be multiple of 8 bytes */
@@ -313,6 +315,8 @@ enum {
  */
 #define UBIFS_XATTR_NAME_ENCRYPTION_CONTEXT "c"
 
+/* Type field in ubifs_sig_node */
+#define UBIFS_SIGNATURE_TYPE_PKCS7	1
 
 /*
  * On-flash inode flags.
@@ -373,6 +377,7 @@ enum {
  * UBIFS_CS_NODE: commit start node
  * UBIFS_ORPH_NODE: orphan node
  * UBIFS_AUTH_NODE: authentication node
+ * UBIFS_SIG_NODE: signature node
  * UBIFS_NODE_TYPES_CNT: count of supported node types
  *
  * Note, we index arrays by these numbers, so keep them low and contiguous.
@@ -393,6 +398,7 @@ enum {
 	UBIFS_CS_NODE,
 	UBIFS_ORPH_NODE,
 	UBIFS_AUTH_NODE,
+	UBIFS_SIG_NODE,
 	UBIFS_NODE_TYPES_CNT,
 };
 
@@ -650,6 +656,8 @@ struct ubifs_pad_node {
  * @hmac_wkm: HMAC of a well known message (the string "UBIFS") as a convenience
  *            to the user to check if the correct key is passed.
  * @hash_algo: The hash algo used for this filesystem (one of enum hash_algo)
+ * @hash_mst: hash of the master node, only valid for signed images in which the
+ *            master node does not contain a hmac
  */
 struct ubifs_sb_node {
 	struct ubifs_ch ch;
@@ -680,7 +688,8 @@ struct ubifs_sb_node {
 	__u8 hmac[UBIFS_MAX_HMAC_LEN];
 	__u8 hmac_wkm[UBIFS_MAX_HMAC_LEN];
 	__le16 hash_algo;
-	__u8 padding2[3838];
+	__u8 hash_mst[UBIFS_MAX_HASH_LEN];
+	__u8 padding2[3774];
 } __packed;
 
 /**
@@ -782,6 +791,23 @@ struct ubifs_auth_node {
 	__u8 hmac[];
 } __packed;
 
+/**
+ * struct ubifs_sig_node - node for signing other nodes
+ * @ch: common header
+ * @type: type of the signature, currently only UBIFS_SIGNATURE_TYPE_PKCS7
+ * supported
+ * @len: The length of the signature data
+ * @padding: reserved for future, zeroes
+ * @sig: The signature data
+ */
+struct ubifs_sig_node {
+	struct ubifs_ch ch;
+	__le32 type;
+	__le32 len;
+	__u8 padding[32];
+	__u8 sig[];
+} __packed;
+
 /**
  * struct ubifs_branch - key/reference/length branch
  * @lnum: LEB number of the target node
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 1ae12900e01d..fc9c3fdf18a2 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1113,7 +1113,6 @@ struct ubifs_debug_info;
  *                used to store indexing nodes (@leb_size - @max_idx_node_sz)
  * @leb_cnt: count of logical eraseblocks
  * @max_leb_cnt: maximum count of logical eraseblocks
- * @old_leb_cnt: count of logical eraseblocks before re-size
  * @ro_media: the underlying UBI volume is read-only
  * @ro_mount: the file-system was mounted as read-only
  * @ro_error: UBIFS switched to R/O mode because an error happened
@@ -1304,6 +1303,7 @@ struct ubifs_info {
 	unsigned int rw_incompat:1;
 	unsigned int assert_action:2;
 	unsigned int authenticated:1;
+	unsigned int superblock_need_write:1;
 
 	struct mutex tnc_mutex;
 	struct ubifs_zbranch zroot;
@@ -1361,7 +1361,6 @@ struct ubifs_info {
 	int idx_leb_size;
 	int leb_cnt;
 	int max_leb_cnt;
-	int old_leb_cnt;
 	unsigned int ro_media:1;
 	unsigned int ro_mount:1;
 	unsigned int ro_error:1;
@@ -1689,6 +1688,9 @@ static inline int ubifs_auth_node_sz(const struct ubifs_info *c)
 	else
 		return 0;
 }
+int ubifs_sb_verify_signature(struct ubifs_info *c,
+			      const struct ubifs_sb_node *sup);
+bool ubifs_hmac_zero(struct ubifs_info *c, const u8 *hmac);
 
 int ubifs_hmac_wkm(struct ubifs_info *c, u8 *hmac);
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
