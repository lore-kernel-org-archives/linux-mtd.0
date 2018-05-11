Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fH30q-0000ac-OS
 for linux-mtd@lists.infradead.org; Fri, 11 May 2018 08:02:52 +0000
Date: Fri, 11 May 2018 10:02:27 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Greg Ungerer <gerg@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org, gerg@linux-m68k.org
Subject: Re: linux-4.17-rc4 marvell-nand.c driver problems
Message-ID: <20180511100227.6e016b48@bbrezillon>
In-Reply-To: <579454cc-ad92-8fdc-a1ac-f7c57eb56606@kernel.org>
References: <579454cc-ad92-8fdc-a1ac-f7c57eb56606@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Greg,

On Fri, 11 May 2018 17:11:28 +1000
Greg Ungerer <gerg@kernel.org> wrote:

> Hi Miquel,
> 
> I have a hardware platform built around the Armada 370 using NAND flash.
> Its old hardware, and has run pretty much every kernel version from
> 3.10 up to 4.16 with no problems. The flash is 128Mbyte SLC from various
> vendors (Spansion, Micron, etc).
> 
> It has always been using the pxa3xx_nand.c driver up to now. With that
> gone in 4.17 I am trying out the marvell_nand.c driver. I am getting
> a dump just after startup:

Can you try to cherry-pick this commit [1] (it should appear in
4.17-rc5).

Thanks,

Boris

[1]https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/mtd/nand/raw?h=next-20180511&id=a2ee41fd953e7c3ff6c55a3038c80354d191a318

> 
> UBIFS (ubi0:1): background thread "ubifs_bgt0_1" started, PID 154
> marvell-nfc d00d0000.nand: Timeout waiting for RB signal
> ubi0 error: ubi_io_write: error -110 while writing 2048 bytes to PEB 
> 333:16384, written 0 bytes
> CPU: 0 PID: 153 Comm: mount Not tainted 4.17.0-rc4-dirty #4
> Hardware name: Marvell Armada 370/XP (Device Tree)
> [<c010d8f4>] (unwind_backtrace) from [<c010b350>] (show_stack+0x10/0x14)
> [<c010b350>] (show_stack) from [<c03ceba0>] (ubi_io_write+0x4d0/0x664)
> [<c03ceba0>] (ubi_io_write) from [<c03cc004>] (ubi_eba_write_leb+0x80/0x650)
> [<c03cc004>] (ubi_eba_write_leb) from [<c03cab40>] (ubi_leb_write+0xc0/0xe4)
> [<c03cab40>] (ubi_leb_write) from [<c0271c38>] (ubifs_leb_write+0xa0/0x130)
> [<c0271c38>] (ubifs_leb_write) from [<c027331c>] 
> (ubifs_write_node+0xb8/0x1b4)
> [<c027331c>] (ubifs_write_node) from [<c0278e6c>] 
> (ubifs_write_master+0xbc/0x150)
> [<c0278e6c>] (ubifs_write_master) from [<c0270020>] 
> (ubifs_mount+0xfc8/0x14ac)
> [<c0270020>] (ubifs_mount) from [<c01a8c78>] (mount_fs+0x14/0xa4)
> [<c01a8c78>] (mount_fs) from [<c01c088c>] (vfs_kern_mount+0x48/0xd8)
> [<c01c088c>] (vfs_kern_mount) from [<c01c33d0>] (do_mount+0x174/0xac4)
> [<c01c33d0>] (do_mount) from [<c01c4080>] (ksys_mount+0x8c/0xbc)
> [<c01c4080>] (ksys_mount) from [<c0101000>] (ret_fast_syscall+0x0/0x54)
> Exception stack(0xceb15fa8 to 0xceb15ff0)
> 5fa0:                   00000000 befedc80 befedfae befedfba befedfa8 
> 00008000
> 5fc0: 00000000 befedc80 b6f3b4a0 00000015 00000000 00000000 b6f3df74 
> 00065704
> 5fe0: b6ec2d18 befedb8c 0002aa60 b6ec2d28
> ubi0: dumping 2048 bytes of data from PEB 333, offset 16384
> ubi0 warning: ubi_eba_write_leb: failed to write data to PEB 333
> ubi0 warning: ubi_eba_write_leb: switch to read-only mode
> CPU: 0 PID: 153 Comm: mount Not tainted 4.17.0-rc4-dirty #4
> Hardware name: Marvell Armada 370/XP (Device Tree)
> [<c010d8f4>] (unwind_backtrace) from [<c010b350>] (show_stack+0x10/0x14)
> [<c010b350>] (show_stack) from [<c03cc1ac>] (ubi_eba_write_leb+0x228/0x650)
> [<c03cc1ac>] (ubi_eba_write_leb) from [<c03cab40>] (ubi_leb_write+0xc0/0xe4)
> [<c03cab40>] (ubi_leb_write) from [<c0271c38>] (ubifs_leb_write+0xa0/0x130)
> [<c0271c38>] (ubifs_leb_write) from [<c027331c>] 
> (ubifs_write_node+0xb8/0x1b4)
> [<c027331c>] (ubifs_write_node) from [<c0278e6c>] 
> (ubifs_write_master+0xbc/0x150)
> [<c0278e6c>] (ubifs_write_master) from [<c0270020>] 
> (ubifs_mount+0xfc8/0x14ac)
> [<c0270020>] (ubifs_mount) from [<c01a8c78>] (mount_fs+0x14/0xa4)
> [<c01a8c78>] (mount_fs) from [<c01c088c>] (vfs_kern_mount+0x48/0xd8)
> [<c01c088c>] (vfs_kern_mount) from [<c01c33d0>] (do_mount+0x174/0xac4)
> [<c01c33d0>] (do_mount) from [<c01c4080>] (ksys_mount+0x8c/0xbc)
> [<c01c4080>] (ksys_mount) from [<c0101000>] (ret_fast_syscall+0x0/0x54)
> Exception stack(0xceb15fa8 to 0xceb15ff0)
> 5fa0:                   00000000 befedc80 befedfae befedfba befedfa8 
> 00008000
> 5fc0: 00000000 befedc80 b6f3b4a0 00000015 00000000 00000000 b6f3df74 
> 00065704
> 5fe0: b6ec2d18 befedb8c 0002aa60 b6ec2d28
> UBIFS error (ubi0:1 pid 153): ubifs_leb_write: writing 2048 bytes to LEB 
> 1:12288 failed, error -110
> UBIFS warning (ubi0:1 pid 153): ubifs_ro_mode.part.0: switched to 
> read-only mode, error -110
> CPU: 0 PID: 153 Comm: mount Not tainted 4.17.0-rc4-dirty #4
> Hardware name: Marvell Armada 370/XP (Device Tree)
> [<c010d8f4>] (unwind_backtrace) from [<c010b350>] (show_stack+0x10/0x14)
> [<c010b350>] (show_stack) from [<c0271cc4>] (ubifs_leb_write+0x12c/0x130)
> [<c0271cc4>] (ubifs_leb_write) from [<c027331c>] 
> (ubifs_write_node+0xb8/0x1b4)
> [<c027331c>] (ubifs_write_node) from [<c0278e6c>] 
> (ubifs_write_master+0xbc/0x150)
> [<c0278e6c>] (ubifs_write_master) from [<c0270020>] 
> (ubifs_mount+0xfc8/0x14ac)
> [<c0270020>] (ubifs_mount) from [<c01a8c78>] (mount_fs+0x14/0xa4)
> [<c01a8c78>] (mount_fs) from [<c01c088c>] (vfs_kern_mount+0x48/0xd8)
> [<c01c088c>] (vfs_kern_mount) from [<c01c33d0>] (do_mount+0x174/0xac4)
> [<c01c33d0>] (do_mount) from [<c01c4080>] (ksys_mount+0x8c/0xbc)
> [<c01c4080>] (ksys_mount) from [<c0101000>] (ret_fast_syscall+0x0/0x54)
> Exception stack(0xceb15fa8 to 0xceb15ff0)
> 5fa0:                   00000000 befedc80 befedfae befedfba befedfa8 
> 00008000
> 5fc0: 00000000 befedc80 b6f3b4a0 00000015 00000000 00000000 b6f3df74 
> 00065704
> 5fe0: b6ec2d18 befedb8c 0002aa60 b6ec2d28
> CPU: 0 PID: 153 Comm: mount Not tainted 4.17.0-rc4-dirty #4
> Hardware name: Marvell Armada 370/XP (Device Tree)
> [<c010d8f4>] (unwind_backtrace) from [<c010b350>] (show_stack+0x10/0x14)
> [<c010b350>] (show_stack) from [<c0271cb0>] (ubifs_leb_write+0x118/0x130)
> [<c0271cb0>] (ubifs_leb_write) from [<c027331c>] 
> (ubifs_write_node+0xb8/0x1b4)
> [<c027331c>] (ubifs_write_node) from [<c0278e6c>] 
> (ubifs_write_master+0xbc/0x150)
> [<c0278e6c>] (ubifs_write_master) from [<c0270020>] 
> (ubifs_mount+0xfc8/0x14ac)
> [<c0270020>] (ubifs_mount) from [<c01a8c78>] (mount_fs+0x14/0xa4)
> [<c01a8c78>] (mount_fs) from [<c01c088c>] (vfs_kern_mount+0x48/0xd8)
> [<c01c088c>] (vfs_kern_mount) from [<c01c33d0>] (do_mount+0x174/0xac4)
> [<c01c33d0>] (do_mount) from [<c01c4080>] (ksys_mount+0x8c/0xbc)
> [<c01c4080>] (ksys_mount) from [<c0101000>] (ret_fast_syscall+0x0/0x54)
> Exception stack(0xceb15fa8 to 0xceb15ff0)
> 5fa0:                   00000000 befedc80 befedfae befedfba befedfa8 
> 00008000
> 5fc0: 00000000 befedc80 b6f3b4a0 00000015 00000000 00000000 b6f3df74 
> 00065704
> 5fe0: b6ec2d18 befedb8c 0002aa60 b6ec2d28
> 	magic          0x6101831
> 	crc            0x3d983859
> 	node_type      7 (master node)
> 	group_type     0 (no node group)
> 	sqnum          21756
> 	len            512
> 	highest_inum   515
> 	commit number  638
> 	flags          0x3
> 	log_lnum       5
> 	root_lnum      11
> 	root_offs      126096
> 	root_len       88
> 	gc_lnum        13
> 	ihead_lnum     11
> 	ihead_offs     126976
> 	index_size     1672
> 	lpt_lnum       6
> 	lpt_offs       36921
> 	nhead_lnum     6
> 	nhead_offs     38912
> 	ltab_lnum      6
> 	ltab_offs      36864
> 	lsave_lnum     0
> 	lsave_offs     0
> 	lscan_lnum     29
> 	leb_cnt        34
> 	empty_lebs     16
> 	idx_lebs       2
> 	total_free     2314240
> 	total_dirty    720136
> 	total_used     11376
> 	total_dead     0
> 	total_dark     135168
> UBIFS (ubi0:1): background thread "ubifs_bgt0_1" stops
> 
> 
> The driver init during boot up looked good:
> 
> nand: device found, Manufacturer ID: 0x01, Chip ID: 0xf1
> nand: AMD/Spansion S34ML01G1
> nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> Bad block table found at page 65472, version 0x01
> Bad block table found at page 65408, version 0x01
> 5 fixed-partitions partitions found on MTD device pxa3xx_nand-0
> Creating 5 MTD partitions on "pxa3xx_nand-0":
> 0x000000000000-0x000000200000 : "u-boot"
> 0x000000200000-0x000000300000 : "u-boot-env"
> 0x000000300000-0x000000500000 : "log"
> 0x000000500000-0x000008000000 : "flash"
> 0x000000000000-0x000008000000 : "all"
> 
> 
> The kernel dump is not fatal, and I can still use the system.
> I can dd all the flash, and otherwise use the flash and that all
> seems to work ok. And interestingly if I try to mount that UBIFS
> again at the command line then it succeeds and I can see the files
> within it properly.
> 
> Any ideas?
> 
> Regards
> Greg
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
