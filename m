From: jgarzik@pobox.com (Jeff Garzik)
Date: Thu, 13 Feb 2003 01:14:37 -0500
Subject: Q: MTD and NIC Roms...
In-Reply-To: <m3znp0zqaw.fsf@lnxi.com>
References: <m3znp0zqaw.fsf@lnxi.com>
Message-ID: <3E4B37CD.8090507@pobox.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Eric W. Biederman wrote:
> Currently I have a patch to eepro100.c that adds an MTD map driver so
> the onboard rom can be written.  Making code like etherboot easier to
> flash etc. 
[...]
> I am currently looking for ideas on ways to cleanly get this code
> into the kernel, and I am looking for ideas.  The map driver is


Well... this functionality has existed for a while, and it doesn't need 
to be in the kernel :)

Donald Becker's diag suite can do flashing. 
ftp://www.scyld.com/pub/diag/  He provides means to program the flash 
from userspace.

And I think that's the best place for it.  We _could_ bloat up the 
kernel code by adding the ability flash -- but how many users is that 
going to serve, that are not already served by existing programs?  So, I 
disagree with getting this stuff into the kernel at all.

	Jeff
