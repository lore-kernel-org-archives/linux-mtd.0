Return-Path: <SRS0=mo6j=BD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384E8C433E1
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2020 07:56:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8F172068F
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2020 07:56:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xzxl2XsA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="L0lLNwfr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iSYQcKAz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8F172068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wLezF99uZTP3xRdg8Jq/g2/BVw7g/gTfJFPK8+MGK2Q=; b=xzxl2XsAYGAom/br6kFaYncnXV
	IiqV7f0lhXcFo0cD/L9UFIKklBlJ7VzG/QrEu4qhghjsy7GlcfHOAATFhLy5foltjthI5BUi+06NE
	MN0gzm3qEDh+feJI/H+o0+aUfk9X8gFf1TgM2LuH1QlwBNiUFZBhqe95WpmaZ40Jr9PfvgP71vl20
	Zwi2BlhYj1uBdNqC5eZQHdDG5p6W6gHuVa5BVMEP8YP2ZzhKoHzRjn7sgvDkuqmeM5sB+VaOM13IH
	cRRNWBuICtbznSi64ek/lSJpxcT9z6wc66tN+Z28WnJmOJSSYQvLAOCZLFaJiAk8jgjIv8Groiaop
	jqfJCniQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysYM-0000QR-V4; Fri, 24 Jul 2020 07:55:38 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jysQq-00058H-Cr
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2020 07:47:53 +0000
From: bage@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1595576869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=I2Fs/8kPmao+iOhhWE74/bW5l2byh8ZOlHSvD5gwGGE=;
 b=L0lLNwfrdMGGgMFKE3r4FgI9L9PDNe6LVNgh+IOb5CEV8zfmjJtZAATiMnu3Sm93EqiTzd
 IDfxhljc0XEnh4ZC/05M+JVvqbNRZqynikBBnAzDps0R/MQO8IcNdxYkaEfgXM7V49GCXX
 F4MSKdo9zUzCKnc6P4mYAIH05u3OCrTCDodG9vvZKPdlS41S1I+pH4ZkMN6EpF+QpnTnza
 nQErWcdb7PFZtcHysAXDch9G3mvg2rmpBR2gMrHz/NCEpP9UH/JtZnRVjLge0H2xwGZt4I
 k6fkyr0veB7JRBzRi+D9rX4MAeAnWDrKLt2Wtkq8cs7pXtwx/3catZurjY6Xjg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1595576869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=I2Fs/8kPmao+iOhhWE74/bW5l2byh8ZOlHSvD5gwGGE=;
 b=iSYQcKAzcFdkX2ukD+D09xepjv+WBwwDFfevc5w4LovUpwNdxWA3sxaAJOqxxL3K7Auv2z
 Zzba1Hgcn/gQ6lCw==
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mkfs.ubifs: remove OPENSSL_no_config()
Date: Fri, 24 Jul 2020 09:47:05 +0200
Message-Id: <20200724074705.6376-1-bage@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_034752_631953_AF49F196 
X-CRM114-Status: UNSURE (   5.28  )
X-CRM114-Notice: Please train this message.
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
Cc: Bastian Germann <bage@linutronix.de>,
 Torben Hohn <torben.hohn@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Torben Hohn <torben.hohn@linutronix.de>

Especially for the pkcs11 engine, a configuration is required
because the provider has to be configured.

Its not clear why OPENSSL_no_config() is called.

Remove OPENSSL_no_config() and call OPENSSL_config(NULL)
instead.

Signed-off-by: Torben Hohn <torben.hohn@linutronix.de>
Signed-off-by: Bastian Germann <bage@linutronix.de>
---
 ubifs-utils/mkfs.ubifs/sign.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ubifs-utils/mkfs.ubifs/sign.c b/ubifs-utils/mkfs.ubifs/sign.c
index b7ad7ef..7f284f8 100644
--- a/ubifs-utils/mkfs.ubifs/sign.c
+++ b/ubifs-utils/mkfs.ubifs/sign.c
@@ -388,7 +388,8 @@ int init_authentication(void)
 	if (!c->hash_algo_name)
 		return err_msg("Hash algorithm not given (--hash-algo)");
 
-	OPENSSL_no_config();
+	OPENSSL_config(NULL);
+
 	OpenSSL_add_all_algorithms();
 	ERR_load_crypto_strings();
 
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
