Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22FEC7115B
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Jun 2025 03:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZSLtfH0f4LQYZ3z/WyeM3Z8VHrILL3bySnQlVIlov3Q=; b=W+iLllyOTR9o3p
	8uWtaeTr6Ahqc/yz+R/0JEPBF1mQ2J+cevX2j8oV3hwWhujRUWSNwaBZahHyckDSj2orb7EXxVEvp
	q5YIWeNcHntfyOL1VHQiBOhexh0CG0PZUVkzKUwRdFM7TdviVV+aQchFOe5jlZF5MOfs828g7RgJS
	HGvZI9PFvEVImDoTrc4Ojrt2FpEjsqfCGbJFSX1hgLb4Yg9uJQapdqXaxx0Jx1iV3NC8Q8RhPRi+I
	ryhL/MRRMwXvjuU+hjdMIh5RnCI/lfIvGXFrPEPHVqWAlZnEwI8lwwoSs5J+CgHwslBxLCx/+KUP6
	XdHaWk4VigRHZW15bz6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSShN-0000000Egao-0KON;
	Fri, 20 Jun 2025 03:45:53 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSSgt-0000000EgZe-2bZe
	for linux-mtd@lists.infradead.org;
	Fri, 20 Jun 2025 03:45:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=FOObGMt2zmekDQSV/9HvR5INLPUOaT9w1VIobsdSqCo=; b=d2wW5oC8+G1KZoeNIL6ZSgywBU
	jjbqjlVzEByPhPYkF1LFfOHFmtjY+RPUOmcCqe45lnunB97YHMQKNaQkCXv7UFseMvrHAQ8zRjf9B
	nVifGhAXNF+xXWxm+GxICDmXrgbHKD76ZYP23MhFuW0Uj8JJLYYWJ+aFpnpjFHqPx8I1LEzRQS/nu
	dtlKBUlXy+QEu0u5enwTVc0g/J9qC6XocSLT68n4K8RB6q/d9xgxSnx0crpKTKxjFpcwDsf4SyS9J
	dLt9FE5qPF3v4rgskM1EiQvN15EnwjIJ2YNsCgZ9/6ys92Mso9vNsvwmSgFOuGBs7e0dXyOpIv/DR
	0nMl/Utw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uSSRJ-000THE-2T;
	Fri, 20 Jun 2025 11:45:06 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 20 Jun 2025 11:45:05 +0800
Date: Fri, 20 Jun 2025 11:45:05 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: Allocate shash export state on stack
Message-ID: <aFTZQb_Biyz9j5Nn@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_204523_661962_FD86C297 
X-CRM114-Status: UNSURE (   5.96  )
X-CRM114-Notice: Please train this message.
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

The output size of crypto_shash_export should be obtained via
crypto_shash_statesize and not crypto_shash_descsize.  The latter
could be too small (but is usually big enough).

However, as state sizes are API-limited, simply allocate it on the
stack.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/fs/ubifs/auth.c b/fs/ubifs/auth.c
index a4a0158f712d..edf012aa51bf 100644
--- a/fs/ubifs/auth.c
+++ b/fs/ubifs/auth.c
@@ -474,13 +474,9 @@ int __ubifs_node_verify_hmac(const struct ubifs_info *c, const void *node,
 int __ubifs_shash_copy_state(const struct ubifs_info *c, struct shash_desc *src,
 			     struct shash_desc *target)
 {
-	u8 *state;
+	u8 state[HASH_MAX_STATESIZE];
 	int err;
 
-	state = kmalloc(crypto_shash_descsize(src->tfm), GFP_NOFS);
-	if (!state)
-		return -ENOMEM;
-
 	err = crypto_shash_export(src, state);
 	if (err)
 		goto out;
@@ -488,8 +484,6 @@ int __ubifs_shash_copy_state(const struct ubifs_info *c, struct shash_desc *src,
 	err = crypto_shash_import(target, state);
 
 out:
-	kfree(state);
-
 	return err;
 }
 
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
