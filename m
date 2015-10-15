Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmZu2-0002pf-0V
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2015 04:12:31 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <david@sigma-star.at>, <dedekind1@gmail.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 25/27] ubifs: defs.h: introduce some compatible definitions
 about integer such as __u16
Date: Thu, 15 Oct 2015 12:04:48 +0800
Message-ID: <1444881890-4012-26-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1444881890-4012-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1444881890-4012-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Add __uXX class compatible definitions in defs.h

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 ubifs-utils/include/defs.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/ubifs-utils/include/defs.h b/ubifs-utils/include/defs.h
index ed42ab1..91ef175 100644
--- a/ubifs-utils/include/defs.h
+++ b/ubifs-utils/include/defs.h
@@ -174,6 +174,36 @@ static inline long IS_ERR(const void *ptr)
 #define ULONG_MAX       (~0UL)
 #endif
 
+#ifndef __CHECKER__
+/*
+ * Since we're using primitive definitions from kernel-space, we need to
+ * define __KERNEL__ so that system header files know which definitions
+ * to use.
+ */
+#define __KERNEL__
+#include <asm/types.h>
+typedef __u32 u32;
+typedef __u64 u64;
+typedef __u16 u16;
+typedef __u8 u8;
+typedef __s64 s64;
+typedef __s32 s32;
+
+/*
+ * Continuing to define __KERNEL__ breaks others parts of the code, so
+ * we can just undefine it now that we have the correct headers...
+ */
+#undef __KERNEL__
+#else
+typedef unsigned int u32;
+typedef unsigned int __u32;
+typedef unsigned long long u64;
+typedef unsigned char u8;
+typedef unsigned short u16;
+typedef long long s64;
+typedef int s32;
+#endif
+
 #if INT_MAX != 0x7fffffff
 #error : sizeof(int) must be 4 for this program
 #endif
-- 
1.8.4.2
