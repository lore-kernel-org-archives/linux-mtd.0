Received: from sorrow.cyrius.com ([65.19.161.204])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HD0oL-0007jo-Jy
	for linux-mtd@lists.infradead.org; Fri, 02 Feb 2007 15:58:52 +0000
Date: Fri, 2 Feb 2007 16:56:07 +0100
From: Martin Michlmayr <tbm@cyrius.com>
To: linux-mtd@lists.infradead.org
Subject: Oops parsing empty RedBoot partition with 2.6.20-rc7
Message-ID: <20070202155607.GA31304@deprecation.cyrius.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: dan.j.williams@intel.com, buytenh@wantstofly.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With current git (2.6.20-rc7) I get the following oops when it's
trying to parse the RedBoot partition.  This is on an IOP13xx based
board (Intel iq81340mc).  I guess the problm happens because I don't
have any RedBoot partitions.  Note that 2.6.19 work fine.


RedBoot> fis list
Name              FLASH addr  Mem addr    Length      Entry point
RedBoot>

2.6.20-rc7:

physmap platform flash device: 02000000 at fa000000
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
cmdlinepart partition parsing not available
Searching for RedBoot partition table in physmap-flash.0 at offset 0x1fe0000
Unable to handle kernel paging request at virtual address 50870000
pgd = 40004000
[50870000] *pgd=00609051, *pte=00000000, *ppte=00000000
Internal error: Oops: 27 [#1]
Modules linked in:
CPU: 0
PC is at memcmp+0x18/0x58
LR is at parse_redboot_partitions+0x150/0x640
pc : [<401747b0>]    lr : [<401d9784>]    Not tainted
sp : 40621ddc  ip : 0000000e  fp : 40621de8
r10: 50850000  r9 : 40396a74  r8 : 00ffffff
r7 : 4ffe1ee0  r6 : 00000000  r5 : 00020000  r4 : 50870000
r3 : ffffffff  r2 : 0000000e  r1 : 403687d8  r0 : 50870000
Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
Control: 400397F
Table: 00004018  DAC: 00000035
Process swapper (pid: 1, stack limit = 0x40620250)
Stack: (0x40621ddc to 0x40622000)
1dc0:                                                                40621e48
1de0: 40621dec 401d9784 401747a4 40621e18 50850000 00000001 00000000 4fc79e5c
1e00: 403a9260 50850000 00000000 00000000 40396a74 00000200 00020000 00000000
1e20: 403a901c 403a9264 00000000 4ffe1ee0 00000000 40396a74 4fc79e5c 40621e70
1e40: 40621e4c 401d8dd0 401d9640 403a9250 00000000 4fc79e20 40396a6c 40396ba8
1e60: 40396b18 40621ea0 40621e74 401e2278 401d8d8c 00000000 40396a74 40396a74
1e80: 407f54a0 403a91b8 403c4484 40023344 40396b18 40621eb0 40621ea4 401a98c0
1ea0: 401e209c 40621ed8 40621eb4 401a7c18 401a98ac 403a91b8 40396a74 407f54a0
1ec0: 401a7e74 40023344 40022e58 40621ef4 40621edc 401a7d84 401a7bbc 40396b48
1ee0: 40396a74 403a91b8 40621f0c 40621ef8 401a7f58 401a7cf8 00000000 40621f10
1f00: 40621f38 40621f10 401a707c 401a7e80 403a60b4 403a60b4 40396abc 403a91b8
1f20: 403a91cc 403a5fb4 00000000 40621f48 40621f3c 401a7ac8 401a7034 40621f6c
1f40: 40621f4c 401a7410 401a7ab4 403a91b8 00000000 40620000 00000000 40023344
1f60: 40621f80 40621f70 401a8180 401a73ac 40022ddc 40621f90 40621f84 401a9b68
1f80: 401a812c 40621fa0 40621f94 4001db14 401a9b08 40621ff4 40621fa4 400280a8
1fa0: 4001db0c 40621fb0 40028e04 4003b800 00000000 00000000 4002802c 40041a38
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1fe0: 00000000 00000000 00000000 40621ff8 40041a38 40028038 00000000 00000000
Backtrace:
[<40174798>] (memcmp+0x0/0x58) from [<401d9784>] (parse_redboot_partitions+0x150/0x640)
[<401d9634>] (parse_redboot_partitions+0x0/0x640) from [<401d8dd0>] (parse_mtd_partitions+0x50/0xc8)
[<401d8d80>] (parse_mtd_partitions+0x0/0xc8) from [<401e2278>] (physmap_flash_probe+0x1e8/0x268)
[<401e2090>] (physmap_flash_probe+0x0/0x268) from [<401a98c0>] (platform_drv_probe+0x20/0x24)
[<401a98a0>] (platform_drv_probe+0x0/0x24) from [<401a7c18>] (really_probe+0x68/0x13c)
[<401a7bb0>] (really_probe+0x0/0x13c) from [<401a7d84>] (driver_probe_device+0x98/0xc4)
[<401a7cec>] (driver_probe_device+0x0/0xc4) from [<401a7f58>] (__driver_attach+0xe4/0xe8)
 r6 = 403A91B8  r5 = 40396A74  r4 = 40396B48
[<401a7e74>] (__driver_attach+0x0/0xe8) from [<401a707c>] (bus_for_each_dev+0x54/0x80)
 r5 = 40621F10  r4 = 00000000
[<401a7028>] (bus_for_each_dev+0x0/0x80) from [<401a7ac8>] (driver_attach+0x20/0x28)
 r7 = 00000000  r6 = 403A5FB4  r5 = 403A91CC  r4 = 403A91B8
[<401a7aa8>] (driver_attach+0x0/0x28) from [<401a7410>] (bus_add_driver+0x70/0x194)
[<401a73a0>] (bus_add_driver+0x0/0x194) from [<401a8180>] (driver_register+0x60/0x9c)
 r8 = 40023344  r7 = 00000000  r6 = 40620000  r5 = 00000000
 r4 = 403A91B8
[<401a8120>] (driver_register+0x0/0x9c) from [<401a9b68>] (platform_driver_register+0x6c/0x88)
 r4 = 40022DDC
[<401a9afc>] (platform_driver_register+0x0/0x88) from [<4001db14>] (physmap_init+0x14/0x1c)
[<4001db00>] (physmap_init+0x0/0x1c) from [<400280a8>] (init+0x7c/0x29c)
[<4002802c>] (init+0x0/0x29c) from [<40041a38>] (do_exit+0x0/0x888)
Code: e24cb004 e252c000 01a0e00c 0a00000a (e5d02000)
 <0>Kernel panic - not syncing: Attempted to kill init!


2.6.19:

physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
cmdlinepart partition parsing not available
Searching for RedBoot partition table in physmap-flash.0 at offset 0x1fe0000
No RedBoot partition table detected in physmap-flash.0

-- 
Martin Michlmayr
http://www.cyrius.com/
