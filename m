Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAIWE-00056D-Nh
 for linux-mtd@lists.infradead.org; Tue, 07 Jun 2016 15:02:16 +0000
Date: Tue, 7 Jun 2016 17:01:41 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren
 <tony@atomide.com>, <devicetree@vger.kernel.org>, Linux mtd
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] of: Add device tree bindings for Evatronix
In-Reply-To: <20160603162207.0688c9e6@bbrezillon>
Message-ID: <alpine.DEB.2.02.1606060757180.23377@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020946500.19416@lnxricardw1.se.axis.com>
 <20160603162207.0688c9e6@bbrezillon>
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

First of all, thanks for reviewing this.

On Fri, 3 Jun 2016, Boris Brezillon wrote:

> > +
> > +Optional properties:
> > +- nand-on-flash-bbt: See nand.txt.
> > +- #address-cells, #size-cells: See partition.txt.
> > +- evatronix,use-bank-select : Use controller bank select function to access
> > +			      multiple chips, rather than chip enable.
> 
> You mean, using a dedicated logic to control the CS lines rather than a
> GPIO (controlled by the SW using gpio_set_value())?

No. In the SoC on which this has been developed, the nand flash controller 
has dedicated I/O pins for all its functions.

The controller has the concept of 'banks' vs. 'devices'. Essentially, a 
'bank' is a group of multiple chips of the same geometry etc, and the 
controller can send commands in parallel to all devices in the same bank. 
In contrast, different 'banks' can have completely different devices, but 
all devices must be idle before the controller can switch 'banks'.

The usecase for the former would be to increase performance and the latter 
case would be if there were for instance one small NAND flash for program 
storage and a large one for data.

The IP that the driver was tested on has two available chip selects, and 
the DT property controls whether they refer to two devices in the same 
bank vs. two separate banks.

> BTW, you seem to support controlling several CS using the same
> controller, which means you'll have to specify which CS the NAND chip
> is connected to (see [1]).

That is true. The driver as it stands currently only supports a single CS, 
however, the IP as configured in the SoC in question can handle two CS 
lines. My plan is to initially provide support for only the single-CS 
case (there are places in the code where I felt it practical to prepare 
for the multiple-CS case though).

As such, I realize that the previously mentioned property 
(evatronix,use-bank-select) won't really have any meaning in the single-CS 
case, so perhaps it should be omitted at this point completely, and added 
in the future when it is really needed?

> > +- evatronix,rb-wired-and: Assume ready/busy signal from all flash chips are
> > +			  connected using a wired-AND topology rather than
> > +			  individually.
> 
> Hm, is that really required? If the R/B line is shared among several
> NAND chips, it should be transparent, you just have to specific which
> chip is connected to which GPIO (or dedicated R/B pin).

For the SoC in question, the wired-and vs individual R/B lines was a 
choice made during the chip design, which is why I exported this choice as 
a DT property, as it reflects a hardware choice done outside the IP but 
inside the SoC.

I didn't really want to have the added flexibility (and complexity) of 
being able to use any R/B line for any connected flash chip. It seems an 
unnecessary complication for the driver without much gain.

But it would certainly be doable, as the R/B stuff is handled completely 
in software. One would still need a new property that the child nand nodes 
can use to select the R/B line (e.g. evatronix,rb-line). (In the 
configuration we have, as with the CS lines, the R/B line has its own 
dedicated pin, so it's not a GPIO). So it would still require a DT 
property to manage it.

Again, this property doesn't really have any meaning in the single-CS 
case, so should I omit it completely?

> > +- evatronix,timings: Seven 32-bit values for initializing the TIME_SEQ_0,
> > +		     TIME_SEQ_1, TIMINGS_ASYN, TIME_GEN_SEQ_0, TIME_GEN_SEQ_1,
> > +		     TIME_GEN_SEQ_2 and TIME_GEN_SEQ_3 registers, respectively.
> 
> 
> Can this be extracted from the timing mode exposed by the NAND chip.
> IMO it shouldn't be defined in the DT.

I agree, Ideally one would like to read timing parameters from the NAND 
chip (ONFi or JEDEC parameter pages) and determine all the controller IP 
timings from that. There are a couple of reasons I haven't gone that 
route.

Mainly, the reason is that the part of the timing settings are influenced 
by delays within the SoC which are not part of the controller itself, thus 
they cannot be part of the driver code and must come from somewhere else.

The other reason is that the resulting calculations would be rather 
complex to express, given the general case of different controller 
operating frequencies, different types of parameter pages (ONFi vs. 
JEDEC), and a number of settable timing modes (ONFi mode 0, 1, 2, ...). It 
would be a nightmare to test and probably even worse to make future 
changes. At some point, the resulting register values will have to be 
analyzed manually anyway to verify them, checking them against the timings 
for the nand flash chips in question, so one might as well put those 
values into the configuration to start with.

One route to go would be to have a number of 'timings' parameters in the 
.dtsi file for the SoC in question, where the register values are defined 
for different timing modes. The board (.dts) file could then either select 
one of the .dtsi-defined timing modes, or it could be selected 
automatically for those cases where it would be possible (i.e. ONFi timing 
modes).

> > +	/* ONFi mode 0 timing, assuming 100 MHz clock. */
> > +	/* Order is TIME_SEQ_0, TIME_SEQ_1, TIMINGS_ASYN,
> > +	 * TIME_GEN_SEQ_0, _1, _2, _3 */
> > +	evatronix,timings = <0x0d151533 0x000b0515 0x00000046
> > +			     0x00150000 0x00000000 0x00000005 0x00000015>;
> > +	nand-ecc-mode = "hw";
> > +	nand-ecc-algo = "bch";
> > +	nand-on-flash-bbt;
> > +	nand-ecc-strength = <8>;
> > +	nand-ecc-step-size = <512>;
> > +	evatronix,use-bank-select;
> > +	evatronix,rb-wired-and;
> > +};
> 
> We recently added more constraints on the 'NAND controller/NAND chip'
> representation in the DT [1].
> You should rework your binding (and your code) to match these
> constraints, even if you controller is only able to interface with a
> single NAND chip.

Just so I'm clear on this: what you're referring to here is that the 
generic mtd properties (nand-*) are now per chip rather than per 
controller? I will have to rework this.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
