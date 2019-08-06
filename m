Return-Path: <SRS0=yOTt=WC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E66C433FF
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Aug 2019 10:50:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5879F20818
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Aug 2019 10:50:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="md2LCWME"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5879F20818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iZGgSKUUmj3v2vOse1AWd6JMiLU30J8pvoXT1V9Mx+A=; b=md2LCWMED5brEG
	Hl7nCmy6yRN0ejvgiwOZVZiNJZ7Z07pyQXSl/dOF+Dxh+3UCN4crPqGZcT1Q9vEi+h5b1v0RjKiif
	gYQVTLERsi4Ri63tTJzL7fda1X8a+B5gHmdkLpfMk6fb8g90R6UhsIZoInzH2XqX0Ikkisxp7uZ5e
	y0OT5rXWs9EtxK7cKSzElAYlBAlAITdZKkBIWKXfdRQqZwShWUixN+l4j9wrg7jp16V/WJvjZnJrJ
	tfEIg0dt7MJ/f3p+yyubuwpTCWhA12jLuUZ4fCTVZZ/0mcAzFE1O0/f2XyoSi6ryDKDujrWNuuOSB
	Uq7qGrvdRpQK0WJttmiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hux2C-0005Kr-AS; Tue, 06 Aug 2019 10:49:40 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hux25-0005Ig-NN
 for linux-mtd@lists.infradead.org; Tue, 06 Aug 2019 10:49:36 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1hux22-0006aJ-4K; Tue, 06 Aug 2019 12:49:30 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1hux21-00083T-B0; Tue, 06 Aug 2019 12:49:29 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] ubifs-media: Update to Linux-5.3-rc3
Date: Tue,  6 Aug 2019 12:49:27 +0200
Message-Id: <20190806104928.1224-2-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806104928.1224-1-s.hauer@pengutronix.de>
References: <20190806104928.1224-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_034933_782832_C45E5940 
X-CRM114-Status: GOOD (  19.61  )
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
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 david.oberhollenzer@sigma-star.at
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This updates ubifs-media.h to Linux-5.3-rc3 which brings us the bits
and pieces necessary for UBIFS authentication and offline signing.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 include/mtd/ubifs-media.h | 75 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 70 insertions(+), 5 deletions(-)

diff --git a/include/mtd/ubifs-media.h b/include/mtd/ubifs-media.h
index 7751ac7..f1e3a14 100644
--- a/include/mtd/ubifs-media.h
+++ b/include/mtd/ubifs-media.h
@@ -288,6 +288,9 @@ enum {
 #define UBIFS_IDX_NODE_SZ  sizeof(struct ubifs_idx_node)
 #define UBIFS_CS_NODE_SZ   sizeof(struct ubifs_cs_node)
 #define UBIFS_ORPH_NODE_SZ sizeof(struct ubifs_orph_node)
+#define UBIFS_AUTH_NODE_SZ sizeof(struct ubifs_auth_node)
+#define UBIFS_SIG_NODE_SZ  sizeof(struct ubifs_sig_node)
+
 /* Extended attribute entry nodes are identical to directory entry nodes */
 #define UBIFS_XENT_NODE_SZ UBIFS_DENT_NODE_SZ
 /* Only this does not have to be multiple of 8 bytes */
@@ -302,12 +305,20 @@ enum {
 /* The largest UBIFS node */
 #define UBIFS_MAX_NODE_SZ UBIFS_MAX_INO_NODE_SZ
 
+/* The maxmimum size of a hash, enough for sha512 */
+#define UBIFS_MAX_HASH_LEN 64
+
+/* The maxmimum size of a hmac, enough for hmac(sha512) */
+#define UBIFS_MAX_HMAC_LEN 64
+
 /*
  * xattr name of UBIFS encryption context, we don't use a prefix
  * nor a long name to not waste space on the flash.
  */
 #define UBIFS_XATTR_NAME_ENCRYPTION_CONTEXT "c"
 
+/* Type field in ubifs_sig_node */
+#define UBIFS_SIGNATURE_TYPE_PKCS7	1
 
 /*
  * On-flash inode flags.
@@ -369,6 +380,8 @@ enum {
  * UBIFS_IDX_NODE: index node
  * UBIFS_CS_NODE: commit start node
  * UBIFS_ORPH_NODE: orphan node
+ * UBIFS_AUTH_NODE: authentication node
+ * UBIFS_SIG_NODE: signature node
  * UBIFS_NODE_TYPES_CNT: count of supported node types
  *
  * Note, we index arrays by these numbers, so keep them low and contiguous.
@@ -388,6 +401,8 @@ enum {
 	UBIFS_IDX_NODE,
 	UBIFS_CS_NODE,
 	UBIFS_ORPH_NODE,
+	UBIFS_AUTH_NODE,
+	UBIFS_SIG_NODE,
 	UBIFS_NODE_TYPES_CNT,
 };
 
@@ -425,15 +440,19 @@ enum {
  * UBIFS_FLG_DOUBLE_HASH: store a 32bit cookie in directory entry nodes to
  *			  support 64bit cookies for lookups by hash
  * UBIFS_FLG_ENCRYPTION: this filesystem contains encrypted files
+ * UBIFS_FLG_AUTHENTICATION: this filesystem contains hashes for authentication
  */
 enum {
 	UBIFS_FLG_BIGLPT = 0x02,
 	UBIFS_FLG_SPACE_FIXUP = 0x04,
 	UBIFS_FLG_DOUBLE_HASH = 0x08,
 	UBIFS_FLG_ENCRYPTION = 0x10,
+	UBIFS_FLG_AUTHENTICATION = 0x20,
 };
 
-#define UBIFS_FLG_MASK (UBIFS_FLG_BIGLPT|UBIFS_FLG_SPACE_FIXUP|UBIFS_FLG_DOUBLE_HASH|UBIFS_FLG_ENCRYPTION)
+#define UBIFS_FLG_MASK (UBIFS_FLG_BIGLPT | UBIFS_FLG_SPACE_FIXUP | \
+		UBIFS_FLG_DOUBLE_HASH | UBIFS_FLG_ENCRYPTION | \
+		UBIFS_FLG_AUTHENTICATION)
 
 /**
  * struct ubifs_ch - common header node.
@@ -568,8 +587,6 @@ struct ubifs_dent_node {
  * @compr_size: compressed data size in bytes, only valid when data is encrypted
  * @data: data
  *
- * Note, do not forget to amend 'zero_data_node_unused()' function when
- * changing the padding fields.
  */
 struct ubifs_data_node {
 	struct ubifs_ch ch;
@@ -639,6 +656,12 @@ struct ubifs_pad_node {
  * @time_gran: time granularity in nanoseconds
  * @uuid: UUID generated when the file system image was created
  * @ro_compat_version: UBIFS R/O compatibility version
+ * @hmac: HMAC to authenticate the superblock node
+ * @hmac_wkm: HMAC of a well known message (the string "UBIFS") as a convenience
+ *            to the user to check if the correct key is passed.
+ * @hash_algo: The hash algo used for this filesystem (one of enum hash_algo)
+ * @hash_mst: hash of the master node, only valid for signed images in which the
+ *            master node does not contain a hmac
  */
 struct ubifs_sb_node {
 	struct ubifs_ch ch;
@@ -665,7 +688,12 @@ struct ubifs_sb_node {
 	__le64 rp_size;
 	__le32 time_gran;
 	__u8 uuid[16];
-	__u8 padding2[3972];
+	__le32 ro_compat_version;
+	__u8 hmac[UBIFS_MAX_HMAC_LEN];
+	__u8 hmac_wkm[UBIFS_MAX_HMAC_LEN];
+	__le16 hash_algo;
+	__u8 hash_mst[UBIFS_MAX_HASH_LEN];
+	__u8 padding2[3774];
 } __attribute__ ((packed));
 
 /**
@@ -700,6 +728,9 @@ struct ubifs_sb_node {
  * @empty_lebs: number of empty logical eraseblocks
  * @idx_lebs: number of indexing logical eraseblocks
  * @leb_cnt: count of LEBs used by file-system
+ * @hash_root_idx: the hash of the root index node
+ * @hash_lpt: the hash of the LPT
+ * @hmac: HMAC to authenticate the master node
  * @padding: reserved for future, zeroes
  */
 struct ubifs_mst_node {
@@ -732,7 +763,10 @@ struct ubifs_mst_node {
 	__le32 empty_lebs;
 	__le32 idx_lebs;
 	__le32 leb_cnt;
-	__u8 padding[344];
+	__u8 hash_root_idx[UBIFS_MAX_HASH_LEN];
+	__u8 hash_lpt[UBIFS_MAX_HASH_LEN];
+	__u8 hmac[UBIFS_MAX_HMAC_LEN];
+	__u8 padding[152];
 } __attribute__ ((packed));
 
 /**
@@ -751,12 +785,43 @@ struct ubifs_ref_node {
 	__u8 padding[28];
 } __attribute__ ((packed));
 
+/**
+ * struct ubifs_auth_node - node for authenticating other nodes
+ * @ch: common header
+ * @hmac: The HMAC
+ */
+struct ubifs_auth_node {
+	struct ubifs_ch ch;
+	__u8 hmac[];
+} __attribute__ ((packed));
+
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
+} __attribute__ ((packed));
+
 /**
  * struct ubifs_branch - key/reference/length branch
  * @lnum: LEB number of the target node
  * @offs: offset within @lnum
  * @len: target node length
  * @key: key
+ *
+ * In an authenticated UBIFS we have the hash of the referenced node after @key.
+ * This can't be added to the struct type definition because @key is a
+ * dynamically sized element already.
  */
 struct ubifs_branch {
 	__le32 lnum;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
