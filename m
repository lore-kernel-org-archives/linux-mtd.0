Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fRHqK-000532-6n
 for linux-mtd@lists.infradead.org; Fri, 08 Jun 2018 13:54:17 +0000
Subject: Re: [PATCH] add support to non-uniform SFDP SPI NOR flash memories
To: Tudor Ambarus <tudor.ambarus@microchip.com>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <boris.brezillon@bootlin.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, <Cristian.Birsan@microchip.com>
References: <20180608134818.21387-1-tudor.ambarus@microchip.com>
From: Cyrille Pitchen <cyrille.pitchen@microchip.com>
Message-ID: <d171a525-e2bd-be61-1fd4-d6ffeecdc9b4@microchip.com>
Date: Fri, 8 Jun 2018 15:54:00 +0200
MIME-Version: 1.0
In-Reply-To: <20180608134818.21387-1-tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Tudor,

Le 08/06/2018 à 15:48, Tudor Ambarus a écrit :
> The commit message became wall-of-text, my feeling is that I heavily
> reworked the code so I changed the author. If someone thinks differently,
> please say and I'll change back to the initial authorship. What I've done:

It's obvious that you're the author of the patch so I'm totally fine with
this change :)

Best regards,

Cyrille

> 
> - minimize the amount of erase() calls by using the best sequence of erase
>   type commands depending on alignment.
> 
> - build the list of best fitted erase commands to be executed once we
>   validate that the erase can be performed.
> 
> - add improvements on how the erase map is handled. The regions are
>   consecutive in the address space, walk through the regions incrementally.
> 
> - speed up finding the best erase type command. Order erase types by
>   size, iterate them from the biggest to the smallest and stop when best
>   fitted command is found.
> 
> - determine at init if there are erase types that can erase the entire
>   memory
> 
> - fix the erase size in overlaid regions. S25FS512S states that 'if a sector
>   erase command is applied to a 256KB range that is overlaid by 4KB secors,
>   the overlaid 4kB sectors are not affected by the erase'
> 
> Backward compatibility test done on MX25L25673G.
> 
> Changes since RFC PATCH:
> - build a list of erase commands to be executed once we validate
>   that the erase can be performed
> - fix walking through the address space in overlaid regions
> - drop wall-of-text description commit message, change author
> 
> 
> Tudor Ambarus (1):
>   mtd: spi-nor: add support to non-uniform SFDP SPI NOR flash memories
> 
>  drivers/mtd/spi-nor/spi-nor.c | 357 ++++++++++++++++++++++++++++++++++++++++--
>  include/linux/mtd/spi-nor.h   | 108 +++++++++++++
>  2 files changed, 451 insertions(+), 14 deletions(-)
> 
