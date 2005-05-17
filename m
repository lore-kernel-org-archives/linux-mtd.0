Received: from blood.actrix.co.nz ([203.96.16.160])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DXtCW-0003KX-CM
	for linux-mtd@lists.infradead.org; Mon, 16 May 2005 23:57:02 -0400
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: jeanwelly <jeanwelly@gmail.com>, yaffs@stoneboat.aleph1.co.uk,
	linux-mtd@lists.infradead.org
Date: Tue, 17 May 2005 15:57:57 +1200
References: <c2bc1f40505161946b00566e@mail.gmail.com>
In-Reply-To: <c2bc1f40505161946b00566e@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20050517035657.0D31B4824@blood.actrix.co.nz>
Cc: 
Subject: Re: [Yaffs] Real bad blocks of nand flash?
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

You can expect up to approx 1% of bad blocks. These will often be close 
together.


 On Tuesday 17 May 2005 14:46, jeanwelly wrote:
> I am running 2.6.11. 7 on S3C2410 ARM platform, using nand flash
> K9F1208, root fs =yaffs....
>
> Why occured so many bad blocks of nand. Are these blocks real bad? How
> can I take a test in another way?
>
>
> #./eraseall /dev/mtd/3
> .................
> Erasing 16 KibytMTD_ioctl
> e @ 230000 -- 72MTD_ioctl
> EraMTD_ioctl
> sing 16 Kibyte @MTD_ioctl
> 234000 -- 73 % MTD_ioctl
> ErasinMTD_ioctl
> g 16 Kibyte @ 23MTD_ioctl
> 8000 -- 73 % comMTD_ioctl
> Erasing 1MTD_ioctl
> 6 Kibyte @ 23c000 -- 74 % compleMTD_close
> Erasing 16 Kibyte @ 278000 -- 82 % complete.
> ./eraseall: /dev/mtd/3: MTD Erase failure: Input/output error
> Erasing 16 Kibyte @ 27c000 -- 82 % complete.
> ./eraseall: /dev/mtd/3: MTD Erase failure: Input/output error
> Erasing 16 Kibyte @ 280000 -- 83 % complete.
> ./eraseall: /dev/mtd/3: MTD Erase failure: Input/output error
> Erasing 16 Kibyte @ 284000 -- 83 % complete.
> ./eraseall: /dev/mtd/3: MTD Erase failure: Input/output error
> Erasing 16 Kibyte @ 288000 -- 84 % complete.
> ./eraseall: /dev/mtd/3: MTD Erase failure: Input/output error
> Erasing 16 Kibyte @ 28c000 -- 84 % complete.
> ./eraseall: /dev/mtd/3: MTD Erase failure: Input/output error
> Erasing 16 Kibyte @ 290000 -- 85 % complete.
> ./eraseall: /dev/mtd/3: MTD Erase failure: Input/output error
> Erasing 16 Kibyte @ 2ac000 -- 89 % complete.
> ./eraseall: /dev/mtd/3: MTD Erase failure: Input/output error
> Erased 3072 Kibyte @ 0 -- 100% complete.
> #
>
> The following is my booting info:
>
> S3C2410 NAND Driver, (c) 2004 Simtec Electronics
> s3c2410-nand: mapped registers at c4a00000
> s3c2410-nand: timing: Tacls 10ns, Twrph0 40ns, Twrph1 10ns
> NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MiB
> 3,3V 8-bit)
> NAND_ECC_NONE selected by board driver. This is not recommended !!
> Scanning device for bad blocks
> Bad eraseblock 129 at 0x00204000   <--- REAL BAD BLOCK ????
> Bad eraseblock 130 at 0x00208000
> Bad eraseblock 146 at 0x00248000
> Bad eraseblock 147 at 0x0024c000
> Bad eraseblock 148 at 0x00250000
> Bad eraseblock 149 at 0x00254000
> Bad eraseblock 158 at 0x00278000
> Bad eraseblock 161 at 0x00284000
> Bad eraseblock 174 at 0x002b8000
> Bad eraseblock 178 at 0x002c8000
> Bad eraseblock 286 at 0x00478000
> Bad eraseblock 287 at 0x0047c000
> Bad eraseblock 288 at 0x00480000
> Bad eraseblock 289 at 0x00484000
> Bad eraseblock 290 at 0x00488000
> Bad eraseblock 291 at 0x0048c000
> Bad eraseblock 292 at 0x00490000
> Bad eraseblock 294 at 0x00498000
> Bad eraseblock 295 at 0x0049c000
> Bad eraseblock 296 at 0x004a0000
> Bad eraseblock 297 at 0x004a4000
> Bad eraseblock 298 at 0x004a8000
> Bad eraseblock 299 at 0x004ac000
> Bad eraseblock 300 at 0x004b0000
> Bad eraseblock 301 at 0x004b4000
> Bad eraseblock 305 at 0x004c4000
> Creating 5 MTD partitions on "NAND 64MiB 3,3V 8-bit":
> 0x00000000-0x00020000 : "vivi"
> mtd: Giving out device 0 to vivi
> 0x00020000-0x00030000 : "param"
> mtd: Giving out device 1 to param
> 0x00030000-0x00200000 : "kernel"
> mtd: Giving out device 2 to kernel
> 0x00200000-0x00600000 : "root"
> mtd: Giving out device 3 to root
> 0x00600000-0x04000000 : "usr"
> mtd: Giving out device 4 to usr
> mice: PS/2 mouse device common for all mice
> NET: Registered protocol family 2
> IP: routing cache hash table of 512 buckets, 4Kbytes
> TCP established hash table entries: 4096 (order: 3, 32768 bytes)
> TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
> TCP: Hash tables configured (established 4096 bind 4096)
> NET: Registered protocol family 1
> Root-NFS: No NFS server available, giving up.
> VFS: Unable to mount root fs via NFS, trying floppy.
> Reading data from NAND FLASH without ECC is not recommended
> yaffs: dev is 32505859 name is "(unavailable)"
> VFS: Mounted root (yaffs filesystem).
> Mounted devfs on /dev
> Freeing init memory: 80K
> Reading data from NAND FLASH without ECC is not recommended
> zw: mount /etc as ramfs
> zw: /bin/mount -t yaffs /dev/mtdblock/4 /usr
> yaffs: dev is 32505860 name is "(unavailable)"
> Reading data from NAND FLASH without ECC is not recommended
> Reading data from NAND FLASH without ECC is not recommended
> Reading data from NAND FLASH without ECC is not recommended
> exec /sbin/init
> console=/dev/console
> init started: BusyBox v0.60.3 (2002.05.13-08:36+0000) multi-call binary
> Starting pid 20, console /dev/console: '/etc/init.d/rcS'
> mount: Mounting tmpfs on /dev/shm failed: No such file or directory
> Thu Jan 1 00:00:00 UTC 2004
> mount: Mounting ramfs on /.kde failed: No such file or directory
> Reading data from NAND FLASH without ECC is not recommended
> calibrate: error while loading shared libraries: liblinuetteapp.so.1:
> cannot load shayserver: error while loading shared libraries:
> liblinuettemodule.so.1: cannot load shayWaiting for enter to start
> '/bin/sh' (pid 38, terminal /dev/console)
>
> Please press Enter to activate this console.
> Starting pid 38, console /dev/console: '/bin/sh'
>
>
> BusyBox v0.60.3 (2002.05.13-08:36+0000) Built-in shell (ash)
> Enter 'help' for a list of built-in commands.
>
> # ls
> Reading data from NAND FLASH without ECC is not recommended
> aa.c etc linuxrc proc tmp
> bin lib lost+found qt usr
> dev linuette mnt sbin var
> # ls /usr
> Reading data from NAND FLASH without ECC is not recommended
> bin lib lost+found sample
> etc linuette qt sbin
>
> BTW:
> In bootloader vivi, I use  # bon part , there are no bad blocks found. WHY?
