Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ds07J-0006Xw-NN
 for linux-mtd@lists.infradead.org; Wed, 13 Sep 2017 05:21:51 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 3/9] mtd: nand: denali: consolidate include directives
Date: Wed, 13 Sep 2017 14:20:40 +0900
Message-Id: <1505280046-16608-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1505280046-16608-1-git-send-email-yamada.masahiro@socionext.com>
References: <1505280046-16608-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Include necessary headers explicitly without relying on indirect
header inclusion.  Also, sort them alphabetically.

<linux/delay.h>, <linux/wait.h>, <linux/mutex.h> turned out bogus,
so removed.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c     | 12 +++++++-----
 drivers/mtd/nand/denali.h     |  3 +++
 drivers/mtd/nand/denali_dt.c  |  3 ++-
 drivers/mtd/nand/denali_pci.c |  3 +++
 4 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 48193f9..4daeb7f 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -16,14 +16,16 @@
  * 51 Franklin St - Fifth Floor, Boston, MA 02110-1301 USA.
  *
  */
-#include <linux/interrupt.h>
-#include <linux/delay.h>
+
+#include <linux/completion.h>
 #include <linux/dma-mapping.h>
-#include <linux/wait.h>
-#include <linux/mutex.h>
-#include <linux/mtd/mtd.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
 #include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 
 #include "denali.h"
 
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 9239e67..dc3f970 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -21,7 +21,10 @@
 #define __DENALI_H__
 
 #include <linux/bitops.h>
+#include <linux/completion.h>
 #include <linux/mtd/rawnand.h>
+#include <linux/spinlock_types.h>
+#include <linux/types.h>
 
 #define DEVICE_RESET				0x0
 #define     DEVICE_RESET__BANK(bank)			BIT(bank)
diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index 56e2e17..01e0100 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -12,15 +12,16 @@
  * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
  * more details.
  */
+
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/platform_device.h>
 
 #include "denali.h"
 
diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
index 81370c7..7d5600b 100644
--- a/drivers/mtd/nand/denali_pci.c
+++ b/drivers/mtd/nand/denali_pci.c
@@ -11,6 +11,9 @@
  * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
  * more details.
  */
+
+#include <linux/errno.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
-- 
2.7.4
