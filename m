Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9C460A3808
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 17:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BTvVlfGv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ntNyIf3q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Unsubscribe-Post:List-Owner;
	bh=RlDSQCBm5z54LT0AxP1prCYqWPCjTbUMcPodoxN3NUk=; b=BTvVlfGvbJ4REfXRGhAPJdHupy
	BxHZlLaM9fo7x6IfBTEn6h415bNTQqpMfqc1SyKne+tfmozXReoteUz63ZsVdOFLSkgSNtqEsxipU
	LGzoAjeWxCNbIuBxGtgJFpEUIu9cblmF3k/9YqhlPjzlOAEh82N5tT5yrT/Mx4DseZXoYgVTmYuwG
	osN880ykInrSOLTYsWCzqX4NQigAOkaRaDWa6wcB2KjOGYRYW0Xt6LPZfwEFkaOBpD5s2YAVH9fMD
	bHrVdD+Xy0t/0fyqehI2JAfncKiz7/W0JZ6l/GuC3xTkAwVX0e+F61vAfSAW9YvgfdukKyp2GXcFD
	YuKMbEtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5ZF-0000000CmJT-0Tjc;
	Thu, 19 Nov 2026 17:05:01 +0000
Received: from mail-dy1-x1346.google.com ([2607:f8b0:4864:20::1346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5ZD-0000000CmIJ-1Ec6
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 17:05:00 +0000
Received: by mail-dy1-x1346.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3036885eec.1
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 09:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107898; x=1795712698; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pMZy3TbZeKRiv/Z66UeJUGYrCokU2I/q0uQ2VQCNBe0=;
        b=ntNyIf3qgSD0ol6f3Fop90o7YNJu1N28axyN8REgmo+TfpsidyeT8tq6czTES4kAoV
         NkbI2Vnfgv6xwP0cp9k3eyBob7VCXkD8dyKzMoAYvs2M3fzNppVhwWRcGnuyrGIZhaIE
         oo2HoetJrnMloG7z24TT5e8X//PzoPvWTfX6OPVJpxExuUsd54m4TPeKid5MgnT7ObQ2
         5MZeAQsGogJpkVhST/VOAgtE3MhTRTR9ZsMj4uiJ0BuicprlUk5TqrtuEKuWT7m9QzqS
         90cHArI4hmUTF99ScexjJpvW205p6bcQXujettCwErZTbhKiOfPWtispSC29CAquRtet
         yoSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107898; x=1795712698;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMZy3TbZeKRiv/Z66UeJUGYrCokU2I/q0uQ2VQCNBe0=;
        b=r7AzELEzXtTs6jVz0cDSvxI8DoOXxxWLP5952LsLa8G0Dq98REYhK6Gn9d2M4bNJOM
         2xezGcHZ3htnTfLO374Hqrq7sPwZFEbG2BOXyGD4NjIYeMciaC5gr9bqxUTOJGTGjXRa
         rSDs6ezdeMYOFBIbAtoQt2fUdgipwHSGICQBDOEaShUqqKKKKC1xss8qTVQKZ19udOvP
         v68d6gqGajJcnnqOZT02LZxrXIFbfLA5ggV949wpzn56SlUBdq4GSVcXAUEP7EQ7El6u
         apiVL3386ikUusy+/c7y7qMinG/3XvKu6tPgWvtAoC/rS5p4KYfRqw8/DOlBOwmRUs9Z
         9c1A==
X-Forwarded-Encrypted: i=1; AL+hErG2oB9cbRPyfl9zADmCU8Zu9o0VFsq5+LWe+TGAvY48WGicoRfJtYIatQejkj5Tk1GchQARtE8GlCc=@lists.infradead.org
X-Gm-Message-State: APuU4Z8lJUN0El+Oc73hPiVgaSUv3FjiYepDJlzG6NykHp2EKMpsGUdD
	kA85kUvW5jjyUp4b00yOSVnL926zOogWqQwNrFXpG5qqIscsv3TjcCjgwvXiA8oQzqwHPWV1pUL
	XDHjlEnFqlQ==
X-Received: from dycui7.prod.google.com ([2002:a05:693c:6007:b0:383:6d6a:6b7a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:106:b0:36a:180f:3154
 with SMTP id 5a478bee46e88-38280171c18mr5988373eec.18.1795107897686; Thu, 19
 Nov 2026 09:04:57 -0800 (PST)
Date: Thu, 19 Nov 2026 09:04:54 -0800
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170455.1514058-1-irogers@google.com>
Subject: [PATCH] ubifs: widen compr_type bitfields and guard uncompiled compressors
From: Ian Rogers <irogers@google.com>
To: Richard Weinberger <richard@nod.at>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_090459_339786_A33A745B 
X-CRM114-Status: GOOD (  19.73  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit eeabb9866e4c ("ubifs: Add support for zstd compression.") added
UBIFS_COMPR_ZSTD (3), raising UBIFS_COMPR_TYPES_CNT to 4. However,
compr_type in struct ubifs_inode and struct ubifs_mount_opts, as well as
default_compr in struct ubifs_info and struct ubifs_fs_context, remained
2-bit unsigned bitfields (0..3). Because ubifs_read_superblock() and
ubifs_iget() store 16-bit on-flash __le16 compressor IDs into those 2-bit
bitfields before validate_sb() and validate_inode() check
'>= UBIFS_COMPR_TYPES_CNT', out-of-range on-flash compressor IDs silently
wrap modulo 4 and render both validation checks dead code.

In addition, when an inode uses a valid compressor that is disabled in
Kconfig (!compr->capi_name, compr->cc == NULL), validate_inode() only
logs a warning and allows the inode to be opened, but
ubifs_compress_common() lacks ubifs_decompress_common()'s !compr->capi_name
check and passes NULL compr->cc into crypto_acomp_compress() on write.

Widen all four compression-type bitfields from 2 bits to 16 bits to match
the __le16 on-flash fields (fitting within existing 32-bit bitfield groups
without increasing any structure size), update the BUILD_BUG_ON() in
ubifs_init(), and fall back to uncompressed data with a warning in
ubifs_compress_common() if compr_type is invalid or not compiled in.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wtautological-value-range-compare enabled; fix and changelog drafted with
an AI coding assistant. Verified with a standalone C bitfield/layout test
and build-tested across fs/ubifs/ under LLVM=1 W=1 and
-Wtautological-value-range-compare; not runtime-tested on a mounted UBIFS
volume.

Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Fixes: eeabb9866e4c ("ubifs: Add support for zstd compression.")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 fs/ubifs/compress.c | 26 ++++++++++++++++++++------
 fs/ubifs/super.c    | 11 ++++++-----
 fs/ubifs/ubifs.h    |  6 +++---
 3 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/fs/ubifs/compress.c b/fs/ubifs/compress.c
index 059a02691edd..c5c21d30d846 100644
--- a/fs/ubifs/compress.c
+++ b/fs/ubifs/compress.c
@@ -73,11 +73,12 @@ static struct ubifs_compressor zstd_compr = {
 /* All UBIFS compressors */
 struct ubifs_compressor *ubifs_compressors[UBIFS_COMPR_TYPES_CNT];
 
-static void ubifs_compress_common(int *compr_type, union ubifs_in_ptr in_ptr,
-				  size_t in_offset, int in_len, bool in_folio,
-				  void *out_buf, int *out_len)
+static void ubifs_compress_common(const struct ubifs_info *c, int *compr_type,
+				  union ubifs_in_ptr in_ptr, size_t in_offset,
+				  int in_len, bool in_folio, void *out_buf,
+				  int *out_len)
 {
-	struct ubifs_compressor *compr = ubifs_compressors[*compr_type];
+	struct ubifs_compressor *compr;
 	int dlen = *out_len;
 	int err;
 
@@ -88,6 +89,19 @@ static void ubifs_compress_common(int *compr_type, union ubifs_in_ptr in_ptr,
 	if (in_len < UBIFS_MIN_COMPR_LEN)
 		goto no_compr;
 
+	if (unlikely(*compr_type < 0 || *compr_type >= UBIFS_COMPR_TYPES_CNT)) {
+		ubifs_warn(c, "invalid compression type %d, leave data uncompressed",
+			   *compr_type);
+		goto no_compr;
+	}
+
+	compr = ubifs_compressors[*compr_type];
+	if (unlikely(!compr->capi_name)) {
+		ubifs_warn(c, "%s compression is not compiled in, leave data uncompressed",
+			   compr->name);
+		goto no_compr;
+	}
+
 	dlen = min(dlen, in_len - UBIFS_MIN_COMPRESS_DIFF);
 
 	do {
@@ -154,7 +168,7 @@ void ubifs_compress(const struct ubifs_info *c, const void *in_buf,
 {
 	union ubifs_in_ptr in_ptr = { .buf = in_buf };
 
-	ubifs_compress_common(compr_type, in_ptr, 0, in_len, false,
+	ubifs_compress_common(c, compr_type, in_ptr, 0, in_len, false,
 			      out_buf, out_len);
 }
 
@@ -184,7 +198,7 @@ void ubifs_compress_folio(const struct ubifs_info *c, struct folio *in_folio,
 {
 	union ubifs_in_ptr in_ptr = { .folio = in_folio };
 
-	ubifs_compress_common(compr_type, in_ptr, in_offset, in_len, true,
+	ubifs_compress_common(c, compr_type, in_ptr, in_offset, in_len, true,
 			      out_buf, out_len);
 }
 
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 38972786817e..cca1b459d978 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1019,7 +1019,7 @@ struct ubifs_fs_context {
 	char *auth_hash_name;
 	unsigned int no_chk_data_crc:1;
 	unsigned int bulk_read:1;
-	unsigned int default_compr:2;
+	unsigned int default_compr:16;
 	unsigned int assert_action:2;
 };
 
@@ -2424,12 +2424,13 @@ static int __init ubifs_init(void)
 	BUILD_BUG_ON(UBIFS_REF_NODE_SZ != 64);
 
 	/*
-	 * We use 2 bit wide bit-fields to store compression type, which should
-	 * be amended if more compressors are added. The bit-fields are:
+	 * We use 16 bit wide bit-fields to store compression type, matching
+	 * the 16-bit on-flash fields. The bit-fields are:
 	 * @compr_type in 'struct ubifs_inode', @default_compr in
-	 * 'struct ubifs_info' and @compr_type in 'struct ubifs_mount_opts'.
+	 * 'struct ubifs_info' and 'struct ubifs_fs_context', and @compr_type
+	 * in 'struct ubifs_mount_opts'.
 	 */
-	BUILD_BUG_ON(UBIFS_COMPR_TYPES_CNT > 4);
+	BUILD_BUG_ON(UBIFS_COMPR_TYPES_CNT > (1 << 16));
 
 	/*
 	 * We require that PAGE_SIZE is greater-than-or-equal-to
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index b85b45a0564b..f2511f866c38 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -406,7 +406,7 @@ struct ubifs_inode {
 	unsigned int dirty:1;
 	unsigned int xattr:1;
 	unsigned int bulk_read:1;
-	unsigned int compr_type:2;
+	unsigned int compr_type:16;
 	struct mutex ui_mutex;
 	struct rw_semaphore xattr_sem;
 	spinlock_t ui_lock;
@@ -948,7 +948,7 @@ struct ubifs_mount_opts {
 	unsigned int bulk_read:2;
 	unsigned int chk_data_crc:2;
 	unsigned int override_compr:1;
-	unsigned int compr_type:2;
+	unsigned int compr_type:16;
 };
 
 /**
@@ -1311,7 +1311,7 @@ struct ubifs_info {
 	unsigned int encrypted:1;
 	unsigned int no_chk_data_crc:1;
 	unsigned int bulk_read:1;
-	unsigned int default_compr:2;
+	unsigned int default_compr:16;
 	unsigned int rw_incompat:1;
 	unsigned int assert_action:2;
 	unsigned int authenticated:1;
-- 
2.56.1.708.g77570a6a1d-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
