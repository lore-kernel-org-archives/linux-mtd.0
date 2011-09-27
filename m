Received: from arroyo.ext.ti.com ([192.94.94.40])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R8TNf-0002dp-CO
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2011 08:51:12 +0000
From: "Saxena, Parth" <parth.saxena@ti.com>
To: "Saxena, Parth" <parth.saxena@ti.com>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "tony@atomide.com" <tony@atomide.com>
Date: Tue, 27 Sep 2011 14:21:02 +0530
Subject: RE: [PATCH] ti816x: add support for nand on ti8168 evm
Message-ID: <19F8576C6E063C45BE387C64729E739404EC3121D6@dbde02.ent.ti.com>
References: <1316438648-25760-1-git-send-email-parth.saxena@ti.com>
In-Reply-To: <1316438648-25760-1-git-send-email-parth.saxena@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Basheer, Mansoor Ahamed" <mansoor.ahamed@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If there are no review comments on this patch, can this be merged?

Thanks and Regards,
Parth

> -----Original Message-----
> From: Saxena, Parth
> Sent: Monday, September 19, 2011 6:54 PM
> To: linux-omap@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org; tony@atomide.com; Saxena, Parth;
> Basheer, Mansoor Ahamed
> Subject: [PATCH] ti816x: add support for nand on ti8168 evm
>=20
> Add partition table for NAND device on TI8168 EVM
> and initialise the NAND module.
>=20
> Signed-off-by: Saxena, Parth <parth.saxena@ti.com>
> Signed-off-by: Basheer, Mansoor Ahamed <mansoor.ahamed@ti.com>
> ---
>=20
> This patch is tested on top of linux-omap/master and
> Hemant's patches submitted recently.
>=20
> http://www.mail-archive.com/linux-omap@vger.kernel.org/msg53457.html
> http://www.mail-archive.com/linux-omap@vger.kernel.org/msg54296.html
>=20
>  arch/arm/mach-omap2/board-ti8168evm.c |   39
> +++++++++++++++++++++++++++++++++
>  1 files changed, 39 insertions(+), 0 deletions(-)
>=20
> diff --git a/arch/arm/mach-omap2/board-ti8168evm.c b/arch/arm/mach-
> omap2/board-ti8168evm.c
> index e516a04..87953bb 100644
> --- a/arch/arm/mach-omap2/board-ti8168evm.c
> +++ b/arch/arm/mach-omap2/board-ti8168evm.c
> @@ -14,6 +14,7 @@
>   */
>  #include <linux/kernel.h>
>  #include <linux/init.h>
> +#include <linux/mtd/nand.h>
>=20
>  #include <mach/hardware.h>
>  #include <asm/mach-types.h>
> @@ -23,6 +24,42 @@
>  #include <plat/irqs.h>
>  #include <plat/board.h>
>  #include <plat/common.h>
> +#include <plat/gpmc.h>
> +#include <plat/nand.h>
> +
> +#include "board-flash.h"
> +
> +#define NAND_BLOCK_SIZE		SZ_128K
> +
> +static struct mtd_partition ti816x_nand_partitions[] =3D {
> +/* All the partition sizes are listed in terms of NAND block size */
> +	{
> +		.name		=3D "U-Boot",
> +		.offset		=3D 0,			/* Offset =3D 0x0 */
> +		.size		=3D 18 * NAND_BLOCK_SIZE,
> +		.mask_flags	=3D MTD_WRITEABLE,	/* force read-only */
> +	},
> +	{
> +		.name		=3D "U-Boot Env",
> +		.offset		=3D MTDPART_OFS_APPEND,	/* Offset =3D 0x240000
> */
> +		.size		=3D 2 * NAND_BLOCK_SIZE,
> +	},
> +	{
> +		.name		=3D "Kernel",
> +		.offset		=3D MTDPART_OFS_APPEND,	/* Offset =3D 0x280000
> */
> +		.size		=3D 34 * NAND_BLOCK_SIZE,
> +	},
> +	{
> +		.name		=3D "File System",
> +		.offset		=3D MTDPART_OFS_APPEND,	/* Offset =3D 0x6C0000
> */
> +		.size		=3D 1601 * NAND_BLOCK_SIZE,
> +	},
> +	{
> +		.name		=3D "Reserved",
> +		.offset		=3D MTDPART_OFS_APPEND,	/* Offset =3D
> 0xCEE0000 */
> +		.size		=3D MTDPART_SIZ_FULL,
> +	},
> +};
>=20
>  static struct omap_board_config_kernel ti8168_evm_config[] __initdata =
=3D {
>  };
> @@ -35,6 +72,8 @@ static void __init ti8168_init_early(void)
>=20
>  static void __init ti8168_evm_init(void)
>  {
> +	board_nand_init(ti816x_nand_partitions,
> +		ARRAY_SIZE(ti816x_nand_partitions), 0, NAND_BUSWIDTH_16);
>  	omap_serial_init();
>  	omap_board_config =3D ti8168_evm_config;
>  	omap_board_config_size =3D ARRAY_SIZE(ti8168_evm_config);
> --
> 1.6.2.4
