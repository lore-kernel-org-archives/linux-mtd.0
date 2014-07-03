Received: from mail-bn1blp0184.outbound.protection.outlook.com
 ([207.46.163.184] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X2pD4-0005Vl-1A
 for linux-mtd@lists.infradead.org; Thu, 03 Jul 2014 22:10:31 +0000
Message-ID: <1404425400.21434.89.camel@snotra.buserror.net>
Subject: Re: [PATCH] devicetree/bindings: Add binding for micron n25q512a
 memory
From: Scott Wood <scottwood@freescale.com>
To: Priyanka Jain <Priyanka.Jain@freescale.com>
Date: Thu, 3 Jul 2014 17:10:00 -0500
In-Reply-To: <1404382376-3115-1-git-send-email-Priyanka.Jain@freescale.com>
References: <1404382376-3115-1-git-send-email-Priyanka.Jain@freescale.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-07-03 at 15:42 +0530, Priyanka Jain wrote:
> -Micron n25q512a memory is supported by m25p80 driver.
>  Add compatible field required to support n25q512a in m25p80.txt
> -Add micron to the vendor-prefixes.txt file
> 
> Signed-off-by: Priyanka Jain <Priyanka.Jain@freescale.com>
> ---
>  Documentation/devicetree/bindings/mtd/m25p80.txt   |    1 +
>  .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>  2 files changed, 2 insertions(+), 0 deletions(-)

Why did you send this to the ppc list but not the spi or mtd lists?

I'm having a hard time following the flow of how these SPI devices get
bound -- is the compatible involved at all?  I don't see this string
(with vendor prefix included) in the driver.  I do see a table that
contains what looks like device IDs.  If the device can report its id,
shouldn't we rely on that rather than device tree compatible?

-Scott


> diff --git a/Documentation/devicetree/bindings/mtd/m25p80.txt b/Documentation/devicetree/bindings/mtd/m25p80.txt
> index 4611aa8..ce02e81 100644
> --- a/Documentation/devicetree/bindings/mtd/m25p80.txt
> +++ b/Documentation/devicetree/bindings/mtd/m25p80.txt
> @@ -7,6 +7,7 @@ Required properties:
>                 the DT binding is not Linux-only, but in case of Linux, see the
>                 "spi_nor_ids" table in drivers/mtd/spi-nor/spi-nor.c for the list
>                 of supported chips.
> +               example: "micron,n25q512a"
>  - reg : Chip-Select number
>  - spi-max-frequency : Maximum frequency of the SPI bus the chip can operate at
>  
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 4d7f375..a44cfee 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -79,6 +79,7 @@ marvell	Marvell Technology Group Ltd.
>  maxim	Maxim Integrated Products
>  micrel	Micrel Inc.
>  microchip	Microchip Technology Inc.
> +micron	Micron Technology Inc.
>  mosaixtech	Mosaix Technologies, Inc.
>  moxa	Moxa
>  mpl	MPL AG
