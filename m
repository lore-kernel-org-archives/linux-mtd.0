Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYQoz-0004uX-5T
 for linux-mtd@lists.infradead.org; Thu, 28 Jun 2018 06:54:26 +0000
Received: by mail-it0-x242.google.com with SMTP id u4-v6so11143412itg.0
 for <linux-mtd@lists.infradead.org>; Wed, 27 Jun 2018 23:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <1529563351-2241-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <1529563351-2241-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
In-Reply-To: <1529563351-2241-2-git-send-email-naga.sureshkumar.relli@xilinx.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Jun 2018 08:54:02 +0200
Message-ID: <CACRpkdaX8KrZ=3GwFUje05kYV61bRfTSJQ9fCQwVk5ot3cxvpQ@mail.gmail.com>
Subject: Re: [[LINUX PATCH v10] 1/4] Devicetree: Add pl353 smc controller
 devicetree binding information
To: naga.sureshkumar.relli@xilinx.com
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Mark Vasut <marek.vasut@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Markus Mayer <mmayer@broadcom.com>, Roger Quadros <rogerq@ti.com>,
 Ladislav Michl <ladis@linux-mips.org>, ada@thorsis.com,
 honghui.zhang@mediatek.com,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 nagasureshkumarrelli@gmail.com, michals@xilinx.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 21, 2018 at 8:43 AM Naga Sureshkumar Relli
<naga.sureshkumar.relli@xilinx.com> wrote:

Thanks for your patch!

> Add pl353 static memory controller devicetree binding information.
>
> Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
> +Device tree bindings for ARM PL353 static memory controller
> +
> +PL353 static memory controller supports two kinds of memory
> +interfaces.i.e NAND and SRAM/NOR interfaces.
> +The actual devices are instantiated from the child nodes of pl353 smc node.

See and reference the special PrimeCell DT bindings:
Documentation/devicetree/bindings/arm/primecell.txt

> +Required properties:
> +- compatible           : Must be "arm,pl353-smc-r2p1"

Should be:

"arm,pl353-smc-r2p1", "arm,primecell";

It will be possible for the Linux AMBA core to probe the device
from just reading out the primecell ID registers, so the first
compatible string will not even be used by many OS:es.

> +- reg                  : Controller registers map and length.
> +- clock-names          : List of input clock names - "ref_clk", "aper_clk"
> +                         (See clock bindings for details).

The AMBA primecell peripheral clock (clocking the silicon)
must be named "apb_pclk".

> +- clocks               : Clock phandles (see clock bindings for details).
> +- address-cells                : Must be 1.
> +- size-cells           : Must be 1.
> +
> +Child nodes:
> + For NAND the "arm,pl353-nand-r2p1" and for NOR the "cfi-flash" drivers are
> +supported as child nodes.
> +
> +for NAND partition information please refer the below file
> +Documentation/devicetree/bindings/mtd/partition.txt
> +
> +Example:
> +       smcc: memory-controller@e000e000
> +                       compatible = "arm,pl353-smc-r2p1"

Add , "arm,primecell";

> +                       clock-names = "memclk", "aclk";

This doesn't even have the same name as in the bindings
above, I think the latter should be named "apb_pclk".

Otherwise it looks good!

Yours,
Linus Walleij
