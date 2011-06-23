Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QZt2k-0007o0-1b
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 23:10:38 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH] mtd-utils: bump nanddump, mtdinfo version numbers
Date: Thu, 23 Jun 2011 16:09:47 -0700
Message-ID: <1308870587-5300-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nanddump.c              |    2 +-
 ubi-utils/src/mtdinfo.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 54cb1af..0367d83 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -14,7 +14,7 @@
  */
 
 #define PROGRAM_NAME "nanddump"
-#define VERSION "1.30"
+#define VERSION "1.31"
 
 #define _GNU_SOURCE
 #include <ctype.h>
diff --git a/ubi-utils/src/mtdinfo.c b/ubi-utils/src/mtdinfo.c
index b6077e4..bfd7e6d 100644
--- a/ubi-utils/src/mtdinfo.c
+++ b/ubi-utils/src/mtdinfo.c
@@ -21,7 +21,7 @@
  * Author: Artem Bityutskiy
  */
 
-#define PROGRAM_VERSION "1.0"
+#define PROGRAM_VERSION "1.1"
 #define PROGRAM_NAME    "mtdinfo"
 
 #include <stdint.h>
-- 
1.7.0.4
