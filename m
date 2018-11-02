To: LKML <linux-kernel@vger.kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jacopo Mondi <jacopo@jmondi.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Magnus Damm <magnus.damm@gmail.com>, linux-mtd@lists.infradead.org,
 linux-sh@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2] arch/sh: mach-kfr2r09: fix struct mtd_oob_ops build warning
Message-ID: <99e03339-5fab-bcdf-902d-962084db86e8@infradead.org>
Date: Fri, 2 Nov 2018 09:14:12 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <rdunlap@infradead.org>

arch/sh/boards/mach-kfr2r09/setup.c does not need to #include
<mtd/onenand.h>, and doing so causes a build warning, so drop
that header file.

In file included from ../arch/sh/boards/mach-kfr2r09/setup.c:28:
../include/linux/mtd/onenand.h:225:12: warning: 'struct mtd_oob_ops' declared inside parameter list will not be visible outside of this definition or declaration
     struct mtd_oob_ops *ops);

Fixes: 33893d7aa000 ("sh: kfr2r09 board support - NAND flash")

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Jacopo Mondi <jacopo@jmondi.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-sh@vger.kernel.org
---
v2: fix the Fixes commit ID and add Ack from Jacopo.

 arch/sh/boards/mach-kfr2r09/setup.c |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20181101.orig/arch/sh/boards/mach-kfr2r09/setup.c
+++ linux-next-20181101/arch/sh/boards/mach-kfr2r09/setup.c
@@ -25,7 +25,6 @@
 #include <linux/memblock.h>
 #include <linux/mfd/tmio.h>
 #include <linux/mmc/host.h>
-#include <linux/mtd/onenand.h>
 #include <linux/mtd/physmap.h>
 #include <linux/platform_data/lv5207lp.h>
 #include <linux/platform_device.h>
