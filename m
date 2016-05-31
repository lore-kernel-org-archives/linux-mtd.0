Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7oda-0002Z8-W9
 for linux-mtd@lists.infradead.org; Tue, 31 May 2016 18:43:35 +0000
Received: by mail-pf0-x241.google.com with SMTP id 62so14129175pfd.3
 for <linux-mtd@lists.infradead.org>; Tue, 31 May 2016 11:43:14 -0700 (PDT)
Date: Tue, 31 May 2016 11:43:10 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Barbier, Renaud (Abaco Systems, Non-GE)" <Renaud.Barbier@ge.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, Michal Suchanek <hramrach@gmail.com>
Subject: Re: m25p80 spi32766.0: unrecognized JEDEC id bytes: 00,  0,  0
Message-ID: <20160531184310.GA31496@google.com>
References: <7F6493595BCD744E896E5FE2800ADF6472BAAB0C@LONURLNA21.e2k.ad.ge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7F6493595BCD744E896E5FE2800ADF6472BAAB0C@LONURLNA21.e2k.ad.ge.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 26, 2016 at 05:30:31PM +0000, Barbier, Renaud (Abaco Systems, Non-GE) wrote:
> Hello,
> I am running Broadcom 53346 with integratedARM cpu on  Linux 4.0.0 and get the message 
> m25p80 spi32766.0: unrecognized JEDEC id bytes: 00,  0,  0
> followed by a crash
> 
> when mounting the spi nor (m25p80 spi32766.0: n25q256a)
> 
> What would be the cause of this read failure?

Michal's mostly right; if the driver doesn't probe right (e.g., your SPI
bus is just returning 0's for the ID), then you won't see the MTD
device, and if you depend on it for critical boot infrastructure (e.g.,
rootfs) you won't boot up properly. So you really want to fix your SPI
driver, I expect.

But that's not the only problem you show. You're explicitly trying to
mount an additional filesystem on an already-booted system. I don't know
why UBI/UBIFS is letting you do this even though the MTD doesn't exist.
Perhaps that's also a UBI bug? Might be good to get the

  cat /proc/mtd
  mtdinfo -a

output too.

> Cheers,
>  Renaud
> 
> ===================================
> 
> The crash output if needed:
> [root@openware]# mount -t ubifs ubi0:boot /mnt
> UBIFS: background thread "ubifs_bgt0_0" started, PID 673
> m25p80 spi32766.0: unrecognized JEDEC id bytes: 00,  0,  0
> Unable to handle kernel NULL pointer dereference at virtual address 0000000d
> pgd = c0004000
> [0000000d] *pgd=00000000
> Internal error: Oops: 17 [#1] SMP ARM
> Modules linked in:
> CPU: 0 PID: 669 Comm: ubi_bgt0d Not tainted 4.0.0-owc+ #22
> Hardware name: RM927RC
> task: cbca4c00 ti: cbccc000 task.ti: cbccc000
> PC is at spi_nor_read+0x2c/0x274
> LR is at 0x0
> pc : [<c0266c58>]    lr : [<00000000>]    psr: 600f0013
> sp : cbccdc60  ip : 00000000  fp : cbccdc94
> r10: cc8ff000  r9 : 00000000  r8 : 00000040
> r7 : 00000000  r6 : 00220000  r5 : 00000000  r4 : cca51c14
> r3 : 00000000  r2 : 0c8ea000  r1 : 00000000  r0 : ffffffed
> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
> Control: 10c5387d  Table: 6cc6c04a  DAC: 00000015
> Process ubi_bgt0d (pid: 669, stack limit = 0xcbccc190)
> Stack: (0xcbccdc60 to 0xcbcce000)
[...]
> Backtrace:
> [<c0266c2c>] (spi_nor_read) from [<c023c880>] (part_read+0x4c/0x94)
>  r9:00000000 r8:00180000 r7:00000040 r6:00000000 r5:00000000 r4:cc93d000
> [<c023c834>] (part_read) from [<c0239fb4>] (mtd_read+0x80/0xb4)
>  r9:cbccddb8 r8:cc93d000 r7:00000000 r6:00000004 r5:00000000 r4:01960000
> [<c0239f34>] (mtd_read) from [<c027201c>] (ubi_io_read+0x9c/0x310)
>  r8:0000000a r7:00000000 r6:00000004 r5:00000040 r4:cc8ff000
> [<c0271f80>] (ubi_io_read) from [<c02724d4>] (ubi_io_read_ec_hdr+0x4c/0x220)
>  r10:00000040 r9:00000000 r8:0000000a r7:cc8ff000 r6:000a0000 r5:cbccddb8
>  r4:cc8ff000
> [<c0272488>] (ubi_io_read_ec_hdr) from [<c02728fc>] (nor_erase_prepare+0x34/0x1)
>  r10:0000000a r9:00000000 r8:0000000c r7:00000000 r6:000a0000 r5:0000000a
>  r4:cc8ff000
> [<c02728c8>] (nor_erase_prepare) from [<c0273908>] (ubi_io_sync_erase+0x1ec/0x2)
>  r9:00000000 r8:0000000c r7:cbd4ee34 r6:0000000a r5:00000000 r4:cc8ff000
> [<c027371c>] (ubi_io_sync_erase) from [<c0274628>] (sync_erase.isra.12+0x94/0x2)
>  r9:00000000 r8:0000000c r7:cbd4ee34 r6:ccb8c140 r5:cbd4ee38 r4:cc8ff000
> [<c0274594>] (sync_erase.isra.12) from [<c027482c>] (erase_worker+0x8c/0x518)
>  r10:cc8ff000 r9:00000000 r8:0000000a r7:00000008 r6:00000000 r5:cbd4ee28
>  r4:ccb8c100
> [<c02747a0>] (erase_worker) from [<c0273ee8>] (do_work+0xa4/0x134)
>  r10:00000000 r9:00000000 r8:cc8ffd6c r7:cc8ffd10 r6:cc8ffd2c r5:cc8ff000
>  r4:ccb8c100

i.e., why are you scheduling IO on a seemingly NULL MTD? We could
confirm with more mtdinfo output.

> [<c0273e44>] (do_work) from [<c0276310>] (ubi_thread+0x144/0x1e0)
>  r7:c054eac0 r6:cbccc000 r5:cc8ffd10 r4:cc8ff000
> [<c02761cc>] (ubi_thread) from [<c003386c>] (kthread+0xe4/0xfc)
>  r9:00000000 r8:00000000 r7:c02761cc r6:cc8ff000 r5:ccb7f940 r4:00000000
> [<c0033788>] (kthread) from [<c0009900>] (ret_from_fork+0x14/0x34)
>  r7:00000000 r6:00000000 r5:c0033788 r4:ccb7f940
> Code: e59b8004 e1a00004 ebffffc8 e3a01000 (e5909020)
> ---[ end trace a219755da14e86e6 ]---

Brian
