Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NM6VQ-0007i3-3l
	for linux-mtd@lists.infradead.org; Sat, 19 Dec 2009 21:06:36 +0000
Received: by bwz4 with SMTP id 4so2849329bwz.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 19 Dec 2009 13:06:24 -0800 (PST)
Subject: Re: Few problems in mtd system
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <1261243060.13445.11.camel@maxim-laptop>
References: <1261087727.3311.50.camel@maxim-laptop>
	<1261243060.13445.11.camel@maxim-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 19 Dec 2009 23:06:19 +0200
Message-ID: <1261256779.18118.26.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: joern <joern@logfs.org>, arnd <arnd@arndb.de>, Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2009-12-19 at 19:17 +0200, Maxim Levitsky wrote: 
> On Fri, 2009-12-18 at 00:08 +0200, Maxim Levitsky wrote: 
> > Hi,
> > 
> > I am writing a driver for an xD controller found in my notebook.
> > xD card is 99.9% nand chip, and the controller fits into the nand
> > subsystem nicely.
> > 
> > However I face few problems, out of which about half is due to that
> > '99.9' and rest I believe  are bugs in the nand/mtd system.
> > 
> > First of all I design a two layer driver.
> > First layer is mtd driver which plugs into nand system.
> > Second layer is xD specific FTL that already exists (and works) in R/O
> > form in mtd/ssfdc.c
> > (Of course you are free to use another FTL or UBI on top of mtd driver,
> > but you won't be able to read the card in xd readers)
> > 
> > I am using 2.6.32 vanilla, so maybe something was already fixed.
> > 
> > First, the biggest problem is that del_mtd_device fails if the mtd
> > device is open. 
> > 
> > However the user can pull the card out of the slot anytime, so this has
> > to be handled gracefully.
> > Currently I can't even test for that condition, because nand_release
> > discards the return value.
> > 
> > 
> > Secondary, the hardware I deal with supports hardware ecc, and will
> > return error bit location if correctable error found.
> > Thus I use the 'syndrome' set of ecc functions.
> > 
> > However, the nand_write_oob_syndrome is broken. It uses NAND_CMD_READ0
> > with ecc step size offset (this is 512 or minimum 256 in common cases),
> > but this offset can't even be sent over 8 bit bus.
> > 
> > 
> > 
> > Another problem I discovered recently is that bad block handling other
> > that using bad block table is broken.
> > Maybe I should use it too, but scan of whole device takes some
> > significant time (~1 sec) and I don't like that.
> > 
> > However, when I attempt to implement custom .block_bad/.block_markbad, I
> > run into trouble about how to read oob from hardware.
> > Default functions use lots of static helpers, and only way to to that in
> > standard way is to use mtd->read_oob, but that leads to deadlock when
> > doing the erase.
> > nand_erase_nand does nand_get_device and it tests for bad block which
> > end in mtd->read_oob (implemented as nand_read_oob and it does
> > nand_get_device too...)
> > 
> > Or I can use very low level functions, but this skips taking locks, and
> > could lead to races.
> > 
> > Note that although maybe I could avoid the deadlock by using the bad
> > block table, I still need these functions to determine/write the bad
> > status because there is no bad block table on the flash.
> > 
> > 
> > 
> > Yet another problem I found is inside add_mtd_blktrans_dev.
> > This function takes mtd_table_mutex but never releases it.
> > This sounds fishy, and deadlocks when it calls 'add_disk(gd);'
> > This function (I think in case partitions are detected on device) opens
> > block device, and this takes that lock too
> > (blktrans_open->get_mtd_device)
> > 
> > 
> > 
> > And lastly, here are problems due to slight incompatibilities:
> > 
> > First, its possible to use small page nand (256 bytes/page), but then
> > unfortunately oob contents of every odd and even page are 'related'
> > (odd page contains ecc of both pages).
> > This is very hard to support, and since it only present in SmartMedia,
> > and to read such old card you need an adapter (which I not sure is
> > possible to buy), I'll skip it.
> > 
> > 
> > Another problem is that chip does report correct ID, but doesn't report
> > valid settings in extended ID, thus chips > 128 MB aren't detected.
> > Also there is whole class of mask rom devices, and they have non nand
> > IDs.
> > Not sure its valuable to support mask roms (it is also smartmedia only
> > feature too), but erasesize/pagesize have to be hardcoded. 
> > I think that best solution it to allow to pass custom list of device IDs
> > to nand_scan.
> > 
> > 
> > Last problem I discovered recently is that the chip always reports via
> > status command that it is write protected. This is maybe a card bug.
> > Small workaround for that in the nand system isn't a problem.
> > I will test if that report is really bogus though.
> > The hardware has seperate register to check write-protect status, and
> > card I suspect has a write-protect seal.
> > 
> > 
> > Currently, with workarounds to above problems, my driver does read the
> > xD card (using ssfdc.c)
> > 
> > Best regards,
> > Maxim Levitsky
> 
> 
> One small and a bit disappointing note.
> I found out that ether controller or the card (I strongly suspect the
> later) pokes at OOB contents that are written.
> 
> For example writing invalid sector number, results in no write, and the
> sector reads random data until card is reinserted, at which point read
> returns same contents as before.
> 
> Also setting 'reserved' field to anything but 0xFFFFFFFF results in it
> being written as 0xFFFFFFFF
Ah, this is even worse.
All OOB writes (except write of page+oob with valid content) result in
same funny behavier (junk is returned doing read, and after card
reinsert, contents return to original state)

Even erase fails in same way.
This is after a erase, block does became full of 0xFFs, but once you
insert/remove the card, old contents are back...

And yes, its possible to write a page many times, without doing the
erase....


It could be all some error in my driver, but now I am very confident it
executes same commands as original driver, and works correctly.
Card just emulates the nand command set.


Seeing all that things, I guess I drop one of my goals to make a generic
nand driver.

My goals were to write a driver for general use (this is to read the
picture cards, and as an option use the card as raw nand flash for
experiments with flash filesystems, UBI... etc...)

Due to all these problems, I guess special self contained driver
(similar to what alex wrote) is better.

I have type M or M+ card. I suspect that that type has this problems.
Standard XD cards probably are fine.




> .
> 
> I strongly suspect that xD card I have (1 GB) is not 'real' nand card.
> Probably inside the card there is same embedded cpu, just as inside all
> other cards. 
> It just emulates the nand command set, and thus pokes at oob contents
> (and doesn't store it fully ether....)
> 
> Will be glad to hear from you about rest of the questions I asked.
> 
> 
> Best regards,
> Maxim Levitsky
> 
> 
