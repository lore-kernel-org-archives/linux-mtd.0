Message-ID: <49DD8D39.6090300@nokia.com>
Date: Thu, 09 Apr 2009 08:52:57 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] MTD: change email address for Adrian Hunter
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Adrian Hunter <adrian.hunter@nokia.com>

Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c  |    2 +-
 drivers/mtd/tests/mtd_oobtest.c     |    2 +-
 drivers/mtd/tests/mtd_pagetest.c    |    2 +-
 drivers/mtd/tests/mtd_readtest.c    |    2 +-
 drivers/mtd/tests/mtd_speedtest.c   |    2 +-
 drivers/mtd/tests/mtd_stresstest.c  |    2 +-
 drivers/mtd/tests/mtd_subpagetest.c |    2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 30d6999..ec5e530 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -5,7 +5,7 @@
  *  Kyungmin Park <kyungmin.park@samsung.com>
  *
  *  Credits:
- *	Adrian Hunter <ext-adrian.hunter@nokia.com>:
+ *	Adrian Hunter <adrian.hunter@nokia.com>:
  *	auto-placement support, read-while load support, various fixes
  *	Copyright (C) Nokia Corporation, 2007
  *
diff --git a/drivers/mtd/tests/mtd_oobtest.c b/drivers/mtd/tests/mtd_oobtest.c
index a18e8d2..3e96cdb 100644
--- a/drivers/mtd/tests/mtd_oobtest.c
+++ b/drivers/mtd/tests/mtd_oobtest.c
@@ -16,7 +16,7 @@
  *
  * Test OOB read and write on MTD device.
  *
- * Author: Adrian Hunter <ext-adrian.hunter@nokia.com>
+ * Author: Adrian Hunter <adrian.hunter@nokia.com>
  */
 
 #include <asm/div64.h>
diff --git a/drivers/mtd/tests/mtd_pagetest.c b/drivers/mtd/tests/mtd_pagetest.c
index 9648818..4e6d327 100644
--- a/drivers/mtd/tests/mtd_pagetest.c
+++ b/drivers/mtd/tests/mtd_pagetest.c
@@ -16,7 +16,7 @@
  *
  * Test page read and write on MTD device.
  *
- * Author: Adrian Hunter <ext-adrian.hunter@nokia.com>
+ * Author: Adrian Hunter <adrian.hunter@nokia.com>
  */
 
 #include <asm/div64.h>
diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readtest.c
index 79fc453..05182a3 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -16,7 +16,7 @@
  *
  * Check MTD device read.
  *
- * Author: Adrian Hunter <ext-adrian.hunter@nokia.com>
+ * Author: Adrian Hunter <adrian.hunter@nokia.com>
  */
 
 #include <linux/init.h>
diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index 141363a..46f3c53 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -16,7 +16,7 @@
  *
  * Test read and write speed of a MTD device.
  *
- * Author: Adrian Hunter <ext-adrian.hunter@nokia.com>
+ * Author: Adrian Hunter <adrian.hunter@nokia.com>
  */
 
 #include <linux/init.h>
diff --git a/drivers/mtd/tests/mtd_stresstest.c b/drivers/mtd/tests/mtd_stresstest.c
index 6392047..c46d944 100644
--- a/drivers/mtd/tests/mtd_stresstest.c
+++ b/drivers/mtd/tests/mtd_stresstest.c
@@ -16,7 +16,7 @@
  *
  * Test random reads, writes and erases on MTD device.
  *
- * Author: Adrian Hunter <ext-adrian.hunter@nokia.com>
+ * Author: Adrian Hunter <adrian.hunter@nokia.com>
  */
 
 #include <linux/init.h>
diff --git a/drivers/mtd/tests/mtd_subpagetest.c b/drivers/mtd/tests/mtd_subpagetest.c
index 5b88972..f91e22f 100644
--- a/drivers/mtd/tests/mtd_subpagetest.c
+++ b/drivers/mtd/tests/mtd_subpagetest.c
@@ -15,7 +15,7 @@
  * Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
  *
  * Test sub-page read and write on MTD device.
- * Author: Adrian Hunter <ext-adrian.hunter@nokia.com>
+ * Author: Adrian Hunter <adrian.hunter@nokia.com>
  *
  */
 
-- 
1.5.4.3
