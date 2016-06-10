Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bBNcT-0008BM-IN
 for linux-mtd@lists.infradead.org; Fri, 10 Jun 2016 14:41:11 +0000
Date: Fri, 10 Jun 2016 16:40:39 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 <linux-kernel@vger.kernel.org>, Oleksij Rempel <linux@rempel-privat.de>,
 Linux mtd <linux-mtd@lists.infradead.org>, Benoit Cousson
 <bcousson@baylibre.com>, Brian Norris <computersforpeace@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 3/4] mtd: nand: Add support for Evatronix
 NANDFLASH-CTRL
In-Reply-To: <20160609110814.78823ef3@bbrezillon>
Message-ID: <alpine.DEB.2.02.1606091313490.6751@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020948070.19416@lnxricardw1.se.axis.com>
 <20160603165909.09f27ee0@bbrezillon>
 <alpine.DEB.2.02.1606071702220.19416@lnxricardw1.se.axis.com>
 <20160609110814.78823ef3@bbrezillon>
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


On Thu, 9 Jun 2016, Boris Brezillon wrote:

> > > >  drivers/mtd/nand/Kconfig          |    6 +
> > > >  drivers/mtd/nand/Makefile         |    1 +
> > > >  drivers/mtd/nand/evatronix_nand.c | 1909 +++++++++++++++++++++++++++++++++++++
> > > >  3 files changed, 1916 insertions(+)
> > > >  create mode 100644 drivers/mtd/nand/evatronix_nand.c  
> > > 
> > > Please run checkpatch.pl and fix all the ERRORS and WARNINGS.  
> > 
> > I did run checkpatch.pl (at least the one in the mtd l2 tree), and there 
> > should be no outstanding errors. Some of the warnings are related to lines 
> > ...
> > 
> 
> Well, I'm not asking to fix all 80 chars warnings, but I see a lot of
> warnings and errors in there [1], and I'm pretty sure most of them can
> be addressed in a sane way.

Whoa, something must have gone seriously wrong when I mailed out the 
patch. When I run checkpatch.pl locally on the patch file, I have 0 errors 
and 10 warnings (not 128 errors and 65 warnings).

I tired mailing the patch to myself, extracting it from the incoming 
email, and comparing with the original patch file and they were identical. 
I must check up if something has gone amiss with our external email here, 
as we haven't had problems before. I'll need to look into this. I would 
certainly not submit a patch with any checkpatch.pl errors unless they 
were really false positives.

> > > > +#undef POLLED_XFERS /* Use polled rather than interrupt based transfers */
> > > > +
> > > > +#undef CLEAR_DMA_BUF_AFTER_WRITE /* Useful for debugging */  
> > > 
> > [ ... ]
> > The rationale for leaving this code in is that it can help bring up a new 
> > unknown system with this IP, because I consider the most likely re-use of 
> > this driver to be for someone who is developing a new SoC, as it seems 
> > rather uncommon in commercially available chips.
> 
> That's not how it works. Either you provide a sane way to activate
> these options (using Kconfig entries), or your drop dead-code sections.
> 
> I understand that debugging is important to you, but adding hundreds
> lines of unused code is also hurting readability, so I keep thinking
> that these options should either be removed (with the associated code
> sections) or exposed as Kconfig options.

Ok, I'll give it some consideration and fix it either way.

> > > > +/* DMA buffer for page transfers. */
> > > > +#define DMA_BUF_SIZE (8192 + 640) /* main + spare for 8k page flash */  
> > > 
> > > This should clearly be dynamic.  
> > 
> > 8k pages are the largest the controller can handle, and there's only a 
> > [  ... ]
> 
> If you reject all NAND above 8k + 640 oob bytes I'm fine with this
> fixed size.

Ok, I see what you're getting at. Yes, there needs to be a check for that, 
somewhere.

> > > I'm pretty sure you can implement ->cmd_ctrl() and rely on the default
> > > cmdfunc() logic instead of manually converting those high-level NAND
> > > commands into your own model (which seems to match pretty much the  
> > > ->cmd_ctrl() model, where you can get the number of address and command  
> > > cycles).
> > > [ ... ]
> 
> Just to be clear, you don't have to toggle the pins each time
> ->cmd_ctrl() is called, you can cache the operations and launch it once
> it says it's dones (don't remember the flag).
>

I've omitted comments to this here as the discussion has been carried on 
in the sub thread started by Mychaela.

> > > > +/* Information common to all chips, including the NANDFLASH-CTRL IP */
> > > > +struct nfc_info {  
> > > 
> > > Should inherit from nand_hw_ctrl (see the sunxi_nand driver)...
> > >   
> > > > +	void __iomem *regbase;
> > > > +	struct device *dev;
> > > > +	struct nand_hw_control *controller;  
> > > 
> > > ... and not point to it.  
> > 
> > Ok. I'm a bit unsure what you mean by 'inherit' though; in the sunxi 
> > driver the struct nand_hw_controller is contained within the struct 
> > sunxi_nfc, in my case there's a pointer to a single instance of a 
> > nand_hw_control. I agree that my approach is wasteful on a dynamic 
> > allocation and I have no problems changing it, but conceptually there's 
> > not much of a difference.
> 
> There's a huge different. By embedding the nand_hw_control struct into
> your nfc_info object you allow things like:
> 
> static int get_nfc(struct nand_chip *chip)
> {
> 	return container_of(chip->controller, struct nfc_info,
> 			    controller);
> }
> 
> This way you can retrieve the nfc_info object attached to the nand_chip.

Yes, of course ... or rather,

static int get_nfc(struct nand_hw_control *controller)

I see new what you mean by inherit. It all comes down to if struct 
nfc_info is a specialized type of struct nand_hw_control, or if it just 
refers to it. I had assumed it was the latter that was the paradigm.

In the driver in question it makes no practical difference as there is no 
need to go from a nand_hw_control to an nfc_info (in fact, the 
nand_hw_control is nevery really used explicitly, it tags along, only used 
by the framework).

Still, I'm not trying to make an argument here, just trying to understand 
what the underlying paradigm is. I'll move it inside as it clearly is 
better in several respects.

> > > > +
> > > > +/* This is a global pointer, as we only support one single instance of the NFC.
> > > > + * For multiple instances, we would need to add nfc_info as a parameter to
> > > > + * several functions, as well as adding it as a member of the chip_info struct.
> > > > + * Since most likely a system would only have one NFC instance, we don't
> > > > + * go all the way implementing that feature now.
> > > > + */
> > > > +static struct nfc_info *nfc_info;  
> > > 
> > > Come on! Don't be so lazy, do the right thing.  
> > 
> > It's not a question of laziness, it was a conscious decision: why add 
> > unnecessary bloat and complexity for a case that probably will never 
> > occur? I can certainly change it if you think it's worth while of course.
> 
> It is. And you're okay bloating the code with dead-code, but not with
> implementing this in order to avoid singletons when it clearly
> shouldn't be?

I'm ok with bloating the code with something which I consider may be 
useful, but I have reservations bloating it with something which I don't 
think will ever be used (and which could be added if the need arises 
later) and furthermore is not possible to test and verify properly (as 
there is in fact only one NAND controller on the platform on which I can 
test this).

But I'm fine with adding it, I'm not really trying to knock it, just 
explaining why it wasn't done in the first place. (I think I'm actually 
reacting to the word 'lazy' here...).

> > > > +
> > > > +/* The timing setup is expected to come via DT. We keep some default timings
> > > > + * here for reference, based on a 100 MHz reference clock.
> > > > + */
> > > > +
> > > > +static const struct nfc_timings default_mode0_pll_enabled = {
> > > > +	0x0d151533, 0x000b0515, 0x00000046,
> > > > +	0x00150000, 0x00000000, 0x00000005, 0x00000015 };  
> > > 
> > > Can you explain those magic values?  
> > 
> > Not really, the problem is that the agreement we have with the IP vendor 
> > is that we may not disclose any documentation, outside of what is 
> > absolutely necessary to write working code.
> > 
> > A rationale is that anyone else wanting to use the driver will either be 
> > designing their own SoC in which case they will have access to the 
> > relevant documentation, or if they're using a SoC from someone else, the 
> > SoC vendor will have to provide that information in order for the chip to 
> > be useful anyway.
> 
> Hm, so I'll have a new table like that for each new SoC using this IP?

Yes, I would say that would be the case.

> I must say I don't like the idea, but let's address the other aspects
> first.

Ok.

> As said above, I'm planning to rework the NAND framework to
> support things like:
> 
> struct nand_operation {
> 	u8 cmds[2];
> 	u8 addrs[5];
> 	int ncmds;
> 	int naddrs;
> 	union {
> 		void *out;
> 		const void *in;
> 	};
> 	enum nand_op_direction dir;
> }
> 
> ->exec_op(struct nand_operation *op);
> 
> This way the NAND controller would have all the necessary information
> to trigger the whole operation (omitted the ECC info on purpose, to
> make it clearer).
> 
> But this is not there yet, and in the meantime, if possible, I'd prefer
> seeing drivers implementing the ->cmd_ctrl() function instead of
> overloading the default ->cmdfunc() implementation.

I see, I suppose that's because during the course of this the ->cmdfunc() 
logic will be significantly changed, requiring corresponding changes in 
drivers that do overload that function? Fair enough, that's a pretty good 
reason, probably more so than the alleged simplicity of the ->cmd_ctrl() 
interface.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
