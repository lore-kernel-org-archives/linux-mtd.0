Received: from mail-pf0-x236.google.com ([2607:f8b0:400e:c00::236])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c3vwy-0006Gs-PU
 for linux-mtd@lists.infradead.org; Tue, 08 Nov 2016 02:15:49 +0000
Received: by mail-pf0-x236.google.com with SMTP id n85so99116117pfi.1
 for <linux-mtd@lists.infradead.org>; Mon, 07 Nov 2016 18:15:28 -0800 (PST)
Date: Mon, 7 Nov 2016 18:01:15 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Yao Yuan <yao.yuan@nxp.com>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "hramrach@gmail.com" <hramrach@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: SPI NAND support in drivers/mtd/spi-nor/spi-nor.c
Message-ID: <20161108020115.GA116407@google.com>
References: <DB6PR0401MB2407AE783B4F57D09750D8DA89A70@DB6PR0401MB2407.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DB6PR0401MB2407AE783B4F57D09750D8DA89A70@DB6PR0401MB2407.eurprd04.prod.outlook.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ others

On Mon, Nov 07, 2016 at 09:53:34AM +0000, Yao Yuan wrote:
>    Hi All,

Hi Yao,

I'm not that interested in handling private requests, and this is
generally informative, so I've added the linux-mtd list, as well as the
other maintainers.

Also, when you're ready to send patches, make sure you use plain text
instead of HTML email.

>    I’m trying to add the QSPI NAND support in MTD.
> 
>    But I have reached a junction, could you please take some minutes and
>    give me some suggestions?
> 
> 
>    You know, we have the QSPI NOR support in
>    drivers/mtd/spi-nor/spi-nor.c,
> 
>    And the QSPI NAND is very similar with QSPI NOR, but the Read, write
>    and erase is different with SPI-NOR.

How similar is the controller hardware? Does your IP support standard
SPI protocol, or is it specialized for accelerating SPI NAND (e.g.,
memory-mapped, DMA, etc.)? Does it support SPI NOR?

>    So I have two ways to add QSPI-NAND:

I'll leave your options intact below, but I don't think either of them
are that good. SPI NOR and SPI NAND are different enough, I doubt that
we'll get much benefit from using the same framework, unless you happen
to have IP that's designed for both NOR and NAND, yet doesn't quite do
traditional SPI.

Particularly, NAND flash has a lot of issues that NOR flash generally
does not, around bad block management and wear leveling. Also, there may
be something to share around identification/ONFI? (Not sure how similar
the implementations are there.) There's been some prior discussion about
it, and maybe one of the CC'd people can direct you toward the latest
opinions, or else you can search the archives youreself ("SPI NAND"
should turn up several results).

So the main issues would probably be around abstracting out the
bad-block-related and chip identification code so you can share code
with existing (parallel) NAND support. At least, that's what I think
based on the last time I looked at things, and I think some of the other
active maintainers had ideas along the same lines.

Brian

>    1, rename
> 
>    drivers/mtd/spi-nor/spi-nor.c
> 
>    As
> 
>    drivers/mtd/spi-flash/spi-flash.c
> 
>    And then add:
> 
>    spi_nand_erase
> 
>    spi_nand_read
> 
>    spi_nand_write
> 
>    to support QSPI NAND.
> 
> 
>    2, rename
> 
>    drivers/mtd/spi-nor/
> 
>    to
> 
>    drivers/mtd/spi-flash/
> 
>    and then add:
> 
>    drivers/mtd/spi-flash/spi-nand.c
> 
>    to support QSPI NAND.
> 
> 
>    Thanks for your suggestions, and I will send the RFC patch once I can
>    select a way.
> 
> 
>    Best Regards,
> 
>    Yao
