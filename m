Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XejmU-00069Q-Vo
 for linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 12:03:48 +0000
Message-ID: <543FB3C1.9050800@huawei.com>
Date: Thu, 16 Oct 2014 20:02:09 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 1/2] mtd-utils:  Add macros to include/common.h
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds four macros:

    ALIGN, __ALIGN_MASK, min_t and max_t

to include/common.h.

Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 include/common.h |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/include/common.h b/include/common.h
index 6895e5c..9b8804a 100644
--- a/include/common.h
+++ b/include/common.h
@@ -47,6 +47,21 @@ extern "C" {
 #define min(a, b) MIN(a, b) /* glue for linux kernel source */
 #define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))

+#define ALIGN(x,a) __ALIGN_MASK(x,(typeof(x))(a)-1)
+#define __ALIGN_MASK(x,mask) (((x)+(mask))&~(mask))
+
+#define min_t(t,x,y) ({ \
+	typeof((x)) _x = (x); \
+	typeof((y)) _y = (y); \
+	(_x < _y) ? _x : _y; \
+})
+
+#define max_t(t,x,y) ({ \
+	typeof((x)) _x = (x); \
+	typeof((y)) _y = (y); \
+	(_x > _y) ? _x : _y; \
+})
+
 #ifndef O_CLOEXEC
 #define O_CLOEXEC 0
 #endif
-- 
1.6.0.2
