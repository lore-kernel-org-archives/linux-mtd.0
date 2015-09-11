Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZaXA0-0004wn-UH
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2015 22:51:14 +0000
Received: by padhy16 with SMTP id hy16so86498593pad.1
 for <linux-mtd@lists.infradead.org>; Fri, 11 Sep 2015 15:50:52 -0700 (PDT)
Date: Fri, 11 Sep 2015 15:50:50 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-mtd@lists.infradead.org, Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH V2 1/2] mtd: spi-nor: Decouple SPI NOR's device_node from
 controller device
Message-ID: <20150911225050.GH11487@google.com>
References: <1441298137-12199-1-git-send-email-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1441298137-12199-1-git-send-email-marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 03, 2015 at 06:35:36PM +0200, Marek Vasut wrote:
> The problem this patch is trying to address is such, that SPI NOR flash
> devices attached to a dedicated SPI NOR controller cannot read their
> properties from the associated struct device_node.
> 
> A couple of facts first:
> 1) Each SPI NOR flash has a struct spi_nor associated with it.
> 2) Each SPI NOR flash has certain device properties associated
>    with it, for example the OF property 'm25p,fast-read' is a
>    good pick. These properties are used by the SPI NOR core to
>    select which opcodes are sent to such SPI NOR flash. These
>    properties are coming from spi_nor .dev->of_node .
> 
> The problem is, that for SPI NOR controllers, the struct spi_nor .dev
> element points to the struct device of the SPI NOR controller, not the
> SPI NOR flash. Therefore, the associated dev->of_node also is the
> one of the controller and therefore the SPI NOR core code is trying to
> parse the SPI NOR controller's properties, not the properties of the
> SPI NOR flash.
> 
> Note: The m25p80 driver is not affected, because the controller and
>       the flash are the same device, so the associated device_node
>       of the controller and the flash are the same.
> 
> This patch adjusts the SPI NOR core such that the device_node is not
> picked from spi_nor .dev directly, but from a new separate spi_nor
> .flash_node element. This let's the SPI NOR controller drivers set up
> a different spi_nor .flash_node element for each SPI NOR flash.
> 
> This patch also fixes the controller drivers to be compatible with
> this modification and correctly set the spi_nor .flash_node element.
> 
> This patch is inspired by 5844feeaa4154d1c46d3462c7a4653d22356d8b4
> mtd: nand: add common DT init code
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/devices/m25p80.c      | 1 +
>  drivers/mtd/spi-nor/fsl-quadspi.c | 1 +
>  drivers/mtd/spi-nor/nxp-spifi.c   | 1 +
>  drivers/mtd/spi-nor/spi-nor.c     | 2 +-
>  include/linux/mtd/spi-nor.h       | 2 ++
>  5 files changed, 6 insertions(+), 1 deletion(-)
> 
> V2: - Rename .dn to .flash_node
>     - Add missing change to spi-nor.c
>     - Fix build issue in m25p80, where there was one deref. too much

Pushed both to l2-mtd.git/next
