Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta04.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16liws-0003jB-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2002 04:04:11 +0000
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Thu, 14 Mar 2002 20:15:37 -0800 (PST)
From: Jim Zeus <zeusj@firstlinux.net>
To: "David  Woodhouse" <dwmw2@infradead.org>
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Reply-To: zeusj@firstlinux.net
Message-Id: <20020315041537.2B3613ECC@sitemail.everyone.net>
Subject: (no subject)
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

hello, David, thank you for answer my question before
now I've got other 2 questions

I've defined the CONFIG_MTD_BLOCK by choosing "Caching block device access to MTD device".I divided the flash (16 M)into 3 partitions: bootloader, kernel and jffs. and I have create several device file mtd0-mtd4(with major device number 80) and mtdblock0-mtdblock4(with major device number 31). 
now , the first problem appears
1. if I use "cat /proc/mtd" I just can find only one mtd device which is the first partition.

so I modify the file /drivers/mtd/maps/perseus-flash.c to divide the flash into only one partition : jffs (start: the start of flash size:8M) after the kernel up. I mount the mtdblock0 as jffs onto /jffs with command "mount -t jffs /dev/mtdblock0 /jffs". I didnt erase the flash or copy jffs image to mtd because I think mount can create the filesystem format automatically .
then the second problem appears 
2. after enter command mount , lots of meesage appear in the screen (which really scare me:-).and the kernel......died.

I guess maybe the mtd never up , so I reboot and cp some file to /dev/mtd0 , it said "cant open /dev/mtd0 : No such device",but when I try to cp the same file to /dev/mtdblock0 , the message look like what showed when I mount appears
and here is the message:

# mount /dev/mtdblock0 jffs -t jffs

mtdblock_open

ok

JFFS: Trying to mount device 1f:00.

jffs_build_fs()

jffs_create_control()

jffs_build_begin()

  fmc->flash_size = 8388608 bytes

jffs_scan_flash(): start pos = 0x0, end = 0x800000

check_partly_erased_sector():checking sector which contains offset 0x0 for flipp
ing bits..

flash_safe_read(c001a160, 00000000, c0b15000, 00001000)

Unable to handle kernel NULL pointer dereference at virtual address 00000000

pgd = c0b78000

*pgd = 10b9d001, *pmd = 10b9d001, *pte = 00000000, *ppte = 00000000

Internal error: Oops: 0

CPU: 0

pc : [<00000000>]    lr : [<c00b590c>]    Not tainted

sp : c0b7fc34  ip : fffffffe  fp : c0140528

r10: c001b6dc  r9 : 00000080  r8 : c0b7e000

r7 : c001b6a0  r6 : 00000000  r5 : c0135850  r4 : c0b7fc54

r3 : 00001000  r2 : 00000000  r1 : c0b15000  r0 : c0135850

Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  Segment user

Control: 3177  Table: 10B78000  DAC: 00000015

Process mount (pid: 16, stackpage=c0b7f000)

Stack:
>>....here is many address and value 


Backtrace: frame pointer underflow

Function entered at [<fffffff1>] from [<00000000>]

Backtrace aborted due to bad frame pointer <c0140528>

Code: bad PC value.

Kernel panic: Aiee, killing interrupt handler!

In interrupt handler - not syncing



I am just a poor programmer who want to mount a file system, cant u help me?
your help was and will be appreciated .

Jim Zeus(really confused)



_____________________________________________________________
Want a new web-based email account ? ---> http://www.firstlinux.net

_____________________________________________________________
Run a small business? Then you need professional email like you@yourbiz.com from Everyone.net  http://www.everyone.net?tag
