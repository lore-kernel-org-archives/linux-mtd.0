Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aAwB3-0001wk-4m
 for linux-mtd@lists.infradead.org; Mon, 21 Dec 2015 08:50:46 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <computersforpeace@gmail.com>, <richard@nod.at>, <david@sigma-star.at>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 13/38] ubifs: defs.h: introduce some compatible definition for
 printk class
Date: Mon, 21 Dec 2015 16:41:36 +0800
Message-ID: <1450687321-12381-14-git-send-email-yangds.fnst@cn.fujitsu.com>
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

There are some functions of printk class in code copied from kernel.
Then add a compatible definitions in defs.h for them.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 ubifs-utils/include/defs.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/ubifs-utils/include/defs.h b/ubifs-utils/include/defs.h
index 1fa3316..739af7f 100644
--- a/ubifs-utils/include/defs.h
+++ b/ubifs-utils/include/defs.h
@@ -81,6 +81,15 @@ __res = ((unsigned long) n) % (unsigned) base; \
 n = ((unsigned long) n) / (unsigned) base; \
 __res; })
 
+/*
+ * printk
+ */
+#define printk(fmt, args...) fprintf(stderr, fmt, ##args)
+#define	KERN_CRIT	""
+#define KERN_ERR	""
+#define ubifs_err(c, fmt, args...) printk(fmt, ##args)
+#define pr_err(fmt, args...) printk(fmt, ##args)
+
 #if INT_MAX != 0x7fffffff
 #error : sizeof(int) must be 4 for this program
 #endif
-- 
1.8.4.2
