Received: from mail.meprolight.com ([194.90.149.17] helo=meprolight.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SeOY6-0001XG-CT
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2012 10:42:11 +0000
From: Alex Gershgorin <alexg@meprolight.com>
To: "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>
Date: Tue, 12 Jun 2012 13:35:57 +0300
Subject: mtd mxc_nand: mx35 kernel panic during request to read Device ID
Message-ID: <4875438356E7CA4A8F2145FCD3E61C0B2CD8AD332F@MEP-EXCH.meprolight.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everybody,

In kernel 3.4, I have not encountered this problem

Unhandled fault: imprecise external abort (0x406) at 0x00000000
Internal error: : 406 [#1] ARM
CPU: 0    Not tainted  (3.5.0-rc2+ #2537)
PC is at _memcpy_fromio+0x24/0x38
LR is at send_read_id_v1_v2+0x84/0xd4
pc : [<80011ad4>]    lr : [<801f5704>]    psr: 20000013
sp : 86033d94  ip : 86033da8  fp : 86033da4
r10: ffffffff  r9 : 00000000  r8 : 00000000
r7 : 00000000  r6 : 00000090  r5 : 86128000  r4 : 00000000
r3 : 00000000  r2 : 0000000f  r1 : 8880c000  r0 : 86128448
Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
Control: 00c5387d  Table: 80004008  DAC: 00000017
Process swapper (pid: 1, stack limit =3D 0x86032268)
Backtrace:=20
[<80011ab0>] (_memcpy_fromio+0x0/0x38) from [<801f5704>] (send_read_id_v1_v=
2+0x84/0xd4)
 r4:86128000
[<801f5680>] (send_read_id_v1_v2+0x0/0xd4) from [<801f614c>] (mxc_nand_comm=
and+0x210/0x244)
 r4:86128000 r3:801f5680
[<801f5f3c>] (mxc_nand_command+0x0/0x244) from [<801f128c>] (nand_scan_iden=
t+0x190/0xa44)
[<801f10fc>] (nand_scan_ident+0x0/0xa44) from [<803e02d0>] (mxcnd_probe+0x3=
80/0x4b8)
[<803dff50>] (mxcnd_probe+0x0/0x4b8) from [<801c1d78>] (platform_drv_probe+=
0x1c/0x20)
 r8:00000000 r7:8041a4c0 r6:8041a4c0 r5:86057008 r4:86057008
[<801c1d5c>] (platform_drv_probe+0x0/0x20) from [<801c09a8>] (driver_probe_=
device+0xb0/0x1cc)
[<801c08f8>] (driver_probe_device+0x0/0x1cc) from [<801c0b2c>] (__driver_at=
tach+0x68/0x8c)
 r7:00000000 r6:8041a4c0 r5:8605703c r4:86057008
[<801c0ac4>] (__driver_attach+0x0/0x8c) from [<801bf404>] (bus_for_each_dev=
+0x54/0x84)
 r6:00000000 r5:801c0ac4 r4:8041a4c0 r3:801c0ac4
[<801bf3b0>] (bus_for_each_dev+0x0/0x84) from [<801c07e0>] (driver_attach+0=
x20/0x28)
 r6:804169f0 r5:861107e0 r4:8041a4c0
[<801c07c0>] (driver_attach+0x0/0x28) from [<801bfab0>] (bus_add_driver+0xb=
4/0x220)
[<801bf9fc>] (bus_add_driver+0x0/0x220) from [<801c1170>] (driver_register+=
0xa8/0x134)
[<801c10c8>] (driver_register+0x0/0x134) from [<801c210c>] (platform_driver=
_register+0x4c/0x60)
 r8:00000000 r7:00000000 r6:00000081 r5:803dff2c r4:8041a4ac
r3:00000000
[<801c20c0>] (platform_driver_register+0x0/0x60) from [<803dec68>] (platfor=
m_driver_probe+0x20/0x70)
[<803dec48>] (platform_driver_probe+0x0/0x70) from [<803dff44>] (mxc_nd_ini=
t+0x18/0x24)
 r5:803dff2c r4:00000006
[<803dff2c>] (mxc_nd_init+0x0/0x24) from [<803ca268>] (do_one_initcall+0xa0=
/0x170)
[<803ca1c8>] (do_one_initcall+0x0/0x170) from [<803ca4d8>] (kernel_init+0xe=
4/0x1c0)
 r9:00000000 r8:00000000 r7:803f21e0 r6:00000081 r5:803eb120
r4:00000006
[<803ca3f4>] (kernel_init+0x0/0x1c0) from [<8001ddb8>] (do_exit+0x0/0x698)
 r7:00000013 r6:8001ddb8 r5:803ca3f4 r4:00000000
Code: e7d3c001 e2422001 e3a04000 ee074f9a (e7c0c003)=20
---[ end trace 569b102f52cca9c7 ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x0000000b

Regards,
Alex
