Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1DAE6781D
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WhHZiQ8lk95sJu9KPwt41SfdRTVp4Pvihk7prK/2TNk=; b=O0eDFRCyw0LcFh
	e0Ljv6KrsU9gFovTgXxuHRfUqQ+8D2ln/UrXDUnj526VTTV76A+tNCBkUMzV6uOGRz1FqBQOlvtJD
	ShwZ7lEYoOBJZ4+9Ll/ZcZuaib3XxI1HtAMcUMt5JqIajdlVcZkFbzvEd2ZtZ9nblH9jbbpwdu0hp
	Q3pKSvBq4/i8D4ZrKsNXBEntP0RXg6qQKMTGUNcs4zYuBkysRc1m1s88czyK57Nh4+oFBqAsNaDwr
	/CQUs+X4y67p9h2Ihos8kCtj6ZWfl2dtkOPtMa5LHuSRxrQ2jL/j18sYRyLGN1EnRGKgKNYkx2q1B
	xoYJZYh8WzsysHGZhJ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPaM-0000000GmHo-36om;
	Mon, 11 Nov 2024 08:15:46 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOU0-0000000GZ0r-1YdO
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:05:14 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Xn0mn1pwBz28fPh;
	Mon, 11 Nov 2024 15:00:25 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 9A6F014037B;
	Mon, 11 Nov 2024 15:05:06 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:06 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 011/102] ubifs-utils: Add linux type definitions
Date: Mon, 11 Nov 2024 15:02:14 +0800
Message-ID: <20241111070346.1314122-12-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_230508_993123_B493ECAC 
X-CRM114-Status: GOOD (  17.58  )
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

Add linux type definitions, because there are many types
(eg. u8/u16/u64) used in UBIFS linux kernel libs. Besides
move type conversions (eg. cpu_to_le16, cpu_to_le32, etc.)
into type definitions header file.

This is a preparation for replacing implementation of UBIFS utils with
linux kernel libs.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/Makemodule.am           |  1 +
 ubifs-utils/common/crypto.c         |  1 +
 ubifs-utils/common/defs.h           | 30 -------------
 ubifs-utils/common/fscrypt.c        |  3 +-
 ubifs-utils/common/fscrypt.h        |  7 +--
 ubifs-utils/common/linux_types.h    | 89 +++++++++++++++++++++++++++++++++++++
 ubifs-utils/common/sign.c           |  2 +-
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c |  9 ++--
 8 files changed, 104 insertions(+), 38 deletions(-)
 create mode 100644 ubifs-utils/common/linux_types.h

diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index d58570fe..0f9c0fa6 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -1,5 +1,6 @@
 common_SOURCES = \
 	ubifs-utils/common/compiler_attributes.h \
+	ubifs-utils/common/linux_types.h \
 	ubifs-utils/common/defs.h \
 	ubifs-utils/common/crc16.h \
 	ubifs-utils/common/crc16.c \
diff --git a/ubifs-utils/common/crypto.c b/ubifs-utils/common/crypto.c
index 2ecd8da1..e4ef3491 100644
--- a/ubifs-utils/common/crypto.c
+++ b/ubifs-utils/common/crypto.c
@@ -23,6 +23,7 @@
 #include <string.h>
 #include <assert.h>
 
+#include "linux_types.h"
 #include "fscrypt.h"
 #include "defs.h"
 #include "ubifs.h"
diff --git a/ubifs-utils/common/defs.h b/ubifs-utils/common/defs.h
index cafc94af..dd3b806e 100644
--- a/ubifs-utils/common/defs.h
+++ b/ubifs-utils/common/defs.h
@@ -9,7 +9,6 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <limits.h>
-#include <byteswap.h>
 #include <errno.h>
 
 #include "ubifs.h"
@@ -27,37 +26,8 @@ enum { MKFS_PROGRAM_TYPE = 0 };
 	printf("%s: %s: " fmt "\n", PROGRAM_NAME, __FUNCTION__, ##__VA_ARGS__); \
 } while(0)
 
-#define t16(x) ({ \
-	uint16_t __b = (x); \
-	(__LITTLE_ENDIAN==__BYTE_ORDER) ? __b : bswap_16(__b); \
-})
-
-#define t32(x) ({ \
-	uint32_t __b = (x); \
-	(__LITTLE_ENDIAN==__BYTE_ORDER) ? __b : bswap_32(__b); \
-})
-
-#define t64(x) ({ \
-	uint64_t __b = (x); \
-	(__LITTLE_ENDIAN==__BYTE_ORDER) ? __b : bswap_64(__b); \
-})
-
-#define cpu_to_le16(x) ((__le16){t16(x)})
-#define cpu_to_le32(x) ((__le32){t32(x)})
-#define cpu_to_le64(x) ((__le64){t64(x)})
-
-#define le16_to_cpu(x) (t16((x)))
-#define le32_to_cpu(x) (t32((x)))
-#define le64_to_cpu(x) (t64((x)))
-
 #define unlikely(x) (x)
 
-struct qstr
-{
-	char *name;
-	size_t len;
-};
-
 /**
  * fls - find last (most-significant) bit set
  * @x: the word to search
diff --git a/ubifs-utils/common/fscrypt.c b/ubifs-utils/common/fscrypt.c
index 895d5c72..f39faa76 100644
--- a/ubifs-utils/common/fscrypt.c
+++ b/ubifs-utils/common/fscrypt.c
@@ -20,6 +20,7 @@
 
 #include <endian.h>
 
+#include "linux_types.h"
 #include "fscrypt.h"
 #include "defs.h"
 #include "ubifs.h"
@@ -88,7 +89,7 @@ unsigned int fscrypt_fname_encrypted_size(struct fscrypt_context *fctx,
 	return round_up(ilen, padding);
 }
 
-int encrypt_path(void **outbuf, void *data, unsigned int data_len,
+int encrypt_path(void **outbuf, const void *data, unsigned int data_len,
 		unsigned int max_namelen, struct fscrypt_context *fctx)
 {
 	void *inbuf, *crypt_key;
diff --git a/ubifs-utils/common/fscrypt.h b/ubifs-utils/common/fscrypt.h
index b8a599de..4a073e97 100644
--- a/ubifs-utils/common/fscrypt.h
+++ b/ubifs-utils/common/fscrypt.h
@@ -107,7 +107,7 @@ struct fscrypt_context *inherit_fscrypt_context(struct fscrypt_context *fctx);
 void free_fscrypt_context(struct fscrypt_context *fctx);
 unsigned int fscrypt_fname_encrypted_size(struct fscrypt_context *fctx,
 					  unsigned int ilen);
-int encrypt_path(void **outbuf, void *data, unsigned int data_len,
+int encrypt_path(void **outbuf, const void *data, unsigned int data_len,
 		 unsigned int max_namelen, struct fscrypt_context *fctx);
 int encrypt_data_node(struct fscrypt_context *fctx, unsigned int block_no,
 		      struct ubifs_data_node *dn, size_t length);
@@ -138,8 +138,9 @@ static inline void free_fscrypt_context(struct fscrypt_context *fctx)
 	assert(!fctx);
 }
 
-static inline int encrypt_path(void **outbuf, void *data, unsigned int data_len,
-		 unsigned int max_namelen, struct fscrypt_context *fctx)
+static inline int encrypt_path(void **outbuf, const void *data,
+			unsigned int data_len, unsigned int max_namelen,
+			struct fscrypt_context *fctx)
 {
 	(void)outbuf;
 	(void)data;
diff --git a/ubifs-utils/common/linux_types.h b/ubifs-utils/common/linux_types.h
new file mode 100644
index 00000000..556b2e25
--- /dev/null
+++ b/ubifs-utils/common/linux_types.h
@@ -0,0 +1,89 @@
+#ifndef __LINUX_TYPES_H__
+#define __LINUX_TYPES_H__
+
+#include <linux/types.h>
+#include <sys/types.h>
+#include <byteswap.h>
+#include <stdint.h>
+#include <unistd.h>
+
+#include "compiler_attributes.h"
+
+typedef __u8		u8;
+typedef __u16		u16;
+typedef __u32		u32;
+typedef __u64		u64;
+
+typedef __s64		time64_t;
+
+struct qstr {
+	const char *name;
+	size_t len;
+};
+
+struct fscrypt_name {
+	struct qstr disk_name;
+};
+
+#define fname_name(p)	((p)->disk_name.name)
+#define fname_len(p)	((p)->disk_name.len)
+
+#define t16(x) ({ \
+	uint16_t __b = (x); \
+	(__LITTLE_ENDIAN==__BYTE_ORDER) ? __b : bswap_16(__b); \
+})
+
+#define t32(x) ({ \
+	uint32_t __b = (x); \
+	(__LITTLE_ENDIAN==__BYTE_ORDER) ? __b : bswap_32(__b); \
+})
+
+#define t64(x) ({ \
+	uint64_t __b = (x); \
+	(__LITTLE_ENDIAN==__BYTE_ORDER) ? __b : bswap_64(__b); \
+})
+
+#define cpu_to_le16(x) ((__le16){t16(x)})
+#define cpu_to_le32(x) ((__le32){t32(x)})
+#define cpu_to_le64(x) ((__le64){t64(x)})
+
+#define le16_to_cpu(x) (t16((x)))
+#define le32_to_cpu(x) (t32((x)))
+#define le64_to_cpu(x) (t64((x)))
+
+#define check_mul_overflow(a, b, d) ({		\
+	typeof(a) __a = (a);			\
+	typeof(b) __b = (b);			\
+	typeof(d) __d = (d);			\
+	(void) (&__a == &__b);			\
+	(void) (&__a == __d);			\
+	__builtin_mul_overflow(__a, __b, __d);	\
+})
+
+static inline __must_check size_t array_size(size_t a, size_t b)
+{
+	size_t bytes;
+	if (check_mul_overflow(a, b, &bytes))
+		return SIZE_MAX;
+
+	return bytes;
+}
+
+static inline int int_log2(unsigned int arg)
+{
+	int  l = 0;
+
+	arg >>= 1;
+	while (arg) {
+		l++;
+		arg >>= 1;
+	}
+	return l;
+}
+
+#undef PAGE_SIZE
+#define PAGE_SIZE (getpagesize())
+#undef PAGE_SHIFT
+#define PAGE_SHIFT (int_log2(PAGE_SIZE))
+
+#endif
diff --git a/ubifs-utils/common/sign.c b/ubifs-utils/common/sign.c
index 7530503a..dfbc96bf 100644
--- a/ubifs-utils/common/sign.c
+++ b/ubifs-utils/common/sign.c
@@ -28,7 +28,7 @@
 #include <openssl/conf.h>
 #include <err.h>
 
-#include "compiler_attributes.h"
+#include "linux_types.h"
 #include "sign.h"
 #include "defs.h"
 #include "ubifs.h"
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 2181595e..c2f5a29d 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -46,6 +46,7 @@
 #include <zstd.h>
 #endif
 
+#include "linux_types.h"
 #include "defs.h"
 #include "crypto.h"
 #include "fscrypt.h"
@@ -1207,12 +1208,14 @@ static int add_xattr(struct ubifs_ino_node *host_ino, struct stat *st,
 	struct ubifs_ino_node *ino;
 	struct ubifs_dent_node *xent;
 	struct qstr nm;
+	char *tmp_name;
 	union ubifs_key xkey, nkey;
 	int len, ret;
 
 	nm.len = strlen(name);
-	nm.name = xmalloc(nm.len + 1);
-	memcpy(nm.name, name, nm.len + 1);
+	tmp_name = xmalloc(nm.len + 1);
+	memcpy(tmp_name, name, nm.len + 1);
+	nm.name = tmp_name;
 
 	host_ino->xattr_cnt++;
 	host_ino->xattr_size += CALC_DENT_SIZE(nm.len);
@@ -1240,7 +1243,7 @@ static int add_xattr(struct ubifs_ino_node *host_ino, struct stat *st,
 
 	xent->inum = cpu_to_le64(inum);
 
-	ret = add_node(&xkey, nm.name, nm.len, xent, len);
+	ret = add_node(&xkey, tmp_name, nm.len, xent, len);
 	if (ret)
 		goto out;
 
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
