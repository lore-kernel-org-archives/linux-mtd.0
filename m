Received: from bm-1a.paradise.net.nz ([202.0.58.20]
	helo=linda-1.paradise.net.nz)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CUZ7B-0000T0-F5
	for linux-mtd@lists.infradead.org; Wed, 17 Nov 2004 18:21:33 -0500
Received: from smtp-1.paradise.net.nz (smtp-1a.paradise.net.nz [202.0.32.194])
	by linda-1.paradise.net.nz (Paradise.net.nz)
	with ESMTP id <0I7C00AZ7JJOPM@linda-1.paradise.net.nz> for
	linux-mtd@lists.infradead.org; Thu, 18 Nov 2004 12:21:25 +1300 (NZDT)
Received: from hayes.bluewaternz.com
	(203-96-159-182.paradise.net.nz [203.96.159.182])	by
	smtp-1.paradise.net.nz
	(Postfix) with ESMTP id D88B7828BB	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Nov 2004 12:21:23 +1300 (NZDT)
Received: from emma.bluewaternz.com ([192.168.2.44] helo=bluewatersys.com)
	by hayes.bluewaternz.com with esmtp (Exim 3.35 #1 (Debian))
	id 1CUZ75-00033m-00	for <linux-mtd@lists.infradead.org>; Thu,
	18 Nov 2004 12:21:23 +1300
Date: Thu, 18 Nov 2004 12:23:33 +1300
From: Brad Beveridge <bbeveridge@bluewatersys.com>
In-reply-to: <419BCFA2.5090900@bluewatersys.com>
To: linux-mtd@lists.infradead.org
Message-id: <419BDD75.8030209@bluewatersys.com>
MIME-version: 1.0
Content-type: text/plain; format=flowed; charset=ISO-8859-1
Content-transfer-encoding: 7bit
References: <419AC024.1060202@bluewatersys.com>
	<419BCFA2.5090900@bluewatersys.com>
Subject: Re: Removable flash storage
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Looks like I sent a message that didn't hit the list.  It is attached 
below.

More info - having a single partition on my NAND device causes no oops.  
But multiple (3) partitions on the nand device does cause it to break.

 From a quick look in mtdpart.c, it looks like when you add a partition, 
slave->master is always set to master.  Automatically adding/deleting 
mtd devices looks like it is killing me somehow.  Any suggestions on 
what I should do to tell mtd and nand_release that only one device 
should be deleted for all 3 partitions?

Cheers
Brad

Brad Beveridge wrote:

> Hi again.  Further to my previous post, I am finding that when I rmmod 
> my nand module, I get a kernel oops (see below).
> When I insmod my driver, basically I do some setup & call nand_scan, 
> then if that returns OK I call add_mtd_partitions.
> On rmmod, I simply call nand_release, then kfree my mtd_info 
> structure.  I've only started looking into this, but I thought I 
> should post the oops output so wiser heads could take a look.  Ang 
> suggestions on how to start tracking down this particular oops?
>
> Cheers
> Brad
>
>
> Here is the oops output
>
> kernel BUG at include/linux/dcache.h:276!
> Unable to handle kernel NULL pointer dereference at virtual address 
> 00000000
> pgd = c5864000
> [00000000] *pgd=a5cd1011, *pte=00000000, *ppte=00000000
> Internal error: Oops: 807 [#1]
> Modules linked in: scallop
> CPU: 0
> PC is at __bug+0x40/0x54
> LR is at 0x1
> pc : [<c0028bec>]    lr : [<00000001>]    Not tainted
> sp : c5e9ddd8  ip : 60000093  fp : c5e9dde8
> r10: befffe64  r9 : c5e9c000  r8 : c02a1400
> r7 : c01dabc0  r6 : c01dab7c  r5 : c587b948  r4 : 00000000
> r3 : 00000000  r2 : 00000000  r1 : 00001596  r0 : 00000001
> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
> Control: 397F  Table: A5864000  DAC: 00000015
> Process rmmod (pid: 43, stack limit = 0xc5e9c190)
> Stack: (0xc5e9ddd8 to 0xc5e9e000)
> ddc0:                                                       c5c5dd60 
> c5e9de00
> dde0: c5e9ddec c00a1840 c0028bb8 c5c5dd60 c026a380 c5e9de14 c5e9de04 
> c00d9028
> de00: c00a1820 c5c5dd60 c5e9de28 c5e9de18 c00d904c c00d9010 c5c5dd10 
> c5e9de3c
> de20: c5e9de2c c01127fc c00d9044 c5c5dd10 c5e9de54 c5e9de40 c0116bdc 
> c01127e8
> de40: c026a380 c026a380 c5e9de68 c5e9de58 c0117970 c0116bb8 00000000 
> c5e9de80
> de60: c5e9de6c c00a0a0c c0117968 c031b920 c01daba8 c5e9de94 c5e9de84 
> c012f37c
> de80: c00a09ac c031b920 c5e9dea8 c5e9de98 c012e9f4 c012f2e4 c01dabb0 
> c5e9decc
> dea0: c5e9deac c012f3f4 c012e9ec c01dabe8 c02a1400 c01daaec c01daadc 
> c021b468
> dec0: c5e9def0 c5e9ded0 c012b62c c012f3ac c01daaf4 c02a1400 c01daaf4 
> c5880c00
> dee0: 00000880 c5e9df10 c5e9def4 c012c818 c012b5a4 c5880c00 c5880d68 
> c01cf184
> df00: c5e9df48 c5e9df28 c5e9df14 c0132f38 c012c7d8 00000002 bf001580 
> c5e9df40
> df20: c5e9df2c bf0007b8 c0132f2c bf001480 00000000 c5e9dfa4 c5e9df44 
> c004cf20
> df40: bf00077c 00000000 6c616373 00706f6c c0060fb0 c5ee428c c5c60640 
> 60000010
> df60: c5e9c000 4019cbe0 c5ee428c c5e9dfac c5e9df7c c0029e88 c00dab58 
> c5e9dfac
> df80: 00000000 6c616373 00706f6c 000741c8 00000081 c00232a4 00000000 
> c5e9dfa8
> dfa0: c0023120 c004cd68 00706f6c 000741c8 00900081 befffe5c 00000880 
> 00000000
> dfc0: 6c616373 00706f6c 000741c8 00000002 00000880 00000000 befffe64 
> befffe8c
> dfe0: befffe5c befffe50 0002cf10 4019cbf0 60000010 00900081 0000b990 
> 0000b990
> Backtrace:
> [<c0028bac>] (__bug+0x0/0x54) from [<c00a1840>] 
> (sysfs_remove_dir+0x2c/0x168)
> r4 = C5C5DD60
> [<c00a1814>] (sysfs_remove_dir+0x0/0x168) from [<c00d9028>] 
> (kobject_del+0x24/0x34)
> r5 = C026A380  r4 = C5C5DD60
> [<c00d9004>] (kobject_del+0x0/0x34) from [<c00d904c>] 
> (kobject_unregister+0x14/0x20)
> r4 = C5C5DD60
> [<c00d9038>] (kobject_unregister+0x0/0x20) from [<c01127fc>] 
> (elv_unregister_queue+0x20/0x30)
> r4 = C5C5DD10
> [<c01127dc>] (elv_unregister_queue+0x0/0x30) from [<c0116bdc>] 
> (blk_unregister_queue+0x30/0x48)
> r4 = C5C5DD10
> [<c0116bac>] (blk_unregister_queue+0x0/0x48) from [<c0117970>] 
> (unlink_gendisk+0x14/0x28)
> r5 = C026A380  r4 = C026A380
> [<c011795c>] (unlink_gendisk+0x0/0x28) from [<c00a0a0c>] 
> (del_gendisk+0x6c/0xc4)
> r4 = 00000000
> [<c00a09a0>] (del_gendisk+0x0/0xc4) from [<c012f37c>] 
> (del_mtd_blktrans_dev+0xa4/0xc8)
> r5 = C01DABA8  r4 = C031B920
> [<c012f2d8>] (del_mtd_blktrans_dev+0x0/0xc8) from [<c012e9f4>] 
> (mtdblock_remove_dev+0x14/0x20)
> r4 = C031B920
> [<c012e9e0>] (mtdblock_remove_dev+0x0/0x20) from [<c012f3f4>] 
> (blktrans_notify_remove+0x54/0x84)
> r4 = C01DABB0
> [<c012f3a0>] (blktrans_notify_remove+0x0/0x84) from [<c012b62c>] 
> (del_mtd_device+0x94/0xf0)
> r8 = C021B468  r7 = C01DAADC  r6 = C01DAAEC  r5 = C02A1400
> r4 = C01DABE8
> [<c012b598>] (del_mtd_device+0x0/0xf0) from [<c012c818>] 
> (del_mtd_partitions+0x4c/0x70)
> r8 = 00000880  r7 = C5880C00  r6 = C01DAAF4  r5 = C02A1400
> r4 = C01DAAF4
> [<c012c7cc>] (del_mtd_partitions+0x0/0x70) from [<c0132f38>] 
> (nand_release+0x18/0x58)
> r7 = C5E9DF48  r6 = C01CF184  r5 = C5880D68  r4 = C5880C00
> [<c0132f20>] (nand_release+0x0/0x58) from [<bf0007b8>] 
> (scallop_cleanup+0x48/0x94 [scallop])
> r5 = BF001580  r4 = 00000002
> [<bf000770>] (scallop_cleanup+0x0/0x94 [scallop]) from [<c004cf20>] 
> (sys_delete_module+0x1c4/0x228)
> r5 = 00000000  r4 = BF001480
> [<c004cd5c>] (sys_delete_module+0x0/0x228) from [<c0023120>] 
> (ret_fast_syscall+0x0/0x2c)
> r8 = C00232A4  r7 = 00000081  r6 = 000741C8  r5 = 00706F6C
> r4 = 6C616373
> Code: 1b003adb e59f0014 eb003ad9 e3a03000 (e5833000)
> Segmentation fault
>
> <--- end of oops -->
>

-- 
Bluewater Systems Ltd - ARM Technology Solution Centre

       Brad Beveridge                           Bluewater Systems Ltd
Phone: +64 3 3779127 (Aus +1 800 148 751)       Level 17, 119 Armagh St
Fax:   +64 3 3779135                            PO Box 13889
Email: bbeveridge@bluewatersys.com              Christchurch
Web:   http://www.bluewatersys.com              New Zealand 
