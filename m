Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8V3s-0004Zv-2R
 for linux-mtd@lists.infradead.org; Thu, 02 Jun 2016 16:01:32 +0000
Date: Thu, 2 Jun 2016 18:00:59 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Tony
 Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, Linux mtd
 <linux-mtd@lists.infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] mtd: nand: Add support for Evatronix NANDFLASH-CTRL
Message-ID: <20160602180059.11928d40@bbrezillon>
In-Reply-To: <alpine.DEB.2.02.1606020944180.19416@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020944180.19416@lnxricardw1.se.axis.com>
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

Hi Ricard,

I was not in Cc of this series, so you're either developing an old
kernel version, or you didn't check the MAINTAINERS file (or didn't run
get_maintainer.pl on your series). And please, next time make sure
patches 1 to X are sent in replies to your cover letter.

On Thu, 2 Jun 2016 09:46:31 +0200
Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:

> This patch set adds a driver and relevant devicetree bindings for the
> Evatronix NANDFLASH-CTRL NAND flash controller IP. This controller is
> used in the Axis ARTPEC-6 SoC.
> 
> The driver supports BCH ECC using the controller's hardware, but there is
> also an option to use software BCH ECC. However, the ECC layouts are not
> compatible so it's not possible to mix them. The main advantage to using
> software ECC is that there are more OOB bytes free, as the hardware is
> slightly wasteful on OOB space.
> 
> BCH ECC from 4 to 32 bits over 256, 512 or 1024 byte ECC blocks is supported.
> 
> Only large-page flash chips are supported, using 4 or 5 address cycles.
> 
> The driver has been extensively tested using hardware ECC on 2 Mbit flash chips,
> with 8 bit ECC over 512 bytes ECC blocks.

I'll to review the driver soon.

Regards,

Boris

> 
> Ricard Wanderlof (4):
>   of: Add device tree bindings for Evatronix NANDFLASH-CTRL
>   dts: Add Evatronix NAND flash driver to ARTPEC-6 dtsi
>   mtd: nand: Add support for Evatronix NANDFLASH-CTRL
>   MAINTAINERS: mtd: Add maintainer for Evatronix NAND flash driver
> 
>  .../devicetree/bindings/mtd/evatronix-nand.txt     |   44 +
>  .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>  MAINTAINERS                                        |    6 +
>  arch/arm/boot/dts/artpec6.dtsi                     |   19 +
>  drivers/mtd/nand/Kconfig                           |    6 +
>  drivers/mtd/nand/Makefile                          |    1 +
>  drivers/mtd/nand/evatronix_nand.c                  | 1909 ++++++++++++++++++++
>  7 files changed, 1986 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/evatronix-nand.txt
>  create mode 100644 drivers/mtd/nand/evatronix_nand.c
> 



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
