Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NDvne-0004Zx-1q
	for linux-mtd@lists.infradead.org; Fri, 27 Nov 2009 08:03:34 +0000
Message-ID: <4B0F87BA.7060504@nokia.com>
Date: Fri, 27 Nov 2009 10:03:06 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Alemao <xcarandiru@gmail.com>
Subject: Re: UBIFS: problems writing to the partition
References: <d970ff420911250403w6a81308v89f3f0faf47a9ee0@mail.gmail.com>
In-Reply-To: <d970ff420911250403w6a81308v89f3f0faf47a9ee0@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Alemao wrote:
> Hi all,
> 
> I have de following scenario:
> 
> - Freescale MPC8541
> - U-Boot-2009.03
> - Linux-2.6.26
> - NAND flash 512Mbit (64MB), page: 512 bytes, erase block: 16KB
> 
> 
> And Im creating UBI image with this parameters:
> 
> mkfs.ubifs -r rootfs/ -m 512 -c 3897 -e 15872 -o ubi.temp
> ubinize -o rootfs.ubifs -m 512 -p 16384 -s 256 ubinize.cfg
> 
> My ubinize.cfg
> 
> [ubifs]
> mode=ubi
> image=ubi.temp
> vol_id=0
> vol_size=60MiB
> vol_type=dynamic
> vol_name=ubipart
> vol_alignment=1
> vol_flags=autoresize
> 
> Im loading the linux kernel from UBIFS partition in U-Boot and
> mounting again in kernel with no problem:
> 
> # mount -t ubifs -o rw ubi0!ubipart /mnt/nand
> UBIFS: mounted UBI device 0, volume 0, name "ubipart"
> UBIFS: file system size:   61392896 bytes (59954 KiB, 58 MiB, 3868 LEBs)
> UBIFS: journal size:       8015360 bytes (7827 KiB, 7 MiB, 505 LEBs)
> UBIFS: media format:       4 (latest is 4)
> UBIFS: default compressor: lzo
> UBIFS: reserved for root:  0 bytes (0 KiB)

I guess if you turn on UBIFS debugging checks, it will not mount.

> 
> # ls /mnt/nand/
> cfg  www  logs  readme.txt
> 
> 
> But when I try to write something...
> 
> # echo hi > /mnt/nand/hi.txt
> UBI error: paranoid_check_peb_vid_hdr: bad VID header CRC at PEB 0,
> calculated 0xb730eb2, read 0xffffffff
> UBI error: paranoid_check_peb_vid_hdr: paranoid check failed for PEB 0
> Call Trace:
> [df003c20] [c0006a4c] show_stack+0x50/0x170 (unreliable)
> [df003c50] [c01bad88] ubi_io_write+0x258/0x354
> [df003c90] [c01b8c34] ubi_eba_write_leb+0xd8/0x654
> [df003ce0] [c01b7568] ubi_leb_write+0x11c/0x140
> [df003d10] [c011fd28] dbg_leb_write+0xc0/0xe8
> [df003d40] [c00ff1ac] ubifs_wbuf_write_nolock+0x338/0x544
> [df003d70] [c00f2804] ubifs_jnl_write_data+0x23c/0x2c0
> [df003db0] [c00f5510] do_writepage+0xb8/0x1cc
> [df003df0] [c0049c3c] __writepage+0x24/0x68
> [df003e00] [c004ace0] write_cache_pages+0x1c0/0x334
> [df003e90] [c004aecc] do_writepages+0x50/0x78
> [df003ea0] [c0044248] __filemap_fdatawrite_range+0x7c/0x98
> [df003f00] [c0084520] do_fsync+0x3c/0xb0
> [df003f20] [c00845c0] __do_fsync+0x2c/0x50
> [df003f40] [c000d134] ret_from_syscall+0x0/0x3c
> UBI warning: ubi_eba_write_leb: failed to write data to PEB 0
> UBI warning: ubi_ro_mode: switch to read-only mode
> UBIFS error (pid 13868): ubifs_wbuf_write_nolock: cannot write 2289
> bytes to LEB 2896:0, error -22
> 
> Dont know if Im creating the image with the right parameters.
> 
> One thing that I notice is that when I DONT load the kernel from UBIFS
> in U-Boot, I can write to the partition in kernel with no problem. But
> after a reboot, I got some recovery messages:

Which means it was not un-mounted cleanly.

Gotta wonder if U-Boot is corrupting UBI / UBIFS?

> 
> # mount -t ubifs -o rw ubi0!ubipart /mnt/nand
> UBIFS: recovery needed
> UBIFS: recovery completed
> UBIFS: mounted UBI device 0, volume 0, name "ubipart"
> UBIFS: file system size:   61392896 bytes (59954 KiB, 58 MiB, 3868 LEBs)
> UBIFS: journal size:       8015360 bytes (7827 KiB, 7 MiB, 505 LEBs)
> UBIFS: media format:       4 (latest is 4)
> UBIFS: default compressor: lzo
> UBIFS: reserved for root:  0 bytes (0 KiB)
> 
> 
> Here some messages from UBIFS kernel initialization:
> 
> NAND device: Manufacturer ID: 0x20, Chip ID: 0x76 (ST Micro NAND 64MiB
> 3,3V 8-bit)
> Scanning device for bad blocks
> Creating 1 MTD partitions on "60000000.nand":
> 0x00000000-0x04000000 : "ubipart"
> UBI: attaching mtd3 to ubi0
> UBI: physical eraseblock size:   16384 bytes (16 KiB)
> UBI: logical eraseblock size:    15872 bytes
> UBI: smallest flash I/O unit:    512
> UBI: sub-page size:              256
> UBI: VID header offset:          256 (aligned 256)
> UBI: data offset:                512
> UBI: attached mtd3 to ubi0
> UBI: MTD device name:            "ubipart"
> UBI: MTD device size:            64 MiB
> UBI: number of good PEBs:        4096
> UBI: number of bad PEBs:         0
> UBI: max. allowed volumes:       92
> UBI: wear-leveling threshold:    4096
> UBI: number of internal volumes: 1
> UBI: number of user volumes:     1
> UBI: available PEBs:             0
> UBI: total number of reserved PEBs: 4096
> UBI: number of PEBs reserved for bad PEB handling: 40
> UBI: max/mean erase counter: 2/0
> 
> 
> And my bootargs (U-Boot):
> 
> root=/dev/ram rw console=ttyS0,115200 ubi.mtd=3
> 
> or
> 
> root=/dev/ram console=ttyS0,115200 ubi.mtd=3
> 
> 
> Any ideas about what could be happening?
> 
> Thanks in advance,
> 
> --
> Alemao
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
