Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QbGY6-0003FX-Qb
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 18:28:46 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 05/10] mkfs.ubifs: use common.h
Date: Mon, 27 Jun 2011 11:27:22 -0700
Message-ID: <1309199247-19248-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
References: <1309199247-19248-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To use more unified versioning and to re-use other existing code,
switch to common.h.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 mkfs.ubifs/mkfs.ubifs.c |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index ac3c8d3..c718818 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -20,8 +20,11 @@
  *          Zoltan Sogor
  */
 
+#define PROGRAM_NAME "mkfs.ubifs"
+
 #include "mkfs.ubifs.h"
 #include <crc32.h>
+#include "common.h"
 
 #define PROGRAM_VERSION "1.5"
 
@@ -390,11 +393,6 @@ static long long add_space_overhead(long long size)
         return size / divisor;
 }
 
-static inline int is_power_of_2(unsigned long long n)
-{
-                return (n != 0 && ((n & (n - 1)) == 0));
-}
-
 static int validate_options(void)
 {
 	int tmp;
-- 
1.7.0.4
