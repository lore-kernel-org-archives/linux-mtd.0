Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y18RI-000461-Lf
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 06:50:29 +0000
Received: by mail-pa0-f47.google.com with SMTP id kq14so15671507pab.6
 for <linux-mtd@lists.infradead.org>; Tue, 16 Dec 2014 22:50:07 -0800 (PST)
Date: Tue, 16 Dec 2014 22:50:01 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: allow NULL as chip name and try to auto
 detect it
Message-ID: <20141217065001.GE7112@brian-ubuntu>
References: <1413993900-23155-1-git-send-email-zajec5@gmail.com>
 <20141201084023.GH29070@brian-ubuntu>
 <CACna6rwBOux=V-12eTTYBSEzgfQ4v=4HJx8iQGz2OkzzA+LnLA@mail.gmail.com>
 <20141217011511.GN9759@ld-irv-0074>
 <CACna6rxmagC5wyGR=pL9=G3Yrihk7tvOkBXcR2wXCSuhEeOA5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6rxmagC5wyGR=pL9=G3Yrihk7tvOkBXcR2wXCSuhEeOA5Q@mail.gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 17, 2014 at 07:19:58AM +0100, Rafał Miłecki wrote:
> On 17 December 2014 at 02:15, Brian Norris <computersforpeace@gmail.com> wrote:
> > On Mon, Dec 01, 2014 at 10:49:28AM +0100, Rafał Miłecki wrote:
> >> The case with non-DT platforms is simple. There is
> >> struct flash_platform_data
> >> which contains "type". I was thinking about Introducing new type like
> >> "m25p80-rdid". What do you think about this?
> >
> > It should reflect "JEDEC RDID" in the name; it means the flash supports
> > the JEDEC opcode (0x9F), unlike some of the SST flash you've looked at.
> > I'm also not sure why it should still be tied to the m25p80 name. How
> > about "spi-nor,jedec-id" or "spi-flash,jedec-id"?
> 
> OK on "jedec-id".
> 
> However I'm not sure about this "spi-nor," because spi-not is a
> framework and it doesn't support all needed ops by itself.

No, SPI NOR is a (moderately) specific type of SPI device. It also
happens to be the name of the framework / library in
drivers/mtd/spi-nor/spi-nor.c and include/linux/mtd/spi-nor.h.

The point is that the name is descriptive of exactly what we expect of
it; it operates on the SPI bus, it's a NOR flash, and it supports the
JEDEC read ID command.

> And it
> wouldn't be clear if "spi-nor,jedec-id" should be handled by m25p80,
> fsl-quadspi, or even some different spi-nor driver.

fsl-quadspi (and other non-SPI flash drivers that may plug into
spi-nor.c) is not probed on a per flash device basis; it's probed based
on the controller compatibility (i.e., the "fsl,vf610-qspi" DT binding).
The driver then happens to use flash names when it calls into the SPI
NOR library.

As I see it, we only need to worry about true SPI devices when
considering this name. We'd need to be able to differentiate the kinds
of SPI devices which cannot be handled by m25p80.c + spi-nor.c. And as
far as I can see, that will only happen for devices which don't support
the JEDEC RDID opcode.

Brian
