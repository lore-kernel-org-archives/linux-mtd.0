Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEADD6409B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gb1djqrY8cDi9djS2sNU5qt5W305UxOOTq+CEGUOdeo=; b=hpyMFMCnBnoY80
	EVRQP9/zXfwuDJx9lcNy6ZngkNsJdi5243lcOnjJzWgSR28/A8XwG9yJUhr9wIp5qGd+xle4n5ER4
	YV9DBseZ3o+VAKya2s6vz3h/k1rXj1bfu8U4ctILdx0s8a+P832tV6UrjT2952mlVpG5Z7z4mnUkF
	FTY99foAxbhEmHymhAGhfTYPMl/hW8xUNzmXEk8FQKJlC+M7h+ByEoxMh+UcUwSNxvSC4eMtt9CoI
	dvvjv1rZd+pS39pqe/p1oWMhpy+2BCtRV3ypdtsG6g63qgN2ZZj0za3fycRz4TdOmdJ86OnlIyqB5
	7UIlVDZFfp7JjOVOLB3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPaL-0000000GmGw-371c;
	Mon, 11 Nov 2024 08:15:45 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOU0-0000000GZ0p-0OQK
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:05:13 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xn0rp2np3z20t4D;
	Mon, 11 Nov 2024 15:03:54 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 8E394140361;
	Mon, 11 Nov 2024 15:05:06 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:05 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 010/102] ubifs-utils: Add compiler attributes implementations
Date: Mon, 11 Nov 2024 15:02:13 +0800
Message-ID: <20241111070346.1314122-11-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_230508_491355_A35E17F2 
X-CRM114-Status: GOOD (  20.21  )
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

Add compiler attributes implementations, such as __packed, __unused,
__const, etc., which could be used in linux kernel libs. Besides, change
some existing attributes into linux kernel style.

This is a preparation for replacing implementation of UBIFS utils with
linux kernel libs.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/Makemodule.am                |  1 +
 ubifs-utils/common/compiler_attributes.h | 79 ++++++++++++++++++++++++++++++++
 ubifs-utils/common/fscrypt.h             |  6 ++-
 ubifs-utils/common/sign.c                |  4 +-
 4 files changed, 86 insertions(+), 4 deletions(-)
 create mode 100644 ubifs-utils/common/compiler_attributes.h

diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index 90cc7005..d58570fe 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -1,4 +1,5 @@
 common_SOURCES = \
+	ubifs-utils/common/compiler_attributes.h \
 	ubifs-utils/common/defs.h \
 	ubifs-utils/common/crc16.h \
 	ubifs-utils/common/crc16.c \
diff --git a/ubifs-utils/common/compiler_attributes.h b/ubifs-utils/common/compiler_attributes.h
new file mode 100644
index 00000000..bb65d3a9
--- /dev/null
+++ b/ubifs-utils/common/compiler_attributes.h
@@ -0,0 +1,79 @@
+#ifndef __COMPILER_ATTRIBUTES_H__
+#define __COMPILER_ATTRIBUTES_H__
+
+#if __has_attribute(__fallthrough__)
+#define fallthrough	__attribute__((__fallthrough__))
+#else
+#define fallthrough     do {} while (0)
+#endif
+
+#define __packed	__attribute__((__packed__))
+#define __unused	__attribute__((__unused__))
+#define __const		__attribute__((__const__))
+#define __must_check    __attribute__((__warn_unused_result__))
+#ifndef __force
+#define __force
+#endif
+
+/*
+ * Optional: only supported since clang >= 14.0
+ *
+ *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-error-function-attribute
+ */
+#if __has_attribute(__error__)
+# define __compiletime_error(msg)       __attribute__((__error__(msg)))
+#else
+# define __compiletime_error(msg)
+#endif
+
+#ifndef __compiletime_error
+# define __compiletime_error(message)
+#endif
+
+#ifdef __OPTIMIZE__
+# define __compiletime_assert(condition, msg, prefix, suffix)		\
+	do {								\
+		extern void prefix ## suffix(void) __compiletime_error(msg); \
+		if (!(condition))					\
+			prefix ## suffix();				\
+	} while (0)
+#else
+# define __compiletime_assert(condition, msg, prefix, suffix) do { } while (0)
+#endif
+
+#define _compiletime_assert(condition, msg, prefix, suffix) \
+	__compiletime_assert(condition, msg, prefix, suffix)
+
+/**
+ * compiletime_assert - break build and emit msg if condition is false
+ * @condition: a compile-time constant condition to check
+ * @msg:       a message to emit if condition is false
+ *
+ * In tradition of POSIX assert, this macro will break the build if the
+ * supplied condition is *false*, emitting the supplied error message if the
+ * compiler has support to do so.
+ */
+#define compiletime_assert(condition, msg) \
+	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
+
+/**
+ * BUILD_BUG_ON_MSG - break compile if a condition is true & emit supplied
+ *		      error message.
+ * @condition: the condition which the compiler should know is false.
+ *
+ * See BUILD_BUG_ON for description.
+ */
+#define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
+
+/**
+ * BUILD_BUG_ON - break compile if a condition is true.
+ * @condition: the condition which the compiler should know is false.
+ *
+ * If you have some code which relies on certain constants being equal, or
+ * some other compile-time-evaluated condition, you should use BUILD_BUG_ON to
+ * detect if someone changes it.
+ */
+#define BUILD_BUG_ON(condition) \
+	BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
+
+#endif
diff --git a/ubifs-utils/common/fscrypt.h b/ubifs-utils/common/fscrypt.h
index 908a5041..b8a599de 100644
--- a/ubifs-utils/common/fscrypt.h
+++ b/ubifs-utils/common/fscrypt.h
@@ -25,6 +25,8 @@
 #include <openssl/rand.h>
 #endif
 #include <assert.h>
+
+#include "compiler_attributes.h"
 #include "ubifs.h"
 #include "crypto.h"
 
@@ -79,7 +81,7 @@ struct fscrypt_context {
 	__u8 flags;
 	__u8 master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
 	__u8 nonce[FS_KEY_DERIVATION_NONCE_SIZE];
-} __attribute__((packed));
+} __packed;
 
 /**
  * For encrypted symlinks, the ciphertext length is stored at the beginning
@@ -88,7 +90,7 @@ struct fscrypt_context {
 struct fscrypt_symlink_data {
 	__le16 len;
 	char encrypted_path[1];
-} __attribute__((packed));
+} __packed;
 
 
 #ifndef FS_MAX_KEY_SIZE
diff --git a/ubifs-utils/common/sign.c b/ubifs-utils/common/sign.c
index 9c53e671..7530503a 100644
--- a/ubifs-utils/common/sign.c
+++ b/ubifs-utils/common/sign.c
@@ -28,6 +28,7 @@
 #include <openssl/conf.h>
 #include <err.h>
 
+#include "compiler_attributes.h"
 #include "sign.h"
 #include "defs.h"
 #include "ubifs.h"
@@ -116,8 +117,7 @@ static void drain_openssl_errors(void)
 
 static const char *key_pass;
 
-static int pem_pw_cb(char *buf, int len, __attribute__((unused)) int w,
-		     __attribute__((unused)) void *v)
+static int pem_pw_cb(char *buf, int len, __unused int w, __unused void *v)
 {
 	int pwlen;
 
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
