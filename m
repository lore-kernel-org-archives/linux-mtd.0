Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12VhzJ-000331-00
	for mtd-list@infradead.org; Thu, 16 Mar 2000 21:39:25 +0000
Received: from smtp6.mindspring.com ([207.69.200.110])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12VhzH-00032v-00
	for mtd@infradead.org; Thu, 16 Mar 2000 21:39:23 +0000
Received: from nexus-tech.net (pool-209-138-131-122.atln.grid.net [209.138.131.122])
	by smtp6.mindspring.com (8.9.3/8.8.5) with ESMTP id QAA04884
	for <mtd@infradead.org>; Thu, 16 Mar 2000 16:39:20 -0500 (EST)
Message-ID: <38D1541C.85DB4CEC@nexus-tech.net>
Date: Thu, 16 Mar 2000 16:37:32 -0500
From: Kyle Harris <kharris@nexus-tech.net>
MIME-Version: 1.0
CC: mtd-list <mtd@infradead.org>
Subject: Re: CF Works !?
References: <38D1281F.63D57D8E@datalux.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


Ralph,

Thanks for the update. I'm a little confused (not unusual :). Why is the
IDE-CF adaptor needed? Does the IDE CF not interface directly to a
standard IDE? What is the total cost of your 32MB solution?

Thanks, Kyle.

Ralph Stickley wrote:
> 
> Ok,
> After a long drawn out battle (mostly documented on these lists :-)
> here's what I had to do to make my card boot. I got this working on
> the card I've been using all week - then pulled a fresh card
> out of it's package and did the following:
> 
> (using PQI compact Flash card - 32MB; PC-Engines IDE-CF adaptor )
> 
> 1. Set the BIOS to autodetect HDD #1...all others are "uninstalled"
> 2. run fdisk on /dev/hdb
>   - delete any existing partitions (factory partition is DOS FAT16 <32M)
>   - using fdisk expert mode, set cylinders to 31 (changed from default
> 8)
>   - set heads to 32 (default was also 8)
>   - set sectors to 63 (default was 1014)
>   - create a new partition for cylinders 1-31
>   - REBOOT!!! critical here ??!! NOT power off ??
> 
> 3. format /dev/hdb1 as ext2
> 4. sync/umount  then fsck.ext2 /dev/hdb1 - checks OK
> 5. mount and copy file system (12M)
> 6. sync/umount
> 7. REBOOT - (this seemed like the biggest help)
> 8. mount / lilo
>    - include "linear" flag (thanks for hint on that one :-)
>    - give kernel hdd parameters append="hd=31/32/63"
> 9. sync/reboot/power off
> 10. REMOVE HDD - set CF adaptor for Master mode, power up and *poof* it
> boots!
> 
> Notes:
> The kernel boot "Partition check" still reports [32/32/63] for CHS
> Initial access to the device *sometimes* generates "DriveReady
> SeekComplete error"
> fsck.ext2 doesn't seem to work after all the files are copied
> 
> ==========
> 
> Geeze, what a pain. I fully expect this to NOT work for anybody
> else...might
> not work for me tomorrow...Your mileage WILL vary!
> 
> Anybody know something else to try??
> 
> Good luck
> Ralph
> 
> P.S. FYI (not trying to sell anything here...FYI only)
> 
> The adaptor I used (the one that worked) was from PC Engines -
> http://www.pcengines.com/
> 
> PQI cards can be found at:
> http://www.pqiusa.com
> (about 30% cheaper than SanSombody...support is a bit tougher...)
> 
> *** Linux - All Beta, All the time! ***
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
