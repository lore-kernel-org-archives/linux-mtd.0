Received: from mail.free-electrons.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eYYUA-0006Kz-ME
 for linux-mtd@lists.infradead.org; Mon, 08 Jan 2018 14:33:12 +0000
Date: Mon, 8 Jan 2018 15:32:49 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Frieder Schrempf <frieder.schrempf@exceet.de>, MTD Maling List
 <linux-mtd@lists.infradead.org>, Prabhakar Kushwaha
 <prabhakar.kushwaha@nxp.com>, Marek Vasut <marex@denx.de>, Richard
 Weinberger <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Suresh Gupta
 <suresh.gupta@nxp.com>, Poonam Aggrwal <poonam.aggrwal@nxp.com>
Subject: Re: mtd layer: support of hybrid flash(W25M161AW) having both NOR
 and NAND flash
Message-ID: <20180108153249.24d05341@bbrezillon>
In-Reply-To: <CAOiHx=kw=L-H1yCwnzhfJhg3vUeXiTz_39n4_Wq3qbKMdDCitA@mail.gmail.com>
References: <20180108101447.1d9ab212@bbrezillon>
 <dbefefbb-7e0e-2a25-00b5-d9bcffa91a4b@exceet.de>
 <20180108133118.02086991@bbrezillon>
 <CAOiHx=kw=L-H1yCwnzhfJhg3vUeXiTz_39n4_Wq3qbKMdDCitA@mail.gmail.com>
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

On Mon, 8 Jan 2018 14:43:56 +0100
Jonas Gorski <jonas.gorski@gmail.com> wrote:

> On 8 January 2018 at 13:31, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > Hi Frieder,
> >
> > On Mon, 8 Jan 2018 12:02:19 +0100
> > Frieder Schrempf <frieder.schrempf@exceet.de> wrote:
> >  
> >> >> > >> with the "windbond,w25q16fw" driver modeled as a simple
> >> >> > >> "spi-multiplexer" that registers its own virtual spi-bus. Then when
> >> >> > >> spi-nor or spi-nand tries to communicate with their appropriate die,
> >> >> > >> it sends the Software Die Select command if needed and then passes on
> >> >> > >> the message to its parent bus.
> >> >> > >>
> >> >> > >> That way there should be no changes needed for spi-nor / spi-nand
> >> >> > >> themselves. (The devil is probably in the details ;-)  
> >> >> > >
> >> >> > > Yep, I thought about this approach, and it's indeed quite elegant, but
> >> >> > > we're missing the lock I was mentioning in my previous reply. We need
> >> >> > > to prevent die selection not only for the time we're sending a single
> >> >> > > SPI message, but for the whole operation (which can be formed of
> >> >> > > several SPI messages). Or maybe I'm wrong, and operations can actually
> >> >> > > be interleaved, but I wouldn't bet on that ;-).  
> >>
> >> With operations, that consist of several SPI messages, do you mean
> >> something like NAND page program?  
> >
> > Yep.
> >  
> >>
> >> Because I'm quite sure something like this should be possible (and all
> >> of these commands consist only of one spi message, don't they?):
> >> 1. Select second (NAND) die
> >> 2. Send data to the NAND page buffer (PROGRAM)
> >> 3. Select first (NOR) die
> >> 4. Program data to a NOR block
> >> 5. Select second (NAND) die
> >> 6. Send command to transfer page buffer to flash (PROGRAM EXECUTE)  
> >
> > Yes, and that's the problem, if you don't have a lock, the sequence you
> > describe above could be re-ordered like this:
> >
> > 1. Select second (NAND) die
> > 2. Select first (NOR) die
> > 3. Send data to the NAND page buffer (PROGRAM)
> > 4. Program data to a NOR block
> > ...  
> 
> At least with what I was thinking of (with the spi-multiplexer) this
> should be impossible, as the (virtual) spi bus message pump should
> ensure that any messages from spi-nand and spi-nor are properly
> serialized so they could only end up as in Frieder's example, unless
> I'm overlooking something.
> 
> So my virtual's spi implementation would look like this:
> 
> struct W25M161AW {
>         struct spi_device *spi; /* we at the parent bus */
> };
> 
> int W25M161AW_transfer_one_message(master, message)
> {
>         W25M161AW *w = spi_master_get_devdata(master);
>         spi_device *spi = message->spi;
> 
>         W25M161AW_send_die_select(w->spi, spi->chip_select);
> 
>         /* pass on the message to the parent bus */
>         spi_sync(w->spi, msg);
>         spi_finalize_current_message(master);
> 
>         return 0;
> }

I wish all QSPI controllers were exposed as regular SPI controllers with
QSPI capabilities, unfortunately most of them are standalone drivers
that simply does not implement the generic SPI interface and instead
directly register to their flash devices to SPI NOR layer, thus
preventing the generic logic you're proposing here :-(.

> 
> (this is a very simplified version, of course we can't pass on the
> message directly to the parent bus but need to clone it)
> 
> This way AFAICT there should be a guarantee that there can be no other
> message to the flash scheduled between the die select and the message
> to the die.
> 
> Of course if we need to ensure that there is no die change between the
> PROGRAM and the PROGRAM EXECUTE we need the extra bus lock. Without a
> public datasheet I can't tell though.

I found this one [1] if you want to have a look.

Regards,

Boris

[1]http://www.winbond.com.tw/resource-files/w25m161av%20combo%20reva%20091317%20mod%20final.pdf
