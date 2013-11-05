Received: from mail-db8lp0186.outbound.messaging.microsoft.com
 ([213.199.154.186] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VdWgC-0005Pr-Mg
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2013 02:47:45 +0000
Message-ID: <52785CF5.80809@freescale.com>
Date: Tue, 5 Nov 2013 10:50:29 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: gpmi_nand crashes on mx23
References: <CAOMZO5Bciab5+FoJ1q45+wUt8Kxw=+2na552KwqS9Z7yqbp+UA@mail.gmail.com>
In-Reply-To: <CAOMZO5Bciab5+FoJ1q45+wUt8Kxw=+2na552KwqS9Z7yqbp+UA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B411=E6=9C=8805=E6=97=A5 10:13, Fabio Estevam =E5=86=
=99=E9=81=93:
> Hi Huang,
>
> Running linux-next 20131104 I get the following issue on mx23evk:
>
> [    1.130000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xd7 (Samsu=
ng NAND )
> [    1.140000] NAND device: 4096MiB, MLC, page size: 4096, OOB size: 21=
8
> [    2.140000] gpmi_nand: DMA timeout, last DMA :2
> [    2.140000] Show GPMI registers :
> [    2.140000] offset 0x000 : 0x20930001
> [    2.150000] offset 0x010 : 0x00000000
> [    2.150000] offset 0x020 : 0x00000000
> [    2.150000] offset 0x030 : 0x00000000
> [    2.160000] offset 0x040 : 0x00000000
> [    2.160000] offset 0x050 : 0x00000000
> [    2.170000] offset 0x060 : 0x0004000c
> [    2.170000] offset 0x070 : 0x00010203
> [    2.170000] offset 0x080 : 0x05000000
> [    2.180000] offset 0x090 : 0x09020101
> [    2.180000] offset 0x0a0 : 0x000000ec
> [    2.180000] offset 0x0b0 : 0x80000020
> [    2.190000] offset 0x0c0 : 0x100310b5
> [    2.190000] offset 0x0d0 : 0x03000000
> [    2.200000] Show BCH registers :
> [    2.200000] offset 0x000 : 0x00000000
> [    2.200000] offset 0x010 : 0x00000010
> [    2.210000] offset 0x020 : 0x00000000
> [    2.210000] offset 0x030 : 0x00000000
> [    2.210000] offset 0x040 : 0x00000000
> [    2.220000] offset 0x050 : 0x00000000
> [    2.220000] offset 0x060 : 0x00000000
> [    2.230000] offset 0x070 : 0xe4e4e4e4
> [    2.230000] offset 0x080 : 0x070a8200
> [    2.230000] offset 0x090 : 0x10da8200
> [    2.240000] offset 0x0a0 : 0x070a8200
> [    2.240000] offset 0x0b0 : 0x10da8200
> [    2.240000] offset 0x0c0 : 0x070a8200
> [    2.250000] offset 0x0d0 : 0x10da8200
> [    2.250000] offset 0x0e0 : 0x070a8200
> [    2.260000] offset 0x0f0 : 0x10da8200
> [    2.260000] offset 0x100 : 0x00000000
> [    2.260000] offset 0x110 : 0x00000000
> [    2.270000] offset 0x120 : 0x00000000
> [    2.270000] offset 0x130 : 0x00000000
> [    2.270000] offset 0x140 : 0x00000000
> [    2.280000] offset 0x150 : 0x20484342
> [    2.280000] offset 0x160 : 0x01000000
> [    2.290000] offset 0x170 : 0x00000000
> [    2.290000] BCH Geometry :
> [    2.290000] GF length              : 0
> [    2.300000] ECC Strength           : 0
> [    2.300000] Page Size in Bytes     : 0
> [    2.300000] Metadata Size in Bytes : 0
> [    2.310000] ECC Chunk Size in Bytes: 0
> [    2.310000] ECC Chunk Count        : 0
> [    2.310000] Payload Size in Bytes  : 1024
> [    2.320000] Auxiliary Size in Bytes: 128
> [    2.320000] Auxiliary Status Offset: 0
> [    2.330000] Block Mark Byte Offset : 0
> [    2.330000] Block Mark Bit Offset  : 0
> [    2.330000] gpmi_nand: Chip: 1, Error -110
> [    2.360000] step 1 error
> [    2.360000] gpmi_nand: Chip: 1, Error -1
> [    2.380000] step 1 error
> [    2.380000] step 1 error
> [    2.380000] step 1 error
> [    2.380000] gpmi_nand: Chip: 0, Error -1
> [    2.390000] step 1 error
> [    2.390000] gpmi_nand: Chip: 0, Error -1
> [    2.390000] step 1 error
> [    2.400000] Unable to handle kernel NULL pointer dereference at virt=
ual addr0
> [    2.400000] pgd =3D c0004000
> [    2.410000] [000005d0] *pgd=3D00000000
> [    2.410000] Internal error: Oops: 5 [#1] ARM
> [    2.410000] Modules linked in:
> [    2.410000] CPU: 0 PID: 1 Comm: swapper Not tainted 3.12.0-rc7-next-=
201311042
> [    2.410000] task: c7440000 ti: c743a000 task.ti: c743a000
> [    2.410000] PC is at memcmp+0x10/0x54
> [    2.410000] LR is at gpmi_nand_probe+0x420/0x888
> [    2.410000] pc : [<c0266194>]    lr : [<c0302328>]    psr: 20000013
> [    2.410000] sp : c743be24  ip : c7440000  fp : ffffffff
> [    2.410000] r10: 000005d0  r9 : c03017d4  r8 : 00000000
> [    2.410000] r7 : c757d0b8  r6 : c757d0b8  r5 : c757d320  r4 : c757d0=
10
> [    2.410000] r3 : 000005d0  r2 : 00000004  r1 : c05dc8d8  r0 : 000005=
d0
> [    2.410000] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Seg=
ment kerl
> [    2.410000] Control: 0005317f  Table: 40004000  DAC: 00000017
> [    2.410000] Process swapper (pid: 1, stack limit =3D 0xc743a1c0)
> [    2.410000] Stack: (0xc743be24 to 0xc743c000)
> [    2.410000] be20:          c757d010 c05dc634 c757d010 c06afaf4 00000=
000 c7470
> [    2.410000] be40: 00000001 c06c7c58 00000000 00000000 00000000 c7472=
810 c06c8
> [    2.410000] be60: 00000000 c06c7c58 0000007a c067f118 00000000 c02ca=
a64 c02c0
> [    2.410000] be80: 00000000 c02c9670 c7472810 c06c7c58 c7472844 00000=
000 c7430
> [    2.410000] bea0: 00000000 c06c7c58 c02c978c c02c7e24 c74038a8 c7467=
bd0 c06c0
> [    2.410000] bec0: c06c0e50 c02c8e34 c05dc628 c06c7c58 00000006 c06c7=
c58 0000c
> [    2.410000] bee0: c06dfd00 c02c9e50 00000000 c0694af0 00000006 c0008=
914 c7448
> [    2.410000] bf00: 60000053 c026599c 00000000 00000000 00000000 00000=
000 00000
> [    2.410000] bf20: 00000002 c743a000 c0d4192e c04b13b0 0000007a c0037=
b24 c0636
> [    2.410000] bf40: c0d41936 00000006 60000053 c0694af0 00000006 c068b=
d8c c06d0
> [    2.410000] bf60: 0000007a c068bd98 00000000 c065cac0 00000006 00000=
006 c0655
> [    2.410000] bf80: 00000000 c0467c28 00000000 c0467c28 00000000 00000=
000 00000
> [    2.410000] bfa0: 00000000 c0467c30 00000000 c000eec0 00000000 00000=
000 00000
> [    2.410000] bfc0: 00000000 00000000 00000000 00000000 00000000 00000=
000 00000
> [    2.410000] bfe0: 00000000 00000000 00000000 00000000 00000013 00000=
000 55555
> [    2.410000] [<c0266194>] (memcmp+0x10/0x54) from [<c05dc634>] (__fun=
c__.1539)
> [    2.410000] Code: e3520000 e52d4004 e1a03000 0a00000e (e5d0c000)
> [    2.630000] ---[ end trace 963e72d69291ae47 ]---
> [    2.640000] Kernel panic - not syncing: Attempted to kill init! exit=
code=3D0x0b
>
could you email the uboot for imx23?

I have not touched the imx23 board for a long long time.

thanks
Huang Shijie
