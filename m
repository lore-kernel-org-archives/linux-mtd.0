Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CANsI-00083K-KT
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2004 03:19:00 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Ben Dooks <ben@fluff.org.uk>
In-Reply-To: <20040922202907.GA25491@home.fluff.org>
References: <I4G9K8$32150B19D33A6F23F04032D520B4890A@libero.it>
	<20040922202907.GA25491@home.fluff.org>
Content-Type: text/plain
Message-Id: <1095923470.2925.57.camel@thomas>
Mime-Version: 1.0
Date: Thu, 23 Sep 2004 09:11:10 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>, gavin@simtec.co.uk
Subject: Re: NAND detect
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-09-22 at 22:29, Ben Dooks wrote:
> I've just had a check through, and it seems the driver was
> written pre the nand hooks for >1 chip per controller, and
> therefore just selects slot 0 (smartmedia card) at start time.
> 
> A quick way to get going would be to change the value passed
> to bast_nand_select_slot() in bast_nand_init() in the driver
> to at least show that a chip can be detected and used. The
> current default in the driver is to select the SmartMedia socket.
> 
> The slots are allocated as 0 for the SmartMedia card slot, and
> 1 through 3 for the chips on the board (U52, U53 and U54)
> 
> Looking through the NAND code, it seems that we may have a
> few problems with implementing >1 chip, which could bite
> in your configuration:
> 
> 1) The driver needs to work out which slots are used and
>    create a linear mapping of chips -> slots.
> 
> 2) The NAND layer itself seems to concatenate the chips
>    together, not export them as seperate devices, which
>    makes supporting removable devices in the card slot
>    and on-board NAND difficult.

You can call nandscan (onboardnand, nrchips) and nandscan(removablenand,
1) and you have two independend mtd devices where the first
(onboardnand) is a concatenation of the available chips.
You can also call nandscan for each chip seperate and you have n
independend devices. They share the hwcontrol function, but the mtd
private structure should tell you which chip you are handling.
For concatenated chips you have to provide the getchip function to
select the appropriate chip.

> I would be interesting in anyone's comments about how difficult
> it would be to have an overall controller activity lock and
> allow a single controller to register more than one NAND chip
> as a seperate device. 

Are you talking about a hardware controller, where several chips are
connected to and which can handle only one chip at a time ?

That's not supported at the moment. It is not hard to make this work. It
needs some additional information about which devices share the
controller and some access management which puts you on the right
waitqueue.

struct nand_hw_controller {
	spinlock_t	lock;
	struct mtd_info	*active;
};

The driver provides the structure for its hardware controller and adds a
pointer to this structure to the nand structure before calling nandscan.
nand_get_chip and nand_release_chip need some tweaks to check the
availablity of such an structure. If active == NULL then the current mtd
device is stored in active and we can grab the chip. Otherwise we add
the current process to the waitqueue of the nand device, which holds the
controller. 

> It would also be nice to have at least some form of hotplug
> mechanism support where a chip can be re-scanned after a
> change in it's detect status.

It should be not too hard to integrate such functionality into the
generic hotplug framework. If the driver is a selfcontained module for
one chip, then it should work right now. If the driver must stay in the
kernel because it controls more than one chip, then interfacing to the
kobject framework should be a valuable solution.

Most stuff must be done in the driver, but we have to figure out if we
need additional functionality for removal in the nand reps. mtd
framework. 

dwmw2 ???


tglx
