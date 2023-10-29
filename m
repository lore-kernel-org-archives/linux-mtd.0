Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31301C4332F
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Oct 2023 05:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1iUrZYJAN/DzeOXesH51FDTJN7JudTrw7zt3/rY4k/s=; b=xYPQuYna5HeoYN
	43cWhxwPtlgBaxOdLSGv/fPeDJGt8hfGHd+10eS46PVW2Bf+WNjtcq1Spft6mdw938OZ+/ewpbpMs
	kTqrN4CSCpknGY23uuURbgGp57pFkfHZJz9z1KHSW0vmEpbmCspOpfzkpHl2VCtoVUVC52cQRtiax
	KH64/WMw39s1tl+xFfCPL+Dv/1dIjG1nvZ9h9gwnYJl6LSXeok58UCJP9Go3g6istrXJolvy3VKBk
	CuXtcA/xzWwg1zX/lWfiOvSD+3nCb/L03FlYvtK0fR1U043AEnIj9M13cX0SepxBX0Kh/LA4R02tT
	spNWzPfC5BMdVvNFvyHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwxyA-001CJZ-24;
	Sun, 29 Oct 2023 05:04:14 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwxy5-001CJ3-3D
	for linux-mtd@lists.infradead.org;
	Sun, 29 Oct 2023 05:04:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2FA37B8094F;
	Sun, 29 Oct 2023 05:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C751C433C7;
	Sun, 29 Oct 2023 05:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698555845;
	bh=Bd85Pl0HxDFyn+Xmq89TAE0x2+xo8OOJv3Wbz88xxEA=;
	h=From:To:Cc:Subject:Date:From;
	b=Mw1IfVQZiMp5BpDGgUt/tVQwmrsRmtydrP/mY+CD9xI+TnspAOs6HHsaKEdBaB97W
	 Mzm57m4NaWDKJRdDI0Rh65r96MWyM0gFobkYFXPQfYKefodqAvJW9v8saGakPoAakL
	 oFnyVVCqNetSd5falmLFuPW7gD/04tSmozJvE319Wqono21d9mEXhBC0nI5QdQW29Z
	 q6ddAZvkQIiRDqk5JN6tsoRD1uuBxbbDgiBH/3vHXKCUx3rXjyzAyttUET8QsqfdJw
	 fobRnFp1Qwd7gxrvtbgFwk/9+lq1hqCjrRkzUzt3mzFe+/KKsTa2Y7qR+0D2r6W3Cd
	 0q67pUFqmu5yQ==
From: Eric Biggers <ebiggers@kernel.org>
To: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org
Cc: linux-crypto@vger.kernel.org
Subject: [PATCH] ubifs: use crypto_shash_tfm_digest() in ubifs_hmac_wkm()
Date: Sat, 28 Oct 2023 22:03:55 -0700
Message-ID: <20231029050355.154989-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_220410_178070_9B5FD936 
X-CRM114-Status: GOOD (  12.43  )
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

From: Eric Biggers <ebiggers@google.com>

Simplify ubifs_hmac_wkm() by using crypto_shash_tfm_digest() instead of
an alloc+init+update+final sequence.  This should also improve
performance.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ubifs/auth.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/fs/ubifs/auth.c b/fs/ubifs/auth.c
index e564d5ff8781..4add4a4f0720 100644
--- a/fs/ubifs/auth.c
+++ b/fs/ubifs/auth.c
@@ -501,42 +501,27 @@ int __ubifs_shash_copy_state(const struct ubifs_info *c, struct shash_desc *src,
  *
  * This function creates a HMAC of a well known message. This is used
  * to check if the provided key is suitable to authenticate a UBIFS
  * image. This is only a convenience to the user to provide a better
  * error message when the wrong key is provided.
  *
  * This function returns 0 for success or a negative error code otherwise.
  */
 int ubifs_hmac_wkm(struct ubifs_info *c, u8 *hmac)
 {
-	SHASH_DESC_ON_STACK(shash, c->hmac_tfm);
-	int err;
 	const char well_known_message[] = "UBIFS";
 
 	if (!ubifs_authenticated(c))
 		return 0;
 
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
-
-	err = crypto_shash_final(shash, hmac);
-	if (err)
-		return err;
-	return 0;
+	return crypto_shash_tfm_digest(c->hmac_tfm, well_known_message,
+				       sizeof(well_known_message) - 1, hmac);
 }
 
 /*
  * ubifs_hmac_zero - test if a HMAC is zero
  * @c: UBIFS file-system description object
  * @hmac: the HMAC to test
  *
  * This function tests if a HMAC is zero and returns true if it is
  * and false otherwise.
  */

base-commit: 2af9b20dbb39f6ebf9b9b6c090271594627d818e
-- 
2.42.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
