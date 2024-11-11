Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD258D5E39A
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 08:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8CEkUaGdASo2lycXCKmLIpYtIinmI99NriCCkpy3pk=; b=L3nmGiBla06D8Q
	e7pLwDMM2E2rHwaTMOrZmfvFRGgLBGtbUFvTQZ3/26g8TZ0+vuj8OH+MLFeXpw8RXeS+yn0wfVBv+
	IEI36yvrwpQhY++SS+tEe9cq7ZYAXc5zRXsuMosT0i1xIYVyEE9SZ5U4FJ/Cd7eEDEbl5NCPp72G2
	eXehlrE7drYDPU/A7+f3b00sjb9T8UG+xHzSOGXrSQdrE+y2EKLrp+Vrsb8YShp7sAECUgEu14B3V
	Pjn4kIiRstg5ErXs9q+oVbwVMjZxXGXMKRw8A8fqQ1GKIXccAeVKGIKEnqulB2TMXWM7yYL6JArOY
	vnk/NVztdc0bo4ojGAsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPaJ-0000000GmFf-1GEN;
	Mon, 11 Nov 2024 08:15:43 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOTx-0000000GYyB-0tek
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:05:09 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Xn0rj4s4dzQsrG;
	Mon, 11 Nov 2024 15:03:49 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 15710180104;
	Mon, 11 Nov 2024 15:05:02 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:01 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 003/102] ubifs-utils: Define PROGRAM_NAME as variable
Date: Mon, 11 Nov 2024 15:02:06 +0800
Message-ID: <20241111070346.1314122-4-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_230505_611688_FDBC527E 
X-CRM114-Status: GOOD (  14.04  )
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

PROGRAM_NAME is defined as a const string "mkfs.ubifs", which won't be
suitable for fsck.ubifs. Add 'program_name' member in ubifs_info
structure, define PROGRAM_NAME as ubifs_info.program_name. Then, error
messages will display right program name if fsck.ubifs is supported.
Besides, add 'program_type' member in ubifs_info structure to identify
which current program type is, without comparing program name.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/common/crypto.c              | 10 +++++++---
 ubifs-utils/common/defs.h                |  4 ++++
 ubifs-utils/common/fscrypt.c             |  7 +++++--
 ubifs-utils/common/hashtable/hashtable.c | 14 +++++++++-----
 ubifs-utils/common/lpt.c                 |  7 +++++--
 ubifs-utils/common/ubifs.h               |  6 ++++++
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c      |  3 +++
 7 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/ubifs-utils/common/crypto.c b/ubifs-utils/common/crypto.c
index 60a67a4e..614a16de 100644
--- a/ubifs-utils/common/crypto.c
+++ b/ubifs-utils/common/crypto.c
@@ -23,10 +23,14 @@
 #include <string.h>
 #include <assert.h>
 
-#define PROGRAM_NAME "mkfs.ubifs"
-#include "common.h"
-#include "defs.h"
 #include "fscrypt.h"
+#include "defs.h"
+#include "ubifs.h"
+
+/* common.h requires the PROGRAM_NAME macro */
+extern struct ubifs_info info_;
+#define PROGRAM_NAME (info_.program_name)
+#include "common.h"
 
 static int do_hash(const EVP_MD *md, const unsigned char *in, size_t len, unsigned char *out)
 {
diff --git a/ubifs-utils/common/defs.h b/ubifs-utils/common/defs.h
index e1aded03..143f6c65 100644
--- a/ubifs-utils/common/defs.h
+++ b/ubifs-utils/common/defs.h
@@ -12,6 +12,10 @@
 #include <byteswap.h>
 #include <errno.h>
 
+#define MKFS_PROGRAM_NAME "mkfs.ubifs"
+
+enum { MKFS_PROGRAM_TYPE = 0 };
+
 extern int debug_level;
 
 #define dbg_msg(lvl, fmt, ...) do {if (debug_level >= lvl)                \
diff --git a/ubifs-utils/common/fscrypt.c b/ubifs-utils/common/fscrypt.c
index 94c6c377..cc989638 100644
--- a/ubifs-utils/common/fscrypt.c
+++ b/ubifs-utils/common/fscrypt.c
@@ -20,11 +20,14 @@
 
 #include <endian.h>
 
-#define PROGRAM_NAME "mkfs.ubifs"
-#include "common.h"
 #include "fscrypt.h"
 #include "defs.h"
+#include "ubifs.h"
 
+/* common.h requires the PROGRAM_NAME macro */
+extern struct ubifs_info info_;
+#define PROGRAM_NAME (info_.program_name)
+#include "common.h"
 
 static __u8 fscrypt_masterkey[FS_MAX_KEY_SIZE];
 static struct cipher *fscrypt_cipher;
diff --git a/ubifs-utils/common/hashtable/hashtable.c b/ubifs-utils/common/hashtable/hashtable.c
index c1f99edd..071afd22 100644
--- a/ubifs-utils/common/hashtable/hashtable.c
+++ b/ubifs-utils/common/hashtable/hashtable.c
@@ -1,15 +1,19 @@
 /* Copyright (C) 2004 Christopher Clark <firstname.lastname@cl.cam.ac.uk> */
 
-#define PROGRAM_NAME "hashtable"
-
-#include "common.h"
-#include "hashtable.h"
-#include "hashtable_private.h"
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
 #include <math.h>
 
+#include "ubifs.h"
+#include "hashtable.h"
+#include "hashtable_private.h"
+
+/* common.h requires the PROGRAM_NAME macro */
+extern struct ubifs_info info_;
+#define PROGRAM_NAME (info_.program_name)
+#include "common.h"
+
 /*
 Credit for primes table: Aaron Krowne
  http://br.endernet.org/~akrowne/
diff --git a/ubifs-utils/common/lpt.c b/ubifs-utils/common/lpt.c
index 23ffe7f7..746fc7db 100644
--- a/ubifs-utils/common/lpt.c
+++ b/ubifs-utils/common/lpt.c
@@ -24,14 +24,17 @@
 #include <openssl/evp.h>
 #endif
 
-#define PROGRAM_NAME "mkfs.ubifs"
-#include "common.h"
 #include "lpt.h"
 #include "defs.h"
 #include "ubifs.h"
 #include "crc16.h"
 #include "sign.h"
 
+/* common.h requires the PROGRAM_NAME macro */
+extern struct ubifs_info info_;
+#define PROGRAM_NAME (info_.program_name)
+#include "common.h"
+
 /**
  * do_calc_lpt_geom - calculate sizes for the LPT area.
  * @c: the UBIFS file-system description object
diff --git a/ubifs-utils/common/ubifs.h b/ubifs-utils/common/ubifs.h
index 0eef31ac..2b0ffe56 100644
--- a/ubifs-utils/common/ubifs.h
+++ b/ubifs-utils/common/ubifs.h
@@ -273,6 +273,9 @@ struct ubifs_znode
  * @highest_inum: highest used inode number
  * @max_sqnum: current global sequence number
  *
+ * @program_type: used to identify the type of current program
+ * @program_name: program name
+ *
  * @jhead_cnt: count of journal heads
  * @max_bud_bytes: maximum number of bytes allowed in buds
  *
@@ -360,6 +363,9 @@ struct ubifs_info
 	ino_t highest_inum;
 	unsigned long long max_sqnum;
 
+	int program_type;
+	const char *program_name;
+
 	int jhead_cnt;
 	long long max_bud_bytes;
 
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 0304ae70..8f292a21 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -3073,6 +3073,9 @@ int main(int argc, char *argv[])
 {
 	int err;
 
+	info_.program_name = MKFS_PROGRAM_NAME;
+	info_.program_type = MKFS_PROGRAM_TYPE;
+
 	if (crypto_init())
 		return -1;
 
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
