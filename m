Received: from [65.18.154.155] (helo=skynetaccess.skynetaccess.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AH1Og-0007BJ-4R
	for <linux-mtd@lists.infradead.org>; Tue, 04 Nov 2003 13:39:02 +0000
Received: from earthlink.net (ba.e5bccf.client.atlantech.net
	[207.188.229.186])	(authenticated (0 bits))hA4Db3w26870
	for <linux-mtd@lists.infradead.org>; Tue, 4 Nov 2003 08:37:03 -0500
Sender: train@skynetaccess.skynetaccess.net
Message-ID: <3FA7AB8B.A287F4@earthlink.net>
Date: Tue, 04 Nov 2003 08:37:15 -0500
From: Phil Wilshire <philwil@earthlink.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: Jffs2 write Error
Reply-To: philwil@earthlink.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Guys,

I am seeing a frequent error 

on an ARM7TDMI  system
  uClinux version 2.4.20-uc0 

Processor: Atmel AT91M40xxx revision 0
Architecture: EB01          

physmap flash device: 200000 at 1600000
Found: Atmel AT49BV32XA
number of JEDEC chips: 1

Creating 3 MTD partitions on "Physically mapped flash":
0x00000000-0x00100000 : "part1"
0x00100000-0x00200000 : "part2"
0x00200000-0x00400000 : "rest"


I have added some debugging in write.c
And I get this sort of output
I am copying a large file into the flash system.

ls -l /var/ram/mytest
-rwxr-xr-x  1 0        0          500856  Jan  1 00:00 /var/ram/mtest

cp /var/ram/mytest /var/mtd0/mytest


It all looks to be working just fine...
( PSW is my debug )
PSW Write of 2491 bytes at 0x000ac3b4 attempted. returned 0, retlen 2491
PSW Write of 2514 bytes at 0x000acd70 attempted. returned 0, retlen 2514
PSW Write of 2422 bytes at 0x000ad744 attempted. returned 0, retlen 2422
PSW Write of 2550 bytes at 0x000ae0bc attempted. returned 0, retlen 2550
PSW Write of 2523 bytes at 0x000aeab4 attempted. returned 0, retlen 2523
PSW Write of 2393 bytes at 0x000af490 attempted. returned 0, retlen 2393
PSW Write of 527 bytes at 0x000afdec attempted. returned 0, retlen 527
PSW Write of 2129 bytes at 0x0009000c attempted. returned 0, retlen 2129
 

Then I get this error

Last[3] is 66, datum is 8000066
Write of 49 bytes at 0x00090860 failed. returned -5, retlen 40
jffs2_write_dirent in garbage_collect_dirent failed: -5
Last[3] is 66, datum is 8000066
Write of 49 bytes at 0x00090894 failed. returned -5, retlen 40
jffs2_write_dirent in garbage_collect_dirent failed: -5

  which produces and IOERROR -5 =  -EIO
 

Here is the flash usage..


 /> df
Filesystem           1k-blocks      Used Available Use% Mounted on
rootfs                    1999      1999         0 100% /
/dev/ram0                 1999      1999         0 100% /
/dev/ram1                  115         8       107   7% /var
/dev/mtdblock0            1024       444       580  43% /var/mtd0  

The system was eraseall'd and then mounted before this test.
The first copy of the big file went OK the error was found on the second copy to the same file.

Any clues as to what is happening here ???


regards
  Phil Wilshire
-- 
SDCS -- System Design & Consulting Services LLC, http://www.sysdcs.com
** Embedded Linux Training **  email me for details  
630 Springhouse Sq., Leesburg VA 20175 t: 703 669 9766 f: 703 669 9768
