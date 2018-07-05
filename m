Received: from mail.bugwerft.de ([2a03:6000:1011::59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fazXM-0006JJ-1X
 for linux-mtd@lists.infradead.org; Thu, 05 Jul 2018 08:22:50 +0000
Subject: Re: marvell_nand driver fails to suspend
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <68ab4512-58f2-1ade-6754-616de8d8c8d5@zonque.org>
 <9de339a6-01f9-d3a9-0271-f33933ede35b@zonque.org>
 <20180702092014.0006fee0@xps13>
 <01ca9c4b-dc20-47fa-ae3c-983b3f47b28d@zonque.org>
 <20180703090557.0ec5cd20@xps13>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <98a6c329-d0a4-72c7-bb06-34b80738c475@zonque.org>
Date: Thu, 5 Jul 2018 10:22:29 +0200
MIME-Version: 1.0
In-Reply-To: <20180703090557.0ec5cd20@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel,

On Tuesday, July 03, 2018 09:05 AM, Miquel Raynal wrote:
> Daniel Mack <daniel@zonque.org> wrote on Mon, 2 Jul 2018 09:48:01 +0200:

>> I'll give it a spin in a couple of days again, but if anything comes to your mind, please let me know.
>>
>> And FTR, the device node has keep-config set for this board.
> 
> Can you try without? It should work anyway, but it would allow us to
> see if it's a timing issue.

I can't easily, because I don't have the individual timing parameters at 
hand. I could of course re-engineer them from the NDTR0/NDTR1 values the 
bootloader sets, but that would only lead to these registers being 
restored to the same value as they currently have. And as they're read 
during probe() anyway and re-used in marvell_nfc_select_chip(), I don't 
think that's the problem.

Btw - the comment in that function doesn't quite make sense; the 
registers are written unconditionally and regardless of keep-config:

	/*
	 * Do not change the timing registers when using the DT property
	 * marvell,nand-keep-config; in that case ->ndtr0 and ->ndtr1 from the
	 * marvell_nand structure are supposedly empty.
	 */
	writel_relaxed(marvell_nand->ndtr0, nfc->regs + NDTR0);
	writel_relaxed(marvell_nand->ndtr1, nfc->regs + NDTR1);

I have a patch to fix that.

> Also, can you try with the mtd-utils directly (without UBI/UBIFS) with
> nanddump flash_erase and nandwrite to see what are the errors raised by
> the controller driver.

The effect is that the controller does not get any interrupts anymore 
after the resume. My test setup now executes the following command sequence:

   # nandtest /dev/mtd2
   # echo mem >/sys/power/state
   [make the hardware resume]
   # echo "RESUMED!"
   # nandtest /dev/mtd2

The first nandtest works, the second fails. I've added some printks in 
select_chip() and a WARN_ON(!ret) in marvell_nfc_wait_op() to get a 
stack trace, and this is the output after resume:

> [   43.358823] marvell_nfc_select_chip(): 0016271c 0f3d00f2
> [   44.417980] ------------[ cut here ]------------
> [   44.422678] WARNING: CPU: 0 PID: 1297 at drivers/mtd/nand/raw/marvell_nand.c:629 marvell_nfc_wait_op+0x88/0xb8 [marvell_nand]
> [   44.433994] Modules linked in: marvell_nand pxamci
> [   44.438853] CPU: 0 PID: 1297 Comm: nandtest Not tainted 4.18.0-rc3+ #392
> [   44.445510] Hardware name: Marvell PXA3xx (Device Tree Support)
> [   44.451450] Backtrace: 
> [   44.453938] [<c0106458>] (dump_backtrace) from [<c0106718>] (show_stack+0x18/0x1c)
> [   44.461533]  r7:00000009 r6:00000000 r5:bf008e87 r4:00000000
> [   44.467185] [<c0106700>] (show_stack) from [<c066f5e0>] (dump_stack+0x20/0x28)
> [   44.474468] [<c066f5c0>] (dump_stack) from [<c0111f9c>] (__warn+0xe8/0x104)
> [   44.481479] [<c0111eb4>] (__warn) from [<c01120d4>] (warn_slowpath_null+0x44/0x50)
> [   44.489077]  r9:00000004 r8:bf0094e4 r7:000003e8 r6:bf0075cc r5:00000275 r4:bf008e87
> [   44.496810] [<c0112090>] (warn_slowpath_null) from [<bf0075cc>] (marvell_nfc_wait_op+0x88/0xb8 [marvell_nand])
> [   44.506814]  r6:c66ba80c r5:c66ba7f0 r4:00000000
> [   44.511503] [<bf007544>] (marvell_nfc_wait_op [marvell_nand]) from [<bf0079e0>] (marvell_nfc_erase_cmd_type_exec+0x74/0xa8 [marvell_nand])
> [   44.523919]  r7:0000000c r6:00000000 r5:c66bc810 r4:c0a03008
> [   44.529647] [<bf00796c>] (marvell_nfc_erase_cmd_type_exec [marvell_nand]) from [<c04382c8>] (nand_op_parser_exec_op+0x148/0x25c)
> [   44.541214]  r6:00000001 r5:bf008760 r4:c67c3c30
> [   44.545839] [<c0438180>] (nand_op_parser_exec_op) from [<bf007500>] (marvell_nfc_exec_op+0x30/0x3c [marvell_nand])
> [   44.556195]  r10:00000001 r9:ffffffff r8:c0a03008 r7:89705f41 r6:36b4a597 r5:c67c3c38
> [   44.564023]  r4:c66bc810
> [   44.566577] [<bf0074d0>] (marvell_nfc_exec_op [marvell_nand]) from [<c0437dd4>] (nand_erase_op+0x148/0x1f4)
> [   44.576330] [<c0437c8c>] (nand_erase_op) from [<c04383fc>] (single_erase+0x20/0x24)
> [   44.584000]  r8:00000180 r7:00000040 r6:c6815900 r5:00000000 r4:c66bc810
> [   44.590745] [<c04383dc>] (single_erase) from [<c043f544>] (nand_erase_nand+0x1b0/0x23c)
> [   44.598781] [<c043f394>] (nand_erase_nand) from [<c043f6e8>] (nand_erase+0x14/0x18)
> [   44.606399]  r10:c0a03008 r9:00000000 r8:00000000 r7:00000000 r6:000c0000 r5:c67b5670
> [   44.614237]  r4:c6815900
> [   44.616794] [<c043f6d4>] (nand_erase) from [<c04300ac>] (part_erase+0x34/0x74)
> [   44.624051] [<c0430078>] (part_erase) from [<c042c794>] (mtd_erase+0x74/0x9c)
> [   44.631215]  r7:00000000 r6:00020000 r5:00000000 r4:00060000
> [   44.636854] [<c042c720>] (mtd_erase) from [<c0432c4c>] (mtdchar_ioctl+0x1188/0x11b0)
> [   44.644618]  r9:c67c2000 r8:00000051 r7:c6815900 r6:00000000 r5:c67b5400 r4:bee7dd08
> [   44.652396] [<c0431ac4>] (mtdchar_ioctl) from [<c0432ca8>] (mtdchar_unlocked_ioctl+0x34/0x4c)
> [   44.660947]  r10:c0a03008 r9:c67c2000 r8:bee7dd08 r7:bee7dd08 r6:40084d02 r5:c6650280
> [   44.668784]  r4:c0a227c0
> [   44.671339] [<c0432c74>] (mtdchar_unlocked_ioctl) from [<c01d17d4>] (vfs_ioctl+0x28/0x3c)
> [   44.679533]  r7:40084d02 r6:c6650280 r5:c6679c28 r4:bee7dd08
> [   44.685174] [<c01d17ac>] (vfs_ioctl) from [<c01d19c4>] (do_vfs_ioctl+0x98/0x904)
> [   44.692604] [<c01d192c>] (do_vfs_ioctl) from [<c01d2270>] (ksys_ioctl+0x40/0x5c)
> [   44.700033]  r10:00020000 r9:c67c2000 r8:bee7dd08 r7:40084d02 r6:c6650280 r5:00000003
> [   44.707805]  r4:c6650280
> [   44.710398] [<c01d2230>] (ksys_ioctl) from [<c01d229c>] (sys_ioctl+0x10/0x14)
> [   44.717494]  r9:c67c2000 r8:c01011e4 r7:00000036 r6:00000000 r5:00022098 r4:000220c0
> [   44.725265] [<c01d228c>] (sys_ioctl) from [<c0101000>] (ret_fast_syscall+0x0/0x50)
> [   44.732855] Exception stack(0xc67c3fa8 to 0xc67c3ff0)
> [   44.737954] 3fa0:                   000220c0 00022098 00000003 40084d02 bee7dd08 00020000
> [   44.746087] 3fc0: 000220c0 00022098 00000000 00000036 00022084 b6d5a008 b6d5a008 b6d5a008
> [   44.754273] 3fe0: 00022024 bee7dcec 00010e34 b6e67dbc
> [   44.759363] ---[ end trace b29035065663519d ]---
> [   44.763970] marvell-nfc 43100000.nand-controller: Timeout waiting for RB signal
> MEMERASE: Input/output error
> [   44.771960] marvell_nfc_select_chip(): 0016271c 0f3d00f2
> 00020000: erasing... [   44.812608] marvell_nfc_select_chip(): 0016271c 0f3d00f2
> [   45.857970] ------------[ cut here ]------------

FWIW, my suspend/resume routines gained some more flesh now, but 
something is still missing I suppose:

> static int __maybe_unused marvell_nfc_suspend(struct device *dev)
> {
> 	struct marvell_nfc *nfc = dev_get_drvdata(dev);
> 	struct marvell_nand_chip *chip;
> 
> 	list_for_each_entry(chip, &nfc->chips, node)
> 		marvell_nfc_wait_ndrun(&chip->chip);
> 
> 	clk_disable_unprepare(nfc->core_clk);
> 
> 	return 0;
> }
> 
> static int __maybe_unused marvell_nfc_resume(struct device *dev)
> {
> 	struct marvell_nfc *nfc = dev_get_drvdata(dev);
> 	int ret;
> 
> 	ret = clk_prepare_enable(nfc->core_clk);
> 	if (ret < 0)
> 		return ret;
> 
> 	/*
> 	 * Reset nfc->selected_chip so the next command will cause the timing
> 	 * registers to be restored in marvell_nfc_select_chip().
> 	 */
> 	nfc->selected_chip = NULL;
> 
> 	writel_relaxed(NDCR_ALL_INT | NDCR_ND_ARB_EN | NDCR_SPARE_EN |
> 		       NDCR_RD_ID_CNT(NFCV1_READID_LEN), nfc->regs + NDCR);
> 	writel_relaxed(0xFFFFFFFF, nfc->regs + NDSR);
> 	writel_relaxed(0, nfc->regs + NDECCCTRL);
> 
> 	return 0;
> }

The controller loses all its state after resume, but I don't see which 
register is not re-initialized after that, but I might miss something.

I'll get back to this in a couple of days, because I have to do this in 
my spare time. Miquel, do you have any platform with such a controller 
that is suspend-able? It might still be an issue outside of this driver, 
after all.



Thanks,
Daniel
