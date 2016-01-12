Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJ18g-0000Hp-Di
 for linux-mtd@lists.infradead.org; Tue, 12 Jan 2016 15:45:43 +0000
Subject: Re: [RFC PATCH 0/4] mtd: atmel_nand: Add support for NAND Flash on
 SAMA5D2
To: Romain Izard <romain.izard.pro@gmail.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>, "Yang, Wenyou"
 <Wenyou.Yang@atmel.com>, <rainyfeeling@outlook.com>
References: <1452609223-14790-1-git-send-email-romain.izard.pro@gmail.com>
CC: Josh Wu <josh.wu@atmel.com>
From: Nicolas Ferre <nicolas.ferre@atmel.com>
Message-ID: <56951F91.1090101@atmel.com>
Date: Tue, 12 Jan 2016 16:45:21 +0100
MIME-Version: 1.0
In-Reply-To: <1452609223-14790-1-git-send-email-romain.izard.pro@gmail.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 12/01/2016 15:33, Romain Izard a écrit :
> The NAND Flash controller for SAMA5D2 has small differences that make it
> impossible to use the existing driver for SAMA5D3. This patchset uses the
> device tree's compatible string to get those differences, and the code is
> slightly modified to handle them.
> 
> Applies on the Atmel Linux 4.1 branch for now, but only the dtsi file
> differs from the mainline.
> 
> Compile tested for all SAMA5 chips for now, and tested on SAMA5D3xek as
> there is no existing SAMA5D2 board with NAND Flash memory (yet).

Hi Romain,

The maintainers for this driver changed very recently, so you'll have to
includes these names to your CC list:

M:      Wenyou Yang <wenyou.yang@atmel.com>
M:      Josh Wu <rainyfeeling@outlook.com>

I also think that Wenyou did some work regarding this support. So you'll
have to coordinat together.

Thanks, bye,

> Romain Izard (4):
>   mtd: atmel_nand: Do not warn on bitflips
>   mtd: atmel_nand: Support variable RB_EDGE interrupts
>   mtd: atmel_nand: Support 32-bit ECC strength
>   ARM: at91/dt: sama5d2: add nand0 and nfc0 nodes
> 
>  .../devicetree/bindings/mtd/atmel-nand.txt         | 12 ++-
>  arch/arm/boot/dts/sama5d2.dtsi                     | 38 ++++++++++
>  drivers/mtd/nand/atmel_nand.c                      | 86 ++++++++++++++++++----
>  drivers/mtd/nand/atmel_nand_ecc.h                  |  9 ++-
>  drivers/mtd/nand/atmel_nand_nfc.h                  |  5 +-
>  5 files changed, 128 insertions(+), 22 deletions(-)
> 


-- 
Nicolas Ferre
