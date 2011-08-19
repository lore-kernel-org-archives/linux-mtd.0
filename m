Received: from comal.ext.ti.com ([198.47.26.152])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuM88-0002ay-CI
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 10:16:49 +0000
From: "Bhandiwad, Hrishikesh" <hrishikesh.b@ti.com>
To: "Bhandiwad, Hrishikesh" <hrishikesh.b@ti.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Fri, 19 Aug 2011 15:44:59 +0530
Subject: RE: [PATCH] AM3517: NAND: Adding NAND support and specifying NAND
	partitions.
Message-ID: <ADF30F4D7BDE934D9B632CE7D5C7ACA4047C4D08A0B9@dbde03.ent.ti.com>
References: <1312543549-31869-1-git-send-email-hrishikesh.b@ti.com>
In-Reply-To: <1312543549-31869-1-git-send-email-hrishikesh.b@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Tony,

As this patch is trivial , can it be upstreamed .

Thanks & Regards,
Hrishikesh
________________________________________
From: Bhandiwad, Hrishikesh
Sent: Friday, August 05, 2011 4:55 PM
To: linux-omap@vger.kernel.org; linux-kernel@vger.kernel.org; linux-mtd@lis=
ts.infradead.org
Cc: Bhandiwad, Hrishikesh
Subject: [PATCH] AM3517: NAND: Adding NAND support and specifying NAND part=
itions.

This patch adds the NAND support on AM3517 platform and creates the partiti=
ons.
Referred to file: arch/arm/mach-omap2/board-omap3beagle.c

Signed-off-by: Hrishikesh Bhandiwad <hrishikesh.b@ti.com>
---
 arch/arm/mach-omap2/board-am3517evm.c |   38 +++++++++++++++++++++++++++++=
++++
 1 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-omap2/board-am3517evm.c b/arch/arm/mach-omap2/bo=
ard-am3517evm.c
index 63af417..dceb996 100644
--- a/arch/arm/mach-omap2/board-am3517evm.c
+++ b/arch/arm/mach-omap2/board-am3517evm.c
@@ -24,6 +24,8 @@
 #include <linux/i2c/pca953x.h>
 #include <linux/can/platform/ti_hecc.h>
 #include <linux/davinci_emac.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/nand.h>

 #include <mach/hardware.h>
 #include <mach/am35xx.h>
@@ -39,6 +41,7 @@

 #include "mux.h"
 #include "control.h"
+#include "common-board-devices.h"

 #define AM35XX_EVM_MDIO_FREQUENCY      (1000000)

@@ -460,6 +463,37 @@ static void am3517_evm_hecc_init(struct ti_hecc_platfo=
rm_data *pdata)
 static struct omap_board_config_kernel am3517_evm_config[] __initdata =3D =
{
 };

+static struct mtd_partition am3517_nand_partitions[] =3D {
+       /* All the partition sizes are listed in terms of NAND block size *=
/
+       {
+               .name           =3D "X-Loader",
+               .offset         =3D 0,
+               .size           =3D 4 * NAND_BLOCK_SIZE,
+               .mask_flags     =3D MTD_WRITEABLE,        /* force read-onl=
y */
+       },
+       {
+               .name           =3D "U-Boot",
+               .offset         =3D MTDPART_OFS_APPEND,   /* Offset =3D 0x8=
0000 */
+               .size           =3D 15 * NAND_BLOCK_SIZE,
+               .mask_flags     =3D MTD_WRITEABLE,        /* force read-onl=
y */
+       },
+       {
+               .name           =3D "U-Boot Env",
+               .offset         =3D MTDPART_OFS_APPEND,   /* Offset =3D 0x2=
60000 */
+               .size           =3D 1 * NAND_BLOCK_SIZE,
+       },
+       {
+               .name           =3D "Kernel",
+               .offset         =3D MTDPART_OFS_APPEND,   /* Offset =3D 0x2=
80000 */
+               .size           =3D 32 * NAND_BLOCK_SIZE,
+       },
+       {
+               .name           =3D "File System",
+               .offset         =3D MTDPART_OFS_APPEND,   /* Offset =3D 0x6=
80000 */
+               .size           =3D MTDPART_SIZ_FULL,
+       },
+};
+
 static void __init am3517_evm_init(void)
 {
        omap_board_config =3D am3517_evm_config;
@@ -473,6 +507,10 @@ static void __init am3517_evm_init(void)
        /* Configure GPIO for EHCI port */
        omap_mux_init_gpio(57, OMAP_PIN_OUTPUT);
        usbhs_init(&usbhs_bdata);
+       /*NAND*/
+       omap_nand_flash_init(NAND_BUSWIDTH_16, am3517_nand_partitions,
+                               ARRAY_SIZE(am3517_nand_partitions));
+
        am3517_evm_hecc_init(&am3517_evm_hecc_pdata);
        /* DSS */
        am3517_evm_display_init();
--
1.6.2.4
This patch has dependency on following patchset :
http://marc.info/?l=3Dlinux-omap&m=3D131247357813228&w=3D2
