Received: from smtp-out114.alice.it ([85.37.17.114])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LXeUE-000585-5N
	for linux-mtd@lists.infradead.org; Thu, 12 Feb 2009 16:32:28 +0000
Date: Thu, 12 Feb 2009 17:32:17 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: linux-mtd@lists.infradead.org
Subject: pxa2xx-flash: segfault on rmmod.
Message-Id: <20090212173217.33ad118c.ospite@studenti.unina.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-arm-kernel@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

this can be easily reproduced setting CONFIG_MTD_PXA2XX=m

pxa2xx_flash_remove() tries to free info-> parts and fails with this info:

Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c0a84000
[00000000] *pgd=ac956031, *pte=00000000, *ppte=00000000
Internal error: Oops: 817 [#1] PREEMPT
Modules linked in: cfi_cmdset_0001 cfi_probe gen_probe cfi_util
  pxa2xx_flash(-) mtd chipreg rfcomm ipv6 bridge stp llc bnep l2cap bluetooth
  rtc_sa1100 nls_iso8859_1 nls_cp437 vfat mt9m111 soc_camera fat videobuf_core
  videodev v4l1_compat
CPU: 0    Not tainted  (2.6.29-rc3-ezxdev #11)
PC is at kfree+0x80/0xdc
LR is at pxa2xx_flash_remove+0x64/0x74 [pxa2xx_flash]
pc : [<c0093c2c>]    lr : [<bf105160>]    psr: 40000093
sp : c1b2de78  ip : c1b2de98  fp : c1b2de94
r10: 00000000  r9 : c1b2c000  r8 : c0024048
r7 : bf1058f4  r6 : c0311e98  r5 : a0000013  r4 : ccbba260
r3 : 00000000  r2 : 01406220  r1 : a0000400  r0 : c034a220
Flags: nZcv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 0000397f  Table: a0a84000  DAC: 00000015
Process rmmod (pid: 1228, stack limit = 0xc1b2c270)
Stack: (0xc1b2de78 to 0xc1b2e000)
de60:                                                       c002b8f4 ccbba260
de80: bf1058f4 c0311120 c1b2deac c1b2de98 bf105160 c0093bb8 00000000 c0311120
dea0: c1b2dec4 c1b2deb0 c0168a58 bf105108 c03111a8 c1b2c000 c1b2dee4 c1b2dec8
dec0: c0168f60 c01689f4 bf1058f4 bf105930 c031e4e8 00000880 c1b2df04 c1b2dee8
dee0: c0167c10 c0168eac c0083acc bf1058f4 bf105930 00000000 c1b2df24 c1b2df08
df00: c0169004 c0167b8c c1b2df34 00000000 bf105930 c1b2df3c c1b2df34 c1b2df28
df20: bf1050f4 c0168fc8 c1b2dfa4 c1b2df38 c0065954 bf1050ec c1b2df84 32617870
df40: 665f7878 6873616c 4001f000 c1b2df58 c00990bc 00000000 cc887394 ffffffff
df60: 00001000 00021000 4013c034 00000880 00000000 0013b000 bf105930 00000880
df80: c1b2df84 00000000 becbb990 becb9170 becb9190 00000081 00000000 c1b2dfa8
dfa0: c0023ea0 c0065788 becbb990 becb9170 becb9170 00000880 00000000 00000001
dfc0: becbb990 becb9170 becb9190 00000081 00000880 00000000 00000000 becbba04
dfe0: 00000003 becb9168 00009068 400ded1c 60000010 becb9170 00000000 00000019
Backtrace:
[<c0093bac>] (kfree+0x0/0xdc) from [<bf105160>] (pxa2xx_flash_remove+0x64/0x74 [pxa2xx_flash])
 r6:c0311120 r5:bf1058f4 r4:ccbba260
[<bf1050fc>] (pxa2xx_flash_remove+0x0/0x74 [pxa2xx_flash]) from [<c0168a58>] (__device_release_driver+0x70/0x8c)
 r4:c0311120
[<c01689e8>] (__device_release_driver+0x0/0x8c) from [<c0168f60>] (driver_detach+0xc0/0xec)
 r5:c1b2c000 r4:c03111a8
[<c0168ea0>] (driver_detach+0x0/0xec) from [<c0167c10>] (bus_remove_driver+0x90/0xb8)
 r7:00000880 r6:c031e4e8 r5:bf105930 r4:bf1058f4
[<c0167b80>] (bus_remove_driver+0x0/0xb8) from [<c0169004>] (driver_unregister+0x48/0x4c)
 r6:00000000 r5:bf105930 r4:bf1058f4
[<c0168fbc>] (driver_unregister+0x0/0x4c) from [<bf1050f4>] (cleanup_pxa2xx_flash+0x14/0x1c [pxa2xx_flash])
 r6:c1b2df3c r5:bf105930 r4:00000000
[<bf1050e0>] (cleanup_pxa2xx_flash+0x0/0x1c [pxa2xx_flash]) from [<c0065954>] (sys_delete_module+0x1d8/0x238)
[<c006577c>] (sys_delete_module+0x0/0x238) from [<c0023ea0>] (ret_fast_syscall+0x0/0x2c)
 r7:00000081 r6:becb9190 r5:becb9170 r4:becbb990
Code: e5903000 e3130080 1a000002 e3a03000 (e5833000)
---[ end trace 10cb092cde06a174 ]---

The following change avoids the segfault but I don't know if it is a proper
fix, I don't know very well all the steps involved in pxa2xx_flash_probe().

Can you please take a look?

--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -135,7 +135,6 @@ static int __exit pxa2xx_flash_remove(struct device *dev)
 	iounmap(info->map.virt);
 	if (info->map.cached)
 		iounmap(info->map.cached);
-	kfree(info->parts);
 	kfree(info);
 	return 0;
 }

Thanks,
   Antonio Ospite
