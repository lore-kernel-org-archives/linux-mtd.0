Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aw5yM-0001gJ-Cz
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2004 20:49:38 +0000
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HTN00KH4R64MN@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Wed, 25 Feb 2004 21:49:17 +0100 (MET)
Date: Wed, 25 Feb 2004 21:46:53 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <a06002005bc62a78212ec@[130.161.115.44]>
To: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>, jasmine@linuxgrrls.org
Message-id: <200402252146.53616.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <a06002001bc6281361918@[130.161.115.44]>
 <Pine.LNX.4.58.0402251827300.29757@hex>
 <a06002005bc62a78212ec@[130.161.115.44]>
cc: linux-mtd@lists.infradead.org
Subject: Re: Handling multiple NAND chips -- take 2
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 25 February 2004 20:35, J.D. Bakker wrote:
> At 6:29 PM +0000 25/2/04, jasmine@linuxgrrls.org wrote:
> >  > I think that's acceptable. It's _definitely_ OK on NOR. On NAND we may
> >>
> >>  be sharing some control lines between different chips, but I still
> >> think it's OK and we can deal with that in the board-level driver.
> >
> >What if you have a board with an onboard NAND (for the OS) and a
> >SmartMedia slot?  That's surprisingly common.  It's very difficult to buy
> >consistent Smartmedia cards, too-  they often have different parts in
> >them during a run.
>
> That's true, but would you want the SmartMedia card to be part of the
> linear array ? What I'm doing here is to do for NAND devices what the
> linear (or possibly RAID0) driver does for disks. In both cases is
> the array size/configuration fixed on creation, in neither case will
> you have anything useful/usable when one of the components goes away.

The mtdconcat layer provides this RAID0 function already, but it does not work 
with shared control lines. If you have seperate control lines you can use the 
code as is.

> It could well make sense to treat the (hot-plugged) SM card as a
> separate entity, with its own partitions and all. This, however, is
> not what I'm trying to achieve. What I want is the reverse, deal with
> multiple NAND chips as if they were one, larger, NAND device. I can't
> see how hot-plugging et al would be useful in such a scenario (but
> I'm open to any and all demonstrations of the narrow-mindedness of
> such an approach).

The point is that you can have some soldered chips and a SM card sharing the 
same control lines. The soldered chips could form a large parition mtd0 and 
the SM card would be mtd1. 

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
