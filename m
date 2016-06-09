Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAvCQ-0002f7-Dd
 for linux-mtd@lists.infradead.org; Thu, 09 Jun 2016 08:20:24 +0000
Date: Thu, 9 Jun 2016 10:19:51 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren
 <tony@atomide.com>, <devicetree@vger.kernel.org>, Linux mtd
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Oleksij
 Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH 3/4] mtd: nand: Add support for Evatronix
 NANDFLASH-CTRL
In-Reply-To: <20160603165909.09f27ee0@bbrezillon>
Message-ID: <alpine.DEB.2.02.1606071702220.19416@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020948070.19416@lnxricardw1.se.axis.com>
 <20160603165909.09f27ee0@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Boris,

Again, thanks for reviewing this.

On Fri, 3 Jun 2016, Boris Brezillon wrote:

> >  drivers/mtd/nand/Kconfig          |    6 +
> >  drivers/mtd/nand/Makefile         |    1 +
> >  drivers/mtd/nand/evatronix_nand.c | 1909 +++++++++++++++++++++++++++++++++++++
> >  3 files changed, 1916 insertions(+)
> >  create mode 100644 drivers/mtd/nand/evatronix_nand.c
> 
> Please run checkpatch.pl and fix all the ERRORS and WARNINGS.

I did run checkpatch.pl (at least the one in the mtd l2 tree), and there 
should be no outstanding errors. Some of the warnings are related to lines 
that are more than 80 characters which contain printouts which I don't 
want to split as it makes them hard to grep for.

There is a warning regarding the KConfig entry though, which seems to 
indicate that the description is missing - perhaps it just means that the 
help text is too short (although it's not shorter than many other NAND 
drivers in the same file)?

There are a couple of BUG()s though which are all of the type 'things that 
shouldn't happen' (e.g.. an enum having a value outside its range), so 
there's no real way to recover, however, one could always return early 
from the function in question and hope for the best.

I see now that there's a comment on an overly long line in the commit 
message that I've missed, as is a function call that's one character over 
the 80 character limit.

I usually consider checkpatch.pl to be of guidence rather than a sentinel 
when it comes to warnings, but if you want a '0 warnings' approach I can 
certainly accomplish that.

> > +#include <asm/dma.h>
> > +#include <linux/bitops.h> /* for ffs() */
> > +#include <linux/io.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/err.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/of.h>
> > +#include <linux/slab.h>
> > +#include <linux/mtd/mtd.h>
> > +#include <linux/mtd/nand.h>
> > +#include <linux/mtd/concat.h>
> > +#include <linux/mtd/partitions.h>
> > +#include <linux/version.h>
> 
> You seem to include a lot of things, and even asm headers. Please make
> sure you really need them.

Ok, will do.

> > +/* Some of this could potentially be moved to DT, but it represents stuff
> > + * that is either untested, only used for debugging, or things we really
> > + * don't want anyone to change, so we keep it here until a clear use case
> > + * emerges.
> > + */
> > +
> > +#undef NFC_DMA64BIT /* NFC hardware support for 64-bit DMA transfers */
> > +
> > +#undef POLLED_XFERS /* Use polled rather than interrupt based transfers */
> > +
> > +#undef CLEAR_DMA_BUF_AFTER_WRITE /* Useful for debugging */
> 
> Then simply drop the code in those sections and add it back when it's
> been tested.

NFC_DMA64BIT is untested so I'll take it out.

CLEAR_DMA_BUF_AFTER_WRITE is useful when debugging (and tested), and 
POLLED_XFERS is also tested but normally only used for debugging (if for 
instance there's a problem with interrupts). I don't really like to throw 
out code that's useful because it's unnecessary work to have to put it in 
again when the need arises. I could change the wording in the comment to 
make it clearer though (especially after having removed NFC_DMA64BIT) if 
that is enough?

The rationale for leaving this code in is that it can help bring up a new 
unknown system with this IP, because I consider the most likely re-use of 
this driver to be for someone who is developing a new SoC, as it seems 
rather uncommon in commercially available chips.

> > +/* DMA buffer for page transfers. */
> > +#define DMA_BUF_SIZE (8192 + 640) /* main + spare for 8k page flash */
> 
> This should clearly be dynamic.

8k pages are the largest the controller can handle, and there's only a 
single DMA buffer for the controller, so it's a very small amount of 
memory, and I didn't feel it worth the complexity to reduce the size just 
because a smaller paged flash was encountered. The driver uses the DMA 
buffer to read the ID data so it needs a buffer anyway before the page 
size has been determined. But if you feel it's important I can rework it - 
there would have to be two buffers, one smaller one for reading the ID and 
a larger one subsequently allocated for page data.

> > +
> > +/* Debugging */
> > +
> > +#define MTD_TRACE(FORMAT, ...) pr_debug("%s: " FORMAT, __func__, ## __VA_ARGS__)
> 
> Hm, I'm not a big fan of those custom pr_debug() macros, but if you
> really wan to keep it you shouldn't prefix it with MTD_.

Ok. I was thinking about replacing it with pr_debug straight off, but saw 
that there were other drivers with custom debug macros so I left it in. 
I'll replace it with pr_debug then.

> Reading at the code I see a lot of MTD_TRACE() calls, while I'm not
> against debug traces, it seems to me that you've kept traces you used
> while developing/debugging your implementation. Can you clean it up and
> keep only the relevant ones.

It's true that the debug traces were initially created during driver 
development, however I have gone through the debug printouts and consider 
the ones remaining to be relevant, especially if one is trying to debug a 
new previously untested system with this IP. Was there any particular 
one(s) you were thinking of?

> > +	MAKE_COMMAND(_SEQ_14, INPUT_SEL_SIU, DATA_SEL_FIFO, \
> > +		NAND_BLOCK_ERASE, NAND_BLOCK_ERASE_END, _DONT_CARE)
> > +
> > +/* Assembled values for putting into GEN_SEQ_CTRL register */
> > +
> > +/* General command sequence specification for 4 cycle PAGE_READ command */
> > +#define GEN_SEQ_CTRL_READ_PAGE_4CYCLE \
> > +	MAKE_GEN_CMD(1, 0, 1, 0,	/* enable command 0 and 2 phases */ \
> > +		     2, 2,		/* col A0 2 cycles, row A0 2 cycles */ \
> > +		     0, 0,		/* col A1, row A1 not used */ \
> > +		     1,			/* data phase enabled */ \
> > +		     _BUSY_0,		/* busy0 phase enabled */ \
> > +		     0,			/* immediate cmd execution disabled */ \
> > +		     _DONT_CARE)	/* command 3 code not needed */
> > +
> > +/* General command sequence specification for 4 cycle PAGE_PROGRAM command */
> > +#define GEN_SEQ_CTRL_WRITE_PAGE_4CYCLE \
> > +	MAKE_GEN_CMD(1, 1, 0, 0,	/* enable command 0 and 1 phases */ \
> > +		     2, 2,		/* col A0 2 cycles, row A0 2 cycles */ \
> > +		     0, 0,		/* col A1, row A1 not used */ \
> > +		     1,			/* data phase enabled */ \
> > +		     _BUSY_1,		/* busy1 phase enabled */ \
> > +		     0,			/* immediate cmd execution disabled */ \
> > +		     _DONT_CARE)	/* command 3 code not needed */
> 
> I think I already commented on that last time a driver for the same IP 
> was submitted by Oleksij.

(Just to clarify: this doesn't have any bearing on this particular issue, 
but the SoC Oleksij submitted a driver for used a rather different 
(probably older) version of the same IP. The only documentation I saw for 
that SoC was the IP register map, and there were several differences in 
not only the register addresses but also the available registers and bit 
fields, and it did not look like one was a subset of the other. So it 
looked more like the IP vendor had done an at least partial rewrite of the 
internal logic between the two versions.)

> I'm pretty sure you can implement ->cmd_ctrl() and rely on the default
> cmdfunc() logic instead of manually converting those high-level NAND
> commands into your own model (which seems to match pretty much the
> ->cmd_ctrl() model, where you can get the number of address and command
> cycles).
> 
> Maybe I'm wrong, but I think it's worth a try, and if it works, it
> would greatly simplify the driver.

It's not so much trying as reading the manual for the IP. :-)

The problem here is that the ->cmd_ctrl() logic assumes that you can pass 
single bytes transparently via the IP and also directly control the state 
of the ALE and CLE lines, as well as set up data transfers independently 
of that, none of which is not possible with this IP. Instead, the IP 
offers a number of fixed interface sequences, some more programmable than 
others, a subset of which are used in this driver, which do all the heavy 
lifting. There is for instance no sequence which just writes or reads data 
to or from the flash, there's always at least a command write (CLE) 
included.

(The command definitions in the macro sections are more or less direct 
translations from a table and section in the IP manual describing how to 
accomplish various functions.)

If there had been a transparent mode I would certainly have gone that 
route, at least initially, rather than mess about with all this controller 
specific stuff. I think that's why Oleksij arrived at a similar solution 
(or possibly he used a non-Linux driver as a starting point).

The designers of this IP apparantly did not have Linux in mind when they 
designed the controller, since it does all the low level stuff 
autonomously (in the right IP configuration it can even remap flash blocks 
transparently), with no way of intervening. For instance, when doing 
hardware ECC, the OOB data is not available anywhere to the user, and if 
one wants to actually read it a separate OOB write needs to be done. I 
think the target market for the IP is really a general real time OS where 
there is no NAND driver available, and you just want to fire off a single 
high level command, wait for an interrupt, and have your data waiting for 
you.

This latter property is actually advantageous in Linux too as the driver 
doesn't have to do bit- and byte-banging against the NAND flash. I'm not 
sure what the gain in overhead is in practice, but at any rate there's not 
much of a choice.

> > +/* Information common to all chips, including the NANDFLASH-CTRL IP */
> > +struct nfc_info {
> 
> Should inherit from nand_hw_ctrl (see the sunxi_nand driver)...
> 
> > +	void __iomem *regbase;
> > +	struct device *dev;
> > +	struct nand_hw_control *controller;
> 
> ... and not point to it.

Ok. I'm a bit unsure what you mean by 'inherit' though; in the sunxi 
driver the struct nand_hw_controller is contained within the struct 
sunxi_nfc, in my case there's a pointer to a single instance of a 
nand_hw_control. I agree that my approach is wasteful on a dynamic 
allocation and I have no problems changing it, but conceptually there's 
not much of a difference.

> > +
> > +/* What we tell mtd is an mtd_info actually is a complete chip_info */
> > +#define TO_CHIP_INFO(mtd) ((struct chip_info *)(mtd_to_nand(mtd)))
> 
> Ouch! Please, don't do that, container_of() is here for a good reason.
> And prefer static inline functions over macros for this kind of things.
> 
> static inline struct chip_info *mtd_to_chip_info(struct mtd_info *mtd)
> {
> 	return container_of(mtd_to_nand(mtd), struct chip_info, chip);
> }

Ok. Will change.

> > +
> > +/* This is a global pointer, as we only support one single instance of the NFC.
> > + * For multiple instances, we would need to add nfc_info as a parameter to
> > + * several functions, as well as adding it as a member of the chip_info struct.
> > + * Since most likely a system would only have one NFC instance, we don't
> > + * go all the way implementing that feature now.
> > + */
> > +static struct nfc_info *nfc_info;
> 
> Come on! Don't be so lazy, do the right thing.

It's not a question of laziness, it was a conscious decision: why add 
unnecessary bloat and complexity for a case that probably will never 
occur? I can certainly change it if you think it's worth while of course.

> > +
> > +/* The timing setup is expected to come via DT. We keep some default timings
> > + * here for reference, based on a 100 MHz reference clock.
> > + */
> > +
> > +static const struct nfc_timings default_mode0_pll_enabled = {
> > +	0x0d151533, 0x000b0515, 0x00000046,
> > +	0x00150000, 0x00000000, 0x00000005, 0x00000015 };
> 
> Can you explain those magic values?

Not really, the problem is that the agreement we have with the IP vendor 
is that we may not disclose any documentation, outside of what is 
absolutely necessary to write working code.

A rationale is that anyone else wanting to use the driver will either be 
designing their own SoC in which case they will have access to the 
relevant documentation, or if they're using a SoC from someone else, the 
SoC vendor will have to provide that information in order for the chip to 
be useful anyway.

> > +
> > +/**** Utility routines. */
> 
> Please use regular comments: /* */

Ugh. Yes, sorry.

> > +
> > +/* Count the number of 0's in buff up to a max of max_bits */
> > +/* Used to determine how many bitflips there are in an allegedly erased block */
> > +static int count_zero_bits(uint8_t *buff, int size, int max_bits)
> > +{
> > +	int k, zero_bits = 0;
> > +
> > +	for (k = 0; k < size; k++) {
> > +		zero_bits += hweight8(~buff[k]);
> > +		if (zero_bits > max_bits)
> > +			break;
> > +	}
> > +
> > +	return zero_bits;
> > +}
> 
> We have an helper for that [1].

Great, I'll use that. (I don't think it existed when the first version of 
this driver was written).

> > +
> > +/* Read and write NFC SFR registers */
> > +
> > +static uint32_t nfc_read(uint reg_offset)
> > +{
> > +	return readl_relaxed(nfc_info->regbase + reg_offset);
> > +}
> > +
> > +static void nfc_write(uint32_t data, uint reg_offset)
> > +{
> > +	/* Note: According to NANDFLASH-CTRL Design Specification, rev 1.14,
> > +	 * p19, the NFC SFR's can only be written when STATUS.CTRL_STAT is 0.
> > +	 * However, this doesn't seem to be an issue in practice.
> > +	 */
> > +	writel_relaxed(data, nfc_info->regbase  + reg_offset);
> > +}
> 
> Do you really want to use the _relaxed functions?

Yes, using _relaxed, together with explicit memory barriers in the DMA 
routines has shown a 5% increase in flash read performance on an ARM 
system, the reason being that on an ARM system the implicit memory barrier 
in the writel() call causes a fairly heavy penalty in terms of flushing 
the L2 cache.

> > +	res = request_irq(irq, nfc_irq, 0, "evatronix-nand", nfc_info);
> 
> devm_?

Yes, good catch, thanks!

> To be honest, your driver seems really complicated compared to what
> it's supposed to do, and I suspect it could be a lot simpler, but
> again, maybe I'm wrong.
> 
> If you didn't try yet, please investigate the ->cmd_ctrl() approach,
> and if you did, could you explain why it didn't work out?

Given that the controller does not have the transparency that the 
->cmd_ctrl() approach requires, as noted above, I can't see how it could 
be simplified.

I basically need to grab everything needed for a given operation and 
interpret it before handing it over to the controller. I considered using 
a higher level API, by replacing the default ->cmdfunc() (default 
nand_command/nand_command_lp) with a specific version, which would have 
avoided the need to interpret the NAND commands arriving via ->cmd_ctrl(), 
but that meant duplicating some of the logic in nand_base.c which seemed 
like a bad idea.

> Can you please remove everything that is not strictly required and
> clean the things I pointed before submitting a new version.

Sure, but I would very much like some feedback on the points I've raised 
above before going on with that.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
