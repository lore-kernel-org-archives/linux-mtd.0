Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghIRc-0004OM-5c
 for linux-mtd@lists.infradead.org; Wed, 09 Jan 2019 18:19:13 +0000
Received: by mail-lf1-x141.google.com with SMTP id p6so6387318lfc.1
 for <linux-mtd@lists.infradead.org>; Wed, 09 Jan 2019 10:19:11 -0800 (PST)
MIME-Version: 1.0
References: <20181111075524.13123-1-boris.brezillon@bootlin.com>
 <20181111075524.13123-16-boris.brezillon@bootlin.com>
In-Reply-To: <20181111075524.13123-16-boris.brezillon@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Jan 2019 19:18:58 +0100
Message-ID: <CACRpkdYTXO4AXt79Ny-EsbWvd0kR7=auz_73UF6f+nEXfZ_HmA@mail.gmail.com>
Subject: Re: [PATCH v3 15/22] mtd: rawnand: fsmc: Stop implementing
 ->select_chip()
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, Maxim Levitsky <maximlevitsky@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Han Xu <han.xu@nxp.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 11, 2018 at 8:59 AM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> Now that the CS line to assert is directly passed through the
> nand_operation struct we can replace the fsmc_select_chip()
> implementation by an internal fsmc_ce_ctrl() function which is
> directly called from fsmc_exec_op()
>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

This commit regresses the Nomadik NHK15 in a curious way.
The code seems fine but after a few reads to the chip it crashes
(trace with debug prints enabled):

fsmc-nand 10100000.flash: FSMC device partno 090, manufacturer 80,
revision 00, config 00
Executing operation [2 instructions]:
  ->CMD      [0xff]
  ->WAITRDY  [max 250 ms]
Executing operation [1 instructions]:
  ->CMD      [0x70]
Executing operation [1 instructions]:
  ->DATA_IN  [1 B, force 8-bit]
Executing operation [1 instructions]:
  ->CMD      [0x00]
Executing operation [3 instructions]:
  ->CMD      [0x90]
  ->ADDR     [1 cyc]
  ->DATA_IN  [2 B, force 8-bit]
Executing operation [3 instructions]:
  ->CMD      [0x90]
  ->ADDR     [1 cyc]
  ->DATA_IN  [8 B, force 8-bit]
Executing operation [3 instructions]:
  ->CMD      [0x90]
  ->ADDR     [1 cyc]
  ->DATA_IN  [4 B, force 8-bit]
Executing operation [3 instructions]:
  ->CMD      [0x90]
  ->ADDR     [1 cyc]
  ->DATA_IN  [5 B, force 8-bit]
nand: device found, Manufacturer ID: 0x20, Chip ID: 0xa1
nand: ST Micro NAND 128MiB 1,8V 8-bit
nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
fsmc-nand 10100000.flash: Using 1-bit HW ECC scheme
Scanning device for bad blocks
Executing operation [5 instructions]:
  ->CMD      [0x00]
  ->ADDR     [4 cyc]
  ->CMD      [0x30]
  ->WAITRDY  [max 200000 ms]
Executing operation [1 instructions]:
  ->CMD      [0x70]
Executing operation [1 instructions]:
  ->DATA_IN  [1 B, force 8-bit]
Executing operation [1 instructions]:
  ->CMD      [0x00]
  ->DATA_IN  [64 B]
Unhandled fault: external abort on non-linefetch (0x008) at 0xcc960000
pgd = (ptrval)
[cc960000] *pgd=0b808811, *pte=40000653, *ppte=40000552
Internal error: : 8 [#1] PREEMPT ARM
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 5.0.0-rc1+ #84
Hardware name: Nomadik STn8815
PC is at fsmc_exec_op+0x180/0x284
LR is at fsmc_exec_op+0x144/0x284
pc : [<c0361f18>]    lr : [<c0361edc>]    psr: 20000013
sp : cb82ba88  ip : c092e6f8  fp : c0644078
r10: c0615ae8  r9 : cb9d5020  r8 : 00000000
r7 : cb9d5038  r6 : cb82bac4  r5 : 00000004  r4 : cb82bb20
r3 : cb8807fc  r2 : cb88083c  r1 : cc960000  r0 : 00000013
Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 0005317f  Table: 0b334000  DAC: 00000053
Process swapper (pid: 1, stack limit = 0x(ptrval))
(...)
[<c0361f18>] (fsmc_exec_op) from [<c0355834>]
(nand_lp_exec_read_page_op+0x1cc/0x224)
[<c0355834>] (nand_lp_exec_read_page_op) from [<c0355968>]
(nand_read_page_op+0xdc/0x2f0)
[<c0355968>] (nand_read_page_op) from [<c0355c48>] (nand_read_oob_std+0x1c/0x24)
[<c0355c48>] (nand_read_oob_std) from [<c0359444>] (nand_read_oob+0x504/0x708)
[<c0359444>] (nand_read_oob) from [<c0347548>] (mtd_read_oob+0x54/0xcc)
[<c0347548>] (mtd_read_oob) from [<c035cea8>] (create_bbt+0x120/0x290)
[<c035cea8>] (create_bbt) from [<c035e87c>] (nand_create_bbt+0x4f8/0x69c)
[<c035e87c>] (nand_create_bbt) from [<c035b00c>] (nand_scan_tail+0x9c4/0xb04)
[<c035b00c>] (nand_scan_tail) from [<c035b8ac>] (nand_scan_with_ids+0x760/0xab4)
[<c035b8ac>] (nand_scan_with_ids) from [<c06ca508>]
(fsmc_nand_probe+0x454/0x578)
[<c06ca508>] (fsmc_nand_probe) from [<c03071d8>] (platform_drv_probe+0x48/0x98)
[<c03071d8>] (platform_drv_probe) from [<c0305620>] (really_probe+0x224/0x2d4)
[<c0305620>] (really_probe) from [<c0305830>] (driver_probe_device+0x5c/0x16c)
[<c0305830>] (driver_probe_device) from [<c0305a10>] (__driver_attach+0xd0/0xd4)
[<c0305a10>] (__driver_attach) from [<c0303798>] (bus_for_each_dev+0x70/0xb4)
[<c0303798>] (bus_for_each_dev) from [<c0304a74>] (bus_add_driver+0x170/0x204)
[<c0304a74>] (bus_add_driver) from [<c03063ac>] (driver_register+0x74/0x108)
[<c03063ac>] (driver_register) from [<c0307390>]
(__platform_driver_probe+0x58/0x124)
[<c0307390>] (__platform_driver_probe) from [<c000a604>]
(do_one_initcall+0x48/0x1a0)
[<c000a604>] (do_one_initcall) from [<c06b3dd4>]
(kernel_init_freeable+0x104/0x1c8)
[<c06b3dd4>] (kernel_init_freeable) from [<c04fcd24>] (kernel_init+0x8/0xf4)
[<c04fcd24>] (kernel_init) from [<c00090e0>] (ret_from_fork+0x14/0x34)
(...)
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

After looking at it I realized that if I uncomment this line:

// fsmc_ce_ctrl(host, false);

The driver works fine, so just holding CE enabled all the time makes
everything work.

I suspect it is some kind of timing issue maybe platform- or electronics
dependent where you need to hold CE enabled for a while before
reading pages from the NAND. This would explain why it is not seen
in the platform this was developed on.

I will experiment with some delay valued and try to read some data
sheets but if you already have hints on how to deal with this I'd
like to hear!

Yours,
Linus Walleij
