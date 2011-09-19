Received: from mga09.intel.com ([134.134.136.24])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R5c0H-0001wE-GE
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2011 11:27:14 +0000
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Artem Bityutskiy <artem.bityutskiy@intel.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 7/7] jffs2reader: use major() and minor() helpers
Date: Mon, 19 Sep 2011 14:25:24 +0300
Message-Id: <61bffdc106e852ca1fe209942b057ece9e4e9c36.1316431431.git.andriy.shevchenko@linux.intel.com>
In-Reply-To: <d94e72a2ae7292c5c890b1ad61f04bfdb983250c.1316431431.git.andriy.shevchenko@linux.intel.com>
References: <d94e72a2ae7292c5c890b1ad61f04bfdb983250c.1316431431.git.andriy.shevchenko@linux.intel.com>
In-Reply-To: <d94e72a2ae7292c5c890b1ad61f04bfdb983250c.1316431431.git.andriy.shevchenko@linux.intel.com>
References: <d94e72a2ae7292c5c890b1ad61f04bfdb983250c.1316431431.git.andriy.shevchenko@linux.intel.com>
Cc: Alexey Dokuchaev <danfe@nsu.ru>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are major() and minor() helpers in the standard library. We can use them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 jffs2reader.c |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/jffs2reader.c b/jffs2reader.c
index 238e617..11a46eb 100644
--- a/jffs2reader.c
+++ b/jffs2reader.c
@@ -81,13 +81,6 @@ BUGS:
 
 #define SCRATCH_SIZE (5*1024*1024)
 
-#ifndef MAJOR
-/* FIXME:  I am using illicit insider knowledge of
- * kernel major/minor representation...  */
-#define MAJOR(dev) (((dev)>>8)&0xff)
-#define MINOR(dev) ((dev)&0xff)
-#endif
-
 /* macro to avoid "lvalue required as left operand of assignment" error */
 #define ADD_BYTES(p, n)		((p) = (typeof(p))((char *)(p) + (n)))
 
@@ -362,7 +355,7 @@ void printdir(char *o, size_t size, struct dir *d, const char *path, int recurse
 			dev_t rdev;
 			size_t devsize;
 			putblock((char*)&rdev, sizeof(rdev), &devsize, ri);
-			printf("%4d, %3d ", (int)MAJOR(rdev), (int)MINOR(rdev));
+			printf("%4d, %3d ", major(rdev), minor(rdev));
 		} else {
 			printf("%9ld ", (long)je32_to_cpu(ri->dsize));
 		}
-- 
1.7.5.4
