Return-Path: <SRS0=ONRD=TU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4133BC04AAC
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 16:30:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3EC320815
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 16:30:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pq/B4nGZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHW4B9x7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3EC320815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H16PuZIbXpYRHmvx++xWfjVZxK+Lt4i75wRdO9kWVBs=; b=Pq/B4nGZf5x36T
	Q5cmar1D5bMj5oJARqZ0hPNSxCWSWiCkNs3Yd0hD6qtjvnoKemG3C5xFQefVPTv0kY7+Yhhku0WWR
	eG3blLDcTRBbyEKBdBnj8oH2gbbpLqy4j9c+L3ZA6h9hbzeVYPHuxdGoXnftmfvJ4ztyrHUt06fZi
	OyzTOiqTcUr/3LsHsOZd+n/5BaUljWmzQzm+9n6KxSc74LB2pZ4wKb5i08QHyBpdPpdncd2btdmtI
	jSXHFQ6SHvyIt7h+/Db4NYwNap9uskhFq5RCQIRHX7Xg6lQ3MFrioUFb5rT3fUbQzV7/yfbU1gbjS
	llcF9XpxoM5DtfrzfB1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSlBV-0003b6-F4; Mon, 20 May 2019 16:30:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSlB7-00033v-TD
 for linux-mtd@lists.infradead.org; Mon, 20 May 2019 16:30:24 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76B6A21721;
 Mon, 20 May 2019 16:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558369821;
 bh=XtXrJbffquLpHwtOpoiOVw/HH3tmVMU+GtpKaJDAspg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GHW4B9x7m3ZWBkOgpMwb5OP/nzyIPNmPuX/CqDCRwzqahKES9jD0BvdK2Qn1Rnhei
 fZhojbcoezA7K8IDMn3+ZvDpLoPcEGTgklnC5mhnC/QmVqknQ9TdAZ6YtZ8+60tvLc
 0MzpUgCuqHIU7JDRfKRayIfjS1I9Cn2o6KNn9L7w=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v2 02/14] fscrypt: remove the "write" part of struct
 fscrypt_ctx
Date: Mon, 20 May 2019 09:29:40 -0700
Message-Id: <20190520162952.156212-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190520162952.156212-1-ebiggers@kernel.org>
References: <20190520162952.156212-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_093021_987219_70E0BBFE 
X-CRM114-Status: GOOD (  12.01  )
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
Cc: linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 Chandan Rajendra <chandan@linux.ibm.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Now that fscrypt_ctx is not used for writes, remove the 'w' fields.

Reviewed-by: Chandan Rajendra <chandan@linux.ibm.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/bio.c         | 11 +++++------
 fs/crypto/crypto.c      | 14 +++++++-------
 include/linux/fscrypt.h |  7 ++-----
 3 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index c857b70b5328c..c534253483874 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -53,9 +53,8 @@ EXPORT_SYMBOL(fscrypt_decrypt_bio);
 
 static void completion_pages(struct work_struct *work)
 {
-	struct fscrypt_ctx *ctx =
-		container_of(work, struct fscrypt_ctx, r.work);
-	struct bio *bio = ctx->r.bio;
+	struct fscrypt_ctx *ctx = container_of(work, struct fscrypt_ctx, work);
+	struct bio *bio = ctx->bio;
 
 	__fscrypt_decrypt_bio(bio, true);
 	fscrypt_release_ctx(ctx);
@@ -64,9 +63,9 @@ static void completion_pages(struct work_struct *work)
 
 void fscrypt_enqueue_decrypt_bio(struct fscrypt_ctx *ctx, struct bio *bio)
 {
-	INIT_WORK(&ctx->r.work, completion_pages);
-	ctx->r.bio = bio;
-	fscrypt_enqueue_decrypt_work(&ctx->r.work);
+	INIT_WORK(&ctx->work, completion_pages);
+	ctx->bio = bio;
+	fscrypt_enqueue_decrypt_work(&ctx->work);
 }
 EXPORT_SYMBOL(fscrypt_enqueue_decrypt_bio);
 
diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 4b076f8daab75..ebfa13cfecb7d 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -58,11 +58,11 @@ void fscrypt_enqueue_decrypt_work(struct work_struct *work)
 EXPORT_SYMBOL(fscrypt_enqueue_decrypt_work);
 
 /**
- * fscrypt_release_ctx() - Releases an encryption context
- * @ctx: The encryption context to release.
+ * fscrypt_release_ctx() - Release a decryption context
+ * @ctx: The decryption context to release.
  *
- * If the encryption context was allocated from the pre-allocated pool, returns
- * it to that pool. Else, frees it.
+ * If the decryption context was allocated from the pre-allocated pool, return
+ * it to that pool.  Else, free it.
  */
 void fscrypt_release_ctx(struct fscrypt_ctx *ctx)
 {
@@ -79,12 +79,12 @@ void fscrypt_release_ctx(struct fscrypt_ctx *ctx)
 EXPORT_SYMBOL(fscrypt_release_ctx);
 
 /**
- * fscrypt_get_ctx() - Gets an encryption context
+ * fscrypt_get_ctx() - Get a decryption context
  * @gfp_flags:   The gfp flag for memory allocation
  *
- * Allocates and initializes an encryption context.
+ * Allocate and initialize a decryption context.
  *
- * Return: A new encryption context on success; an ERR_PTR() otherwise.
+ * Return: A new decryption context on success; an ERR_PTR() otherwise.
  */
 struct fscrypt_ctx *fscrypt_get_ctx(gfp_t gfp_flags)
 {
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index d016fa384d607..1c7287f146a98 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -63,16 +63,13 @@ struct fscrypt_operations {
 	unsigned int max_namelen;
 };
 
+/* Decryption work */
 struct fscrypt_ctx {
 	union {
-		struct {
-			struct page *bounce_page;	/* Ciphertext page */
-			struct page *control_page;	/* Original page  */
-		} w;
 		struct {
 			struct bio *bio;
 			struct work_struct work;
-		} r;
+		};
 		struct list_head free_list;	/* Free list */
 	};
 	u8 flags;				/* Flags */
-- 
2.21.0.1020.gf2820cf01a-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
