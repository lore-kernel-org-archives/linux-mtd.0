Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YpEIB-0003t5-Au
 for linux-mtd@lists.infradead.org; Mon, 04 May 2015 11:12:08 +0000
Received: by widdi4 with SMTP id di4so117233780wid.0
 for <linux-mtd@lists.infradead.org>; Mon, 04 May 2015 04:11:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201505011620.05512.marex@denx.de>
References: <cover.1430430153.git.hramrach@gmail.com>
 <201505010113.50293.marex@denx.de>
 <CAOMqctSn-Ct06tWqSVYPbdoXcFmwrLb1Y9MGvhsSz0gf+fRP3Q@mail.gmail.com>
 <201505011620.05512.marex@denx.de>
From: Michal Suchanek <hramrach@gmail.com>
Date: Mon, 4 May 2015 13:11:03 +0200
Message-ID: <CAOMqctTL-y+YxnxuBX8r4osgbz3_+xJ2T2AfCj4idxMo3tCo8g@mail.gmail.com>
Subject: Re: [PATCH 3/3] MTD: spi-nor: add flag to not use sector erase.
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=UTF-8
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

Hello,

On 1 May 2015 at 16:20, Marek Vasut <marex@denx.de> wrote:
> On Friday, May 01, 2015 at 09:05:15 AM, Michal Suchanek wrote:
>> On 1 May 2015 at 01:13, Marek Vasut <marex@denx.de> wrote:
>> I can determine it for this particular chip. However, when the vendor
>> datasheet says the block is 64/32K it might mean that chips with this
>> ID can have either block size.
>
> http://www.chingistek.com/img/Product_Files/Pm25LD010020datasheet%20v04.pdf
> page 21:
>
> SECTOR_ER (20h) erases 4kByte sector.
> BLOCK_ER (d8h) erases 64kByte sector.
>
> http://www.gigadevice.com/product/download/366.html?locale=en_US
> page 27-28:
>
> Sector Erase (SE) (20h) erases 4kByte sector
> 64KB Block Erase (BE) (d8h) erases 64kByte sector
>

It's pretty much the same as the datasheet I used
http://www.elm-tech.com/en/products/spi-flash-memory/gd25q41/gd25q41.pdf

It mentions both
32KB Block Erase (BE) (52H)
and
64KB Block Erase (BE) (D8H)

So the chip probably tries its best to be compatible with any command
set and this last patch is not needed. The memory organization table
on page 7 is not all that reassuring, though.

Thanks

Michal
