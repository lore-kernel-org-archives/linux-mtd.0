Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8ABC61DBE
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Aug 2026 17:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kJmOqOwbVwydX/+t+qO3VRgkVnDwCYk7tTnRbY5Zxlk=; b=eXarS81JwN6tAE
	y06kkn0twOU0RPXwGGOjnSUCZUdnM5hnuhbOiXFRVaD/J0NwcF02FHFEsw3pQLwfX5jlrJGlUnkLW
	NvhNJLAUT1NLiIUfDHyyfNc/PzfIO71hRTAWZkkdGWB957ANmP7JxsccVqW45OUsjHed02s1J/0gX
	Hi01piFyrpt0JtFv6flKZX2cTIjC7MsVd+IxAfQVhnMR2eadiabUnLKW9kQdFY8ZHVuOuSFUtZHXY
	ykujkhFFHloNOHiKre1JuP0CEn68qsgL4e698/5Y1bnz7QYKAGrcs0gPG+iEHfubl48PWF3Pcp3Rt
	t5tgkS+E2viaxip+1cZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0MvG-00000007B9T-3OlW;
	Sat, 29 Aug 2026 17:32:54 +0000
Received: from chamillionaire.breakpoint.cc ([2a0a:51c0:0:237:300::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0MvE-00000007B95-1ACX
	for linux-mtd@lists.infradead.org;
	Sat, 29 Aug 2026 17:32:53 +0000
Date: Sat, 29 Aug 2026 19:32:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025; t=1788024766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=pKsiLQ5ueIA6Dt9B3FPZ4zfn0M3PCOG0cvKYMsEpWJ0=;
	b=DMRTC2t8rBYHB8v1niCu+u4DI/t0Rnq9Vlh94JUSmHdBmUdXSeOiNfBwOHjLfsWg/jE399
	yafaSpaCvTH0iyqSmp3y6QQVXrrRoUCYqUw3HSmW6zYr+LCZSGYYm+k2wigDhiHe9jh8R3
	t4emaMXvst/s5GlT5XuLSlRCy8uf3Xy6CyjJQivXTBPNzfcYMNwyW6gNaYCgXhUgB1rFk1
	v5N7wD3Xjer5JCzM3/ewhieyhMrJQNCtC/tc7kJjboAAlTPXZr8Wgdfvv74XS+CrrZ62wH
	NBx/fiNcr06+QqWrBI3X0WSxPJcXLrswMWGI4TKLOgrDLbyZsLJj9o9bMHM4+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025e; t=1788024766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=pKsiLQ5ueIA6Dt9B3FPZ4zfn0M3PCOG0cvKYMsEpWJ0=;
	b=4pSC2pAipea06WGECOqEAjpkvchy8qwF9QHxT3EdcIRnaaZIaEpXB9v4Pg4zECtaW9hS1D
	Rn4ESkhDKVvDFUAA==
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH] ubifs-utils: Don't compile engine support if not available
Message-ID: <20260829173245.5-tFbtxE@breakpoint.cc>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_103252_515539_B570226E 
X-CRM114-Status: UNSURE (   9.11  )
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

OpenSSL 4.0 dropped engine support which was deprecated since 3.0. The
replacement is the "providers" API.

Add an ifndef OPENSSL_NO_ENGINE around the engine code so it can be left
out where it is not supported.

Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
---
 ubifs-utils/common/sign.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/ubifs-utils/common/sign.c b/ubifs-utils/common/sign.c
index 032a6acc045d..5f94c0ad176f 100644
--- a/ubifs-utils/common/sign.c
+++ b/ubifs-utils/common/sign.c
@@ -23,11 +23,14 @@
 #include <openssl/bio.h>
 #include <openssl/pem.h>
 #include <openssl/err.h>
-#include <openssl/engine.h>
 #include <openssl/cms.h>
 #include <openssl/conf.h>
 #include <err.h>
 
+#ifndef OPENSSL_NO_ENGINE
+#include <openssl/engine.h>
+#endif
+
 #include "linux_types.h"
 #include "sign.h"
 #include "ubifs.h"
@@ -139,6 +142,7 @@ static EVP_PKEY *read_private_key(const char *private_key_name, X509 **cert)
 	*cert = NULL;
 
 	if (!strncmp(private_key_name, "pkcs11:", 7)) {
+#ifndef OPENSSL_NO_ENGINE
 		ENGINE *e;
 		struct {
 			const char *url;
@@ -177,6 +181,10 @@ static EVP_PKEY *read_private_key(const char *private_key_name, X509 **cert)
 		}
 		*cert = parms.cert;
 		fprintf(stderr, "Using cert %p\n", *cert);
+#else
+		ssl_err_msg("PKCS#11 ENGINE support not available.");
+		return NULL;
+#endif
 	} else {
 		BIO *b;
 
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
