Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6638CD5E39E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OlSpzEFPzUyaknc9adIZIcO61hy3AcSgFih41YhWT8s=; b=Cx2gyCtca8sDfU
	LSBfDQCChzNN3x8JANsFoqVskRENPbue4oyzSKAPZV7GihFzaqRGV+2hduQr68uNTk2nwRcZtkucH
	AxpoDSXhvYSz6nmY80nvAeLIEdqPKDYYr9vqmsoDwEvsiHPBXbqRG8D0iNmXyyh43Q5w5Q+Kl/GPQ
	VhV6o2l8iObO36QOCPNI8E8w3opFACHq1x07h94Fwu+oZSnihyAhX+GSuyKdSjrrdSJuh9zGtJmHR
	OoQjpo7SN3VFhCMqOh0tOUNEQDIEVMpev5pTX8n4/k27+KENKPGdHeFuhqbRIdvADj2hmDpoT4V+P
	o2usOD8LxM6IsjBxRe0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPaH-0000000GmF6-45yN;
	Mon, 11 Nov 2024 08:15:41 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOTx-0000000GYy9-0gyE
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:05:08 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xn0r15vhtz2Dgw3;
	Mon, 11 Nov 2024 15:03:13 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 156321A016C;
	Mon, 11 Nov 2024 15:05:01 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:00 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 001/102] ubifs-utils: Split common source files from mkfs.ubifs
Date: Mon, 11 Nov 2024 15:02:04 +0800
Message-ID: <20241111070346.1314122-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_230505_571856_677B3490 
X-CRM114-Status: UNSURE (   8.70  )
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

Split common source files into common dir from mkfs.ubifs, this is a
preparation for importing libubifs(from linux kernel) to replace
current UBIFS libs.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/Makemodule.am                          | 57 ++++++++++++----------
 ubifs-utils/{mkfs.ubifs => common}/README          |  2 +-
 ubifs-utils/{mkfs.ubifs => common}/compr.c         |  0
 ubifs-utils/{mkfs.ubifs => common}/compr.h         |  0
 ubifs-utils/{mkfs.ubifs => common}/crc16.c         |  0
 ubifs-utils/{mkfs.ubifs => common}/crc16.h         |  0
 ubifs-utils/{mkfs.ubifs => common}/crypto.c        |  0
 ubifs-utils/{mkfs.ubifs => common}/crypto.h        |  0
 ubifs-utils/{mkfs.ubifs => common}/defs.h          |  0
 ubifs-utils/{mkfs.ubifs => common}/devtable.c      |  0
 ubifs-utils/{mkfs.ubifs => common}/fscrypt.c       |  0
 ubifs-utils/{mkfs.ubifs => common}/fscrypt.h       |  0
 .../{mkfs.ubifs => common}/hashtable/hashtable.c   |  0
 .../{mkfs.ubifs => common}/hashtable/hashtable.h   |  0
 .../hashtable/hashtable_itr.c                      |  0
 .../hashtable/hashtable_itr.h                      |  0
 .../hashtable/hashtable_private.h                  |  0
 ubifs-utils/{mkfs.ubifs => common}/key.h           |  0
 ubifs-utils/{mkfs.ubifs => common}/lpt.c           |  0
 ubifs-utils/{mkfs.ubifs => common}/lpt.h           |  0
 ubifs-utils/{mkfs.ubifs => common}/sign.c          |  0
 ubifs-utils/{mkfs.ubifs => common}/sign.h          |  0
 ubifs-utils/{mkfs.ubifs => common}/ubifs.h         |  0
 23 files changed, 31 insertions(+), 28 deletions(-)
 rename ubifs-utils/{mkfs.ubifs => common}/README (91%)
 rename ubifs-utils/{mkfs.ubifs => common}/compr.c (100%)
 rename ubifs-utils/{mkfs.ubifs => common}/compr.h (100%)
 rename ubifs-utils/{mkfs.ubifs => common}/crc16.c (100%)
 rename ubifs-utils/{mkfs.ubifs => common}/crc16.h (100%)
 rename ubifs-utils/{mkfs.ubifs => common}/crypto.c (100%)
 rename ubifs-utils/{mkfs.ubifs => common}/crypto.h (100%)
 rename ubifs-utils/{mkfs.ubifs => common}/defs.h (100%)
 rename ubifs-utils/{mkfs.ubifs => common}/devtable.c (100%)
 rename ubifs-utils/{mkfs.ubifs => common}/fscrypt.c (100%)
 rename ubifs-utils/{mkfs.ubifs => common}/fscrypt.h (100%)
 rename ubifs-utils/{mkfs.ubifs => common}/hashtable/hashtable.c (100%)
 rename ubifs-utils/{mkfs.ubifs => common}/hashtable/hashtable.h (100%)
 rename ubifs-utils/{mkfs.ubifs => common}/hashtable/hashtable_itr.c (100%)
 rename ubifs-utils/{mkfs.ubifs => common}/hashtable/hashtable_itr.h (100%)
 rename ubifs-utils/{mkfs.ubifs => common}/hashtable/hashtable_private.h (100%)
 rename ubifs-utils/{mkfs.ubifs => common}/key.h (100%)
 rename ubifs-utils/{mkfs.ubifs => common}/lpt.c (100%)
 rename ubifs-utils/{mkfs.ubifs => common}/lpt.h (100%)
 rename ubifs-utils/{mkfs.ubifs => common}/sign.c (100%)
 rename ubifs-utils/{mkfs.ubifs => common}/sign.h (100%)
 rename ubifs-utils/{mkfs.ubifs => common}/ubifs.h (100%)

diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index 6814d47b..4a617c19 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -1,37 +1,40 @@
-mkfs_ubifs_SOURCES = \
-	ubifs-utils/mkfs.ubifs/mkfs.ubifs.c \
-	ubifs-utils/mkfs.ubifs/defs.h \
-	ubifs-utils/mkfs.ubifs/lpt.h \
-	ubifs-utils/mkfs.ubifs/mkfs.ubifs.h \
-	ubifs-utils/mkfs.ubifs/crc16.h \
-	ubifs-utils/mkfs.ubifs/key.h \
-	ubifs-utils/mkfs.ubifs/compr.h \
-	ubifs-utils/mkfs.ubifs/ubifs.h \
-	ubifs-utils/mkfs.ubifs/sign.h \
-	ubifs-utils/mkfs.ubifs/crc16.c \
-	ubifs-utils/mkfs.ubifs/lpt.c \
-	ubifs-utils/mkfs.ubifs/compr.c \
-	ubifs-utils/mkfs.ubifs/hashtable/hashtable.h \
-	ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.h \
-	ubifs-utils/mkfs.ubifs/hashtable/hashtable_private.h \
-	ubifs-utils/mkfs.ubifs/hashtable/hashtable.c \
-	ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.c \
-	ubifs-utils/mkfs.ubifs/devtable.c \
+common_SOURCES = \
+	ubifs-utils/common/defs.h \
+	ubifs-utils/common/crc16.h \
+	ubifs-utils/common/crc16.c \
+	ubifs-utils/common/compr.h \
+	ubifs-utils/common/compr.c \
+	ubifs-utils/common/hashtable/hashtable.h \
+	ubifs-utils/common/hashtable/hashtable_itr.h \
+	ubifs-utils/common/hashtable/hashtable_private.h \
+	ubifs-utils/common/hashtable/hashtable.c \
+	ubifs-utils/common/hashtable/hashtable_itr.c \
+	ubifs-utils/common/devtable.c \
+	ubifs-utils/common/ubifs.h \
+	ubifs-utils/common/key.h \
+	ubifs-utils/common/lpt.h \
+	ubifs-utils/common/lpt.c \
+	ubifs-utils/common/sign.h \
 	include/mtd/ubifs-media.h
 
 if WITH_CRYPTO
-mkfs_ubifs_SOURCES += ubifs-utils/mkfs.ubifs/crypto.c \
-		ubifs-utils/mkfs.ubifs/crypto.h \
-		ubifs-utils/mkfs.ubifs/fscrypt.c \
-		ubifs-utils/mkfs.ubifs/fscrypt.h \
-		ubifs-utils/mkfs.ubifs/sign.c
+common_SOURCES += ubifs-utils/common/crypto.c \
+		ubifs-utils/common/crypto.h \
+		ubifs-utils/common/fscrypt.c \
+		ubifs-utils/common/fscrypt.h \
+		ubifs-utils/common/sign.c
 endif
 
+mkfs_ubifs_SOURCES = \
+	$(common_SOURCES) \
+	ubifs-utils/mkfs.ubifs/mkfs.ubifs.h \
+	ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+
 mkfs_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(ZSTD_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) $(OPENSSL_LIBS) -lm
-mkfs_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(ZSTD_CFLAGS) $(UUID_CFLAGS) $(LIBSELINUX_CFLAGS)\
-	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/mkfs.ubifs/
+mkfs_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(ZSTD_CFLAGS) $(UUID_CFLAGS) $(LIBSELINUX_CFLAGS) \
+	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/mkfs.ubifs/ -I$(top_srcdir)/ubifs-utils/common
 
-EXTRA_DIST += ubifs-utils/mkfs.ubifs/README
+EXTRA_DIST += ubifs-utils/common/README
 
 dist_sbin_SCRIPTS = ubifs-utils/mount.ubifs
 
diff --git a/ubifs-utils/mkfs.ubifs/README b/ubifs-utils/common/README
similarity index 91%
rename from ubifs-utils/mkfs.ubifs/README
rename to ubifs-utils/common/README
index 7e199390..8c10fd4b 100644
--- a/ubifs-utils/mkfs.ubifs/README
+++ b/ubifs-utils/common/README
@@ -1,4 +1,4 @@
-UBIFS File System - Make File System program
+Common Library
 
 * crc16.h and crc16.c were copied from the linux kernel.
 * crc32.h and crc32.c were copied from mtd-utils and amended.
diff --git a/ubifs-utils/mkfs.ubifs/compr.c b/ubifs-utils/common/compr.c
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/compr.c
rename to ubifs-utils/common/compr.c
diff --git a/ubifs-utils/mkfs.ubifs/compr.h b/ubifs-utils/common/compr.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/compr.h
rename to ubifs-utils/common/compr.h
diff --git a/ubifs-utils/mkfs.ubifs/crc16.c b/ubifs-utils/common/crc16.c
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/crc16.c
rename to ubifs-utils/common/crc16.c
diff --git a/ubifs-utils/mkfs.ubifs/crc16.h b/ubifs-utils/common/crc16.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/crc16.h
rename to ubifs-utils/common/crc16.h
diff --git a/ubifs-utils/mkfs.ubifs/crypto.c b/ubifs-utils/common/crypto.c
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/crypto.c
rename to ubifs-utils/common/crypto.c
diff --git a/ubifs-utils/mkfs.ubifs/crypto.h b/ubifs-utils/common/crypto.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/crypto.h
rename to ubifs-utils/common/crypto.h
diff --git a/ubifs-utils/mkfs.ubifs/defs.h b/ubifs-utils/common/defs.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/defs.h
rename to ubifs-utils/common/defs.h
diff --git a/ubifs-utils/mkfs.ubifs/devtable.c b/ubifs-utils/common/devtable.c
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/devtable.c
rename to ubifs-utils/common/devtable.c
diff --git a/ubifs-utils/mkfs.ubifs/fscrypt.c b/ubifs-utils/common/fscrypt.c
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/fscrypt.c
rename to ubifs-utils/common/fscrypt.c
diff --git a/ubifs-utils/mkfs.ubifs/fscrypt.h b/ubifs-utils/common/fscrypt.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/fscrypt.h
rename to ubifs-utils/common/fscrypt.h
diff --git a/ubifs-utils/mkfs.ubifs/hashtable/hashtable.c b/ubifs-utils/common/hashtable/hashtable.c
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/hashtable/hashtable.c
rename to ubifs-utils/common/hashtable/hashtable.c
diff --git a/ubifs-utils/mkfs.ubifs/hashtable/hashtable.h b/ubifs-utils/common/hashtable/hashtable.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/hashtable/hashtable.h
rename to ubifs-utils/common/hashtable/hashtable.h
diff --git a/ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.c b/ubifs-utils/common/hashtable/hashtable_itr.c
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.c
rename to ubifs-utils/common/hashtable/hashtable_itr.c
diff --git a/ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.h b/ubifs-utils/common/hashtable/hashtable_itr.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.h
rename to ubifs-utils/common/hashtable/hashtable_itr.h
diff --git a/ubifs-utils/mkfs.ubifs/hashtable/hashtable_private.h b/ubifs-utils/common/hashtable/hashtable_private.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/hashtable/hashtable_private.h
rename to ubifs-utils/common/hashtable/hashtable_private.h
diff --git a/ubifs-utils/mkfs.ubifs/key.h b/ubifs-utils/common/key.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/key.h
rename to ubifs-utils/common/key.h
diff --git a/ubifs-utils/mkfs.ubifs/lpt.c b/ubifs-utils/common/lpt.c
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/lpt.c
rename to ubifs-utils/common/lpt.c
diff --git a/ubifs-utils/mkfs.ubifs/lpt.h b/ubifs-utils/common/lpt.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/lpt.h
rename to ubifs-utils/common/lpt.h
diff --git a/ubifs-utils/mkfs.ubifs/sign.c b/ubifs-utils/common/sign.c
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/sign.c
rename to ubifs-utils/common/sign.c
diff --git a/ubifs-utils/mkfs.ubifs/sign.h b/ubifs-utils/common/sign.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/sign.h
rename to ubifs-utils/common/sign.h
diff --git a/ubifs-utils/mkfs.ubifs/ubifs.h b/ubifs-utils/common/ubifs.h
similarity index 100%
rename from ubifs-utils/mkfs.ubifs/ubifs.h
rename to ubifs-utils/common/ubifs.h
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
