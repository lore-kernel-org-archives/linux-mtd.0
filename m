Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12Vf2v-0002hw-00
	for mtd-list@infradead.org; Thu, 16 Mar 2000 18:30:57 +0000
Received: from proxy.datalux.com ([204.111.16.98] helo=datalux_nt1.datalux_nt1)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12Vf2t-0002ho-00
	for mtd@infradead.org; Thu, 16 Mar 2000 18:30:55 +0000
Message-ID: <38D1281F.63D57D8E@datalux.com>
Date: Thu, 16 Mar 2000 13:29:51 -0500
From: Ralph Stickley <rstickley@datalux.com>
MIME-Version: 1.0
To: "linux-embedded@waste.org" <linux-embedded@waste.org>,
 	mtd-list <mtd@infradead.org>
Subject: CF Works !?
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Ok, 
After a long drawn out battle (mostly documented on these lists :-)
here's what I had to do to make my card boot. I got this working on 
the card I've been using all week - then pulled a fresh card
out of it's package and did the following:

(using PQI compact Flash card - 32MB; PC-Engines IDE-CF adaptor )

1. Set the BIOS to autodetect HDD #1...all others are "uninstalled"
2. run fdisk on /dev/hdb
  - delete any existing partitions (factory partition is DOS FAT16 <32M)
  - using fdisk expert mode, set cylinders to 31 (changed from default
8)
  - set heads to 32 (default was also 8)
  - set sectors to 63 (default was 1014)
  - create a new partition for cylinders 1-31
  - REBOOT!!! critical here ??!! NOT power off ??

3. format /dev/hdb1 as ext2
4. sync/umount  then fsck.ext2 /dev/hdb1 - checks OK
5. mount and copy file system (12M)
6. sync/umount
7. REBOOT - (this seemed like the biggest help)
8. mount / lilo
   - include "linear" flag (thanks for hint on that one :-)
   - give kernel hdd parameters append="hd=31/32/63"
9. sync/reboot/power off
10. REMOVE HDD - set CF adaptor for Master mode, power up and *poof* it
boots!
   
Notes:
The kernel boot "Partition check" still reports [32/32/63] for CHS
Initial access to the device *sometimes* generates "DriveReady
SeekComplete error"
fsck.ext2 doesn't seem to work after all the files are copied

==========

Geeze, what a pain. I fully expect this to NOT work for anybody
else...might
not work for me tomorrow...Your mileage WILL vary!

Anybody know something else to try??

Good luck
Ralph

P.S. FYI (not trying to sell anything here...FYI only)

The adaptor I used (the one that worked) was from PC Engines -
http://www.pcengines.com/

PQI cards can be found at:
http://www.pqiusa.com
(about 30% cheaper than SanSombody...support is a bit tougher...)

*** Linux - All Beta, All the time! ***


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
