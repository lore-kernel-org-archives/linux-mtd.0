Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B6b3Q-0004Aj-W7
	for linux-mtd@lists.infradead.org; Thu, 25 Mar 2004 20:02:17 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HV5005HGEBPKV@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Thu, 25 Mar 2004 21:02:13 +0100 (MET)
Date: Thu, 25 Mar 2004 20:58:55 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <406328A2.3060905@cray.com>
To: David Updegraff <dave@cray.com>, linux-mtd@lists.infradead.org
Message-id: <200403252058.55476.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <406328A2.3060905@cray.com>
Subject: Re: nand oob layout assumptions
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 25 March 2004 19:44, David Updegraff wrote:
> Hi.
>
> So I have a little ducttape-string-and-bailing wire driver here now that
> deals with these newer bigger Samsung K9xxx chips; am hitting snags
> around the declarations of oob areas.
>
> The ecc calcluations within the driver are easy to deal with, straightup
> algorithm of ecc-space-needed = 3 * #-of-256byte chunks in the page.
>
> But how to cope with that exposed oobinfo structure defn. in mtd.h that
> declares the all the universe uses 6 bytes for ecc in oob?

This was valid until now, as we only had 256/512 byte pages and we therefor 
only had 3 or 6 byte ecc. But this is neither a declaration for the universe 
nor for the eternity. What about s/6/24/ ?

> It seems we need the lo-level driver to declare (and allocate?) that
> oobinfo struct, and while we're at breaking everything by doing so, add
> a badblock_pos element to it, since these samsung chips mark badblocks
> not at offset:5 but offset:0 in oob.

Nope, this is done by the filesystem driver, as the filesystem decides how to 
use the oob area. This interface was introduced to make the usage of 
different fs on diffferent partitions possible. The userspace acess is also 
covered by this. There's nothing to change and nothing to break.

The badblockpos is a given value per chip not per parition / filesystem. 5 for 
256/512 byte pages and 0 for the big pages. This must be handled by the nand 
driver itself depending on the chip type and the fs driver must have access 
to this information through the mtd->chip interface. 

> I have no solution dreamed up yet on how to cope with the MEMSETOOBSEL
> ioctl, though.  Do you?

Where's the problem ? 
copy_from_user(&mtd->oobinfo ,(void *)arg, sizeof(struct nand_oobinfo))
I can't see anything to dream of :)

There are more complicated unaddressed issues:

The changes you are doing go for a full page write AFAICS, which will waste a 
lot of space on the device, as we have to flush the writebuffer in jffs2 over 
a timeout to "guarantee" that data is written to flash, or to write a full 
page even for small nodes in YAFFS, which does a page aligned write. 
The "big" devices allow up to 4 consecutive writes to a page, which should be 
made available to the fs driver. This can either mean 4 * 256/512 bytes or a 
4 * random size. The ecc stuff must be made aware of this possibility. The 
256/512byte pagesize types could use this feature too. 

We should check the possibility to use the 16 bit buswith with the same 
driver. The command interface is still 8 bits, only the data interface is 16 
bit. It should be possible to combine those in one go.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
