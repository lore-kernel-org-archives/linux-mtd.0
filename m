Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YoBp7-0002mS-Op
 for linux-mtd@lists.infradead.org; Fri, 01 May 2015 14:21:51 +0000
From: Marek Vasut <marex@denx.de>
To: Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH 3/3] MTD: spi-nor: add flag to not use sector erase.
Date: Fri, 1 May 2015 16:20:05 +0200
References: <cover.1430430153.git.hramrach@gmail.com>
 <201505010113.50293.marex@denx.de>
 <CAOMqctSn-Ct06tWqSVYPbdoXcFmwrLb1Y9MGvhsSz0gf+fRP3Q@mail.gmail.com>
In-Reply-To: <CAOMqctSn-Ct06tWqSVYPbdoXcFmwrLb1Y9MGvhsSz0gf+fRP3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201505011620.05512.marex@denx.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Woodhouse <dwmw2@infradead.org>, Rafa?? Mi??ecki <zajec5@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, "grmoore@altera.com" <grmoore@altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Ben Hutchings <ben@decadent.org.uk>,
 Alison Chaiken <alison_chaiken@mentor.com>,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, May 01, 2015 at 09:05:15 AM, Michal Suchanek wrote:
> On 1 May 2015 at 01:13, Marek Vasut <marex@denx.de> wrote:
> > On Thursday, April 30, 2015 at 11:13:12 PM, Michal Suchanek wrote:
> >> The sector size of the flash memory is unclear from datasheet or may
> >> possibly vary between chips so add a flag to always use 4k blocks.
> >> 
> >> Currently 4k blocks are always used when possible but in the future
> >> somebody might want to do some optimizations with sector erase.
> >> 
> >> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> > 
> > I _think_ you might be able to determine the size, no ?
> > 
> > One way is to ask the vendor, but you can also try something like:
> > 1) erase the whole SPI NOR
> > 2) overwrite it with zeroes (or ones ? I think it should be all ones
> > after erasing).
> > 3) Erase sector 0
> > 4) Read some 128 KiB back
> > 5) Observe what is the difference.
> 
> I can determine it for this particular chip. However, when the vendor
> datasheet says the block is 64/32K it might mean that chips with this
> ID can have either block size.

http://www.chingistek.com/img/Product_Files/Pm25LD010020datasheet%20v04.pdf
page 21:

SECTOR_ER (20h) erases 4kByte sector.
BLOCK_ER (d8h) erases 64kByte sector.

http://www.gigadevice.com/product/download/366.html?locale=en_US
page 27-28:

Sector Erase (SE) (20h) erases 4kByte sector
64KB Block Erase (BE) (d8h) erases 64kByte sector

> It's a value that we don't use anyway so I just mark it as unknown
> here for future reference.

Looks like standard SPI NOR opcodes [1], nothing unknown there ;-)

[1] include/linux/mtd/spi-nor.h

Best regards,
Marek Vasut
