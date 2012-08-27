From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@free-electrons.com>
Subject: [PATCH] mtd: orion_nand: remove <mach/hardware.h> include
Date: Tue, 28 Aug 2012 01:35:28 +0200
Message-Id: <1346110528-30858-2-git-send-email-thomas.petazzoni@free-electrons.com>
In-Reply-To: <1346110528-30858-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <20120816183708.GT22226@titan.lakedaemon.net>
 <1346110528-30858-1-git-send-email-thomas.petazzoni@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Ike Pan <ike.pan@canonical.com>,
 Albert Stone <albert.stone@canonical.com>, Nadav Haklai <nadavh@marvell.com>,
 linux-mtd@lists.infradead.org, Ian Molton <ian.molton@codethink.co.uk>,
 Yehuda Yitschak <yehuday@marvell.com>,
 Jani Monoses <jani.monoses@canonical.com>, Tawfik Bayouk <tawfik@marvell.com>,
 Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>,
 Li Li <li.li@canonical.com>, Leif Lindholm <leif.lindholm@arm.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Jon Masters <jcm@redhat.com>,
 Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Chris Van Hoof <vanhoof@canonical.com>, Nicolas Pitre <nico@fluxnic.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, Maen Suleiman <maen@marvell.com>,
 Shadi Ammouri <shadi@marvell.com>, Olof Johansson <olof@lixom.net>,
 Eric Miao <eric.miao@canonical.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit c085d965fb63ac3b4cc7379d45588c0b39e2bdb0 made the ARCH_MVEBU
platform select PLAT_ORION, which means that now all Orion drivers can
be enabled on ARCH_MVEBU. This works fine for most drivers, except for
orion_nand, because it includes <mach/hardware.h>, but mach-mvebu does
not have a mach/hardware.h header (it is considered as a deprecated
practice).

It turns out that the <mach/hardware.h> include in orion_nand is not
necessary: the driver builds perfectly fine without it, so we simply
get rid of it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <dedekind1@gmail.com>
---
 drivers/mtd/nand/orion_nand.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index fc5a868..9ee436d 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -21,7 +21,6 @@
 #include <linux/err.h>
 #include <asm/io.h>
 #include <asm/sizes.h>
-#include <mach/hardware.h>
 #include <plat/orion_nand.h>
 
 static void orion_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
-- 
1.7.9.5
