Received: from bm-1a.paradise.net.nz ([202.0.58.20]
	helo=linda-1.paradise.net.nz)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CW4fI-0005KS-8P
	for linux-mtd@lists.infradead.org; Sun, 21 Nov 2004 22:14:58 -0500
Received: from smtp-2.paradise.net.nz (smtp-2b.paradise.net.nz [202.0.32.211])
	by linda-1.paradise.net.nz (Paradise.net.nz)
	with ESMTP id <0I7K00A8X90SM1@linda-1.paradise.net.nz> for
	linux-mtd@lists.infradead.org; Mon, 22 Nov 2004 16:14:52 +1300 (NZDT)
Received: from hayes.bluewaternz.com
	(203-96-159-182.paradise.net.nz [203.96.159.182])	by
	smtp-2.paradise.net.nz
	(Postfix) with ESMTP id 23E4F9E42F	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Nov 2004 16:14:52 +1300 (NZDT)
Received: from emma.bluewaternz.com ([192.168.2.44] helo=bluewatersys.com)
	by hayes.bluewaternz.com with esmtp (Exim 3.35 #1 (Debian))
	id 1CW4fD-0004ar-00	for <linux-mtd@lists.infradead.org>; Mon,
	22 Nov 2004 16:14:51 +1300
Date: Mon, 22 Nov 2004 16:17:04 +1300
From: Brad Beveridge <bbeveridge@bluewatersys.com>
In-reply-to: <41A143C4.2090304@bluewatersys.com>
Cc: linux-mtd@lists.infradead.org
Message-id: <41A15A30.4070808@bluewatersys.com>
MIME-version: 1.0
Content-type: text/plain; format=flowed; charset=ISO-8859-1
Content-transfer-encoding: 7bit
References: <41A143C4.2090304@bluewatersys.com>
Subject: Re: BUG at dcache.h:276! Causing oops when I rmmod a nand module
 having mulitple partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As a followup - the oops only occurs when CONFIG_MTD_BLOCK is on, but 
not when it is off.
The oops backtrace is
Backtrace:
[<c0028bac>] (__bug+0x0/0x54) from [<c00a1854>] 
(sysfs_remove_dir+0x2c/0x168)
r4 = C5C59D60
[<c00a1828>] (sysfs_remove_dir+0x0/0x168) from [<c00d8fe4>] 
(kobject_del+0x24/0x34)
r5 = C029AE60  r4 = C5C59D60
[<c00d8fc0>] (kobject_del+0x0/0x34) from [<c00d9008>] 
(kobject_unregister+0x14/0x20)
r4 = C5C59D60
[<c00d8ff4>] (kobject_unregister+0x0/0x20) from [<c011149c>] 
(elv_unregister_queue+0x20/0x30)
r4 = C5C59D10
[<c011147c>] (elv_unregister_queue+0x0/0x30) from [<c011587c>] 
(blk_unregister_queue+0x30/0x48)
r4 = C5C59D10
[<c011584c>] (blk_unregister_queue+0x0/0x48) from [<c0116610>] 
(unlink_gendisk+0x14/0x28)
r5 = C029AE60  r4 = C029AE60
[<c01165fc>] (unlink_gendisk+0x0/0x28) from [<c00a0a20>] 
(del_gendisk+0x6c/0xc4)
r4 = 00000000
[<c00a09b4>] (del_gendisk+0x0/0xc4) from [<c012e164>] 
(del_mtd_blktrans_dev+0xa4/0xc8)
r5 = C01D8990  r4 = C027B320
[<c012e0c0>] (del_mtd_blktrans_dev+0x0/0xc8) from [<c012d7dc>] 
(mtdblock_remove_dev+0x14/0x20)
r4 = C027B320
[<c012d7c8>] (mtdblock_remove_dev+0x0/0x20) from [<c012e1dc>] 
(blktrans_notify_remove+0x54/0x84)
r4 = C01D8998
[<c012e188>] (blktrans_notify_remove+0x0/0x84) from [<c012a300>] 
(del_mtd_device+0xa0/0x100)
r8 = C021889C  r7 = C01D88C4  r6 = C01D88D4  r5 = C034A200
r4 = C01D89D0
[<c012a260>] (del_mtd_device+0x0/0x100) from [<c012b4fc>] 
(del_mtd_partitions+0x58/0x80)
r8 = 00000880  r7 = C5E00C00  r6 = C01D88DC  r5 = C01D88DC
r4 = C034A200
[<c012b4a4>] (del_mtd_partitions+0x0/0x80) from [<c0131f94>] 
(nand_release+0x78/0x94)
r7 = C5E93F48  r6 = C01CD184  r5 = C5E00C00  r4 = C5E00D68
[<c0131f1c>] (nand_release+0x0/0x94) from [<bf0007d4>] 
(scallop_cleanup+0x30/0x58 [scallop])
r5 = BF001540  r4 = 00000000
[<bf0007a4>] (scallop_cleanup+0x0/0x58 [scallop]) from [<c004cf34>] 
(sys_delete_module+0x1c4/0x228)
r5 = 00000000  r4 = BF001440
[<c004cd70>] (sys_delete_module+0x0/0x228) from [<c0023120>] 
(ret_fast_syscall+0x0/0x2c)
r8 = C00232A4  r7 = 00000081  r6 = 000741C8  r5 = 00706F6C
r4 = 6C616373

Cheers
Brad

Brad Beveridge wrote:

> Hi all.  Here is the basic problem, I have a nand module that I want 
> to insmod & rmmod.  It has multiple partitions that look like
> static struct mtd_partition partition_info1[] = {          { name: 
> "part1",                            offset: 
> 0,                                                              size: 
> 4 * 1024 * 1024 },                                            { name: 
> "part2",                               offset: 4 * 1024 * 
> 1024,                                                   size: 4 * 1024 
> * 1024 },                                                 { name: 
> "part3",                                              offset: 8 * 1024 
> * 1024,                                                   size: 
> MTDPART_SIZ_FULL }
> };
>
> I call nand_scan on my device, and then add_mtd_partitions.
> When I rmmod the module I simply call nand_release, because it 
> automatically calls del_mtd_partitions.
>
> However, this causes a BUG in dcache.h:276.
> There is no oops if I only use a single partition.
>
> Any thoughts on what might be going on?
>
> Cheers
> Brad
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>

-- 
Bluewater Systems Ltd - ARM Technology Solution Centre

       Brad Beveridge                           Bluewater Systems Ltd
Phone: +64 3 3779127 (Aus +1 800 148 751)       Level 17, 119 Armagh St
Fax:   +64 3 3779135                            PO Box 13889
Email: bbeveridge@bluewatersys.com              Christchurch
Web:   http://www.bluewatersys.com              New Zealand 
