Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XDOd5-0002sg-8Q
 for linux-mtd@lists.infradead.org; Sat, 02 Aug 2014 02:01:04 +0000
Received: by mail-pa0-f45.google.com with SMTP id eu11so6754745pac.18
 for <linux-mtd@lists.infradead.org>; Fri, 01 Aug 2014 19:00:40 -0700 (PDT)
Date: Fri, 1 Aug 2014 19:00:36 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: Writing SPI flash driver for Broadcom BCM53xx ARM SoC
Message-ID: <20140802020036.GR3711@ld-irv-0074>
References: <CACna6rzhD9=Pkb5gRqd9A23gfaqnHmYe_vm0fwT_mefAibmhYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6rzhD9=Pkb5gRqd9A23gfaqnHmYe_vm0fwT_mefAibmhYQ@mail.gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, Andre Renaud <andre@bluewatersys.com>,
 linux-spi@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 Mark Brown <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Mark, linux-spi, Huang

(Mark, this is the hardware I was talking to you about at ELC!)

Hi Rafal,

On Wed, Jul 30, 2014 at 11:27:15AM +0200, Rafał Miłecki wrote:
> I own BCM53010 (AKA BCM4708) based router which has (obviously) a
> flash memory. Only part of this chip is visible to me (because of the
> radiator), but I read a following label: winbond 25Q128FVFG (it's
> barely visible). Broadcom documents this flash as:
> /* ST M25FL128 128 Mbit Serial Flash */

When I look up the Winbond part number, its datasheet looks relatively
sane. Although sometimes, manufacturers are known to make very similar
parts (both ID and part numbering) that behave quite differently.

One note: the 'FVFG' extension seems to indicate a part which has QE=1
(Quad Enable) on by default. I don't think this means the part is in QPI
mode by default -- just that it's ready to accept the quad-enable
command.

> It seems that Broadcom ARM SoCs use real SPI to access flashes.

I believe the SPI core in this SoC actually has a 2 parts to it -- a 'Boot
SPI' (BSPI) portion which is designed for read-only and can handle a few
clock rates and I/O configurations (dual, quad); and a single-I/O MSPI
(I forget what it stands for) that handles true SPI access. MSPI is used
for everything that's not a {NORMAL,FAST,DUAL,QUAD}_READ.

> I played a bit with this flash and it:
> 1) Doesn't respond to SPINOR_OP_RDID (no JEDEC), returns all zeroes

That's troubling. (But your right, it matches the SST driver.)

> 2) Responds to 0x90 command (SST25L_CMD_READ_ID) with 0xEF 0x17. Or if
> you prefer longer read: 0xEF 0x17 0xEF 0x17 0xEF.

OK. Sane flashes seem to document 0x90 as a legacy alternative to 0x9F
RDID. So that makes some sense.

> I checked Broadcom code and it treats 0xEF (NXPART) as: /* ST compatible */

0xEF matches the Winbond code.

> So far it seems there is some compatibility between Broadcom ARM flash
> support and the sst25l.c.

Only the lack of JEDEC 0x9F RDID is similar.

> I decided to compared erasing flash memory.
> 
> 
> *** Erasing in Broadcom code ***
> 
> mspi_disable_bspi [controller specific]

I believe this is the main portion that does not act like a SPI
controller. It's a lock-like operation that switches from read mode
(BSPI) to 'everything else' mode (MSPI).

> write WREN command (0x06)
> 
> write 0x20 xor 0xD8 xor 0x21 xor 0xDC and offset
> wait for RDSR command (0x05) & 0x1 being 0
> 
> write WRDI command (0x04)
> mspi_enable_bspi [controller specific]

Aside from the MSPI/BSPI, this all matches m25p80.c/spi-nor.c.

> *** Erasing in sst25l_erase ***
> 
> wait for RDSR command (0x05) & 0x1 being 0
> write WREN command (0x06)
> write EWSR command (0x50)
> write WRSR and 0 commands (0x01 and 0x00)
> check RDSR command (0x05) for having WREN (0x2)
> 
> write 0x20 and offset
> wait for RDSR command (0x05) & 0x1 being 0
> 
> write WRDI command (0x04)
> write EWSR command (0x50)
> write WRSR and BP0 and BP1 commands (0x04 and 0x08)
> check RDSR command (0x05) for having WREN (0x2)
> 
> 
> Again, some compatibility, but not really enough for us. First of all
> I'm not sure if Broadcom flash is going to accept these extra commands
> when enabling/disabling writes (EWSR, WRSR). Not sure what they are
> about.

I don't think we want to try using sst25l for this. The only reason is
that it uses the 0x90 legacy RDID (or as some newer datasheets I see
call it: "Read Electronic Manufacturer and device Signature (REMS)".

> I see sst25l_erase is also lacking support for some extra erase
> commands:
> #define SPI_SE_CMD 0xD8 (for block size 0x10000 and up)
> #define SPAN_FLASH_4P4E 0x21 (for new SPAN devices with block size < 0x10000)
> #define SPAN_FLASH_4SE 0xDC (for new SPAN devices with bigger  block size)
> (on the other hand 0xD8 and 0xDC are used in spi-nor.c / m25p80.c).
> 
> What's worse, I have no idea how I could add controller-specific calls
> in the flash driver (mspi_disable_bspi / mspi_enable_bspi).

Yes, that's the tricky part.

> Btw. I took a look at m25p80_erase and it also seems so be a bit
> similar... These differences between sst25l.c and m25p80.c seem a bit
> tiny to me.

I don't know the history here, but it seems like sst25l.c mostly exists
because a couple of the command sequences were different -- most
notably, the 0x90 vs. 0x9f RDID commands.

> So in this situation... do you have an idea how I could implement
> flash driver for Broadcom ARM SoCs? I wanted to use SPI subsystem and
> re-use existing SPI flash drivers, but it seems a bit tricky now.
> Should I write a standalone MTD driver handling SPI communication on
> it's own?

You can probably write a pure SPI driver (drivers/spi/) that uses only
the MSPI hardware to do (slow, single-I/O) true SPI, and hooks into
m25p80.c.

But if you want to integrate the accelerated BSPI for reads, it gets
harder. You might be able to export a kind of 'lock' API from the MSPI
driver, so that a BSPI driver can utilize the MSPI for most
transactions, but then lock it down when doing BSPI/read operations. I
think with a little bit of work, spi-nor.c can accomodate the right kind
of callbacks to allow you to do this. But the coordination between
drivers/spi/<MSPI> and drivers/mtd/spi-nor/<BSPI> would be the hardest
to architect, I think.

> You can see Broadcom's spiflash.s in DD-WRT sources:
> http://svn.dd-wrt.com/browser/src/linux/universal/linux-3.10/brcm/arm/shared/spiflash.c

(FWIW, I have a MSPI/BSPI driver here at Broadcom that fakes being a
drivers/spi/ driver, and it just intercepts the opcodes that look like
m25p80.c read commands, kinda like Huang was doing with his
fsl-quadspi.c. The faking kinda sucks, but it might be a good reference
to compare with. I can see about posting it sometime.)

Brian
