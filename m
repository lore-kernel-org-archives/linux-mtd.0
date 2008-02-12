Received: from carallon.force9.co.uk ([80.229.37.120] helo=carallon.f9.co.uk)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JOtUE-0000H9-B2
	for linux-mtd@lists.infradead.org; Tue, 12 Feb 2008 11:39:49 +0000
Received: from [127.0.0.1] by carallon.f9.co.uk (MDaemon PRO v9.6.0)
	with ESMTP id md50000196491.msg
	for <linux-mtd@lists.infradead.org>; Tue, 12 Feb 2008 11:33:21 +0000
Message-ID: <47B1840D.1010702@carallon.com>
Date: Tue, 12 Feb 2008 11:33:33 +0000
From: Will Wagner <will_wagner@carallon.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: First access to mounted jffs2 partition is slow
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have an ARM11 system with a JFFS2 partition in NAND flash. It works 
but the first time it is accessed after mounting it can be very slow.

These are the steps I am performing:

# flash_eraseall /dev/mtd4
Erasing 128 Kibyte @ 5fe0000 -- 99 % complete.
# time mount /dev/mtdblock4 /flash -t jffs2
real    0m 1.25s
user    0m 0.01s
sys     0m 0.13s
# time ls flash		- with an empty filsystem, this takes no time
real    0m 0.00s
user    0m 0.01s
sys     0m 0.00s
# cp /sdcard/bigfile flash/	- bigfile is ~8MB
# umount /flash
# time mount /dev/mtdblock4 /flash -t jffs2
real    0m 2.63s
user    0m 0.01s
sys     0m 0.50s
# time ls flash		- first time we do this it takes a long time
bigfile
real    0m 11.79s
user    0m 0.00s
sys     0m 0.18s
# time ls flash		- subsequent reads are fast
bigfile
real    0m 0.00s
user    0m 0.01s
sys     0m 0.00s


It was my understanding that the only slow step should be mounting the 
partition when it checks the entire filesystem. Is that correct? Is it 
normal that the first file operation on the partition is slow and then 
all others are fast? That the mount is slow is not a problem but would 
be good if we could make the first access faster even if it means the 
mount must get slower.

This is using Linux 2.6.19.2 with uClibc 0.9.29, busybox 1.9.0 and 
mtd-utils 1.1.0

Thanks,

Will.

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner@carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
