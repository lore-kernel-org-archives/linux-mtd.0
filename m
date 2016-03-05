Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ac2lP-0007KA-My
 for linux-mtd@lists.infradead.org; Sat, 05 Mar 2016 03:20:20 +0000
Received: by mail-pa0-x230.google.com with SMTP id fy10so44800900pac.1
 for <linux-mtd@lists.infradead.org>; Fri, 04 Mar 2016 19:19:58 -0800 (PST)
Date: Fri, 4 Mar 2016 19:19:56 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>
Subject: Re: [PATCH] mtd: spi-nor: update flags for n25q128a
Message-ID: <20160305031956.GR55664@google.com>
References: <1456538836-27449-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <CACna6rzvikqy1kaL6P9GRP6ibvnoY=gAdFhFmutyQaTW+NnH1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6rzvikqy1kaL6P9GRP6ibvnoY=gAdFhFmutyQaTW+NnH1g@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Feb 27, 2016 at 12:25:21PM +0100, Rafał Miłecki wrote:
> On 27 February 2016 at 03:07, Ezequiel Garcia
> <ezequiel@vanguardiasur.com.ar> wrote:
> > @@ -864,8 +864,12 @@ static const struct flash_info spi_nor_ids[] = {
> >         { "n25q032a",    INFO(0x20bb16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
> >         { "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
> >         { "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
> > -       { "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SPI_NOR_QUAD_READ) },
> > -       { "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SPI_NOR_QUAD_READ) },
> > +       { "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256,
> > +                SECT_4K | SPI_NOR_QUAD_READ |
> > +                SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> > +       { "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256,
> > +                SECT_4K | SPI_NOR_QUAD_READ |
> > +                SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
> 
> We use one line per chip, so please keep stick to this formatting. I
> can guess you wanted to follow kernel's coding style, but this adds
> inconsistency. Also kernel's coding style allows lines over 80 chars
> for better readibility. If we are ever going to change it, it should
> be a separated patch affecting all entries.

He may have been taking the hint from my patch:

http://lists.infradead.org/pipermail/linux-mtd/2016-January/065252.html

I didn't feel like we needed to change all entries, personally, but I
think if we're going to start having 5+ flags, we have to have *some*
cutoff point. The lines in my patch were going to be 144 characters
long. That's more than half my (too) large monitor, so IMO that's not
really "better readability."

If you have a good suggestion that doesn't make my above patch too wide,
then I can try to go with that.

Brian
