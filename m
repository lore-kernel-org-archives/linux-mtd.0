From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 3/4] mtd: spi-nor: add the framework for SPI NOR
Date: Wed, 27 Nov 2013 10:39:45 +0100
References: <1385447575-23773-1-git-send-email-b32955@freescale.com>
 <1385447575-23773-4-git-send-email-b32955@freescale.com>
In-Reply-To: <1385447575-23773-4-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201311271039.45463.marex@denx.de>
Cc: broonie@linaro.org, linux-mtd@lists.infradead.org, pekon@ti.com,
 sourav.poddar@ti.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> This patch cloned most of the m25p80.c. In theory, it adds a new spi-nor
> layer.
> 
> Before this patch, the layer is like:
> 
>                    MTD
>          ------------------------
>                   m25p80
>          ------------------------
> 	       spi bus driver
>          ------------------------
> 	        SPI NOR chip
> 
> After this patch, the layer is like:
>                    MTD
>          ------------------------
>                   spi-nor
>          ------------------------
>                   m25p80
>          ------------------------
> 	       spi bus driver
>          ------------------------
> 	       SPI NOR chip
> 
> With the spi-nor controller driver(Freescale Quadspi), it looks like:
>                    MTD
>          ------------------------
>                   spi-nor
>          ------------------------
>                 fsl-quadspi
>          ------------------------
> 	       SPI NOR chip
> 
> New APIs:
>    spi_nor_register: used to register a spi-nor flash.
>    spi_nor_unregister: used to unregister a spi-nor flash.
> 
> The m25p80 and spi-nor controller driver should implement the hooks
>    @read_reg, @write_reg, @write, @read.

I would approach this the other way around -- first I'd split the common code 
out from m25p80 driver and then I'd add my own driver which uses the common 
code. Then we won't have to review the common code (or such a large chunk of it 
anyway) again.

But I am still not too sure we need this new framework at all, I will wait for 
your reply on 0/4 .

Cheers!

Best regards,
Marek Vasut
