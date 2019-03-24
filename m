Return-Path: <SRS0=La3s=R3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59449C43381
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Mar 2019 19:45:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29BA12133F
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Mar 2019 19:45:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uhQAm14S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29BA12133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UfzNtPSv39TH9vmAcdkLC7SgG2dcpsbgF0vGX5Idr+4=; b=uhQAm14Sj2u2kU
	y6UfW7WauXjK4Tcs5eQasFRz+Fnn3jfPXD206Ioofo+mWyvu0qYelellM4PNtWgHA6v0o23MBjgZM
	CcLEc73I9IXE8BfVk61wr0D0fUT5QCgo0Yf6ynDt1+tUxa+2YGlaFcxyzaRDDsFyTuZwCaoWdeHQ+
	o1XPqd33VF7M4Ed/ry3iMtxAl7P4SbNRXi6DqjGAsSzj0vevVm0MA2wxLjAHrPxgCZmqwU/GokbID
	3gKC+0pG6fHe+DhiFNIxDdaPruEZxWQcIo3F8ha4VawBcx+4odR9dOxp1jyLvyCzRxvDk2wuFb+BR
	Ea+09P1J3Ja/UanfBdEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h893u-0006Un-9C; Sun, 24 Mar 2019 19:45:42 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h893p-0006UA-PK
 for linux-mtd@lists.infradead.org; Sun, 24 Mar 2019 19:45:39 +0000
Received: from wuerfel.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MIx7U-1hRJXC4Aws-00KR5b; Sun, 24 Mar 2019 20:45:09 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Subject: [PATCH] ubifs: work around high stack usage with clang
Date: Sun, 24 Mar 2019 20:44:51 +0100
Message-Id: <20190324194505.3244479-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:YCZ4t4TKytA+xgmmV/ZeoVdXaCcLMykTcd/+MqVgKK9RGQVFZkk
 +k7Pc/E9cLc1rLgM26mCQ2Iroecuntrd+sk+4cID9SU7y4zy8dmcIkiIhBEuMrrXvxclSoB
 JsPFcKWlxMXCh+K17vhnsbena8D2r2Au5wSfQRAaFHlWTjN3EEf4Zt/uTxHTxtdImMcKfZO
 +XqSM09rswT2VTr7OiILg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:l1dFlghIaU4=:8fIJOYjmDOXT2bqE+tL4E0
 VXUgvmJ4S4eKXpgYqbDmTgpgOB32HQo6Ql21y0tLyw2fmC/8BzpYpwDBvKOFklE+NdzDbx7my
 +HNTsKid8rJCFqUwT1CGI4ohiZesGGnOSleQg3XWN3feuqfbvoPpS9Xv55qtzSbPyy1o2vSf5
 gwdClwqQlerzhpcmXLe5EoG2I0fuQQVUhExF84yihpg2xannrn0/XaZypI/qF2GWnTc6BpgVr
 AZHzjSMBHeKdEqXKQzgI+lA3IFIJdisR00yK4MpGsQzOb8kI7s79iR16JpNni5AVK8nDc5TNE
 dx0CsBww1mn3d3bNmvi9mfwpv/WcvDgDUsfHusitDMl9EmchqQI339si/RvRluI6DA6Zl2U2y
 2md1vIi7w1wEoSLNf0YLL/1APxcmdSgiEPJh3NoZqJTiEb0+cx4OJSoAqoq0xmJQSCekbvr7m
 VGL71qsxbvGJyVcfKRAtTg15I4jrA1hhi9NOsD4JsILU6+VJxBfdfK95EOpzFBMf35YvPb5un
 YP2LjLdo/3ksCVDWAZk5kDLq8PcIHq4yEUMAoslO+VQf15bn6MMPmSkDomewWI8bzIVRRtfMt
 2vRMwuB4Y+hm2K9RBOil3SIRVJSBgQzN7xzEQUWAqxTTLPBF8uD70XGfNJA39FKOxPD/NqEia
 GfAvs54Hvq7NvPGCck9ceH8JbeNMJd3AMuiIq4IrjTvy/3F4/Cv4GpHPXj72rfo5pS/X7na4i
 gfn1lWK6Rw676RXAxhnDoK/jMaMRNhucdBjGkQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_124538_127623_539FA0A6 
X-CRM114-Status: GOOD (  14.00  )
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Eric Biggers <ebiggers@google.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, linux-mtd@lists.infradead.org,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Building this file with clang can result in large stack usage as seen from
this warning:

fs/ubifs/auth.c:78:5: error: stack frame size of 1152 bytes in function 'ubifs_prepare_auth_node'

The problem is that inlining ubifs_hash_calc_hmac() leads to
two SHASH_DESC_ON_STACK() blocks in the same function, and clang
for some reason does not reuse the stack space as it should.

Putting the first declaration into a separate basic block avoids
this problem and reduces the stack allocation to 640 bytes.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/ubifs/auth.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/fs/ubifs/auth.c b/fs/ubifs/auth.c
index 5bf5fd08879e..5d3d0b37a908 100644
--- a/fs/ubifs/auth.c
+++ b/fs/ubifs/auth.c
@@ -78,7 +78,6 @@ static int ubifs_hash_calc_hmac(const struct ubifs_info *c, const u8 *hash,
 int ubifs_prepare_auth_node(struct ubifs_info *c, void *node,
 			     struct shash_desc *inhash)
 {
-	SHASH_DESC_ON_STACK(hash_desc, c->hash_tfm);
 	struct ubifs_auth_node *auth = node;
 	u8 *hash;
 	int err;
@@ -87,13 +86,17 @@ int ubifs_prepare_auth_node(struct ubifs_info *c, void *node,
 	if (!hash)
 		return -ENOMEM;
 
-	hash_desc->tfm = c->hash_tfm;
-	hash_desc->flags = CRYPTO_TFM_REQ_MAY_SLEEP;
-	ubifs_shash_copy_state(c, inhash, hash_desc);
+	{
+		SHASH_DESC_ON_STACK(hash_desc, c->hash_tfm);
 
-	err = crypto_shash_final(hash_desc, hash);
-	if (err)
-		goto out;
+		hash_desc->tfm = c->hash_tfm;
+		hash_desc->flags = CRYPTO_TFM_REQ_MAY_SLEEP;
+		ubifs_shash_copy_state(c, inhash, hash_desc);
+
+		err = crypto_shash_final(hash_desc, hash);
+		if (err)
+			goto out;
+	}
 
 	err = ubifs_hash_calc_hmac(c, hash, auth->hmac);
 	if (err)
-- 
2.20.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
