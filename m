Received: from sigma.superhosting.bg ([91.196.124.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M9f0V-00051x-Kg
	for linux-mtd@lists.infradead.org; Thu, 28 May 2009 12:46:58 +0000
Received: from blueice2n1.de.ibm.com ([195.212.29.171] helo=[9.157.146.18])
	by sigma.superhosting.bg with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <s.popov@rsc.bg>) id 1M9f0T-00051F-5N
	for linux-mtd@lists.infradead.org; Thu, 28 May 2009 15:46:49 +0300
Message-ID: <4A1E8740.9050208@rsc.bg>
Date: Thu, 28 May 2009 15:44:48 +0300
From: Stanislav Popov <s.popov@rsc.bg>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: UBIFS ubimkvol issue and some others...
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I am trying to use UbiFS but having some issues.
I read the documentations and FAQs for UBI and UbiFS.
My kernel is pretty old (2.6.21) (I am not able to update it now)
but I successfully added UbiFS in it!
First I erased my NAND device with flash_eraseall (flash_eraseall 
/dev/mtd5).
I added attaching the MTD device with kernel parameter ubi.mtd=5 (My 
NAND device is /dev/mtd5).
and it is successfully attached.
Kernel Log:
------------------------------------------------------
UBI: empty MTD device detected
UBI: create volume table (copy #1)
UBI: create volume table (copy #2)
UBI: attached mtd5 to ubi1
UBI: MTD device name:            "nand_data"
UBI: MTD device size:            64 MiB
UBI: physical eraseblock size:   16384 bytes (16 KiB)
UBI: logical eraseblock size:    15872 bytes
UBI: number of good PEBs:        4096
UBI: number of bad PEBs:         0
UBI: smallest flash I/O unit:    512
UBI: VID header offset:          256 (aligned 256)
UBI: data offset:                512
UBI: max. allowed volumes:       92
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     0
UBI: available PEBs:             4053
UBI: total number of reserved PEBs: 43
UBI: number of PEBs reserved for bad PEB handling: 40
UBI: max/mean erase counter: 0/0
------------------------------------------------------
Created /dev/ubi0 device by hand:

# cat /sys/class/ubi/ubi0/dev
254:0
# mknod /dev/ubi0 c 254 0

I have problems with some of the coomands:
------------------------------------------------------
# /mtdinfo
Count of MTD devices:           6
Present MTD devices:
mtdinfo: error!: libmtd failed get MTD device 0 information
         error 2 (No such file or directory)
------------------------------------------------------
The following is one of the main issues:
# /ubiformat /dev//mtd5
ubiformat: error!: cannot get information about "/dev//mtd5"
           error 2 (No such file or directory)
------------------------------------------------------
The following is one of the main issues:
# /ubimkvol /dev/ubi0 -N test -mUnable to handle kernel NULL pointer 
dereference at virtual address 00000000
pgd = c1f0c000
[00000000] *pgd=432a6031, *pte=00000000, *ppte=00000000
Internal error: Oops: 817 [#1]
Modules linked in: g_ether musb_hdrc dsplinkk(F)
CPU: 0
PC is at __down_write_nested+0xc8/0x120
LR is at __down_write_nested+0x28/0x120
pc : [<c024d92c>]    lr : [<c024d88c>]    Tainted: GF
sp : c3289c80  ip : c3289c80  fp : c3289cac
r10: c29b9000  r9 : c1d6d800  r8 : c29b9c00
r7 : 00000000  r6 : c03e6820  r5 : c32c8400  r4 : c3288000
r3 : c32c8404  r2 : c3289c80  r1 : 00000000  r0 : 00000001
Flags: nzcv  IRQs off  FIQs on  Mode SVC_32  Segment user
Control: 5317F
Table: 41F0C000  DAC: 00000015
Process ubimkvol (pid: 705, stack limit = 0xc3288260)
Stack: (0xc3289c80 to 0xc328a000)
9c80: c32c8404 c007f3c8 c03e6820 00000002 00000000 00000000 c1d6d800 
7fffefff
9ca0: c3289cbc c3289cb0 c024d998 c024d874 c3289ccc c3289cc0 c00547c8 
c024d994
9cc0: c3289ce4 c3289cd0 c01bcbf0 c00547c8 c3289d0c c3289d70 c3289d0c 
c3289ce8
9ce0: c01bccfc c01bcbcc c1d6d800 c3289d70 c1d6d800 00000000 c1d6dbd0 
c3289e68
9d00: c3289d4c c3289d10 c01b8c84 c01bccb0 c3289d34 c3289d20 c017cc2c 
c017cbe0
9d20: 8139e3f4 00000000 8139e3f4 c3289d38 c29b9140 c3289d70 00000000 
00000000
9d40: c3289e4c c3289d50 c01ba444 c01b8be4 c3288000 c29b91e4 00000000 
00000000
9d60: 00000400 c0094da8 00000400 c0036934 d50f0000 01000000 00000000 
04000001
9d80: 74736574 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
9da0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
9dc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
9de0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
9e00: 00000000 00000000 00000000 00000000 00000000 00000000 8139e3f4 
c3289e28
9e20: c0043b88 00000000 00000000 000000d5 c3289e68 00000001 c1d6d800 
bee7cb78
9e40: c3289f2c c3289e50 c01bbe80 c01b9f44 00000000 ffffffea c28dd280 
00000001
9e60: c2975d40 00000000 00000000 00000001 03d59600 00000000 00040003 
00000000
9e80: 74736574 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
9ea0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
9ec0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
9ee0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
9f00: c3289f08 c2975d40 ffffffe7 40986f00 bee7cb78 00000003 00000000 
00900036
9f20: c3289f4c c3289f30 c008fdd4 c01bbc24 c2975d40 c28dd280 bee7cb78 
00000036
9f40: c3289f7c c3289f50 c00900bc c008fd68 c2975d40 00000003 00000000 
c2975d40
9f60: fffffff7 40986f00 c0023744 c3288000 c3289fa4 c3289f80 c009011c 
c008fdf8
9f80: 00000005 00000000 c3289fa4 00000003 bee7cf97 bee7cc40 00000000 
c3289fa8
9fa0: c0022f60 c00900ec 00000003 bee7cf97 00000003 40986f00 bee7cb78 
00000000
9fc0: 00000003 bee7cf97 bee7cc40 bee7cf8a bee7cb78 00000001 03d59600 
00000000
9fe0: 400c8340 bee7cb78 0000a858 400c8344 60000010 00000003 00000000 
00000000
Backtrace:
[<c024d864>] (__down_write_nested+0x0/0x120) from [<c024d998>] 
(__down_write+0x14/0x18)
 r6:7fffefff r5:c1d6d800 r4:00000000
[<c024d984>] (__down_write+0x0/0x18) from [<c00547c8>] 
(down_write+0x10/0x14)
[<c00547b8>] (down_write+0x0/0x14) from [<c01bcbf0>] 
(leb_write_lock+0x34/0x40)
[<c01bcbbc>] (leb_write_lock+0x0/0x40) from [<c01bccfc>] 
(ubi_eba_unmap_leb+0x5c/0xac)
 r4:c3289d70
[<c01bcca0>] (ubi_eba_unmap_leb+0x0/0xac) from [<c01b8c84>] 
(ubi_change_vtbl_record+0xb0/0x114)
 r8:c3289e68 r7:c1d6dbd0 r6:00000000 r5:c1d6d800 r4:c3289d70
[<c01b8bd4>] (ubi_change_vtbl_record+0x0/0x114) from [<c01ba444>] 
(ubi_create_volume+0x510/0x640)
 r7:00000000 r6:00000000 r5:c3289d70 r4:c29b9140
[<c01b9f34>] (ubi_create_volume+0x0/0x640) from [<c01bbe80>] 
(ubi_cdev_ioctl+0x26c/0x3dc)
[<c01bbc14>] (ubi_cdev_ioctl+0x0/0x3dc) from [<c008fdd4>] 
(do_ioctl+0x7c/0x90)
[<c008fd58>] (do_ioctl+0x0/0x90) from [<c00900bc>] (vfs_ioctl+0x2d4/0x2f4)
 r7:00000036 r6:bee7cb78 r5:c28dd280 r4:c2975d40
[<c008fde8>] (vfs_ioctl+0x0/0x2f4) from [<c009011c>] (sys_ioctl+0x40/0x64)
 r9:c3288000 r8:c0023744 r6:40986f00 r5:fffffff7 r4:c2975d40
[<c00900dc>] (sys_ioctl+0x0/0x64) from [<c0022f60>] 
(ret_fast_syscall+0x0/0x2c)
 r6:bee7cc40 r5:bee7cf97 r4:00000003
Code: e5931004 e24b202c e50b302c e5832004 (e5812000)

Set volume siznote: ubimkvol[705] exited with preempt_count 2
e to 64329216
BUG: scheduling while atomic: ubimkvol/0x40000002/705
Segmentation fault
#
#
# mount -t ubifs ubi0:test /mnt/dataUBIFS error (pid 709): ubifs_get_sb: 
cannot open "ubi0:test", error -16

mount: mounting ubi0:test on /mnt/data failed: Device or resource busy
#
#
# /ubirmvol /dev/ubi0 -N test
ubirmvol: error!: cannot UBI remove volume
          error 16 (Device or resource busy)

and so I am not able to use UbiFS :(

Do you have any ideas?

Many thanks in advance,
Stanislav
