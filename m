Date: Thu, 15 Mar 2018 14:56:20 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>, Jason Cooper
 <jason@lakedaemon.net>, Antoine Tenart <antoine.tenart@bootlin.com>, Omri
 Itach <omrii@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Shadi Ammouri
 <shadi@marvell.com>, Igal Liberman <igall@marvell.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Marcin Wojtas <mw@semihalf.com>, Hanna Hawa
 <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH v3] mtd: nand: marvell: Fix clock resource by adding a
 register clock
Message-ID: <20180315145620.4680b7e6@bbrezillon>
In-Reply-To: <20180313103016.7695-1-gregory.clement@bootlin.com>
References: <20180313103016.7695-1-gregory.clement@bootlin.com>
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

Hi Greg,

On Tue, 13 Mar 2018 11:30:16 +0100
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> diff --git a/Documentation/devicetree/bindings/mtd/marvell-nand.txt b/Documentation/devicetree/bindings/mtd/marvell-nand.txt
> index c08fb477b3c6..4ee9813bf88f 100644
> --- a/Documentation/devicetree/bindings/mtd/marvell-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/marvell-nand.txt
> @@ -14,7 +14,11 @@ Required properties:
>  - #address-cells: shall be set to 1. Encode the NAND CS.
>  - #size-cells: shall be set to 0.
>  - interrupts: shall define the NAND controller interrupt.
> -- clocks: shall reference the NAND controller clock.
> +- clocks: shall reference the NAND controller clocks, the second one is
> +  optional but needed for the Armada 7K/8K SoCs
> +- clock-names: mandatory if there is a second clock, in this case the
> +   name must be "core" for the first clock and "reg" for the second
> +   one

The order is no longer enforced in this version of the patch.

Regards,

Boris

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
