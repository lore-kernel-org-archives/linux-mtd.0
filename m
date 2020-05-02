Return-Path: <SRS0=DU2W=6Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A8DC3A5A9
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 05:34:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62CCD208DB
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 05:34:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N95PACS5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbitR2Dw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62CCD208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0WzZ8N08XuSU3oWZtYB6J1LOXCTFTqL2NFR19qC2XBs=; b=N95PACS5TQRjUh
	ysxSpgB9QzzkVYjXvf7qJL3oBJrnGSWvhX4xGofKBX/2qPOTL+KkkmWxIp5vBYr87yHme8Pkw9QJp
	fGWh+jqC9ePxIuT/2S93rxZxi1x1CyoUfvSwVrJcQIMQjbKcq/XrCiI0aH5r9DApuj52ba0mKHfXC
	yBGu6T9kjhcnup+NYKdqf3Uw+wdCrH7kIy5ZrUywerLabuqIFMsWY7ISfMWxMuUK6sha01NEUgGSW
	6PKsyu1hF4ExVQ1m8tBneypdIe57gz7XifYq03SETFdzmA7KDEjiGGKdqaoP46Sddrliw6k03zB9c
	0U7x+ExrTS1C6YLU5wyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUkmj-0004vW-9U; Sat, 02 May 2020 05:33:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUkmY-0004kX-Hw
 for linux-mtd@lists.infradead.org; Sat, 02 May 2020 05:33:48 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 661EE2495D;
 Sat,  2 May 2020 05:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588397625;
 bh=kOMqG1wtcM/8YN6jSEEZv709OU3+6XUMoquaqptfu2s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WbitR2DwVVwOWkySkljOEG/ucIKi+bm30pIbzgqiXGrRmv5Agsz4+gDE2PyJ2XGP5
 hhbxw/S3PrKwMsH7ZljNFyZT82r60jVBqSrxq65SozFZIpba/6j68Twg8Z78OFNI2l
 rD0CuVnKuxRqanbc/T4P4ClIy6Q2O97jGc1g8cY4=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [PATCH 16/20] ubifs: use crypto_shash_tfm_digest()
Date: Fri,  1 May 2020 22:31:18 -0700
Message-Id: <20200502053122.995648-17-ebiggers@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200502053122.995648-1-ebiggers@kernel.org>
References: <20200502053122.995648-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_223346_699107_9A60BBDE 
X-CRM114-Status: GOOD (  11.38  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Instead of manually allocating a 'struct shash_desc' on the stack and
calling crypto_shash_digest(), switch to using the new helper function
crypto_shash_tfm_digest() which does this for us.

Cc: linux-mtd@lists.infradead.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ubifs/auth.c   | 20 +++-----------------
 fs/ubifs/master.c |  9 +++------
 fs/ubifs/replay.c | 14 +++-----------
 3 files changed, 9 insertions(+), 34 deletions(-)

diff --git a/fs/ubifs/auth.c b/fs/ubifs/auth.c
index 8cdbd53d780ca7..1e374baafc5255 100644
--- a/fs/ubifs/auth.c
+++ b/fs/ubifs/auth.c
@@ -31,15 +31,9 @@ int __ubifs_node_calc_hash(const struct ubifs_info *c, const void *node,
 			    u8 *hash)
 {
 	const struct ubifs_ch *ch = node;
-	SHASH_DESC_ON_STACK(shash, c->hash_tfm);
-	int err;
-
-	shash->tfm = c->hash_tfm;
 
-	err = crypto_shash_digest(shash, node, le32_to_cpu(ch->len), hash);
-	if (err < 0)
-		return err;
-	return 0;
+	return crypto_shash_tfm_digest(c->hash_tfm, node, le32_to_cpu(ch->len),
+				       hash);
 }
 
 /**
@@ -53,15 +47,7 @@ int __ubifs_node_calc_hash(const struct ubifs_info *c, const void *node,
 static int ubifs_hash_calc_hmac(const struct ubifs_info *c, const u8 *hash,
 				 u8 *hmac)
 {
-	SHASH_DESC_ON_STACK(shash, c->hmac_tfm);
-	int err;
-
-	shash->tfm = c->hmac_tfm;
-
-	err = crypto_shash_digest(shash, hash, c->hash_len, hmac);
-	if (err < 0)
-		return err;
-	return 0;
+	return crypto_shash_tfm_digest(c->hmac_tfm, hash, c->hash_len, hmac);
 }
 
 /**
diff --git a/fs/ubifs/master.c b/fs/ubifs/master.c
index 52a85c01397ef9..911d0555b9f2b1 100644
--- a/fs/ubifs/master.c
+++ b/fs/ubifs/master.c
@@ -68,12 +68,9 @@ static int mst_node_check_hash(const struct ubifs_info *c,
 	u8 calc[UBIFS_MAX_HASH_LEN];
 	const void *node = mst;
 
-	SHASH_DESC_ON_STACK(shash, c->hash_tfm);
-
-	shash->tfm = c->hash_tfm;
-
-	crypto_shash_digest(shash, node + sizeof(struct ubifs_ch),
-			    UBIFS_MST_NODE_SZ - sizeof(struct ubifs_ch), calc);
+	crypto_shash_tfm_digest(c->hash_tfm, node + sizeof(struct ubifs_ch),
+				UBIFS_MST_NODE_SZ - sizeof(struct ubifs_ch),
+				calc);
 
 	if (ubifs_check_hash(c, expected, calc))
 		return -EPERM;
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index b28ac4dfb4070a..c4047a8f641077 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -558,7 +558,7 @@ static int is_last_bud(struct ubifs_info *c, struct ubifs_bud *bud)
 	return data == 0xFFFFFFFF;
 }
 
-/* authenticate_sleb_hash and authenticate_sleb_hmac are split out for stack usage */
+/* authenticate_sleb_hash is split out for stack usage */
 static int authenticate_sleb_hash(struct ubifs_info *c, struct shash_desc *log_hash, u8 *hash)
 {
 	SHASH_DESC_ON_STACK(hash_desc, c->hash_tfm);
@@ -569,15 +569,6 @@ static int authenticate_sleb_hash(struct ubifs_info *c, struct shash_desc *log_h
 	return crypto_shash_final(hash_desc, hash);
 }
 
-static int authenticate_sleb_hmac(struct ubifs_info *c, u8 *hash, u8 *hmac)
-{
-	SHASH_DESC_ON_STACK(hmac_desc, c->hmac_tfm);
-
-	hmac_desc->tfm = c->hmac_tfm;
-
-	return crypto_shash_digest(hmac_desc, hash, c->hash_len, hmac);
-}
-
 /**
  * authenticate_sleb - authenticate one scan LEB
  * @c: UBIFS file-system description object
@@ -624,7 +615,8 @@ static int authenticate_sleb(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 			if (err)
 				goto out;
 
-			err = authenticate_sleb_hmac(c, hash, hmac);
+			err = crypto_shash_tfm_digest(c->hmac_tfm, hash,
+						      c->hash_len, hmac);
 			if (err)
 				goto out;
 
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
