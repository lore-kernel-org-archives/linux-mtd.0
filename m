Received: from mailrelay001.isp.belgacom.be ([195.238.6.51])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8rX4-0002lT-Lg
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2010 09:33:59 +0000
Date: Thu, 21 Oct 2010 11:33:43 +0200
From: Philippe De Muyter <phdm@macqel.be>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd: Apply Numonyx Axcell P33/P30 workaround for
	Lock/Unlock bug.
Message-ID: <20101021093343.GA17631@frolo.macqel>
References: <1287498263-5561-1-git-send-email-phdm@macqel.be>
	<1287650398.2932.5.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1287650398.2932.5.camel@localhost>
Cc: Nicolas Pitre <nico@cam.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 21, 2010 at 11:39:58AM +0300, Artem Bityutskiy wrote:
> On Tue, 2010-10-19 at 16:24 +0200, Philippe De Muyter wrote:
> > Some flash chips have a small but annoying bug, documented in
> >     "Numonyx Axcell P33/P30 256-Mbit Specification Update"
> > 
> >     It states :
> >     When customer uses [...] block unlock, the block lock status might
> >     be altered inadvertently. Lock status might be set to either 01h
> >     or 03h unexpectedly (00h as expected data), which leads to
> >     program/erase failure on certain blocks.
> > 
> >     A workaround is given, (summary : issue a "Read Lock Status" before
> >     the "Lock" or "Unlock" command) which I have applied and tested
> >     with success.
> > 
> > Signed-off-by: Philippe De Muyter <phdm@macqel.be>
> 
> Is this Numonyx-specific issue? Should there be some kind of "if
> (numonyx)" statement?

This is clearly a bug specific to some Numonyx flashes.
My chips have Manufacturer ID: 0x89, Device ID: 0x881B, but there are
other chips in the same family.  The errata
http://www.numonyx.com/Documents/Specification%20Updates/509003_P3X_65nm_3V_256Mbit_Discrete.pdf does not list the ManufacturerIDs/DeviceIDs of the affected
chips.

Philippe

-- 
Philippe De Muyter  phdm at macqel dot be  Tel +32 27029044
Macq Electronique SA  rue de l'Aeronef 2  B-1140 Bruxelles  Fax +32 27029077
