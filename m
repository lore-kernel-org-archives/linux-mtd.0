Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YpFxk-0003gU-QT
 for linux-mtd@lists.infradead.org; Mon, 04 May 2015 12:59:10 +0000
From: Marek Vasut <marex@denx.de>
To: Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH 3/3] MTD: spi-nor: add flag to not use sector erase.
Date: Mon, 4 May 2015 14:12:46 +0200
References: <cover.1430430153.git.hramrach@gmail.com>
 <201505011620.05512.marex@denx.de>
 <CAOMqctTL-y+YxnxuBX8r4osgbz3_+xJ2T2AfCj4idxMo3tCo8g@mail.gmail.com>
In-Reply-To: <CAOMqctTL-y+YxnxuBX8r4osgbz3_+xJ2T2AfCj4idxMo3tCo8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201505041412.46195.marex@denx.de>
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

On Monday, May 04, 2015 at 01:11:03 PM, Michal Suchanek wrote:
> Hello,

Hi!

> On 1 May 2015 at 16:20, Marek Vasut <marex@denx.de> wrote:
> > On Friday, May 01, 2015 at 09:05:15 AM, Michal Suchanek wrote:
> >> On 1 May 2015 at 01:13, Marek Vasut <marex@denx.de> wrote:
> >> I can determine it for this particular chip. However, when the vendor
> >> datasheet says the block is 64/32K it might mean that chips with this
> >> ID can have either block size.
> > 
> > http://www.chingistek.com/img/Product_Files/Pm25LD010020datasheet%20v04.p
> > df page 21:
> > 
> > SECTOR_ER (20h) erases 4kByte sector.
> > BLOCK_ER (d8h) erases 64kByte sector.
> > 
> > http://www.gigadevice.com/product/download/366.html?locale=en_US
> > page 27-28:
> > 
> > Sector Erase (SE) (20h) erases 4kByte sector
> > 64KB Block Erase (BE) (d8h) erases 64kByte sector
> 
> It's pretty much the same as the datasheet I used
> http://www.elm-tech.com/en/products/spi-flash-memory/gd25q41/gd25q41.pdf
> 
> It mentions both
> 32KB Block Erase (BE) (52H)
> and
> 64KB Block Erase (BE) (D8H)

The SPI NOR framework will use 0xbe opcode, no problem.

> So the chip probably tries its best to be compatible with any command
> set and this last patch is not needed. The memory organization table
> on page 7 is not all that reassuring, though.

Which exact part do you refer to please ?

Best regards,
Marek Vasut
