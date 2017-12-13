Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ePEZ4-0007Cl-U1
 for linux-mtd@lists.infradead.org; Wed, 13 Dec 2017 21:27:45 +0000
Date: Wed, 13 Dec 2017 22:27:10 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Frieder Schrempf <frieder.schrempf@exceet.de>
Cc: "Peter Pan =?UTF-8?B?5r2Y5qCL?= (peterpandong)"
 <peterpandong@micron.com>, Peter Pan <peterpansjtu@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v6 00/15] A SPI NAND framework under generic NAND framework
Message-ID: <20171213222710.32d12514@bbrezillon>
In-Reply-To: <256b4ab6-c104-4580-87cd-527178bde460@exceet.de>
References: <20170529225931.226da943@bbrezillon>
 <90bcb366-c494-2dee-3bb7-d16b77e347c6@exceet.de>
 <20171204150514.1f17671d@bbrezillon>
 <A0FE66EC-7E17-43BE-9B66-896F112B92A0@micron.com>
 <20171205135804.478902dc@bbrezillon>
 <20171205140313.40f3f17d@bbrezillon>
 <256b4ab6-c104-4580-87cd-527178bde460@exceet.de>
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

Hi Frieder,

On Tue, 12 Dec 2017 10:58:10 +0100
Frieder Schrempf <frieder.schrempf@exceet.de> wrote:

> Hi Boris,
> 
> I spent some time looking at and working with your latest SPI NAND code.
> In my previous mail I said, that we have some working code for our 3.14 
> kernel based on the "mt29f_spinand" staging driver, but that was wrong 
> as I got things mixed up in my head.
> Actually our codebase was an early version of Peter's code, so the 
> effort to port it to the latest framework code was not that big.
> 
> I forked your repo and you can find my working tree at [1].

Great, I'll try to have a look.

> 
> What I did so far:
> 
> * Rebase your patches on latest Linux 4.14.5

Cool, rebasing on 4.15-rc1 would be even better, but I can do that if
you don't have the time.

> 
> * Add a driver for the Winbond W25M02GV SPI NAND chip, that we have on 
> some of our boards.

Okay, that's actually a good thing to have tested with another chip,
This way we can make sure the framework is generic enough.

> 
> * Add a driver for the Freescale QSPI controller, derived from the 
> existing QSPI-NOR driver at drivers/mtd/spi-nor/fsl-quadspi.c.

That's an interesting case as well, the generic NAND controller is
probably the easiest implementation, and that's a good thing to have
another controller.

> 
> * Add a setup and setup_late op to the controller layer (see [3]). I 
> don't know if that makes sense, but at least the setup_late is needed 
> for the FSL QSPI driver, as it needs to know the size of the flash to 
> setup the memory mapping for the QSPI read operations.

Hm, not sure what ->setup_late() is for, but I'll have a look.

> 
> * A bit of testing and fixing two small bugs, which look like copy and 
> paste mistakes. See [2].

Thanks, I'll squash the fixes in the original commit.

> 
> * Running nandtest successfully on our hardware (i.MX6UL -> FSL-QSPI -> 
> W25M02GV)
> 
> I hope this is of use while moving on.

Definitely. I'd also like to have a review on the framework code if
possible, but that can be done when posted on the ML.

> I guess you would like to have the basic framework with Micron support 
> and generic SPI tested and stabilized first, before adding more code, 
> but to be able to test with our hardware I need Micron and FSL QSPI.

I guess you mean Winbond not Micron. That's okay if those patches are
posted after the initial series. All I need is reviews and tests from
different parties, so that I'm less confident in merging the code.

> 
> Some questions/flaws that occurred to me:
> 
> * The W25M02GV chip has two dies of 128M each. My current driver only 
> makes use of the first die. The chip expects a die-select command to 
> switch between the two dies.
> What would be the place to implement this?
> Can I just add the command and issue it in 
> winbond_spinand_adjust_cache_op if luns_per_target > 1?

It really depends when the die selection happens. I guess it happens in
2 places: when preparing a program/read operation and when doing the
transfer to the in-chip cache. Anyway, the die information is already
passed in the nand_pos object, so all you'll have to do is create a new
hook to customize the SPI command when needed.

> 
> * The FSL QSPI controller has a lookup table that needs to be filled 
> with command sequences at the time of setup. Therefore the number of 
> dummy bytes for each command is fixed and in my current implementation 
> op->dummy_bytes is ignored.
> That's not a problem if all chips need the same number of dummy bytes 
> for each command, but I guess that's not the case, as there is a 
> _spinand_get_dummy function.

We should definitely expose that in a generic way, and on a
per-operation basis, so that, after the detection step, the NAND
controller can query this information.

> 
> * What is your plan for ECC and BBT? At least enabling the onchip ECC 
> will be necessary to be able to use the flash properly (e.g. with UBI), 
> or am I wrong?

Well, if all SPI NAND chips are supporting ECC the same way and
on-die ECC support is mandatory for SPI NANDs, then supporting that
directly in the core is probably the best option. If, on the other
hand, you have various implementations, and some SPI controllers have
their own ECC engine that you can use with SPI NANDs, then it's
probably a better idea to abstract ECC engine in the generic NAND layer.

For BBTs, I'd like to have a clean version of the nand_bbt logic that
uses all of the helpers exposed by the generic NAND layer. I'd also
like to simplify the code if possible.

> 
> * Do you have any special test cases? What do you usually do to test the 
> code?

Well, make sure all the mtd tests are passing (drivers/mtd/tests), and
then, the next step is to test it with UBI+UBIFS. But honestly, I'm not
so worried, this is new code, and we've isolated from the raw NAND
layer, so if it's buggy or instable at the beginning it's not a big
deal, it will be noticed and fixed for the next few releases.

> 
> Thanks for your patience and best regards,

No problem. Thanks for your work, and I'll try to be more active on
this topic (I promised that several times, and failed it :-/).

Regards,

Boris
