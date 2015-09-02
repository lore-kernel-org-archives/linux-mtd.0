Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWw4U-0004bP-5S
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2015 00:38:38 +0000
Received: by pacwi10 with SMTP id wi10so12374132pac.3
 for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2015 17:38:17 -0700 (PDT)
Date: Tue, 1 Sep 2015 17:38:14 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: Decouple SPI NOR's device_node from
 controller device
Message-ID: <20150902003814.GO81844@google.com>
References: <1440148160-14355-1-git-send-email-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1440148160-14355-1-git-send-email-marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 21, 2015 at 11:09:20AM +0200, Marek Vasut wrote:
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
>    properties are coming from spi_nor .dev->device_node .
> 
> The problem is, that for SPI NOR controllers, the struct spi_nor .dev
> element points to the struct device of the SPI NOR controller, not the
> SPI NOR flash. Therefore, the associated dev->device_node also is the
> one of the controller and therefore the SPI NOR core code is trying to
> parse the SPI NOR controller's properties, not the properties of the
> SPI NOR flash.
> 
> Note: The m25p80 driver is not affected, because the controller and
>       the flash are the same device, so the associated device_node
>       of the controller and the flash are the same.
> 
> This patch adjusts the SPI NOR core such that the device_node is not
> picked from spi_nor .dev directly, but from a new separate spi_nor .dn
> element.

Does it really?

[...]
> ---
>  drivers/mtd/devices/m25p80.c      | 1 +
>  drivers/mtd/spi-nor/fsl-quadspi.c | 1 +
>  drivers/mtd/spi-nor/nxp-spifi.c   | 1 +
>  include/linux/mtd/spi-nor.h       | 3 +++
>  4 files changed, 6 insertions(+)

^^ I would expect to see spi-nor.c changes in the diffstat. Did you miss
something?

[...]

> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 1bf6f11..333999d 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -169,6 +169,7 @@ enum spi_nor_option_flags {
>   * @lock:		[FLASH-SPECIFIC] lock a region of the SPI NOR
>   * @unlock:		[FLASH-SPECIFIC] unlock a region of the SPI NOR
>   * @priv:		the private data
> + * @dn:			[BOARD-SPECIFIC] device node describing this instance

I might like to see this up near the @dev entry, for organization
purposes.

>   */
>  struct spi_nor {
>  	struct mtd_info		*mtd;
> @@ -208,6 +209,8 @@ struct spi_nor {
>  	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>  
>  	void *priv;
> +
> +	struct device_node *dn;

And this would get moved up as well.

>  };
>  
>  /**

Brian
