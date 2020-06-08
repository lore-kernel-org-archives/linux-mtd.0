Return-Path: <SRS0=yUT7=7V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7B6C433E1
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jun 2020 23:26:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8456F20775
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jun 2020 23:26:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KtOWjuVy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJ6pKdvV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8456F20775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJrGqVPWQqxb9u9FhfD1LCIOVxxThPwpmfKsEKSM+LE=; b=KtOWjuVyQpMyZP
	dM7q3HojCFhcXdILJI2VIFYxQXYA9iIcJclfXJvmGzIaoHgfakU3XKPOezlZI9qcQXOKwMIlHqr0p
	p0q8n10Rjz7eG29TqFyW7fsTtgb8uGL8i5ZqW+RXPzPpBlzfjK5uCsab5U2IfMGvqnnmW6eNOuiCG
	0cnd/guPdLibFgXaYyw/jnD2JGbE3HoOTs9Tfmuv9fP1rezwrWTPwFGlBJayIMrD2M/MuDJtNyqMw
	0ICeFuMyqJskb1cIzc0RuMihhiMi5S1lSHp8Rj2qEBrztAMHDwYfSA9SDUzh4XeK0h7Y+b/57m99u
	5RfQyzALlsniDku9UtgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiR9n-0007LF-K4; Mon, 08 Jun 2020 23:26:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiQxp-00077Y-90
 for linux-mtd@lists.infradead.org; Mon, 08 Jun 2020 23:13:59 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5AB6C21527;
 Mon,  8 Jun 2020 23:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658036;
 bh=AOqm3Fgp/+ECFDkKYPL67fC7r9lGY6j3IklwCRudwTk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gJ6pKdvVbrVwu8aiArkJ8OjSufGr4VyO5H+DAOhN3XZCIoZQvu5xXh7qMoa43xIzq
 chdA/Q7iUmEWHhOYNcenhFgEzkhf+9HeVqhk+sUhZehSTH60kNGf1O/IgFnkF4sV+U
 R6/52VlN9rc0bUb+4xZpO8fCAp6z1pK0XHIbsGWM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 086/606] ubifs: fix wrong use of
 crypto_shash_descsize()
Date: Mon,  8 Jun 2020 19:03:31 -0400
Message-Id: <20200608231211.3363633-86-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_161357_494691_225DB64F 
X-CRM114-Status: GOOD (  13.50  )
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
Cc: Sasha Levin <sashal@kernel.org>, Richard Weinberger <richard@nod.at>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

[ Upstream commit 3c3c32f85b6cc05e5db78693457deff03ac0f434 ]

crypto_shash_descsize() returns the size of the shash_desc context
needed to compute the hash, not the size of the hash itself.

crypto_shash_digestsize() would be correct, or alternatively using
c->hash_len and c->hmac_desc_len which already store the correct values.
But actually it's simpler to just use stack arrays, so do that instead.

Fixes: 49525e5eecca ("ubifs: Add helper functions for authentication support")
Fixes: da8ef65f9573 ("ubifs: Authenticate replayed journal")
Cc: <stable@vger.kernel.org> # v4.20+
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Eric Biggers <ebiggers@google.com>
Acked-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ubifs/auth.c   | 17 ++++-------------
 fs/ubifs/replay.c | 13 ++-----------
 2 files changed, 6 insertions(+), 24 deletions(-)

diff --git a/fs/ubifs/auth.c b/fs/ubifs/auth.c
index 8cdbd53d780c..f985a3fbbb36 100644
--- a/fs/ubifs/auth.c
+++ b/fs/ubifs/auth.c
@@ -79,13 +79,9 @@ int ubifs_prepare_auth_node(struct ubifs_info *c, void *node,
 			     struct shash_desc *inhash)
 {
 	struct ubifs_auth_node *auth = node;
-	u8 *hash;
+	u8 hash[UBIFS_HASH_ARR_SZ];
 	int err;
 
-	hash = kmalloc(crypto_shash_descsize(c->hash_tfm), GFP_NOFS);
-	if (!hash)
-		return -ENOMEM;
-
 	{
 		SHASH_DESC_ON_STACK(hash_desc, c->hash_tfm);
 
@@ -94,21 +90,16 @@ int ubifs_prepare_auth_node(struct ubifs_info *c, void *node,
 
 		err = crypto_shash_final(hash_desc, hash);
 		if (err)
-			goto out;
+			return err;
 	}
 
 	err = ubifs_hash_calc_hmac(c, hash, auth->hmac);
 	if (err)
-		goto out;
+		return err;
 
 	auth->ch.node_type = UBIFS_AUTH_NODE;
 	ubifs_prepare_node(c, auth, ubifs_auth_node_sz(c), 0);
-
-	err = 0;
-out:
-	kfree(hash);
-
-	return err;
+	return 0;
 }
 
 static struct shash_desc *ubifs_get_desc(const struct ubifs_info *c,
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index b28ac4dfb407..01fcf7975047 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -601,18 +601,12 @@ static int authenticate_sleb(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 	struct ubifs_scan_node *snod;
 	int n_nodes = 0;
 	int err;
-	u8 *hash, *hmac;
+	u8 hash[UBIFS_HASH_ARR_SZ];
+	u8 hmac[UBIFS_HMAC_ARR_SZ];
 
 	if (!ubifs_authenticated(c))
 		return sleb->nodes_cnt;
 
-	hash = kmalloc(crypto_shash_descsize(c->hash_tfm), GFP_NOFS);
-	hmac = kmalloc(c->hmac_desc_len, GFP_NOFS);
-	if (!hash || !hmac) {
-		err = -ENOMEM;
-		goto out;
-	}
-
 	list_for_each_entry(snod, &sleb->nodes, list) {
 
 		n_nodes++;
@@ -662,9 +656,6 @@ static int authenticate_sleb(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 		err = 0;
 	}
 out:
-	kfree(hash);
-	kfree(hmac);
-
 	return err ? err : n_nodes - n_not_auth;
 }
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
