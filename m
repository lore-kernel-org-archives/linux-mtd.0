Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUnHV-0006KG-7k
	for linux-mtd@lists.infradead.org; Tue, 12 Jan 2010 20:24:05 +0000
Received: by fxm22 with SMTP id 22so27175291fxm.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Jan 2010 12:23:59 -0800 (PST)
MIME-Version: 1.0
Sender: jonringle@gmail.com
In-Reply-To: <1263271808.30988.38.camel@localhost.localdomain>
References: <152584231001111056n2d174f8fmef6641c4fee99781@mail.gmail.com>
	<152584231001111620i6b397f43n49733caa8f92f472@mail.gmail.com>
	<1263271808.30988.38.camel@localhost.localdomain>
Date: Tue, 12 Jan 2010 15:23:56 -0500
Message-ID: <152584231001121223q123b5b2flbdd9fcde370c3105@mail.gmail.com>
Subject: Re: Fail to mount ubifs
From: Jon Ringle <jon@ringle.org>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 11, 2010 at 11:50 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> As this entry suggests:
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport
>
> - validate your flash/driver with the MTD tests - looks like you have a
> problem there.

Trying to run mtd_readtest I get a seg fault:

(initramfs) lsmod
Module                  Size  Used by
(initramfs) modprobe redboot
(initramfs) modprobe ixp4xx
[   37.570000] IXP4XX-Flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
[   37.570000]  Intel/Sharp Extended Query Table at 0x010A
[   37.580000]  Intel/Sharp Extended Query Table at 0x010A
[   37.580000]  Intel/Sharp Extended Query Table at 0x010A
[   37.590000]  Intel/Sharp Extended Query Table at 0x010A
[   37.590000]  Intel/Sharp Extended Query Table at 0x010A
[   37.600000] Using buffer write method
[   37.600000] Using auto-unlock on power-up/resume
[   37.610000] cfi_cmdset_0001: Erase suspend on write enabled
[   37.610000] Searching for RedBoot partition table in IXP4XX-Flash.0
at offset 0x1fc0000
[   37.680000] 4 RedBoot partitions found on MTD device IXP4XX-Flash.0
[   37.690000] Creating 4 MTD partitions on "IXP4XX-Flash.0":
[   37.700000] 0x000000000000-0x000000080000 : "RedBoot"
[   37.700000] 0x000000080000-0x000001fa0000 : "ubi"
[   37.710000] 0x000001fa0000-0x000001fa1000 : "RedBoot config"
[   37.720000] mtd: partition "RedBoot config" doesn't end on an erase
block -- leaving writable anyway
[   37.730000] 0x000001fc0000-0x000001fe0000 : "FIS directory"
(initramfs) cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00080000 00020000 "RedBoot"
mtd1: 01f20000 00020000 "ubi"
mtd2: 00001000 00020000 "RedBoot config"
mtd3: 00020000 00020000 "FIS directory"
(initramfs) lsmod
Module                  Size  Used by
ixp4xx                  3532  0
redboot                 4128  0
(initramfs) modprobe mtd_readtest dev=1
[   67.430000]
[   67.430000] =================================================
[   67.440000] mtd_readtest: MTD device: 1
[   67.440000] mtd_readtest: not NAND flash, assume page size is 512 bytes.
[   67.450000] mtd_readtest: MTD device size 32636928, eraseblock size
131072, page size 512, count of eraseblocks 249, pages per eraseblock
131072, OOB size 0
[   67.470000] mtd_readtest: scanning for bad eraseblocks
[   67.470000] Unable to handle kernel NULL pointer dereference at
virtual address 00000000
[   67.480000] pgd = cf978000
[   67.480000] [00000000] *pgd=0d49e031, *pte=00000000, *ppte=00000000
[   67.490000] Internal error: Oops: 0 [#1] PREEMPT
[   67.490000] Modules linked in: mtd_readtest(+) ixp4xx redboot
[   67.490000] CPU: 0    Not tainted  (2.6.31.11-isc #3)
[   67.490000] PC is at 0x0
[   67.490000] LR is at scan_for_bad_eraseblocks+0x88/0x10c [mtd_readtest]
[   67.490000] pc : [<00000000>]    lr : [<bf00d28c>]    psr: 20000013
[   67.490000] sp : cf951ef0  ip : 00020000  fp : bf00e18c
[   67.490000] r10: 00000000  r9 : bf00e178  r8 : cd4e9e00
[   67.490000] r7 : 01f20000  r6 : bf00e18c  r5 : bf00e184  r4 : 00000000
[   67.490000] r3 : 00000000  r2 : 00000000  r1 : cf97e400  r0 : cf97e400
[   67.490000] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
[   67.490000] Control: 000039ff  Table: 0f978000  DAC: 00000015
[   67.490000] Process modprobe (pid: 706, stack limit = 0xcf950270)
[   67.490000] Stack: (0xcf951ef0 to 0xcf952000)
[   67.490000] 1ee0:                                     00020000
bf00e180 00000000 01f20000
[   67.490000] 1f00: 000000f9 bf00e188 bf00e178 bf011120 00020000
00000200 000000f9 00020000
[   67.490000] 1f20: 00000000 ffffffff 00000000 0001102a 40000180
c059172c 00000000 bf011000
[   67.490000] 1f40: cf950000 00000000 40000160 c01c02bc c0575498
c01f3770 00000000 00000000
[   67.490000] 1f60: 0001102a 0001102a 40000180 bf00e03c 00000000
c01c0b64 cf950000 00000000
[   67.490000] 1f80: 40000160 c0203c80 00001000 00000003 00000000
00000000 00000000 40000180
[   67.490000] 1fa0: 00000080 c01c09e0 00000000 00000000 40010000
0001102a 40000180 00000000
[   67.490000] 1fc0: 00000000 00000000 40000180 00000080 400001a0
400003f0 00000000 40000160
[   67.490000] 1fe0: 00000000 bedd7a60 00010650 00011564 60000010
40010000 7465456e 64007072
[   67.490000] Code: bad PC value.
[   67.640000] ---[ end trace 57fa54383f645c78 ]---
Segment violation
