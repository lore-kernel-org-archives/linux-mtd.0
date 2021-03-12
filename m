Return-Path: <SRS0=p7xI=IK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF26C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 09:57:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E209F650BE
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Mar 2021 09:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E209F650BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DlVzGr6YwPoGHJ3o0tDnSevIgDeNbVYvZhSHNYFkSOs=; b=lGfNxskU7I0NzPVkNqXcCytIy6
	QinQgrbsHKbhWOU50hVCuuSG/u32hCWqLj3M+vZ1BmgqBc8f3Qeioj39Yz8tlQE1KpF6r5XuITcJ9
	F9NU68XzKl4RKro0VhJiCxbkIcA61aiUUoKChWwB0m7BlO023DYBJ5a8ABg2J4izgt7okipah1GwO
	p7/YAWL5ruyoITJ01XSQCi9xF5lIBi+w4COxnc8/jciEFZCVqLFWwxH0/vLuq7qll9lKkf3yaGwGI
	t3F7Eu3VKs4ApQQBLVewAF/DWik8Y2dlpQfbqzOGxfPNdIEmLJOKqYDSdEERcdjqkeBrHJyzucV0J
	ek/DcneA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKeXg-00B5rg-2G; Fri, 12 Mar 2021 09:57:12 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKeWo-00B5hi-N5
 for linux-mtd@lists.infradead.org; Fri, 12 Mar 2021 09:56:32 +0000
Received: by mail-qk1-x72e.google.com with SMTP id 130so23600452qkh.11
 for <linux-mtd@lists.infradead.org>; Fri, 12 Mar 2021 01:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bEW1hEWBRM4fMNj0JZKfY5sioaWotGdrzXJcIsKNcQI=;
 b=mo7IUt3K7yGeT9ihyHZ7UxdDum+bcNLfYIll63ctj2rlCeTCYXvHLMEfEprLcs0ZG7
 PoqU0anbg9cpt9KwsRSTYCgNPBuA3n0EhmLxP/xgGcO31zzWEV9SqTa5P3Uh+93Vqale
 rfeSW9X6ZWuTmkd79iNzSBU24SqdvQjOLoQpo1ihYuPjwMtmE7HJ4qOGtFTLUHkdmszb
 cFjcnrgZmMBX11M2th6EE1m+qjfa/FNm1Fj/ewRl/h0mzO27dzugJP9ZYiaq6ouY+z18
 nJ3wCm1OHup9vtqbNiNn2ChNChpic1+RuTHwNHtbYHAK0AD4SwHtrmmawzQ7AGjaGJx3
 LkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bEW1hEWBRM4fMNj0JZKfY5sioaWotGdrzXJcIsKNcQI=;
 b=uYXuMAljKPnMSiapy51QDTDKNI7alpMqZw9Wf30gUoRQxnVLgbWRec7qrWBv0qnlye
 ZWJe2Q6jRGH/EfB+NiO/1l4L2cjw8Eemd1YiYPafbmjFSgw37OKzlMyJ8JgTOsBvOwNs
 BKLBkg+4Px5OLdz8/LOZoUJd79tyxsXNoAVi6r6VYK0gdsoG1sjGAPepZDLWYjelazN6
 mGQpHRcEPgqWUXx4aTQgPWSBtlzdc5mg3EjnHofWgsMkk7WsMfGQ/w6Xlj/8ja3vwBLX
 CsvDf6Msq4jWc8MMws087Jv4kOmSslWS2HHstP4zm9Afvc6hu1+CLYgmtJ0m+Exp8pAB
 wG1w==
X-Gm-Message-State: AOAM5336Zr8QDC03492ILyTU3Qdj5EM/02vASXKFjoZYpF8LCRr4BGZM
 JREih93eAXeNtEb336Aj20Wq83eAQl2S
X-Google-Smtp-Source: ABdhPJx/U3IEDQlKYugWuIsbNkulQob+2Bbm6u4lKguYc8xSZDxJceN7alo+9v5y70NCbaKDDrHhyA==
X-Received: by 2002:a37:a515:: with SMTP id o21mr11678708qke.307.1615542976615; 
 Fri, 12 Mar 2021 01:56:16 -0800 (PST)
Received: from presler.lan (a95-93-120-206.cpe.netcabo.pt. [95.93.120.206])
 by smtp.gmail.com with ESMTPSA id n136sm3994980qke.123.2021.03.12.01.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 01:56:16 -0800 (PST)
From: Rui Salvaterra <rsalvaterra@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: lizhe67@huawei.com, christian.brauner@ubuntu.com, gustavoars@kernel.org,
 trix@redhat.com, keescook@chromium.org,
 Rui Salvaterra <rsalvaterra@gmail.com>
Subject: [RFC PATCH] jffs2: add support for zstd compression
Date: Fri, 12 Mar 2021 09:55:46 +0000
Message-Id: <20210312095545.53765-1-rsalvaterra@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_095619_391172_3203E467 
X-CRM114-Status: GOOD (  22.60  )
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

Implement support for zstd compression in jffs2 at the default compression
level (3).

Lightly tested in OpenWrt, on a single CPU embedded MIPS32 system (AirGrid M2).

Signed-off-by: Rui Salvaterra <rsalvaterra@gmail.com>
---
Sent as RFC, since I have no idea if locking is required (the crypto API
implementation doesn't do it, at least).

 fs/jffs2/Kconfig           |   9 +++
 fs/jffs2/Makefile          |   1 +
 fs/jffs2/compr.c           |  10 +++
 fs/jffs2/compr.h           |   6 ++
 fs/jffs2/compr_zstd.c      | 131 +++++++++++++++++++++++++++++++++++++
 fs/jffs2/super.c           |   7 ++
 include/uapi/linux/jffs2.h |   1 +
 7 files changed, 165 insertions(+)
 create mode 100644 fs/jffs2/compr_zstd.c

diff --git a/fs/jffs2/Kconfig b/fs/jffs2/Kconfig
index 7c96bc107218..31308eb7267b 100644
--- a/fs/jffs2/Kconfig
+++ b/fs/jffs2/Kconfig
@@ -136,6 +136,15 @@ config JFFS2_LZO
 	  This feature was added in July, 2007. Say 'N' if you need
 	  compatibility with older bootloaders or kernels.
 
+config JFFS2_ZSTD
+	bool "JFFS2 zstd compression support" if JFFS2_COMPRESSION_OPTIONS
+	select ZSTD_COMPRESS
+	select ZSTD_DECOMPRESS
+	depends on JFFS2_FS
+	default n
+	help
+	  Zstd compression.
+
 config JFFS2_RTIME
 	bool "JFFS2 RTIME compression support" if JFFS2_COMPRESSION_OPTIONS
 	depends on JFFS2_FS
diff --git a/fs/jffs2/Makefile b/fs/jffs2/Makefile
index 5294969d5bf9..75f84b1467c5 100644
--- a/fs/jffs2/Makefile
+++ b/fs/jffs2/Makefile
@@ -19,4 +19,5 @@ jffs2-$(CONFIG_JFFS2_RUBIN)	+= compr_rubin.o
 jffs2-$(CONFIG_JFFS2_RTIME)	+= compr_rtime.o
 jffs2-$(CONFIG_JFFS2_ZLIB)	+= compr_zlib.o
 jffs2-$(CONFIG_JFFS2_LZO)	+= compr_lzo.o
+jffs2-$(CONFIG_JFFS2_ZSTD)	+= compr_zstd.o
 jffs2-$(CONFIG_JFFS2_SUMMARY)   += summary.o
diff --git a/fs/jffs2/compr.c b/fs/jffs2/compr.c
index 4849a4c9a0e2..d65e0c39c9c5 100644
--- a/fs/jffs2/compr.c
+++ b/fs/jffs2/compr.c
@@ -237,6 +237,10 @@ uint16_t jffs2_compress(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 		ret = jffs2_selected_compress(JFFS2_COMPR_ZLIB, data_in,
 				cpage_out, datalen, cdatalen);
 		break;
+	case JFFS2_COMPR_MODE_FORCEZSTD:
+		ret = jffs2_selected_compress(JFFS2_COMPR_ZSTD, data_in,
+				cpage_out, datalen, cdatalen);
+		break;
 	default:
 		pr_err("unknown compression mode\n");
 	}
@@ -378,6 +382,9 @@ int __init jffs2_compressors_init(void)
 #ifdef CONFIG_JFFS2_LZO
 	jffs2_lzo_init();
 #endif
+#ifdef CONFIG_JFFS2_ZSTD
+	jffs2_zstd_init();
+#endif
 /* Setting default compression mode */
 #ifdef CONFIG_JFFS2_CMODE_NONE
 	jffs2_compression_mode = JFFS2_COMPR_MODE_NONE;
@@ -413,6 +420,9 @@ int jffs2_compressors_exit(void)
 #endif
 #ifdef CONFIG_JFFS2_ZLIB
 	jffs2_zlib_exit();
+#endif
+#ifdef CONFIG_JFFS2_ZSTD
+	jffs2_zstd_exit();
 #endif
 	return 0;
 }
diff --git a/fs/jffs2/compr.h b/fs/jffs2/compr.h
index 5e91d578f4ed..8f7032c5ecb2 100644
--- a/fs/jffs2/compr.h
+++ b/fs/jffs2/compr.h
@@ -31,6 +31,7 @@
 #define JFFS2_RTIME_PRIORITY     50
 #define JFFS2_ZLIB_PRIORITY      60
 #define JFFS2_LZO_PRIORITY       80
+#define JFFS2_ZSTD_PRIORITY      90
 
 
 #define JFFS2_RUBINMIPS_DISABLED /* RUBINs will be used only */
@@ -42,6 +43,7 @@
 #define JFFS2_COMPR_MODE_FAVOURLZO  3
 #define JFFS2_COMPR_MODE_FORCELZO   4
 #define JFFS2_COMPR_MODE_FORCEZLIB  5
+#define JFFS2_COMPR_MODE_FORCEZSTD  6
 
 #define FAVOUR_LZO_PERCENT 80
 
@@ -101,5 +103,9 @@ void jffs2_zlib_exit(void);
 int jffs2_lzo_init(void);
 void jffs2_lzo_exit(void);
 #endif
+#ifdef CONFIG_JFFS2_ZSTD
+int jffs2_zstd_init(void);
+void jffs2_zstd_exit(void);
+#endif
 
 #endif /* __JFFS2_COMPR_H__ */
diff --git a/fs/jffs2/compr_zstd.c b/fs/jffs2/compr_zstd.c
new file mode 100644
index 000000000000..86b3d28670d7
--- /dev/null
+++ b/fs/jffs2/compr_zstd.c
@@ -0,0 +1,131 @@
+
+#include <linux/zstd.h>
+#include "compr.h"
+
+#define ZSTD_DEF_LEVEL	3
+
+static ZSTD_CCtx *cctx;
+static ZSTD_DCtx *dctx;
+static void *cwksp;
+static void *dwksp;
+
+static ZSTD_parameters zstd_params(void)
+{
+	return ZSTD_getParams(ZSTD_DEF_LEVEL, 0, 0);
+}
+
+static int zstd_comp_init(void)
+{
+	int ret = 0;
+	const ZSTD_parameters params = zstd_params();
+	const size_t wksp_size = ZSTD_CCtxWorkspaceBound(params.cParams);
+
+	cwksp = vzalloc(wksp_size);
+	if (!cwksp) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	cctx = ZSTD_initCCtx(cwksp, wksp_size);
+	if (cctx) {
+		ret = -EINVAL;
+		goto out_free;
+	}
+out:
+	return ret;
+out_free:
+	vfree(cwksp);
+	goto out;
+}
+
+static int zstd_decomp_init(void)
+{
+	int ret = 0;
+	const size_t wksp_size = ZSTD_DCtxWorkspaceBound();
+
+	dwksp = vzalloc(wksp_size);
+	if (!dwksp) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	dctx = ZSTD_initDCtx(dwksp, wksp_size);
+	if (!dctx) {
+		ret = -EINVAL;
+		goto out_free;
+	}
+out:
+	return ret;
+out_free:
+	vfree(dwksp);
+	goto out;
+}
+
+static void zstd_comp_exit(void)
+{
+	vfree(cwksp);
+	cwksp = NULL;
+	cctx = NULL;
+}
+
+static void zstd_decomp_exit(void)
+{
+	vfree(dwksp);
+	dwksp = NULL;
+	dctx = NULL;
+}
+
+static int jffs2_zstd_compress(unsigned char *data_in, unsigned char *cpage_out,
+			      uint32_t *sourcelen, uint32_t *dstlen)
+{
+	size_t out_len;
+	const ZSTD_parameters params = zstd_params();
+
+	out_len = ZSTD_compressCCtx(cctx, cpage_out, *dstlen, data_in, *sourcelen, params);
+	if (ZSTD_isError(out_len) || out_len > *dstlen)
+		return -1;
+	*dstlen = out_len;
+	return 0;
+}
+
+static int jffs2_zstd_decompress(unsigned char *data_in, unsigned char *cpage_out,
+				 uint32_t srclen, uint32_t destlen)
+{
+	size_t out_len;
+
+	out_len = ZSTD_decompressDCtx(dctx, cpage_out, destlen, data_in, srclen);
+	if (ZSTD_isError(out_len) || out_len != destlen)
+		return -1;
+
+	return 0;
+}
+
+static struct jffs2_compressor jffs2_zstd_comp = {
+	.priority = JFFS2_ZSTD_PRIORITY,
+	.name = "zstd",
+	.compr = JFFS2_COMPR_ZSTD,
+	.compress = &jffs2_zstd_compress,
+	.decompress = &jffs2_zstd_decompress,
+	.disabled = 0,
+};
+
+int __init jffs2_zstd_init(void)
+{
+	int ret;
+
+	ret = zstd_comp_init();
+	if (ret)
+		return ret;
+	ret = zstd_decomp_init();
+	if (ret)
+		zstd_comp_exit();
+	ret = jffs2_register_compressor(&jffs2_zstd_comp);
+	return ret;
+}
+
+void jffs2_zstd_exit(void)
+{
+	jffs2_unregister_compressor(&jffs2_zstd_comp);
+	zstd_comp_exit();
+	zstd_decomp_exit();
+}
diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 81ca58c10b72..ddce95c55dde 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -73,6 +73,10 @@ static const char *jffs2_compr_name(unsigned int compr)
 #ifdef CONFIG_JFFS2_ZLIB
 	case JFFS2_COMPR_MODE_FORCEZLIB:
 		return "zlib";
+#endif
+#ifdef CONFIG_JFFS2_ZSTD
+	case JFFS2_COMPR_MODE_FORCEZSTD:
+		return "zstd";
 #endif
 	default:
 		/* should never happen; programmer error */
@@ -174,6 +178,9 @@ static const struct constant_table jffs2_param_compr[] = {
 #endif
 #ifdef CONFIG_JFFS2_ZLIB
 	{"zlib",	JFFS2_COMPR_MODE_FORCEZLIB },
+#endif
+#ifdef CONFIG_JFFS2_ZSTD
+	{"zstd",	JFFS2_COMPR_MODE_FORCEZSTD },
 #endif
 	{}
 };
diff --git a/include/uapi/linux/jffs2.h b/include/uapi/linux/jffs2.h
index 784ba0b9690a..af4fb69c8d69 100644
--- a/include/uapi/linux/jffs2.h
+++ b/include/uapi/linux/jffs2.h
@@ -46,6 +46,7 @@
 #define JFFS2_COMPR_DYNRUBIN	0x05
 #define JFFS2_COMPR_ZLIB	0x06
 #define JFFS2_COMPR_LZO		0x07
+#define JFFS2_COMPR_ZSTD	0x08
 /* Compatibility flags. */
 #define JFFS2_COMPAT_MASK 0xc000      /* What do to if an unknown nodetype is found */
 #define JFFS2_NODE_ACCURATE 0x2000
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
