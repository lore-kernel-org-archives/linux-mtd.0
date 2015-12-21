Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAwAz-0000mf-Ho
 for linux-mtd@lists.infradead.org; Mon, 21 Dec 2015 08:50:44 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard@nod.at>, <david@sigma-star.at>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 17/38] ubifs: add some more compatible definitions in defs.h
Date: Mon, 21 Dec 2015 16:41:40 +0800
Message-ID: <1450687321-12381-18-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1450687321-12381-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add kmalloc class compatible definitions to defs.h.
Add error pointer class compatible definitions to defs.h.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 ubifs-utils/include/defs.h | 84 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/ubifs-utils/include/defs.h b/ubifs-utils/include/defs.h
index 739af7f..ed42ab1 100644
--- a/ubifs-utils/include/defs.h
+++ b/ubifs-utils/include/defs.h
@@ -6,6 +6,37 @@
 #ifndef __UBIFS_DEFS_H__
 #define __UBIFS_DEFS_H__
 
+#include <stdio.h>
+#include <stdlib.h>
+#include <errno.h>
+#include <string.h>
+#include <endian.h>
+#include <byteswap.h>
+#include <assert.h>
+#include <stddef.h>
+#include <linux/types.h>
+#include <stdint.h>
+
+#include <features.h>
+
+#ifndef __GLIBC__
+#define BTRFS_DISABLE_BACKTRACE
+#define __always_inline __inline __attribute__ ((__always_inline__))
+#endif
+
+#ifndef BTRFS_DISABLE_BACKTRACE
+#include <execinfo.h>
+#endif
+
+#define ptr_to_u64(x)	((u64)(uintptr_t)x)
+#define u64_to_ptr(x)	((void *)(uintptr_t)x)
+
+#ifndef READ
+#define READ 0
+#define WRITE 1
+#define READA 2
+#endif
+
 #define t16(x) ({ \
 	uint16_t __b = (x); \
 	(__LITTLE_ENDIAN==__BYTE_ORDER) ? __b : bswap_16(__b); \
@@ -82,6 +113,41 @@ n = ((unsigned long) n) / (unsigned) base; \
 __res; })
 
 /*
+ * error pointer
+ */
+#define MAX_ERRNO	4095
+#define IS_ERR_VALUE(x) ((x) >= (unsigned long)-MAX_ERRNO)
+
+static inline void *ERR_PTR(long error)
+{
+	return (void *) error;
+}
+
+static inline long PTR_ERR(const void *ptr)
+{
+	return (long) ptr;
+}
+
+static inline long IS_ERR(const void *ptr)
+{
+	return IS_ERR_VALUE((unsigned long)ptr);
+}
+
+#define cond_resched()		do { } while (0)
+#define preempt_enable()	do { } while (0)
+#define preempt_disable()	do { } while (0)
+
+/*
+ * kmalloc/kfree
+ */
+#define kmalloc(x, y) malloc(x)
+#define kzalloc(x, y) calloc(1, x)
+#define kstrdup(x, y) strdup(x)
+#define kfree(x) free(x)
+#define vmalloc(x) malloc(x)
+#define vfree(x) free(x)
+
+/*
  * printk
  */
 #define printk(fmt, args...) fprintf(stderr, fmt, ##args)
@@ -90,6 +156,24 @@ __res; })
 #define ubifs_err(c, fmt, args...) printk(fmt, ##args)
 #define pr_err(fmt, args...) printk(fmt, ##args)
 
+#define container_of(ptr, type, member) ({                      \
+        const typeof( ((type *)0)->member ) *__mptr = (ptr);    \
+	        (type *)( (char *)__mptr - offsetof(type,member) );})
+
+#define gfp_t int
+#define get_cpu_var(p) (p)
+#define __get_cpu_var(p) (p)
+#define BITS_PER_LONG (__SIZEOF_LONG__ * 8)
+#define __GFP_BITS_SHIFT 20
+#define __GFP_BITS_MASK ((int)((1 << __GFP_BITS_SHIFT) - 1))
+#define GFP_KERNEL 0
+#define GFP_NOFS 0
+#define __read_mostly
+
+#ifndef ULONG_MAX
+#define ULONG_MAX       (~0UL)
+#endif
+
 #if INT_MAX != 0x7fffffff
 #error : sizeof(int) must be 4 for this program
 #endif
-- 
1.8.4.2
