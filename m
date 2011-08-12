Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qrtc4-0003HE-SB
	for linux-mtd@lists.infradead.org; Fri, 12 Aug 2011 15:25:34 +0000
Message-ID: <4E4545E5.5050005@parrot.com>
Date: Fri, 12 Aug 2011 17:25:25 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Eric Millbrandt <emillbrandt@dekaresearch.com>
Subject: Re: ubi volume unmountable after power cut
References: <0A40042D85E7C84DB443060EC44B3FD32A723D86B0@dekaexchange07.deka.local>
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD32A723D86B0@dekaexchange07.deka.local>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Eric Millbrandt a écrit :
> All,
> 
> One of our systems came back "unbootable" from our QA department.  When I took a look at the system I found that the rootfs, which is a ubi/ubifs filesystem, had become corrupt.  My QA department swears that they powered off the system correctly, but even so, shouldn't ubi be tolerant of power cuts?  I've attached all the relevant information below.
> 
> # uname -r
> 2.6.33.7-rt29-deka-debug
> 
> Here is the short output of the error, the full dmesg output can be found here,
> http://pastebin.com/Rg1Lcc6U
> 
> # ubiattach /dev/ubi_ctrl -m 8 -O 4096
> [   99.020801] UBI: attaching mtd8 to ubi0
> [   99.025380] UBI: physical eraseblock size:   524288 bytes (512 KiB)
> [   99.032665] UBI: logical eraseblock size:    516096 bytes
> [   99.038840] UBI: smallest flash I/O unit:    4096
> [   99.044193] UBI: sub-page size:              1024
> [   99.049666] UBI: VID header offset:          4096 (aligned 4096)
> [   99.056461] UBI: data offset:                8192
> [  105.013011] UBI warning: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB handling, reserved 39, need 40
> [  105.035256] UBI: attached mtd8 to ubi0
> [  105.039682] UBI: MTD device name:            "rootfs"
> [  105.045466] UBI: MTD device size:            2048 MiB
> [  105.051287] UBI: number of good PEBs:        4095
> [  105.056663] UBI: number of bad PEBs:         1
> [  105.061664] UBI: max. allowed volumes:       128
> [  105.066929] UBI: wear-leveling threshold:    128
> [  105.072195] UBI: number of internal volumes: 1
> [  105.077284] UBI: number of user volumes:     1
> [  105.082371] UBI: available PEBs:             0
> [  105.087461] UBI: total number of reserved PEBs: 4095
> [  105.093197] UBI: number of PEBs reserved for bad PEB handling: 39
> [  105.100196] UBI: max/mean erase counter: 128/4
> [  105.105288] UBI: image sequence number: 659754289
> [  105.110698] UBI: background thread "ubi_bgt0d" started, PID 360
> UBI device number 0, total 4095 LEBs (2113413120 bytes, 2.0 GiB), available 0 LEBs (0 bytes), LEB size 516096 bytes (504.0 KiB)
> # mount -t ubifs ubi0:rootfs /newroot
> [  137.186160] UBIFS: recovery needed
> [  140.225781] uncorrectable error :
> [  140.229463] uncorrectable error :
> [  140.233285] uncorrectable error :
> [  140.237196] uncorrectable error :
> [  140.241109] uncorrectable error :
> [  140.245017] uncorrectable error :
> [  140.248925] uncorrectable error :
> [  140.252837] uncorrectable error :
> [  140.256751] uncorrectable error :
> [  140.260660] uncorrectable error :
> [  140.264460] uncorrectable error :
> [  140.268283] uncorrectable error :
> [  140.272193] uncorrectable error :
> [  140.276109] uncorrectable error :
> [  140.283769] uncorrectable error :
> [  140.287748] uncorrectable error :
> [  140.291659] uncorrectable error :
> [  140.295464] uncorrectable error :
> [  140.299285] uncorrectable error :
> [  140.303194] uncorrectable error :
> [  140.307106] uncorrectable error :
> [  140.311016] uncorrectable error :
> [  140.314927] uncorrectable error :
> [  140.318838] uncorrectable error :
> [  140.322749] uncorrectable error :
> [  140.482974] UBI error: ubi_io_read: error -74 while reading 516096 bytes from PEB 3889:8192, read 516096 bytes
> [  140.494658] Call Trace:
> [  140.497406] [cf86fac0] [c00097bc] show_stack+0x4c/0x16c (unreliable)
> [  140.504881] [cf86fb00] [c031f298] ubi_io_read+0x170/0x28c
> [  140.511141] [cf86fb40] [c031e4a8] ubi_eba_read_leb+0x13c/0x36c
> [  140.517961] [cf86fb80] [c031c7bc] ubi_leb_read+0x120/0x170
> [  140.524329] [cf86fbb0] [c01edd64] ubifs_start_scan+0xb8/0x1e8
> [  140.531053] [cf86fbe0] [c0205820] ubifs_recover_leb+0x68/0xa78
> [  140.537876] [cf86fc50] [c01eead0] replay_buds+0xa8/0xcf4
> [  140.544052] [cf86fcf0] [c01f0018] ubifs_replay_journal+0x8fc/0x1284
> [  140.551315] [cf86fd80] [c01e1268] ubifs_fill_super+0xf20/0x1928
> [  140.558225] [cf86fde0] [c01e2638] ubifs_get_sb+0x104/0x384
> [  140.564702] [cf86fe60] [c00c8d18] vfs_kern_mount+0x70/0x190
> [  140.571142] [cf86fe90] [c00c8e88] do_kern_mount+0x40/0x100
> [  140.577501] [cf86feb0] [c00e3030] do_mount+0x4d8/0x828
> [  140.583497] [cf86ff10] [c00e3410] sys_mount+0x90/0xd0
> [  140.589399] [cf86ff40] [c0012f2c] ret_from_syscall+0x0/0x38
> [  140.595950] --- Exception: c01 at 0xfdd64c8
> [  140.595964]     LR = 0x10063dd8
> [  140.606215] UBIFS error (pid 361): ubifs_recover_leb: garbage
> [  140.612939] UBIFS error (pid 361): ubifs_scanned_corruption: corruption at LEB 3211:335872
> [  140.622385] UBIFS error (pid 361): ubifs_scanned_corruption: first 8192 bytes from LEB 3211:335872
> [  140.646492] UBIFS error (pid 361): ubifs_recover_leb: LEB 3211 scanning failed
> mount: mounting ubi0:rootfs on /newroot failed: Structure needs cleaning
> #
> 
> # cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00040000 00020000 "backupUboot"
> mtd1: 01000000 00020000 "unused"
> mtd2: 002c0000 00020000 "kernel"
> mtd3: 00600000 00020000 "dekainit"
> mtd4: 00600000 00020000 "ramdisk"
> mtd5: 00060000 00020000 "u-boot"
> mtd6: 00060000 00020000 "unused"
> mtd7: 00040000 00020000 "device-tree"
> mtd8: 80000000 00080000 "rootfs"
> 
> mtd0-7 are just raw partitions on a NOR device
> mtd8 is a Micron mt29f16g08ababa, which is a 16Gb SLC NAND part
> 
The new micron chips have unstable bit (
http://lists.infradead.org/pipermail/linux-mtd/2010-October/032762.html) that
was not well supported by ubi/ubifs.

This may be the cause of the problem.



Matthieu
