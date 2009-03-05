Received: from yw-out-1718.google.com ([74.125.46.153])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LfGL2-00038p-Uo
	for linux-mtd@lists.infradead.org; Thu, 05 Mar 2009 16:22:27 +0000
Received: by yw-out-1718.google.com with SMTP id 4so2117713ywq.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Mar 2009 08:22:23 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 5 Mar 2009 17:22:23 +0100
Message-ID: <74d0deb30903050822g45fbf6f8vd9c3d54a0ddb9e59@mail.gmail.com>
Subject: physmap Oops if map_probe failed
From: pHilipp Zabel <philipp.zabel@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
	Matthias Kaehlcke <matthias@kaehlcke.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

commit e480814f138cd5d78a8efe397756ba6b6518fdb6 ("[MTD] [MAPS]
physmap: fix wrong free and del_mtd_{partition,device}") introduces a
NULL pointer dereference in physmap_flash_remove when called from the
error path in physmap_flash_probe (if map_probe failed).
The kernel was compiled with CONFIG_MTD_PARTITIONS=y

I don't know yet why the map_probe failed, but this is another problem.

regards
Philipp

[  245.633676] physmap platform flash device: 04000000 at 00000000
[  245.697096] physmap-flash physmap-flash: map_probe failed
[  245.702184] Unable to handle kernel NULL pointer dereference at
virtual address 00000034
[  245.713369] pgd = c3bd0000
[  245.719681] [00000034] *pgd=a3aff031, *pte=00000000, *ppte=00000000
[  245.730829] Internal error: Oops: 17 [#2] PREEMPT
[  245.735492] Modules linked in: physmap(+) snd_soc_magician
snd_soc_pxa_ssp snd_soc_pxa2xx_i2s snd_soc_pxa2xx snd_pxa2xx_lib
snd_soc_uda1380 snd_soc_core snd_pcm snd_timer snd_page_alloc snd
[  245.754160] CPU: 0    Tainted: G      D
(2.6.29-rc7-00177-g62cd24e-dirty #579)
[  245.763387] PC is at del_mtd_device+0x1c/0xc8
[  245.767975] LR is at del_mtd_device+0x1c/0xc8
[  245.772493] pc : [<c0180aac>]    lr : [<c0180aac>]    psr: 60000013
[  245.772511] sp : c3b5bd88  ip : c3b5bd88  fp : c3b5bda4
[  245.785894] r10: c0306768  r9 : 00000000  r8 : c0306280
[  245.790373] r7 : c392f070  r6 : c392f070  r5 : c392f084  r4 : 00000000
[  245.799184] r3 : 00000000  r2 : 00000001  r1 : 0000344a  r0 : c0314314
[  245.808011] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
[  245.816859] Control: 0000397f  Table: a3bd0000  DAC: 00000015
[  245.825667] Process insmod (pid: 959, stack limit = 0xc3b5a270)
[  245.834480] Stack: (0xc3b5bd88 to 0xc3b5c000)
[  245.838908] bd80:                   c3b5bdac c392f070 c392f084
c392f070 c3b5bdbc c3b5bda8
[  245.847840] bda0: bf0720cc c0180a9c fffffffa c392f084 c3b5be04
c3b5bdc0 bf0723ac bf072074
[  245.856772] bdc0: c03062f0 00000000 c03062f0 c0306288 00000000
00000000 c3b5bdf4 c0306288
[  245.865695] bde0: c0306310 bf072d40 bf072d40 c0313f58 c3b5a000
00000000 c3b5be14 c3b5be08
[  245.874610] be00: c017affc bf072100 c3b5be34 c3b5be18 c017a120
c017afe8 c0306288 c0306310
[  245.883518] be20: bf072d40 bf072d40 c3b5be54 c3b5be38 c017a240
c017a050 c3b5be54 00000000
[  245.892418] be40: c3b5be58 c017a1d4 c3b5be7c c3b5be58 c01795c8
c017a1e0 c38034d8 c03062b8
[  245.901312] be60: 00000000 bf072d40 00012018 c3b75780 c3b5be8c
c3b5be80 c0179f58 c0179580
[  245.910209] be80: c3b5bebc c3b5be90 c0179b78 c0179f44 bf072680
0000159b bf072d40 0000159b
[  245.919160] bea0: bf072d40 00012018 bf075000 c031c0ec c3b5bee4
c3b5bec0 c017a560 c0179adc
[  245.928130] bec0: 0000159b bf072d90 00012018 bf075000 c031c0ec
00000000 c3b5bef4 c3b5bee8
[  245.937129] bee0: c017b420 c017a4d4 c3b5bf04 c3b5bef8 bf075014
c017b3c0 c3b5bf7c c3b5bf08
[  245.946140] bf00: c002632c bf07500c bf0726e0 bf072aa0 c0306ca4
00000014 c4942da0 c4942da0
[  245.955203] bf20: c4942d78 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[  245.964336] bf40: 00000000 0000159b bf072d90 00012018 00000000
c00270a8 0000159b bf072d90
[  245.973502] bf60: 00012018 00000000 c00270a8 00000000 c3b5bfa4
c3b5bf80 c00681f4 c00262e4
[  245.982707] bf80: c00984f4 c0097144 00000000 00012008 00004000
00000080 00000000 c3b5bfa8
[  245.991931] bfa0: c0026f00 c0068168 00000000 00012008 00012018
0000159b 00012008 0000002d
[  246.001217] bfc0: 00000000 00012008 00004000 00000080 beb92f07
beb92f00 00012018 00012008
[  246.010667] bfe0: 00000003 beb92ca4 00008d77 400dce94 60000010
00012018 00000000 00000000
[  246.020131] Backtrace:
[  246.024769] [<c0180a90>] (del_mtd_device+0x0/0xc8) from
[<bf0720cc>] (physmap_flash_remove+0x64/0x8c [physmap])
[  246.034225]  r6:c392f070 r5:c392f084 r4:c392f070
[  246.038930] [<bf072068>] (physmap_flash_remove+0x0/0x8c [physmap])
from [<bf0723ac>] (physmap_flash_probe+0x2b8/0x300 [physmap])
[  246.052784]  r5:c392f084 r4:fffffffa
[  246.057364] [<bf0720f4>] (physmap_flash_probe+0x0/0x300 [physmap])
from [<c017affc>] (platform_drv_probe+0x20/0x24)
[  246.066577] [<c017afdc>] (platform_drv_probe+0x0/0x24) from
[<c017a120>] (driver_probe_device+0xdc/0x190)
[  246.075666] [<c017a044>] (driver_probe_device+0x0/0x190) from
[<c017a240>] (__driver_attach+0x6c/0x90)
[  246.084761]  r7:bf072d40 r6:bf072d40 r5:c0306310 r4:c0306288
[  246.093764] [<c017a1d4>] (__driver_attach+0x0/0x90) from
[<c01795c8>] (bus_for_each_dev+0x54/0x88)
[  246.102828]  r6:c017a1d4 r5:c3b5be58 r4:00000000
[  246.107367] [<c0179574>] (bus_for_each_dev+0x0/0x88) from
[<c0179f58>] (driver_attach+0x20/0x28)
[  246.116362]  r7:c3b75780 r6:00012018 r5:bf072d40 r4:00000000
[  246.125278] [<c0179f38>] (driver_attach+0x0/0x28) from [<c0179b78>]
(bus_add_driver+0xa8/0x218)
[  246.134243] [<c0179ad0>] (bus_add_driver+0x0/0x218) from
[<c017a560>] (driver_register+0x98/0x120)
[  246.143189]  r8:c031c0ec r7:bf075000 r6:00012018 r5:bf072d40 r4:0000159b
[  246.152084] [<c017a4c8>] (driver_register+0x0/0x120) from
[<c017b420>] (platform_driver_register+0x6c/0x88)
[  246.161016] [<c017b3b4>] (platform_driver_register+0x0/0x88) from
[<bf075014>] (physmap_init+0x14/0x1c [physmap])
[  246.169952] [<bf075000>] (physmap_init+0x0/0x1c [physmap]) from
[<c002632c>] (do_one_initcall+0x54/0x184)
[  246.178884] [<c00262d8>] (do_one_initcall+0x0/0x184) from
[<c00681f4>] (sys_init_module+0x98/0x198)
[  246.187840] [<c006815c>] (sys_init_module+0x0/0x198) from
[<c0026f00>] (ret_fast_syscall+0x0/0x2c)
[  246.196721]  r7:00000080 r6:00004000 r5:00012008 r4:00000000
[  246.205478] Code: e24dd004 e1a04000 e59f009c eb038eee (e5941034)
[  246.250089] ---[ end trace 40c1f9c939d60116 ]---
