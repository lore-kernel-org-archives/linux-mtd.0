Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eX9cI-0007OX-JR
 for linux-mtd@lists.infradead.org; Thu, 04 Jan 2018 17:47:48 +0000
Date: Thu, 4 Jan 2018 18:47:22 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>
Subject: Re: mtd layer: support of hybrid flash(W25M161AW) having both NOR
 and NAND flash
Message-ID: <20180104184722.551ca6aa@bbrezillon>
In-Reply-To: <HE1PR04MB1241937FF43AAA64AE7EE776971F0@HE1PR04MB1241.eurprd04.prod.outlook.com>
References: <HE1PR04MB1241937FF43AAA64AE7EE776971F0@HE1PR04MB1241.eurprd04.prod.outlook.com>
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

+MTD maintainers.

On Thu, 4 Jan 2018 14:08:42 +0000
Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:

> Hi All,
> 
> Winbond has come up with special flash i.e.  W25M161AW. It consist of Serial NOR(Die #0) and Serial NAND(Die #1) flash. 
> Means both NOR, NAND flashes are placed in W25M161AW controlled by single chip-select. 
> 
> "Software Die Select (C2h)" command is being used to switch die or flash.

Why are they so mean to us?! :-)
 
>  
> It looks to be quite unique chip and wondering if any kind framework or work in progress available to handle it. 
> I know that SPI-NAND framework discussions is still in progress.

Well, nothing impossible to handle, we just need to declare 2 MTD
devices (one NAND and one NOR). This being said, it looks like we'll
need this spi-flash abstraction we have been talking about with Marek
and Cyrille to properly support these use cases: flash devices will be
exposed through different sub-layers (spi-nor or spi-nand), but we need
a common way to detect those spi-flash chips. I looked at a few SPI
NAND and SPI NOR chips, and from what I've seen so far they were quite
different (the opcodes and CMD+ADDR+DATA sequences were quite
different) so I thought we were safe to start with a completely
unconnected SPI NAND framework and merge some bits in a spi-flash layer
afterwards, but this chip proves me wrong :-/.
