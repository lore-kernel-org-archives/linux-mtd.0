Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CADkE-0006dz-18
	for linux-mtd@lists.infradead.org; Wed, 22 Sep 2004 16:29:48 -0400
Date: Wed, 22 Sep 2004 21:29:07 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: "lp4u@inwind.it" <lp4u@inwind.it>
Message-ID: <20040922202907.GA25491@home.fluff.org>
References: <I4G9K8$32150B19D33A6F23F04032D520B4890A@libero.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <I4G9K8$32150B19D33A6F23F04032D520B4890A@libero.it>
Sender: Ben Dooks <ben@fluff.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, gavin@simtec.co.uk
Subject: Re: NAND detect
Reply-To: Ben Dooks <ben@fluff.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 22, 2004 at 05:55:20PM +0200, lp4u@inwind.it wrote:
> Hi,
> 
> I have a s3c2410 board (BAST architecture).
> I have installed on board a kernel2.4.26 patched and with MTD.
> But the board, at boot, don't detect the NAND (I've 3 NANDs on board: 2 samsung & 1 STM).

Does the bootloader list them, newish versions of the bootloader
should probe all available devices and print the ID information
it finds as it goes.

> The MTD detect only NOR Flash.

I've just had a check through, and it seems the driver was
written pre the nand hooks for >1 chip per controller, and
therefore just selects slot 0 (smartmedia card) at start time.

A quick way to get going would be to change the value passed
to bast_nand_select_slot() in bast_nand_init() in the driver
to at least show that a chip can be detected and used. The
current default in the driver is to select the SmartMedia socket.

The slots are allocated as 0 for the SmartMedia card slot, and
1 through 3 for the chips on the board (U52, U53 and U54)

Looking through the NAND code, it seems that we may have a
few problems with implementing >1 chip, which could bite
in your configuration:

1) The driver needs to work out which slots are used and
   create a linear mapping of chips -> slots.

2) The NAND layer itself seems to concatenate the chips
   together, not export them as seperate devices, which
   makes supporting removable devices in the card slot
   and on-board NAND difficult.

I would be interesting in anyone's comments about how difficult
it would be to have an overall controller activity lock and
allow a single controller to register more than one NAND chip
as a seperate device. 

It would also be nice to have at least some form of hotplug
mechanism support where a chip can be re-scanned after a
change in it's detect status.

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
