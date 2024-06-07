Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F081DC27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/AhrMbQVXbW6dekFS7v8yy4ADaqAk56h4LpEcoXAG/4=; b=oBHdNbeL9I/xSx
	f61j2GS7BTHM4WSbZCp15d6JjX7lI1BXykrbN0u0EzhlOWqMiFyRf7X5DV03MYn0tmrjPzEVr16Ma
	3hwDAmYLZXx868FNDurAho3HkVxMywi2tpqgD/R5+wjuZ1+hnS+YGUuPZXbU3rKqqVTDud7MJDxcK
	Yp0Fw8x4AYLpICSy6abo2IzQoi85FJrwadw8jK1E5PYsSxXqVvriDrkSniPoUArQ9U4mwno+P2nzR
	9YWOm2F8rqex95oXqnjF6EHY4l2kMtjmIruEr997ETvX2w7LgaFn2Si81FzL4VmKLwm9L1HDnj6rk
	ywL+TCOzjbZJY2cY6SKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCd-0000000CGzC-3rdM;
	Fri, 07 Jun 2024 04:27:47 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRBl-0000000CGAI-1Gog
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:27:06 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VwSjS5mLvzwPFT;
	Fri,  7 Jun 2024 12:22:52 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id B3B9B1400D5;
	Fri,  7 Jun 2024 12:26:51 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:26:44 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 024/110] ubifs-utils: Add bit operations implementations
Date: Fri, 7 Jun 2024 12:24:49 +0800
Message-ID: <20240607042615.2069840-25-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_212654_394805_5C6425CB 
X-CRM114-Status: GOOD (  22.71  )
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

Add bit operations implementations, because there are some bit operations
(eg. __set_bit, test_bit) used in UBIFS linux kernel libs.

This is a preparation for replacing implementation of UBIFS utils with
linux kernel libs.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/Makemodule.am   |   2 +
 ubifs-utils/common/bitops.c |  37 +++++++++++
 ubifs-utils/common/bitops.h | 152 ++++++++++++++++++++++++++++++++++++++++++++
 ubifs-utils/common/defs.h   |  36 -----------
 ubifs-utils/common/lpt.c    |   1 +
 5 files changed, 192 insertions(+), 36 deletions(-)
 create mode 100644 ubifs-utils/common/bitops.c
 create mode 100644 ubifs-utils/common/bitops.h

diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index 58162579..9e075071 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -3,6 +3,8 @@ common_SOURCES = \
 	ubifs-utils/common/linux_types.h \
 	ubifs-utils/common/linux_err.h \
 	ubifs-utils/common/atomic.h \
+	ubifs-utils/common/bitops.h \
+	ubifs-utils/common/bitops.c \
 	ubifs-utils/common/kmem.h \
 	ubifs-utils/common/kmem.c \
 	ubifs-utils/common/defs.h \
diff --git a/ubifs-utils/common/bitops.c b/ubifs-utils/common/bitops.c
new file mode 100644
index 00000000..c82f1fae
--- /dev/null
+++ b/ubifs-utils/common/bitops.c
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Realizations of bit operations.
+ */
+
+#include "bitops.h"
+#include "defs.h"
+
+/*
+ * This is a common helper function for find_next_bit and
+ * find_next_zero_bit.  The difference is the "invert" argument, which
+ * is XORed with each fetched word before searching it for one bits.
+ */
+unsigned long _find_next_bit(const unsigned long *addr,
+		unsigned long nbits, unsigned long start, unsigned long invert)
+{
+	unsigned long tmp;
+
+	if (!nbits || start >= nbits)
+		return nbits;
+
+	tmp = addr[start / BITS_PER_LONG] ^ invert;
+
+	/* Handle 1st word. */
+	tmp &= BITMAP_FIRST_WORD_MASK(start);
+	start = round_down(start, BITS_PER_LONG);
+
+	while (!tmp) {
+		start += BITS_PER_LONG;
+		if (start >= nbits)
+			return nbits;
+
+		tmp = addr[start / BITS_PER_LONG] ^ invert;
+	}
+
+	return min(start + __ffs(tmp), nbits);
+}
diff --git a/ubifs-utils/common/bitops.h b/ubifs-utils/common/bitops.h
new file mode 100644
index 00000000..3a2d3f87
--- /dev/null
+++ b/ubifs-utils/common/bitops.h
@@ -0,0 +1,152 @@
+#ifndef __BITOPS_H__
+#define __BITOPS_H__
+
+/*
+ * Non-atomic bitops.
+ */
+
+#include <stdbool.h>
+
+#define BITS_PER_LONG			__LONG_WIDTH__
+#define DIV_ROUND_UP(n, d)		(((n) + (d) - 1) / (d))
+#define BITS_TO_LONGS(nr)		DIV_ROUND_UP(nr, BITS_PER_LONG)
+
+#define BIT_MASK(nr)			(1UL << ((nr) % BITS_PER_LONG))
+#define BIT_WORD(nr)			((nr) / BITS_PER_LONG)
+#define BITMAP_FIRST_WORD_MASK(start)	(~0UL << ((start) & (BITS_PER_LONG - 1)))
+
+static inline void __set_bit(int nr, volatile unsigned long *addr)
+{
+	unsigned long mask = BIT_MASK(nr);
+	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
+
+	*p  |= mask;
+}
+
+static inline void set_bit(int nr, volatile unsigned long *addr)
+{
+	__set_bit(nr, addr);
+}
+
+static inline void __clear_bit(int nr, volatile unsigned long *addr)
+{
+	unsigned long mask = BIT_MASK(nr);
+	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
+
+	*p &= ~mask;
+}
+
+static inline void clear_bit(int nr, volatile unsigned long *addr)
+{
+	__clear_bit(nr, addr);
+}
+
+static inline bool test_bit(int nr, const volatile unsigned long *addr)
+{
+	unsigned long mask = BIT_MASK(nr);
+	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
+
+	return (*p & mask) != 0;
+}
+
+/* Sets and returns original value of the bit */
+static inline int test_and_set_bit(int nr, volatile unsigned long *addr)
+{
+	if (test_bit(nr, addr))
+		return 1;
+	set_bit(nr, addr);
+	return 0;
+}
+
+/**
+ * fls - find last (most-significant) bit set
+ * @x: the word to search
+ *
+ * This is defined the same way as ffs.
+ * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
+ */
+static inline int fls(int x)
+{
+	int r = 32;
+
+	if (!x)
+		return 0;
+	if (!(x & 0xffff0000u)) {
+		x <<= 16;
+		r -= 16;
+	}
+	if (!(x & 0xff000000u)) {
+		x <<= 8;
+		r -= 8;
+	}
+	if (!(x & 0xf0000000u)) {
+		x <<= 4;
+		r -= 4;
+	}
+	if (!(x & 0xc0000000u)) {
+		x <<= 2;
+		r -= 2;
+	}
+	if (!(x & 0x80000000u)) {
+		x <<= 1;
+		r -= 1;
+	}
+	return r;
+}
+
+/**
+ * __ffs - find first bit in word.
+ * @word: The word to search
+ *
+ * Undefined if no bit exists, so code should check against 0 first.
+ */
+static inline unsigned long __ffs(unsigned long word)
+{
+	int num = 0;
+
+#if BITS_PER_LONG == 64
+	if ((word & 0xffffffff) == 0) {
+		num += 32;
+		word >>= 32;
+	}
+#endif
+	if ((word & 0xffff) == 0) {
+		num += 16;
+		word >>= 16;
+	}
+	if ((word & 0xff) == 0) {
+		num += 8;
+		word >>= 8;
+	}
+	if ((word & 0xf) == 0) {
+		num += 4;
+		word >>= 4;
+	}
+	if ((word & 0x3) == 0) {
+		num += 2;
+		word >>= 2;
+	}
+	if ((word & 0x1) == 0)
+		num += 1;
+	return num;
+}
+
+unsigned long _find_next_bit(const unsigned long *addr,
+		unsigned long nbits, unsigned long start, unsigned long invert);
+
+/*
+ * Find the next set bit in a memory region.
+ */
+static inline unsigned long find_next_bit(const unsigned long *addr,
+			unsigned long size, unsigned long offset)
+{
+	return _find_next_bit(addr, size, offset, 0UL);
+}
+
+static inline unsigned long find_next_zero_bit(const unsigned long *addr,
+			unsigned long size, unsigned long offset)
+{
+	return _find_next_bit(addr, size, offset, ~0UL);
+}
+
+#endif
diff --git a/ubifs-utils/common/defs.h b/ubifs-utils/common/defs.h
index dd3b806e..485c50c0 100644
--- a/ubifs-utils/common/defs.h
+++ b/ubifs-utils/common/defs.h
@@ -28,42 +28,6 @@ enum { MKFS_PROGRAM_TYPE = 0 };
 
 #define unlikely(x) (x)
 
-/**
- * fls - find last (most-significant) bit set
- * @x: the word to search
- *
- * This is defined the same way as ffs.
- * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
- */
-static inline int fls(int x)
-{
-	int r = 32;
-
-	if (!x)
-		return 0;
-	if (!(x & 0xffff0000u)) {
-		x <<= 16;
-		r -= 16;
-	}
-	if (!(x & 0xff000000u)) {
-		x <<= 8;
-		r -= 8;
-	}
-	if (!(x & 0xf0000000u)) {
-		x <<= 4;
-		r -= 4;
-	}
-	if (!(x & 0xc0000000u)) {
-		x <<= 2;
-		r -= 2;
-	}
-	if (!(x & 0x80000000u)) {
-		x <<= 1;
-		r -= 1;
-	}
-	return r;
-}
-
 #define do_div(n,base) ({ \
 int __res; \
 __res = ((unsigned long) n) % (unsigned) base; \
diff --git a/ubifs-utils/common/lpt.c b/ubifs-utils/common/lpt.c
index d07f569f..3c55f91b 100644
--- a/ubifs-utils/common/lpt.c
+++ b/ubifs-utils/common/lpt.c
@@ -25,6 +25,7 @@
 #endif
 
 #include "lpt.h"
+#include "bitops.h"
 #include "defs.h"
 #include "ubifs.h"
 #include "crc16.h"
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
