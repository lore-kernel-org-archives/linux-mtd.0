Return-Path: <SRS0=9tRn=TP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0281C04E53
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 21:02:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD6432082E
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 21:02:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X46Eix+r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JyJ5Sdeb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD6432082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=T+9msxfwixLbXbOEoP3rsEJUq0NtrXMEfWdVzCHHY0c=; b=X46
	Eix+rv5FQNQkMemExkXGvxEGUBuoyYRi4LaiexaZ8JyW/cM1L+CAFohH1oIKZXvJbW4Ca/vPz5INn
	o8ZrGrlED2iVfJ1tyCMs+FA+7sNxHlFY2eIE9vAOfDDdm4gEpIThgY5zsjHfZWupLGuNsMaujMyYU
	1wAuc731K0WQ+OqC6mAH+HIzn/9bPg2poMyZcKC2aF6aslYmPAp79l2vufQwwSdMA1+WMfHa6XkVG
	1Cg3g/bjptH4uznWrBly4ZxBJDYgW7nZ2jFlZo5YSG+KRBe11d5/d8KkgcBIJSrr1v13RfAHAVmIj
	VeTZSGbCriSOPaFnspYnpniCQDRdF+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hR13C-0004kP-15; Wed, 15 May 2019 21:02:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hR136-0004k7-Ou
 for linux-mtd@bombadil.infradead.org; Wed, 15 May 2019 21:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DcxUgo7mG/77q9GUDpYI0PFKtC9xt5nrqqNq2fqMZLo=; b=JyJ5SdebpPAdD1y5ClvWAhMGJ
 4vPNw09O0c5Vn9IpLElUYmr2zF9fAMpjoZvzbEIK508fSAfG03XdnkzbrzMGyY3jsIl1qpSR7o0HN
 AIIf2Lqu0FOUNN9GMJvhPPGHNdu5w/v7VLOEbl4fwqixZ48fhEUhY5HrVabwIbGzhAzxgLqlInmNl
 GwScLHWv24m6tSollTCclbtD1asoQi1lcc6w7Z0PyCbzegXhCN5pOrkdE52lYAEJxG/lj4b/FcuT2
 XgIjYojsYcTrTzArJGz7nhPoXvq+4P3dEcl9o5Wi6CCfs7cHUOXbG2vRDwntwWQ5qbGqNXtt9kDlL
 jgApfW5Dw==;
Received: from lilium.sigma-star.at ([109.75.188.150])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hR133-0005wB-1M
 for linux-mtd@lists.infradead.org; Wed, 15 May 2019 21:02:51 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 48EB71801442B;
 Wed, 15 May 2019 23:02:11 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: Add support for zstd compression.
Date: Wed, 15 May 2019 23:02:02 +0200
Message-Id: <20190515210202.21169-1-richard@nod.at>
X-Mailer: git-send-email 2.16.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_220249_162000_A597F12E 
X-CRM114-Status: GOOD (  16.62  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
 linux-kernel@vger.kernel.org, Michele Dionisio <michele.dionisio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Michele Dionisio <michele.dionisio@gmail.com>

zstd shows a good compression rate and is faster than lzo,
also on slow ARM cores.

Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Signed-off-by: Michele Dionisio <michele.dionisio@gmail.com>
[rw: rewrote commit message]
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/Kconfig       | 10 ++++++++++
 fs/ubifs/compress.c    | 27 ++++++++++++++++++++++++++-
 fs/ubifs/super.c       |  2 ++
 fs/ubifs/ubifs-media.h |  2 ++
 4 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index 9da2f135121b..8d84d2ed096d 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -5,8 +5,10 @@ config UBIFS_FS
 	select CRYPTO if UBIFS_FS_ADVANCED_COMPR
 	select CRYPTO if UBIFS_FS_LZO
 	select CRYPTO if UBIFS_FS_ZLIB
+	select CRYPTO if UBIFS_FS_ZSTD
 	select CRYPTO_LZO if UBIFS_FS_LZO
 	select CRYPTO_DEFLATE if UBIFS_FS_ZLIB
+	select CRYPTO_ZSTD if UBIFS_FS_ZSTD
 	select CRYPTO_HASH_INFO
 	select UBIFS_FS_XATTR if FS_ENCRYPTION
 	depends on MTD_UBI
@@ -37,6 +39,14 @@ config UBIFS_FS_ZLIB
 	help
 	  Zlib compresses better than LZO but it is slower. Say 'Y' if unsure.
 
+config UBIFS_FS_ZSTD
+	bool "ZSTD compression support" if UBIFS_FS_ADVANCED_COMPR
+	depends on UBIFS_FS
+	default y
+	help
+	  ZSTD compresses is a big win in speed over Zlib and
+	  in compression ratio over LZO. Say 'Y' if unsure.
+
 config UBIFS_ATIME_SUPPORT
 	bool "Access time support"
 	default n
diff --git a/fs/ubifs/compress.c b/fs/ubifs/compress.c
index 565cb56d7225..89183aeeeb7a 100644
--- a/fs/ubifs/compress.c
+++ b/fs/ubifs/compress.c
@@ -71,6 +71,24 @@ static struct ubifs_compressor zlib_compr = {
 };
 #endif
 
+#ifdef CONFIG_UBIFS_FS_ZSTD
+static DEFINE_MUTEX(zstd_enc_mutex);
+static DEFINE_MUTEX(zstd_dec_mutex);
+
+static struct ubifs_compressor zstd_compr = {
+	.compr_type = UBIFS_COMPR_ZSTD,
+	.comp_mutex = &zstd_enc_mutex,
+	.decomp_mutex = &zstd_dec_mutex,
+	.name = "zstd",
+	.capi_name = "zstd",
+};
+#else
+static struct ubifs_compressor zstd_compr = {
+	.compr_type = UBIFS_COMPR_ZSTD,
+	.name = "zstd",
+};
+#endif
+
 /* All UBIFS compressors */
 struct ubifs_compressor *ubifs_compressors[UBIFS_COMPR_TYPES_CNT];
 
@@ -228,13 +246,19 @@ int __init ubifs_compressors_init(void)
 	if (err)
 		return err;
 
-	err = compr_init(&zlib_compr);
+	err = compr_init(&zstd_compr);
 	if (err)
 		goto out_lzo;
 
+	err = compr_init(&zlib_compr);
+	if (err)
+		goto out_zstd;
+
 	ubifs_compressors[UBIFS_COMPR_NONE] = &none_compr;
 	return 0;
 
+out_zstd:
+	compr_exit(&zstd_compr);
 out_lzo:
 	compr_exit(&lzo_compr);
 	return err;
@@ -247,4 +271,5 @@ void ubifs_compressors_exit(void)
 {
 	compr_exit(&lzo_compr);
 	compr_exit(&zlib_compr);
+	compr_exit(&zstd_compr);
 }
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 04b8ecfd3470..ea8615261936 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1055,6 +1055,8 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
 				c->mount_opts.compr_type = UBIFS_COMPR_LZO;
 			else if (!strcmp(name, "zlib"))
 				c->mount_opts.compr_type = UBIFS_COMPR_ZLIB;
+			else if (!strcmp(name, "zstd"))
+				c->mount_opts.compr_type = UBIFS_COMPR_ZSTD;
 			else {
 				ubifs_err(c, "unknown compressor \"%s\"", name); //FIXME: is c ready?
 				kfree(name);
diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
index 8b7c1844014f..697b1b89066a 100644
--- a/fs/ubifs/ubifs-media.h
+++ b/fs/ubifs/ubifs-media.h
@@ -348,12 +348,14 @@ enum {
  * UBIFS_COMPR_NONE: no compression
  * UBIFS_COMPR_LZO: LZO compression
  * UBIFS_COMPR_ZLIB: ZLIB compression
+ * UBIFS_COMPR_ZSTD: ZSTD compression
  * UBIFS_COMPR_TYPES_CNT: count of supported compression types
  */
 enum {
 	UBIFS_COMPR_NONE,
 	UBIFS_COMPR_LZO,
 	UBIFS_COMPR_ZLIB,
+	UBIFS_COMPR_ZSTD,
 	UBIFS_COMPR_TYPES_CNT,
 };
 
-- 
2.16.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
