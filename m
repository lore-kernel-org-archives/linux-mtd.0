Received: from mailrelay006.isp.belgacom.be ([195.238.6.172])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P90ur-0004q4-6b
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2010 19:35:15 +0000
Date: Thu, 21 Oct 2010 21:34:41 +0200
From: Philippe De Muyter <phdm@macqel.be>
To: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH] mtd: Apply Numonyx Axcell P33/P30 workaround for
	Lock/Unlock bug.
Message-ID: <20101021193441.GA17855@frolo.macqel>
References: <1287498263-5561-1-git-send-email-phdm@macqel.be>
	<1287650398.2932.5.camel@localhost>
	<20101021093343.GA17631@frolo.macqel>
	<1287656983.2932.14.camel@localhost>
	<alpine.LFD.2.00.1010211226120.2764@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.1010211226120.2764@xanadu.home>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Nicolas,

On Thu, Oct 21, 2010 at 12:32:02PM -0400, Nicolas Pitre wrote:
> On Thu, 21 Oct 2010, Artem Bityutskiy wrote:
> 
> > On Thu, 2010-10-21 at 11:33 +0200, Philippe De Muyter wrote:
> > > On Thu, Oct 21, 2010 at 11:39:58AM +0300, Artem Bityutskiy wrote:
> > > > On Tue, 2010-10-19 at 16:24 +0200, Philippe De Muyter wrote:
> > > > > Some flash chips have a small but annoying bug, documented in
> > > > >     "Numonyx Axcell P33/P30 256-Mbit Specification Update"
> > > > > 
> > > > >     It states :
> > > > >     When customer uses [...] block unlock, the block lock status might
> > > > >     be altered inadvertently. Lock status might be set to either 01h
> > > > >     or 03h unexpectedly (00h as expected data), which leads to
> > > > >     program/erase failure on certain blocks.
> > > > > 
> > > > >     A workaround is given, (summary : issue a "Read Lock Status" before
> > > > >     the "Lock" or "Unlock" command) which I have applied and tested
> > > > >     with success.
> > > > > 
> > > > > Signed-off-by: Philippe De Muyter <phdm@macqel.be>
> > > > 
> > > > Is this Numonyx-specific issue? Should there be some kind of "if
> > > > (numonyx)" statement?
> > > 
> > > This is clearly a bug specific to some Numonyx flashes.
> > > My chips have Manufacturer ID: 0x89, Device ID: 0x881B, but there are
> > > other chips in the same family.  The errata
> > > http://www.numonyx.com/Documents/Specification%20Updates/509003_P3X_65nm_3V_256Mbit_Discrete.pdf does not list the ManufacturerIDs/DeviceIDs of the affected
> > > chips.
> > 
> > CCed Nicolas correctly.
> > 
> > Anyway, if this affects only subset of chips, it make sense to make this
> > quirk conditional, because this might affect boot speed, e.g., if some
> > systems unlock all blocks on boot-up.
> 
> That is probably quite unlikely to make a difference given that there is 
> no result delay involved.
> 
> However, does the erratum workaround imply that the status actually has 
> to be read?  In other words, can you simply issue CMD 90 without calling 
> cfi_read_query()?

Here is the relevant excerpt of the errata :

Workaround:  If the interval between 60h and its subsequent command
             can be guaranteed within 20us, Option I is recommended,
             otherwise Option II (involves hardware) should be selected.
Option I: The table below lists the detail command sequences:
Command
              Data bus           Address bus       Remarks
Sequence
  1              90h            Block Address
                                                   Read Lock Status
  2             Read         Block Address + 02h
 (2)(3)                                      (1)
3                60h           Block Address
 (2)(3)                                      (1)   Lock/Unlock/RCR Configuration
4           D0h/01h/03h        Block Address
Notes:
(1) Block Address refers to RCR configuration data only when the 60h
    command sequence is used to set RCR register combined with 03h
    subsequent command.
(2) For the third and fourth command sequences, the Block Address must
    be the same.
(3) The interval between 60h command and its subsequent D0h/01h/2Fh/03h
    commands should be less than 20us.

Philippe

-- 
Philippe De Muyter  phdm at macqel dot be  Tel +32 27029044
Macq Electronique SA  rue de l'Aeronef 2  B-1140 Bruxelles  Fax +32 27029077
