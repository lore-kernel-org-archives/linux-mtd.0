Received: from moutvdom.kundenserver.de ([212.227.126.249]
	helo=moutvdomng.kundenserver.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dd5WO-0005XY-Ex
	for linux-mtd@lists.infradead.org; Tue, 31 May 2005 08:07:03 -0400
Received: from [212.227.126.221] (helo=mrvdomng.kundenserver.de)
	by moutvdomng.kundenserver.de with esmtp (Exim 3.35 #1)
	id 1Dd5WI-0007Nd-00
	for linux-mtd@lists.infradead.org; Tue, 31 May 2005 14:06:54 +0200
Received: from [84.154.87.63] (helo=[192.168.1.10])
	by mrvdomng.kundenserver.de with esmtp (Exim 3.35 #1)
	id 1Dd5WI-0002gu-00
	for linux-mtd@lists.infradead.org; Tue, 31 May 2005 14:06:54 +0200
Message-ID: <429C5347.1080208@anagramm.de>
Date: Tue, 31 May 2005 14:06:31 +0200
From: Clemens Koller <clemens.koller@anagramm.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Oops on rmmod mtdblock module while in dev dir.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, There!

I am new on this list, and new with mtd... so please be patient with me.

Some explanations what I am currently doing:
I'm working on an embedded PowerPC system (Freescale MPC8540 CPU) with
linux-2.6.11.9 (the latest mainstream ones).

I want to use a mtd to map the (IntelStrata) flash of my board at 0xfe000000
and another one to map my fpga at 0xfc000000 for some high speed framegrabber
applications.
So, I compiled several mtd things as modules and started to play
around a little to get an overview and see what happens...

While I was using the mtdblock and mtdchar at the same time along with
the physmap module (to map some 0xfc000000 space).
Reading from the mtd's seems to work fine (tested with cp and dd) and I
get my hardware generating the right chipselects and so on...

Unfortunately, when I try to rmmod mtdblock while I am cd'd into
/dev/mtdblock, I get a little Oops like this:

May 31 13:43:20 ecam kernel: kernel BUG in dget at include/linux/dcache.h:293!
May 31 13:43:20 ecam kernel: Oops: Exception in kernel mode, sig: 5 [#1]
May 31 13:43:20 ecam kernel: NIP: C0090D20 LR: C0101DE8 SP: C12DFD70 REGS: c12dfcc0 TRAP: 0700    Tainted: P
May 31 13:43:20 ecam kernel: MSR: 00029000 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 00
May 31 13:43:20 ecam kernel: TASK = c9ff4a60[3821] 'rmmod' THREAD: c12de000
May 31 13:43:20 ecam kernel: Last syscall: 129
May 31 13:43:20 ecam kernel: GPR00: 00000001 C12DFD70 C9FF4A60 CA084528 C055DB60 00000001 C12DFDA8 C0566380
May 31 13:43:20 ecam kernel: GPR08: C05663A4 00000000 C024EA1C C055DB70 00000000 1001A18C 00000000 00000000
May 31 13:43:20 ecam kernel: GPR16: 10000000 00000000 00000000 00000000 7FFFCF00 10013008 00000001 00000002
May 31 13:43:20 ecam kernel: GPR24: 00000880 7FFFCED0 C025B1A8 D1200354 C07F6800 CA084528 C9D7A90C C07DF044
May 31 13:43:20 ecam kernel: NIP [c0090d20] sysfs_remove_dir+0x28/0x184
May 31 13:43:20 ecam kernel: LR [c0101de8] kobject_del+0x18/0x30
May 31 13:43:20 ecam kernel: Call trace:
May 31 13:43:20 ecam kernel:  [c0101de8] kobject_del+0x18/0x30
May 31 13:43:20 ecam kernel:  [c0101e18] kobject_unregister+0x18/0x30
May 31 13:43:20 ecam kernel:  [c013dc2c] elv_unregister_queue+0x24/0x40
May 31 13:43:20 ecam kernel:  [c01428a4] blk_unregister_queue+0x48/0x6c
May 31 13:43:20 ecam kernel:  [c0143894] unlink_gendisk+0x18/0x40
May 31 13:43:20 ecam kernel:  [c008e9d4] del_gendisk+0x68/0xfc
May 31 13:43:20 ecam kernel:  [c0168094] del_mtd_blktrans_dev+0x90/0xb8
May 31 13:43:20 ecam kernel:  [d11ff91c] mtdblock_remove_dev+0x18/0x34 [mtdblock]
May 31 13:43:20 ecam kernel:  [c0168164] blktrans_notify_remove+0xa8/0xac
May 31 13:43:20 ecam kernel:  [c0165724] del_mtd_device+0xc8/0x14c
May 31 13:43:20 ecam kernel:  [d120401c] cleanup_physmap+0x1c/0x130 [physmap]
May 31 13:43:20 ecam kernel:  [c0036428] sys_delete_module+0x1f4/0x2b8
May 31 13:43:20 ecam kernel:  [c0001ec4] ret_from_syscall+0x0/0x48

So maybe there are some missing error handlers...

As I will work more on the mtd's next time and get more into
all that I can try to find and fix that bug. But that will
take some time.

Best greets,

Clemens Koller
_______________________________
R&D Imaging Devices
Anagramm GmbH
Rupert-Mayer-Str. 45/1
81379 Muenchen
Germany

http://www.anagramm.de
Phone: +49-89-741518-50
Fax: +49-89-741518-19
