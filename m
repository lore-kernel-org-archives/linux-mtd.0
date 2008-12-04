Received: from toronto-hs-216-138-233-67.s-ip.magma.ca ([216.138.233.67]
	helo=yow.seanm.ca)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L86JC-0005gf-Jh
	for linux-mtd@lists.infradead.org; Thu, 04 Dec 2008 04:59:26 +0000
Date: Wed, 3 Dec 2008 23:59:25 -0500
From: Sean MacLennan <smaclennan@pikatech.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Partition badness
Message-ID: <20081203235925.3c2442e2@lappy.seanm.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I tried to run 2.6.28-rc7 and got the following for every partition,
both nor and nand, after the first partition:

ffc00000.nor: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
ffc00000.nor: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
RedBoot partition parsing not available
Creating 4 MTD partitions on "ffc00000.nor":
0x00000000-0x00020000 : "splash"
0x00300000-0x00340000 : "fpga"
------------[ cut here ]------------
Badness at c0058928 [verbose debug info unavailable]
NIP: c0058928 LR: c01320c4 CTR: 00000000
REGS: cf821b50 TRAP: 0700   Not tainted  (2.6.28-rc7-pika)
MSR: 00029000 <EE,ME>  CR: 24000042  XER: 2000005f
TASK = cf81f960[1] 'swapper' THREAD: cf820000
GPR00: cf995a00 cf821c00 cf81f960 cf987630 00000000 c02abd18 cf9959ff c02abd18 
GPR08: cf89b664 cf99d4bc 00000d9f 00000001 84000048 00000000 0ffac000 007fff99 
GPR16: 00400450 00800000 007fff00 0ffa93c4 00000000 ffffffff 00000000 00000001 
GPR24: 00000000 c0310000 00000004 00000001 c030ef2c cf987630 cf98fbe0 cf987630 
NIP [c0058928] bdi_register+0x38/0xe4
LR [c01320c4] add_disk+0x104/0x150
Call Trace:
[cf821c00] [c00ba6f0] __sysfs_add_one+0x24/0xc8 (unreliable)
[cf821c90] [c01320c4] add_disk+0x104/0x150
[cf821cc0] [c0185f8c] add_mtd_blktrans_dev+0x180/0x2a8
[cf821ce0] [c0186c18] mtdblock_add_mtd+0x60/0x80
[cf821cf0] [c0185bbc] blktrans_notify_add+0x40/0x80
[cf821d10] [c01825a0] add_mtd_device+0xa0/0x150
[cf821d30] [c0183d4c] add_mtd_partitions+0x4b0/0x648
[cf821d60] [c02edc14] of_flash_probe+0x1c8/0x4e0
[cf821dc0] [c01bd2a0] of_platform_device_probe+0x58/0x80
[cf821de0] [c0162f50] driver_probe_device+0xb8/0x1cc
[cf821e00] [c0163108] __driver_attach+0xa4/0xa8
[cf821e20] [c0161d98] bus_for_each_dev+0x58/0x94
[cf821e50] [c0162b84] driver_attach+0x24/0x34
[cf821e60] [c01627a8] bus_add_driver+0xb0/0x1f0
[cf821e80] [c01635b8] driver_register+0x5c/0x160
[cf821ea0] [c01bd4d4] of_register_driver+0x54/0x70
[cf821eb0] [c02e649c] of_flash_init+0x20/0x30
[cf821ec0] [c0001420] do_one_initcall+0x34/0x198
[cf821fd0] [c02d0824] kernel_init+0x94/0xf8
[cf821ff0] [c000d244] kernel_thread+0x50/0x6c
Instruction dump:
93e1008c 90010094 80030050 7c7f1b78 90c10014 90e10018 30c0ffff 7d660110 
9101001c 91210020 91410024 7ca72b78 <0f0b0000> 2f8b0000 38a00000 7c661b78 

This is on a PIKA warp with a PPC processor. I haven't really digged
into it yet (I was actually looking for a usb problem) but I am hoping
somebody recognizes the problem.

Yes there is a large gap between the "splash" partition and the fpga
partition. The first partition is at the start of flash and the others
at the end.

Cheers,
   Sean
