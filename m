Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B79nr-0002YT-Fn
	for linux-mtd@lists.infradead.org; Sat, 27 Mar 2004 09:08:31 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HV800JTE9E6M4@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Sat, 27 Mar 2004 10:08:31 +0100 (MET)
Date: Sat, 27 Mar 2004 10:05:08 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <406456BC.1020802@cray.com>
To: David Updegraff <dave@cray.com>, llandre <r&d@wawnet.biz>
Message-id: <200403271005.08629.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <6.0.1.1.0.20040326125338.01f8bab8@dns.struinfo.it>
 <406456BC.1020802@cray.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: Large block NANDs - preliminary diff (2)
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 26 March 2004 17:13, David Updegraff wrote:
> llandre.
>
> Thanks for your work and patch.  I may well be deluded, but aside from
> the large-page-inefficiencies vis.a.vis. file system allocations, it
> still seems to me we have some OOB troubles with the existing API.
> Because oob layout is exported, whereas I think oob layout should be
> hidden in the driver.

Never. Hiding stuff is evil. 
The filesystem defines the OOB usage, as it stores filesystem dependend data 
in the OOB area. So the filesystem gives the _generic_ nand driver the 
information where the ECC is located in the OOB area.
JFFS2 and YAFFS have different OOB layouts. SMartMedi FAT has a own OOB layout 
too. Do you want to change all this or allow the usage of only _ONE_ 
filesystem at a time ? I must be possible to have multiple filesystems on one 
chip. We use YAFFS and JFFS2 on some boards. YAFFS for speed sake and JFFS2 
to utilze on the fly data compression.

>  From what I see, there are three reasons for anyone outside the driver
> to know about oob: ecc, badblock and fs-specific data.
>
> For ecc, they only need to set ON or off for the whole chip, for
> badblock its a boolean per page or block.  And FSDATA is some stuff that
>   the filesystem wants to scribble on its own, that the driver does not
> interpret.
> For ecc, there is already an ioctl that can set it generically, if you
> ignore the .eccpos bytes.  And badblock also has a function pointer in
> the driver.

The userspace interface is neccecary if you want to write fs images to the 
chip and utilize the ECC functions, especially if you have hardware ECC.
One other way to use it is for fs development and testing in userspace.

The badblock position must be exported to the fs driver, as it is located in 
the OOB area. 

> What remains is a way for the filesystem drivers to scribble their own
> bytes of data per page or block.  IMHO they should be able to do this
> independently.  Perhaps that the officially PUBLISHED oobsize and
> oob_buf stuff currently in place should infact refer to those regions of
> the oob that are OUTSIDE of the internal-driver-managed oob regions
> dedicated to badblock marking or ecc tracking. The driver always does
> its own ecc calculations anyway: why even let anyone else see that area?

Which area ? The ECC data is inside the OOB. The filesystem defines the OOB 
layout and _MUST_ have access to the OOB area. Hiding things away is not a 
real good idea, as it restricts the utilization of the device. Then we end up 
exporting byte 1,2,6,9,14,15 as all other bytes are used by the nand driver. 
This does not make any sense to me.

The filesystem provides an OOB buffer, which contains the data it wants to be 
stored in the OOB area. The nand driver does the ECC calc and inserts the ECC 
data into the OOB at the appropriate place. If we dont do it transparent then 
we get byte 1,2,6,9,14,15 from the fs and have to build up a buffer for the 
whole OOB stuff to insert ECC and write it to the device. 

If the ECC positions are hardcoded in the nand driver each filesystem layer 
_MUST_ use this layout. Depending on the information stored in the OOB area 
the filesystem _MUST_ have the ability to define the ECC data positions. We 
had hardcoded positions in the first versions of nand.c and we changed it to 
allow different filesystems to use this driver and have their own OOB layot.

I don't see any real good reason to change the current interface. If somebody 
comes up with a more efficient interface which has the same flexibility I'm 
not in the way, but I doubt that there is one.

Don't tell me we should store the fs dependend layout in the nand driver. 
Never. Nand driver controls nand chips and does not deal with fs specific 
crap. 

If you want to provide a new interface then do this considering the semantics, 
that the filesystem handles the OOB contents and the nand driver provides a 
mechanism to access it.

> But yes; I know; references to the oob stuff is sprinkled everywhere, 
> and it'll probably be short-term easier to just add another case:
> here&there.

I dont see a way to use the OOB area for filesystem purposes without knowing 
about it. Thats not a short term approach. It provides the flexibility to 
develop new filesystems without changing the underlying basics.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
