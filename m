Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12VbSB-0002Hv-00
	for mtd-list@infradead.org; Thu, 16 Mar 2000 14:40:47 +0000
Received: from proxy.datalux.com ([204.111.16.98] helo=datalux_nt1.datalux_nt1)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12VbS9-0002Hp-00
	for mtd@infradead.org; Thu, 16 Mar 2000 14:40:45 +0000
Message-ID: <38D0F229.29DE5664@datalux.com>
Date: Thu, 16 Mar 2000 09:39:37 -0500
From: Ralph Stickley <rstickley@datalux.com>
MIME-Version: 1.0
CC: MTD mailing list <mtd@infradead.org>
Subject: Re: IDE-like SanDisk
References: <001101bf8f24$63dbb140$0500a8c0@cores.ro> <8384.953198169@devel2.axiom.internal>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>



David Woodhouse wrote:
> 
> marius_bogoevici@electronic.cores.ro said:
> > Is there any way to use MTD (maybe just an idea) on an IDE-like
> > SanDisk PC-Card ? Or, at least, the FFS2 ?
> 
> As far as I'm aware, no. CompactFlash presents itself as an IDE drive, 

As an IDE drive, there are some problems here. The cards I've received
are initially formatted in DOS format.  Some have suggested that this 
can be used for storage with no problem, plug and play. Ok, I haven't
tried that..

However, most suggest that formatting the device with ext2 presents
problems.  I've spent a couple of days on this and found several things:

1. The BIOS does not fully recognize the CF 
A CF jumpered as a master device will not lock up the BIOS, the
HDD will boot then proceed to get completely trashed - dueling
masters-ahhhhh!

2. Linux does not recognize the CHS properly
The BIOS (Award, AMI and General Software tested here) has to be 
setup for fdisk to even get close to the correct CHS...(still off
by one cylinder, even after setting up the BIOS).

3. fdisk will render a CF unusable if you select the default CHS
The cylinder count is off by one, I guess formatting the device
with the wrong number of cylinders overwrites the cards internal 
software.

4. Lilo works best using "linear" option.
I have been able to get one to boot...but I think the CF file
system then gets trashed when the booting process writes files 
back to the device - boot once mode ?:)

5. Some CF adaptors don't seem to work
Ok, I've tested with 2 adaptors. One worked....

My next attempt is to 
a) tell the BIOS what the CHS are manually
b) tell fdisk what the CHS are 
c) tell Lilo what the CHS are. 
(I finally got a description from PQI for the CHS...no response
from Sandisk yet)

If this doesn't work, I'm not sure what else to try...

> and
> has its own flash filing system internally (probably FTL). You can't access
> the flash directly.

Although I suspect you can overwrite it by formatting with the wrong
number of Cylinders :-O

Good luck
Ralph


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
