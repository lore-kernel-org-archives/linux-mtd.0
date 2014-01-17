Received: from mail-ig0-x22c.google.com ([2607:f8b0:4001:c05::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W4DqF-0001S8-8M
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2014 18:08:28 +0000
Received: by mail-ig0-f172.google.com with SMTP id k19so2259434igc.5
 for <linux-mtd@lists.infradead.org>; Fri, 17 Jan 2014 10:08:05 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 17 Jan 2014 10:08:05 -0800
Message-ID: <CAFrvcAqcORcdHr14hnrTVCREOYsU9+=CFM8556sNgPihm67aUQ@mail.gmail.com>
Subject: Linux 3.10.24 Oops with Freescale MTD_NAND_FSL_ELBC
From: Barry G <mr.scada@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

We are working on porting one of our boards from
Linux v3.0.101-rt130 to Linux 3.10.24-rt22+.  There
isn't much customization on this board.  It uses
the CONFIG_MTD_NAND_FSL_ELBC controller on an 8308 to
attach to some Samsung NAND for a UBIFS filesystem.

The old kernel (3.0.101) boots fine.  The new kernel
gives me:
fe000000.flash: Found 1 x16 devices at 0x0 in 16-bit bank.
Manufacturer ID 0x0000c2 Chip ID 0x00227e
Amd/Fujitsu Extended Query Table at 0x0040
  Amd/Fujitsu Extended Query version 1.3.
number of CFI chips: 1
NAND device: Manufacturer ID: 0xec, Chip ID: 0xdc (Samsung NAND 512MiB
3,3V 8-bit), 512MiB, page size: 2048, OOB size: 64
Bad block table found at page 262080, version 0x01
Bad block table found at page 262016, version 0x01
nand_read_bbt: bad block at 0x00000f0c0000
nand_read_bbt: bad block at 0x000012d20000
nand_read_bbt: bad block at 0x000016020000
1 ofpart partitions found on MTD device e0600000.flash
Creating 1 MTD partitions on "e0600000.flash":
0x000000000000-0x000020000000 : "ubi"
eLBC NAND device at 0xe0600000, bank 1
[snip non NAND stuff]
Key type dns_resolver registered
UBI: attaching mtd1 to ubi0
UBI: scanning is finished
UBI: attached mtd1 (name "ubi", size 512 MiB) to ubi0
UBI: PEB size: 131072 bytes (128 KiB), LEB size: 129024 bytes
UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 512
UBI: VID header offset: 512 (aligned 512), data offset: 2048
UBI: good PEBs: 4089, bad PEBs: 7, corrupted PEBs: 0
UBI: user volume: 2, internal volumes: 1, max. volumes count: 128
UBI: max/mean erase counter: 10/1, WL threshold: 4096, image sequence number: 0
UBI: available PEBs: 28, total reserved PEBs: 4061, PEBs reserved for
bad PEB handling: 73
UBI: background thread "ubi_bgt0d" started, PID 436
rtc-ds1307 0-0068: setting system clock to 2001-02-08 21:07:08 UTC (981666428)
UBIFS: background thread "ubifs_bgt0_0" started, PID 439
UBIFS: recovery needed
Unable to handle kernel paging request for instruction fetch
Faulting instruction address: 0x00000000
Oops: Kernel access of bad area, sig: 11 [#1]
PREEMPT SEL B1305
CPU: 0 PID: 1 Comm: swapper Not tainted 3.10.24-rt22+ #2
task: df844000 ti: df836000 task.ti: df836000
NIP: 00000000 LR: c01cb430 CTR: 00000000
REGS: df837940 TRAP: 0400   Not tainted  (3.10.24-rt22+)
MSR: 20009032 <EE,ME,IR,DR,RI>  CR: 22ad2e48  XER: 00000000

GPR00: 00000000 df8379f0 df844000 df8ca800 00000001 00000200 00000200 df910500
GPR08: 00000000 00000040 df8f0700 df8ca800 22adbe44 00000000 00000000 0000003f
GPR16: 00000000 00000000 00000040 c03fc03c 00000004 00000001 00000003 00000010
GPR24: 00000001 df910d00 df8ca800 00000200 df910000 df910500 00000000 df8ca9d8
NIP [00000000]   (null)
LR [c01cb430] nand_write_subpage_hwecc+0x6c/0x16c
Call Trace:
[df8379f0] [df8379f4] 0xdf8379f4 (unreliable)
[df837a30] [c01cb294] nand_write_page+0xcc/0x180
[df837a58] [c01cbb30] nand_do_write_ops+0x2c4/0x35c
[df837ab0] [c01cbc20] nand_write+0x58/0x84
[df837af8] [c01b9a9c] part_write+0x30/0x40
[df837b00] [c01b661c] mtd_write+0xa0/0xcc
[df837b10] [c01dba48] ubi_io_write+0x324/0x5a8
[df837b58] [c01da300] ubi_eba_atomic_leb_change+0x17c/0x304
[df837ba0] [c01d8520] ubi_leb_change+0xb8/0xd8
[df837ba8] [c0119228] ubifs_leb_change+0xf0/0x10c
[df837bc8] [c012fe68] ubifs_recover_leb+0x568/0x60c
[df837c00] [c011fab0] replay_buds+0x104/0x884
[df837cc0] [c01208d8] ubifs_replay_journal+0x6a8/0xc60
[df837d58] [c01141b4] ubifs_fill_super+0xb88/0x10d4
[df837db0] [c0115774] ubifs_mount+0x538/0x5b4
[df837df8] [c008e5c4] mount_fs+0x80/0x164
[df837e18] [c00a7bf8] vfs_kern_mount+0x60/0xe4
[df837e38] [c00a83e0] do_mount+0x764/0x858
[df837e88] [c00a8564] SyS_mount+0x90/0xd0
[df837eb8] [c03c0fa4] do_mount_root+0x30/0xac
[df837ec8] [c03c11fc] mount_block_root+0x124/0x214
[df837ee8] [c03c1388] prepare_namespace+0x9c/0x188
[df837f00] [c03c0e28] kernel_init_freeable+0x1b0/0x1c4
[df837f30] [c0003d30] kernel_init+0x18/0x108
[df837f40] [c000d150] ret_from_kernel_thread+0x5c/0x64
Instruction dump:
XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
---[ end trace 0000000000000002 ]---

Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

I am using the vanilla FSL kernel driver with no modifications.

My Google-fu mostly failed for people having this issue.  Any pointers
would be appreciated.

Thanks,

Barry
