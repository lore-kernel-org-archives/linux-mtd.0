Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsnYl-0001m5-J7
 for linux-mtd@lists.infradead.org; Sun, 01 Nov 2015 08:00:16 +0000
Date: Sun, 1 Nov 2015 08:59:45 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Ezequiel
 Garcia <ezequiel@vanguardiasur.com.ar>, Marek Vasut <marex@denx.de>, Scott
 Wood <scottwood@freescale.com>, Josh Wu <josh.wu@atmel.com>, Robert Jarzmik
 <robert.jarzmik@free.fr>, Kyungmin Park <kyungmin.park@samsung.com>, Han Xu
 <han.xu@freescale.com>
Subject: Re: [PATCH v2 00/11] mtd: migrate 'of_node' handling to core, not
 in mtd_part_parser_data
Message-ID: <20151101085945.66bba1fe@bbrezillon>
In-Reply-To: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
References: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 30 Oct 2015 20:33:19 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> Hi,
> 
> I noticed that, for MTD drivers that want to support DT partition parsing
> (essentially all recent ones), it's a bit awkward to set the tell MTD which DT
> node to use. I also noticed that this info is duplicated in a few places;
> namely, some sub-subsystems (like SPI NOR and NAND) need their own field to
> track the DT node, so let's have the propagate the 'MTD' DT node down for us.
> 
> Besides simplifying the boilerplate throughout MTD, this series also has the
> side effect of producing 'of_node' symlinks in sysfs. e.g.:
> 
>   # ls -al /sys/class/mtd/mtd0/of_node
>   lrwxrwxrwx 1 root root 0 Oct 26 19:17 /sys/class/mtd/mtd0/of_node -> ../../../../firmware/devicetree/base/spi@ff130000/flash@0
> 
> For NAND, this potentially has some other bigger initial side effects, since
> nand_dt_init() handles a bit more automagically for drivers that defined their
> ->flash_node. But these drivers should probably convert anyway. So, please test
> your favorite driver!

Looks all good to me,

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> 
> v1 -> v2:
>  * add helper functions for getting/setting the MTD/SPI-NOR/NAND DT node
>  * fix some build errors
>  * drop spi_nor's flash_node field (just use the MTD of_node)
> 
> Regards,
> Brian
> 
> Brian Norris (11):
>   mtd: add get/set of_node/flash_node helpers
>   mtd: ofpart: grab device tree node directly from master device node
>   mtd: {nand,spi-nor}: assign MTD of_node
>   mtd: nand: convert to nand_set_flash_node()
>   mtd: spi-nor: convert to spi_nor_{get,set}_flash_node()
>   mtd: nand: drop unnecessary partition parser data
>   mtd: spi-nor: drop unnecessary partition parser data
>   mtd: spi-nor: drop flash_node field
>   mtd: drop unnecessary partition parser data
>   mtd: ofpart: drop 'of_node' partition parser data
>   mtd: physmap_of: assign parent for the concatenated MTD
> 
>  drivers/mtd/devices/m25p80.c                  | 10 +++-------
>  drivers/mtd/devices/mtd_dataflash.c           |  5 ++---
>  drivers/mtd/devices/spear_smi.c               |  6 ++----
>  drivers/mtd/devices/st_spi_fsm.c              |  5 ++---
>  drivers/mtd/maps/lantiq-flash.c               |  5 ++---
>  drivers/mtd/maps/physmap_of.c                 |  6 +++---
>  drivers/mtd/nand/atmel_nand.c                 |  7 +++----
>  drivers/mtd/nand/brcmnand/brcmnand.c          |  5 ++---
>  drivers/mtd/nand/davinci_nand.c               | 10 +++-------
>  drivers/mtd/nand/fsl_elbc_nand.c              |  5 ++---
>  drivers/mtd/nand/fsl_ifc_nand.c               |  5 ++---
>  drivers/mtd/nand/fsl_upm.c                    |  5 ++---
>  drivers/mtd/nand/fsmc_nand.c                  |  9 ++++-----
>  drivers/mtd/nand/gpio.c                       |  8 +++-----
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c        |  5 ++---
>  drivers/mtd/nand/hisi504_nand.c               |  5 ++---
>  drivers/mtd/nand/lpc32xx_mlc.c                |  7 +++----
>  drivers/mtd/nand/lpc32xx_slc.c                |  7 +++----
>  drivers/mtd/nand/mpc5121_nfc.c                |  5 ++---
>  drivers/mtd/nand/mxc_nand.c                   |  5 ++---
>  drivers/mtd/nand/nand_base.c                  |  3 +++
>  drivers/mtd/nand/ndfc.c                       |  5 ++---
>  drivers/mtd/nand/omap2.c                      |  6 ++----
>  drivers/mtd/nand/orion_nand.c                 |  6 ++----
>  drivers/mtd/nand/plat_nand.c                  |  5 ++---
>  drivers/mtd/nand/pxa3xx_nand.c                | 10 +++++-----
>  drivers/mtd/nand/sh_flctl.c                   |  6 ++----
>  drivers/mtd/nand/socrates_nand.c              |  5 ++---
>  drivers/mtd/nand/sunxi_nand.c                 |  6 ++----
>  drivers/mtd/nand/vf610_nfc.c                  |  8 ++------
>  drivers/mtd/ofpart.c                          | 12 ++++--------
>  drivers/mtd/onenand/omap2.c                   |  8 +++-----
>  drivers/mtd/spi-nor/fsl-quadspi.c             |  6 ++----
>  drivers/mtd/spi-nor/nxp-spifi.c               |  6 ++----
>  drivers/mtd/spi-nor/spi-nor.c                 |  2 +-
>  drivers/staging/mt29f_spinand/mt29f_spinand.c |  5 ++---
>  include/linux/mtd/mtd.h                       | 11 +++++++++++
>  include/linux/mtd/nand.h                      | 11 +++++++++++
>  include/linux/mtd/partitions.h                |  2 --
>  include/linux/mtd/spi-nor.h                   | 13 +++++++++++--
>  40 files changed, 120 insertions(+), 141 deletions(-)
> 



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
