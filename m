Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1614C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 08:19:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 775566113D
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 08:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 775566113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dv+wqim01VZUmIu9Y0BgE9Cwvx/DKtKggGjkKfUrMeA=; b=0BL38dz3v4PDnX
	SNSStSbnh3pS1BSjx3jdcMII6PmNARLh14WNysx/yJjF8OwQ+eBcrunij1nkkEuInCaGAanBObPFa
	uqSZGFO9up1p+HrPTnFXWThhmRapjrr56yTjsZ1M8/BvpMoAKDj5gFwISkzFNQ4EenEpVHaRYhYUe
	LciwGTaS7D+1STiQQ2SQXkGWauB4x168827tgjR1olzyUngn0evFfz2I1BJrVnvIk1xf4gv2Xlyjx
	M6X6QO/4HjTHMGGV8pKxFkFDMgwclErjZ+MOpsF/iym7WftznGLrKSOpXca/4uat4j15mFuBumOPB
	3RFDNthfripZAXrx/P3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkMLB-000xUE-SQ; Tue, 09 Nov 2021 08:18:49 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMKe-000xNH-Ip
 for linux-mtd@lists.infradead.org; Tue, 09 Nov 2021 08:18:18 +0000
Received: by mail-wr1-x432.google.com with SMTP id b12so31501244wrh.4
 for <linux-mtd@lists.infradead.org>; Tue, 09 Nov 2021 00:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Wo+xvI0btcU5woTehpGfHeJePWgerA+oyo3xcTWT9o=;
 b=dKlhV5RrJe6whF4CZPKxbCpjVXQu5xXK0zxyUvZMrquumbY8uhjPpRlpWA0JGymfaC
 nnikCc5kQ+FpvUG9xB+h8nYBHgtDe/ze6pFEzjYNUW5Q6QUHL6Tmv36mb0V5bL91Tujb
 baRoz8pN0wGo1CdfsE7ctCSrzz14j0nm4K7n2QC2B4FHrUGQeUHBGgHthitnrdMnTvil
 ITBPIXaDjAhTO0cGbdtNTinUXVueihjixTJTEQ3h69Sv/v80SJiEl+0eTrWydidYe1QT
 n3a6sh1PmszZY4EXAJp9fdXEcr8T+wZte1XkCitTMpunTxrGJXHpzA2EEl/oNDNUVIcL
 7Gtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Wo+xvI0btcU5woTehpGfHeJePWgerA+oyo3xcTWT9o=;
 b=hUQk5kTbBcRd390/GMC36SBCEgN+wzgoOY/prFZ4R4KwOAw2wmRTCLfR+tcPeWLtV8
 BihEeXM7NfauWbcMxu0W8HyvB5trZyelfeNfbcgGaK779qKbZTZCsq7ankJo1pm8NZYY
 xP6MqododB74F1gu9V7tybmy/ZqIngcDZ2y7C4lJbiNKRZ792emExsH4qVkmzrRNelrO
 Xst2LnKwGLZKoUra0kNn7elPZyLWFOO/VXwgIFP5mmlixKdeWnFGGIibEBOVC776svpY
 xAq5L0xjARAKrklG9RHM/kqosz8nKuP0W8KyISNu+ZfxPUAUj6BcFFYBKrLTgisS5MQW
 JSzg==
X-Gm-Message-State: AOAM532UX9PTcRv/nQcuG1CS24vgu3Xx6Adsw1izJ4NpTwSNj8m/WDbd
 VC30zNjQI4OyKHfuaGzXBeXPOgpBBoLsgekU
X-Google-Smtp-Source: ABdhPJyL7bNl+YaU5plhuVeb5tIRV03xGYKj0eE276skPLkQjrOC+ZbMTLYDHqv3cAEvBRueCsFToA==
X-Received: by 2002:a5d:59a2:: with SMTP id p2mr7198847wrr.252.1636445895311; 
 Tue, 09 Nov 2021 00:18:15 -0800 (PST)
Received: from thor.lan ([213.205.241.131])
 by smtp.gmail.com with ESMTPSA id n184sm1714028wme.2.2021.11.09.00.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 00:18:15 -0800 (PST)
From: Frederic Germain <frederic.germain@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Frederic Germain <frederic.germain@gmail.com>
Subject: [PATCH 3/4] jffsX-utils: add lzma support on jffs2reader
Date: Tue,  9 Nov 2021 08:17:50 +0000
Message-Id: <20211109081751.480718-4-frederic.germain@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211109081751.480718-1-frederic.germain@gmail.com>
References: <20211109081751.480718-1-frederic.germain@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_001816_648664_36D8FF29 
X-CRM114-Status: GOOD (  17.25  )
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

Signed-off-by: Frederic Germain <frederic.germain@gmail.com>
---
 Makefile.am               |  4 ++++
 configure.ac              | 24 +++++++++++++++++++++
 include/linux/jffs2.h     |  2 ++
 include/mtd/jffs2-user.h  |  1 +
 jffsX-utils/Makemodule.am |  2 +-
 jffsX-utils/jffs2reader.c | 45 +++++++++++++++++++++++++++++++++++++++
 6 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/Makefile.am b/Makefile.am
index 9da38af..02a3073 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -11,6 +11,10 @@ if WITHOUT_LZO
 AM_CPPFLAGS += -DWITHOUT_LZO
 endif
 
+if WITHOUT_LZMA
+AM_CPPFLAGS += -DWITHOUT_LZMA
+endif
+
 if WITHOUT_ZSTD
 AM_CPPFLAGS += -DWITHOUT_ZSTD
 endif
diff --git a/configure.ac b/configure.ac
index f47100f..e5035c0 100644
--- a/configure.ac
+++ b/configure.ac
@@ -65,6 +65,7 @@ need_clock_gettime="no"
 need_pthread="no"
 need_uuid="no"
 need_zlib="no"
+need_lzma=""
 need_lzo="no"
 need_zstd="no"
 need_xattr="no"
@@ -158,6 +159,14 @@ AC_ARG_WITH([lzo],
 	*) AC_MSG_ERROR([bad value ${withval} for --without-lzo]) ;;
 	esac])
 
+AC_ARG_WITH([lzma],
+	[AS_HELP_STRING([--without-lzma], [Disable support for LZMA compression])],
+	[case "${withval}" in
+	yes) need_lzma="yes";;
+	no) need_lzma="no" ;;
+	*) AC_MSG_ERROR([bad value ${withval} for --without-lzma]) ;;
+	esac])
+
 AC_ARG_WITH([zstd],
 	[AS_HELP_STRING([--without-zstd], [Disable support for ZSTD compression])],
 	[case "${withval}" in
@@ -190,6 +199,7 @@ clock_gettime_missing="no"
 pthread_missing="no"
 uuid_missing="no"
 zlib_missing="no"
+lzma_missing="no"
 lzo_missing="no"
 zstd_missing="no"
 xattr_missing="no"
@@ -219,6 +229,14 @@ if test "x$need_pthread" = "xyes"; then
 	AX_PTHREAD([], [pthread_missing="yes"])
 fi
 
+if test "x$need_lzma" != "xno"; then
+	AC_ARG_VAR([LZMA_CFLAGS], [C compiler flags for lzma])
+	AC_ARG_VAR([LZMA_LIBS], [linker flags for lzma])
+	AC_CHECK_LIB([lzma], [lzma_alone_decoder], [LZMA_LIBS="-llzma"],
+		[lzma_missing="yes"]
+	)
+fi
+
 if test "x$need_lzo" = "xyes"; then
 	AC_ARG_VAR([LZO_CFLAGS], [C compiler flags for lzo])
 	AC_ARG_VAR([LZO_LIBS], [linker flags for lzo])
@@ -287,6 +305,11 @@ if test "x$zlib_missing" = "xyes"; then
 	dep_missing="yes"
 fi
 
+if test "x$need_lzma" = "xyes" -a "x$lzma_missing" = "xyes"; then
+	AC_MSG_WARN([cannot find LZMA library required by options])
+	dep_missing="yes"
+fi
+
 if test "x$lzo_missing" = "xyes"; then
 	AC_MSG_WARN([cannot find LZO library required for mkfs programs])
 	AC_MSG_NOTICE([mtd-utils can optionally be built without mkfs.ubifs])
@@ -339,6 +362,7 @@ fi
 ##### generate output #####
 
 AM_CONDITIONAL([WITHOUT_LZO], [test "x$need_lzo" != "xyes"])
+AM_CONDITIONAL([WITHOUT_LZMA], [test "x$need_lzma" == "xno" -o "x$missing_lzma" == "xyes" ])
 AM_CONDITIONAL([WITHOUT_ZSTD], [test "x$need_zstd" != "xyes"])
 AM_CONDITIONAL([WITHOUT_XATTR], [test "x$need_xattr" != "xyes"])
 AM_CONDITIONAL([WITH_SELINUX], [test "x$need_selinux" == "xyes"])
diff --git a/include/linux/jffs2.h b/include/linux/jffs2.h
index 7306f86..47abf62 100644
--- a/include/linux/jffs2.h
+++ b/include/linux/jffs2.h
@@ -47,6 +47,8 @@
 #define JFFS2_COMPR_DYNRUBIN	0x05
 #define JFFS2_COMPR_ZLIB	0x06
 #define JFFS2_COMPR_LZO		0x07
+// diff --git a/target/linux/generic/patches-4.1/530-jffs2_make_lzma_available.patch b/target/linux/generic/patches-4.1/530-jffs2_make_lzma_available.patch
+#define JFFS2_COMPR_LZMA	0x08 // https://git.openwrt.org/project/ubus.git;git://git.openwrt.org/project/ubox.git?p=openwrt/openwrt.git;a=commitdiff;h=a0c49ef46f7caf5eb02c635d446218201008ecff;hp=518ab154e059c9f39684f8c78159c9caf333716b
 /* Compatibility flags. */
 #define JFFS2_COMPAT_MASK 0xc000      /* What do to if an unknown nodetype is found */
 #define JFFS2_NODE_ACCURATE 0x2000
diff --git a/include/mtd/jffs2-user.h b/include/mtd/jffs2-user.h
index bc5d99a..7228b5f 100644
--- a/include/mtd/jffs2-user.h
+++ b/include/mtd/jffs2-user.h
@@ -36,6 +36,7 @@ extern int target_endian;
 #define le32_to_cpu(x)	(__BYTE_ORDER==__LITTLE_ENDIAN ? (x) : bswap_32(x))
 #define cpu_to_le16(x)	(__BYTE_ORDER==__LITTLE_ENDIAN ? (x) : bswap_16(x))
 #define cpu_to_le32(x)	(__BYTE_ORDER==__LITTLE_ENDIAN ? (x) : bswap_32(x))
+#define cpu_to_le64(x)	(__BYTE_ORDER==__LITTLE_ENDIAN ? (x) : bswap_64(x))
 
 /* XATTR/POSIX-ACL related definition */
 /* Namespaces copied from xattr.h and posix_acl_xattr.h */
diff --git a/jffsX-utils/Makemodule.am b/jffsX-utils/Makemodule.am
index 96389f6..0c93c18 100644
--- a/jffsX-utils/Makemodule.am
+++ b/jffsX-utils/Makemodule.am
@@ -16,7 +16,7 @@ mkfs_jffs2_LDADD = libmtd.a $(ZLIB_LIBS) $(LZO_LIBS)
 mkfs_jffs2_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS)
 
 jffs2reader_SOURCES = jffsX-utils/jffs2reader.c	include/mtd/jffs2-user.h
-jffs2reader_LDADD = libmtd.a $(ZLIB_LIBS) $(LZO_LIBS)
+jffs2reader_LDADD = libmtd.a $(ZLIB_LIBS) $(LZO_LIBS) $(LZMA_LIBS)
 jffs2reader_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS)
 
 jffs2dump_SOURCES = jffsX-utils/jffs2dump.c include/mtd/jffs2-user.h
diff --git a/jffsX-utils/jffs2reader.c b/jffsX-utils/jffs2reader.c
index 33c5577..2aa2137 100644
--- a/jffsX-utils/jffs2reader.c
+++ b/jffsX-utils/jffs2reader.c
@@ -76,6 +76,9 @@ BUGS:
 #include <sys/stat.h>
 #include <dirent.h>
 #include <zlib.h>
+#ifndef WITHOUT_LZMA
+#include <lzma.h>
+#endif
 
 #include "mtd/jffs2-user.h"
 #include "common.h"
@@ -147,6 +150,48 @@ static void putblock(char *b, size_t bsize, size_t * rsize,
 			bzero(b + je32_to_cpu(n->offset), dlen);
 			break;
 
+#ifndef WITHOUT_LZMA
+		case JFFS2_COMPR_LZMA: {
+			// https://sourceforge.net/p/lzmautils/discussion/708858/thread/d02ebb9386/
+			lzma_stream strm = LZMA_STREAM_INIT;
+			size_t csize = je32_to_cpu(n->csize);
+			Bytef *in = (Bytef *) ((char *) n) + sizeof(struct jffs2_raw_inode);
+			Bytef *out = (Bytef *) b + je32_to_cpu(n->offset);
+			Bytef *compressed_with_header = xmalloc(13 + csize);
+
+			// LZMA properties byte (lc/lp/pb). typical 3/0/2 is 0x5D.
+			// But here works with 0/0/0
+			compressed_with_header[0] = 0;
+
+			// dictionary size as bytes[4], using value from preset 1
+			lzma_options_lzma opt_lzma;
+			if (lzma_lzma_preset(&opt_lzma, 1)) {
+				fprintf(stderr, "preset failed\n");
+				exit(1);
+			}
+			uint32_t dict_size_le = cpu_to_le32(opt_lzma.dict_size);
+			memcpy(&compressed_with_header[1], &dict_size_le, sizeof(dict_size_le));
+
+			// uncompressed size as unsigned 60-bit little endian integer
+			uint64_t uncompressed_size_le = cpu_to_le64(dlen);
+			memcpy(&compressed_with_header[5], &uncompressed_size_le, sizeof(uncompressed_size_le));
+
+			memcpy(&compressed_with_header[13], in, csize);
+			lzma_ret ret = lzma_alone_decoder(&strm, UINT64_MAX);
+			// lzma_ret ret = lzma_alone_decoder(&strm, hardware_memlimit_get(MODE_DECOMPRESS));
+			strm.next_in = compressed_with_header;
+			strm.avail_in = 13 + csize;
+			strm.next_out = out;
+			strm.avail_out = dlen;
+			ret = lzma_code(&strm, LZMA_RUN);
+			if (ret == LZMA_OK) {
+				printf("lzma_code ret:%d in:%ld\n", ret, strm.total_in);
+			}
+			free(compressed_with_header);
+		}
+			break;
+#endif
+
 			/* [DYN]RUBIN support required! */
 
 		default:
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
