From: jerj@coplanar.net (Jeremy Jackson)
Date: 13 Feb 2003 13:34:35 -0500
Subject: Q: MTD and NIC Roms...
In-Reply-To: <3E4B37CD.8090507@pobox.com>
References: <m3znp0zqaw.fsf@lnxi.com>  <3E4B37CD.8090507@pobox.com>
Message-ID: <1045161274.1295.103.camel@contact.skynet.coplanar.net>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Thu, 2003-02-13 at 01:14, Jeff Garzik wrote:
> Eric W. Biederman wrote:
> > Currently I have a patch to eepro100.c that adds an MTD map driver so
> > the onboard rom can be written.  Making code like etherboot easier to
> > flash etc. 
> [...]
> > I am currently looking for ideas on ways to cleanly get this code
> > into the kernel, and I am looking for ideas.  The map driver is
> 
> 
> Well... this functionality has existed for a while, and it doesn't need 
> to be in the kernel :)
> 
> Donald Becker's diag suite can do flashing. 
> ftp://www.scyld.com/pub/diag/  He provides means to program the flash 
> from userspace.

I tried it on a tulip, and it caused a hard reset. PCI bus issues? 

Also, by making it a map driver, I can flash LinuxBIOS into EEPROM,
disable write access to the EEPROM, and put the *DoC* in the NIC
socket.  Putting a public key in the EEPROM and making it RO makes the
whole system secure.  Or I could port DoC and jffs driver to
userspace...

Porting devbios to MTD will then give a large library of NOR flash,
including quirks (like ATMEL has different versions, and none work if
you just use the datasheet), and allow them to be used in arbitrary
sockets.

Also, say bye bye to the "pull out the eeprom and put in DoC quick so
the electrons don't notice" trick.  Just put the DoC into the NIC, boot
up, flash, power down, swap to BIOS socket.  Sorry LinuxBIOS guys, I
guess you'll have to switch back to drinking coffee.

> 
> And I think that's the best place for it.  We _could_ bloat up the 
> kernel code by adding the ability flash -- but how many users is that 
> going to serve, that are not already served by existing programs?  So, I 
> disagree with getting this stuff into the kernel at all.
> 
> 	Jeff
> 
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
-- 
Jeremy Jackson <jerj@coplanar.net>
