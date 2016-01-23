Received: from smtp4-g21.free.fr ([2a01:e0c:1:1599::13])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMvpJ-0006FU-1M
 for linux-mtd@lists.infradead.org; Sat, 23 Jan 2016 10:53:54 +0000
Subject: Re: RFC on large number of hacks in mtd core files
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Sebastian Frias <sf84@laposte.net>
References: <56A24C22.2050607@free.fr> <20160123031635.GB90611@google.com>
From: Mason <slash.tmp@free.fr>
Message-ID: <56A35BA2.3040906@free.fr>
Date: Sat, 23 Jan 2016 11:53:22 +0100
MIME-Version: 1.0
In-Reply-To: <20160123031635.GB90611@google.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Brian,

On 23/01/2016 04:16, Brian Norris wrote:

> On Fri, Jan 22, 2016 at 04:34:58PM +0100, Mason wrote:
> 
>> Hello everyone,
>>
>> As I've mentioned in a previous thread, I'm supposed to port a NAND
>> controller driver from 3.4 to 4.4. But this is complicated by the
>> fact that several core files have been modified along the way.
>>
>> Here's the full picture:
>>
>> $ git diff --stat v3.4.39 custom-3.4 drivers/mtd
>>  drivers/mtd/Kconfig                 |   15 +-
>>  drivers/mtd/chips/cfi_cmdset_0002.c |  129 ++-
>>  drivers/mtd/devices/Kconfig         |    6 +
>>  drivers/mtd/devices/Makefile        |    3 +-
>>  drivers/mtd/devices/m25p80.c        |  100 +-
>>  drivers/mtd/devices/spiflash.c      | 2131 +++++++++++++++++++++++++++++++++++
>>  drivers/mtd/maps/Kconfig            |   11 +-
>>  drivers/mtd/maps/physmap.c          |  202 +++-
>>  drivers/mtd/mtdchar.c               |   54 +
>>  drivers/mtd/mtdcore.c               |   63 +-
>>  drivers/mtd/mtdpart.c               |    9 +
>>  drivers/mtd/nand/Kconfig            |   46 +-
>>  drivers/mtd/nand/Makefile           |   11 +-
>>  drivers/mtd/nand/monza_nand.c       |  614 ++++++++++
>>  drivers/mtd/nand/nand_base.c        | 1226 +++++++++++++++++++-
>>  drivers/mtd/nand/nand_bch_ecc.c     |  311 +++++
>>  drivers/mtd/nand/nand_bch_ecc.h     |   11 +
>>  drivers/mtd/nand/nand_ids.c         |  253 ++++-
>>  drivers/mtd/nand/nandsim.c          |    2 +-
>>  drivers/mtd/nand/smp8xxx_nand.c     | 2009 +++++++++++++++++++++++++++++++++
>>  drivers/mtd/ubi/misc.c              |    7 +
>>  21 files changed, 7164 insertions(+), 49 deletions(-)
> 
> ^^ This doesn't make sense. You've changed over 7000 lines, but your
> entire email is less than 3000 lines. From that alone, I can see you
> haven't given us the whole diff...

Sorry for the confusion. My intention was to provide a
"complete picture" in the diff stat, then trim "useless"
stuff from the actual diff, which is still huge :-(

> And just looking at the diff stat, you might want to clear up a few
> things:
> 
> (1) Are you really just talking about supporting a *NAND* driver? If so,
> then you probably don't need your new drivers/mtd/devices/spiflash.c.
> You also probably don't need to touch most things outside of
> drivers/mtd/nand/, like drivers/mtd/chips/cfi_cmdset_0002.c,
> drivers/mtd/maps/physmap.c, drivers/mtd/devices/m25p80.c, etc.

You're right, I should have been clearer.

I am trying to port the smp8xxx_nand.c driver to 4.4 in such
a way that porting to future kernels won't be such a pain.

This means examining changes to "core" files and either
- deleting unnecessary changes
- merging them back into smp8xxx_nand.c
- submitting them upstream

You seem to be saying that none of the changes outside of
drivers/mtd/nand are required for a NAND controller driver?
That would be great news for me.

Bear in mind that the essence of the driver is "quick and dirty".
So it wouldn't surprise me to find required code outside of
drivers/mtd/nand :-(


I see that m25p80.c is in mtd/devices.
This has nothing to do with the NAND controller drivers?

I thought it was a type of NAND chip, and any NAND controller
might be connected to one such chip.

> (2) How many NAND drivers do you actually have? I see two "new" NAND
> drivers: drivers/mtd/nand/smp8xxx_nand.c and
> drivers/mtd/nand/monza_nand.c.

Please ignore:
monza_nand.c  nand_bch_ecc.*  spiflash.c

>> Here's the actual diff, with non-core changes omitted.
> 
> Ah, I see why the diffstat vs diff discrepancy.
> 
> Others may feel more inclined to humor you, but by omitting the drivers
> themselves, it's hard to really get the whole picture.

I understand.

I'll spend a few hours to clean up the diffs and keep only
what I think is relevant. (Risk being that I delete the
wrong stuff, since I can't test the driver.)

Regards.
