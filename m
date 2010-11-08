Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PFUys-0000AG-J2
	for linux-mtd@lists.infradead.org; Mon, 08 Nov 2010 16:54:08 +0000
Received: by wwe15 with SMTP id 15so6818792wwe.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Nov 2010 08:54:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTin86UQe8Q4PNqSnU7M0x4kVPUehcBRpS0HhHKRh@mail.gmail.com>
References: <AANLkTin86UQe8Q4PNqSnU7M0x4kVPUehcBRpS0HhHKRh@mail.gmail.com>
Date: Mon, 8 Nov 2010 17:54:03 +0100
Message-ID: <AANLkTikVMy+2VBr=SCLS2pP7k-ZMSMViWt=5yeUJvErb@mail.gmail.com>
Subject: Re: PXA310: double bit errors on NAND
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: openpxa-users@lists.sourceforge.net, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/11/8 Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com>:
> Hi all,
>
> I get "double bit error @ page" messages while working with NAND on a
> Colibri PXA310 module. Basically, when I write an UBI image to NAND,
> either with U-Boot "nand write" or "nandwrite" from mtd-utils,
> everything is OK on the *first* mount. But on the second mount I get
> several "double bit error @ page" messages and mount fails. This
> always happen (unless I'm mounting read-only -- then the problem is
> gone). But the funny thing is that if I write an UBIFS image using
> these commands:
>
> ubiformat /dev/mtd7
> ubiattach -m 7
> ubimkvol /dev/ubi0 -N rootfs -m
> ubiupdatevol /dev/ubi0_0 /rootfs.ubifs
>
> everything is OK! I can mount/umount many times and no errors.

After reading the MTD how to send bugreport[1] (which I should have
read earlier!) I enabled "UBI debugging messages" and "Extra
self-checks". The console output is now much more useful :-) AFAICS,
it shows that UBI fails to write data to PEB 3 and switches to
read-only mode. UBIFS then reports write failure at LEB 1 and then the
kernel tries to dereference a NULL pointer:

# flash_eraseall /dev/mtd7 && nandwrite -p /dev/mtd7 /rootfs.ubi
# ubiattach -m 7
# mount -t ubifs /dev/ubi0_0 /mnt
[  664.964427] UBI warning: ubi_eba_write_leb: failed to write data to PEB =
3
[  664.971275] UBI warning: ubi_ro_mode: switch to read-only mode
[  664.977087] UBIFS error (pid 1014): ubifs_write_node: cannot write
2048 bytes to LEB 1:2048, error 5
[  665.008605] kernel BUG at fs/super.c:948!
[  665.012616] Unable to handle kernel NULL pointer dereference at
virtual address 00000000
[  665.020789] pgd =3D c6888000
[  665.023484] [00000000] *pgd=3Da7ba0031, *pte=3D00000000, *ppte=3D0000000=
0
[  665.029782] Internal error: Oops: 817 [#1] PREEMPT
[  665.034537] last sysfs file: /sys/devices/virtual/ubi/ubi0/min_io_size
[  665.041017] Modules linked in:
[  665.044055] CPU: 0    Not tainted  (2.6.36-00018-g14edd22-dirty #265)
[  665.050467] PC is at __bug+0x24/0x30
[  665.054031] LR is at release_console_sem+0x1e8/0x200
[  665.058968] pc : [<c002b9e0>]    lr : [<c0040454>]    psr: 60000013
[  665.058981] sp : c6873ec0  ip : c6873df0  fp : c6873ecc
[  665.070370] r10: c686b000  r9 : c689cbe0  r8 : c686b000
[  665.075557] r7 : 00008000  r6 : 00000005  r5 : c03e5cd8  r4 : c7b1f000
[  665.082044] r3 : 00000000  r2 : 00000001  r1 : c6873e18  r0 : 00000033
[  665.088526] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment=
 user
[  665.095614] Control: 0000397f  Table: a6888018  DAC: 00000015
[  665.101317] Process mount (pid: 1014, stack limit =3D 0xc6872278)
[  665.107201] Stack: (0xc6873ec0 to 0xc6874000)
[  665.111540] 3ec0: c6873efc c6873ed0 c00a4d38 c002b9c8 c7b1f000
c6873ee0 c00bae28 c03e5cd8
[  665.119679] 3ee0: c689cbe0 c686b000 c689cbc0 00008000 c6873f24
c6873f00 c00a4e28 c00a4cc0
[  665.127811] 3f00: c686b000 00000020 c689cbc0 00000000 00000000
00008000 c6873f6c c6873f28
[  665.135944] 3f20: c00be030 c00a4df8 00000000 c6873f6c 00000000
c6873f48 c7805a00 c7452c00
[  665.144077] 3f40: 20000013 c7b9b000 be8f9eb8 00008000 00000000
c0028108 c6872000 00000000
[  665.152211] 3f60: c6873fa4 c6873f70 c00be140 c00bd9d4 c686b000
3a699d01 386d4604 c686b000
[  665.160342] 3f80: c689cbc0 c689cbe0 000b9018 be8f9c70 4018d380
00000015 00000000 c6873fa8
[  665.168476] 3fa0: c0027f60 c00be0c0 000b9018 be8f9c70 be8f9eb8
be8f9ec4 be8f9eb2 00008000
[  665.176607] 3fc0: 000b9018 be8f9c70 4018d380 00000015 00000000
0000d0b0 00008000 00000000
[  665.184742] 3fe0: 40140da4 be8f9b80 0004aefc 40140db8 20000010
be8f9eb8 ffffffff ffffffff
[  665.192860] Backtrace:
[  665.195305] [<c002b9bc>] (__bug+0x0/0x30) from [<c00a4d38>]
(vfs_kern_mount+0x84/0x118)
[  665.203266] [<c00a4cb4>] (vfs_kern_mount+0x0/0x118) from
[<c00a4e28>] (do_kern_mount+0x3c/0xe0)
[  665.211902]  r8:00008000 r7:c689cbc0 r6:c686b000 r5:c689cbe0 r4:c03e5cd8
[  665.218619] [<c00a4dec>] (do_kern_mount+0x0/0xe0) from [<c00be030>]
(do_mount+0x668/0x6ec)
[  665.226822]  r8:00008000 r7:00000000 r6:00000000 r5:c689cbc0 r4:00000020
[  665.233335] r3:c686b000
[  665.235941] [<c00bd9c8>] (do_mount+0x0/0x6ec) from [<c00be140>]
(sys_mount+0x8c/0xcc)
[  665.243751] [<c00be0b4>] (sys_mount+0x0/0xcc) from [<c0027f60>]
(ret_fast_syscall+0x0/0x2c)
[  665.252039]  r7:00000015 r6:4018d380 r5:be8f9c70 r4:000b9018
[  665.257693] Code: e59f0010 e1a01003 eb0b42cf e3a03000 (e5833000)
[  665.264041] ---[ end trace f4c146898e7fbb35 ]---
Segmentation fault
#

If I try mount one more time:

# mount -t ubifs /dev/ubi0_0 /mnt
[  726.910538] UBI DBG (pid 1018): ubi_open_volume_path: open volume
/dev/ubi0_0, mode 1
[  726.918530] UBI DBG (pid 1018): ubi_open_volume: open device 0,
volume 0, mode 1
[  726.925986] UBI DBG (pid 1018): ubi_open_volume: open device 0,
volume 0, mode 2
[  726.952020] UBIFS: read-only UBI device
[  726.955874] UBI DBG (pid 1018): ubi_is_mapped: test LEB 0:0
[  726.961568] UBIFS error (pid 1018): mount_ubifs: cannot mount
read-write - read-only media
[  726.988356] UBI DBG (pid 1018): ubi_close_volume: close device 0,
volume 0, mode 2
[  726.995913] UBI DBG (pid 1018): ubi_close_volume: close device 0,
volume 0, mode 1
[  727.007180] UBI DBG (pid 1018): ubi_open_volume_path: open volume
/dev/ubi0_0, mode 1
[  727.015195] UBI DBG (pid 1018): ubi_open_volume: open device 0,
volume 0, mode 1
[  727.022720] UBI DBG (pid 1018): ubi_open_volume: open device 0,
volume 0, mode 2
[  727.035420] UBIFS: read-only UBI device
[  727.039428] UBI DBG (pid 1018): ubi_is_mapped: test LEB 0:0
[  727.045149] UBI DBG (pid 1018): ubi_leb_read: read 4096 bytes from LEB 0=
:0:0
[  727.057599] UBI DBG (pid 1018): ubi_leb_read: read 126976 bytes
from LEB 0:1:0
[  727.089040] UBI DBG (pid 1018): ubi_io_read: fixable bit-flip
detected at PEB 3
[  727.096321] UBI DBG (pid 1018): ubi_wl_scrub_peb: schedule PEB 3
for scrubbing
[  727.104738] UBI DBG (pid 1018): ubi_leb_read: read 126976 bytes
from LEB 0:1:0
[  727.138638] UBI DBG (pid 1018): ubi_io_read: fixable bit-flip
detected at PEB 3
[  727.145919] UBI DBG (pid 1018): ubi_wl_scrub_peb: schedule PEB 3
for scrubbing
[  727.155845] UBI DBG (pid 1018): ubi_leb_read: read 126976 bytes
from LEB 0:2:0
[  727.192788] UBIFS: recovered master node from LEB 1
[  727.198194] UBI DBG (pid 1018): ubi_leb_read: read 11 bytes from LEB 0:8=
:1868
[  727.206483] UBI DBG (pid 1018): ubi_leb_read: read 12 bytes from LEB 0:8=
:1856
[  727.213789] UBI DBG (pid 1018): ubi_leb_read: read 12 bytes from LEB 0:8=
:1844
[  727.221136] UBI DBG (pid 1018): ubi_leb_read: read 12 bytes from LEB 0:8=
:1820
[  727.228335] UBI DBG (pid 1018): ubi_leb_read: read 12 bytes from LEB 0:8=
:1748
[  727.235442] UBI DBG (pid 1018): ubi_leb_read: read 17 bytes from LEB 0:8=
:1479
[  727.242813] UBI DBG (pid 1018): ubi_leb_read: read 126976 bytes
from LEB 0:3:0
[  727.285249] UBI DBG (pid 1018): ubi_leb_read: read 126976 bytes
from LEB 0:4:0
[  727.318372] UBI DBG (pid 1018): ubi_leb_read: read 17 bytes from LEB 0:8=
:1445
[  727.325575] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
[  727.331666] UBIFS: mounted read-only
[  727.335222] UBIFS: file system size:   44441600 bytes (43400 KiB,
42 MiB, 350 LEBs)
[  727.342863] UBIFS: journal size:       9023488 bytes (8812 KiB, 8
MiB, 72 LEBs)
[  727.350154] UBIFS: media format:       w4/r0 (latest is w4/r0)
[  727.355945] UBIFS: default compressor: lzo
[  727.360043] UBIFS: reserved for root:  0 bytes (0 KiB)
[  727.365179] UBI DBG (pid 1018): ubi_leb_read: read 188 bytes from
LEB 0:360:66688
[  727.373887] UBI DBG (pid 1018): ubi_leb_read: read 188 bytes from
LEB 0:360:65256
[  727.386062] UBI DBG (pid 1018): ubi_leb_read: read 188 bytes from
LEB 0:360:53928
[  727.398812] UBI DBG (pid 1018): ubi_leb_read: read 188 bytes from
LEB 0:359:90216
[  727.408316] UBI DBG (pid 1018): ubi_leb_read: read 188 bytes from LEB 0:=
354:0
[  727.416968] UBI DBG (pid 1018): ubi_leb_read: read 160 bytes from
LEB 0:352:12248
[  727.439783] UBI DBG (pid 1018): ubi_close_volume: close device 0,
volume 0, mode 1
#

It succeeds by using read-only mode. Verification:

# mount | grep ubi
/dev/ubi0_0 on /mnt type ubifs (ro,relatime)


And this is how it looks when /dev/ubi0_0 is created with ubimkvol +
ubiupdatevol (mount succeds, even in rw mode):

# mount -t ubifs /dev/ubi0_0 /mnt/
[ 1977.951135] UBI DBG (pid 1046): ubi_open_volume_path: open volume
/dev/ubi0_0, mode 1
[ 1977.959138] UBI DBG (pid 1046): ubi_open_volume: open device 0,
volume 0, mode 1
[ 1977.966629] UBI DBG (pid 1046): ubi_open_volume: open device 0,
volume 0, mode 2
[ 1977.980317] UBI DBG (pid 1046): ubi_is_mapped: test LEB 0:0
[ 1977.986369] UBI DBG (pid 1046): ubi_leb_read: read 4096 bytes from LEB 0=
:0:0
[ 1977.996481] UBI DBG (pid 1046): ubi_leb_change: atomically write
4096 bytes to LEB 0:0
[ 1978.166771] UBI DBG (pid 1046): ubi_leb_read: read 126976 bytes
from LEB 0:1:0
[ 1978.276756] UBI DBG (pid 1046): ubi_leb_read: read 126976 bytes
from LEB 0:2:0
[ 1978.386391] UBI DBG (pid 1046): ubi_leb_write: write 2048 bytes to
LEB 0:1:2048
[ 1978.458923] UBI DBG (pid 1046): ubi_leb_write: write 2048 bytes to
LEB 0:2:2048
[ 1978.520369] UBI DBG (pid 1046): ubi_leb_read: read 11 bytes from LEB 0:8=
:1868
[ 1978.529013] UBI DBG (pid 1046): ubi_leb_unmap: unmap LEB 0:9
[ 1978.534805] UBI DBG (pid 1046): ubi_leb_read: read 12 bytes from LEB 0:8=
:1856
[ 1978.541955] UBI DBG (pid 1046): ubi_leb_read: read 12 bytes from LEB 0:8=
:1844
[ 1978.549146] UBI DBG (pid 1046): ubi_leb_read: read 12 bytes from LEB 0:8=
:1820
[ 1978.556332] UBI DBG (pid 1046): ubi_leb_read: read 12 bytes from LEB 0:8=
:1748
[ 1978.563441] UBI DBG (pid 1046): ubi_leb_read: read 17 bytes from LEB 0:8=
:1479
[ 1978.570830] UBI DBG (pid 1046): ubi_leb_read: read 126976 bytes
from LEB 0:3:0
[ 1978.639280] UBI DBG (pid 1046): ubi_leb_read: read 126976 bytes
from LEB 0:4:0
[ 1978.649533] UBI DBG (pid 1046): ubi_leb_unmap: unmap LEB 0:10
[ 1978.655423] UBI DBG (pid 1046): ubi_leb_read: read 17 bytes from LEB 0:8=
:1445
[ 1978.662589] UBI DBG (pid 1046): ubi_leb_unmap: unmap LEB 0:353
[ 1978.668471] UBIFS: mounted UBI device 0, volume 0, name "rootfs"
[ 1978.674487] UBIFS: file system size:   62472192 bytes (61008 KiB,
59 MiB, 492 LEBs)
[ 1978.682095] UBIFS: journal size:       9023488 bytes (8812 KiB, 8
MiB, 72 LEBs)
[ 1978.689388] UBIFS: media format:       w4/r0 (latest is w4/r0)
[ 1978.695208] UBIFS: default compressor: lzo
[ 1978.699279] UBIFS: reserved for root:  0 bytes (0 KiB)
[ 1978.704447] UBI DBG (pid 1046): ubi_leb_read: read 188 bytes from
LEB 0:360:66688
[ 1978.715500] UBI DBG (pid 1046): ubi_leb_read: read 188 bytes from
LEB 0:360:65256
[ 1978.727822] UBI DBG (pid 1046): ubi_leb_read: read 188 bytes from
LEB 0:360:53928
[ 1978.739949] UBI DBG (pid 1046): ubi_leb_read: read 188 bytes from
LEB 0:359:90216
[ 1978.752414] UBI DBG (pid 1046): ubi_leb_read: read 188 bytes from LEB 0:=
354:0
[ 1978.764848] UBI DBG (pid 1046): ubi_leb_read: read 160 bytes from
LEB 0:352:12248
[ 1978.774388] UBI DBG (pid 1046): ubi_close_volume: close device 0,
volume 0, mode 1
# mount | grep ubi
/dev/ubi0_0 on /mnt type ubifs (rw,relatime)

I'll get back when I find out more. But of course; any help appreciated :-)

Best regards,
Bj=C3=B8rn Forsman

[1]: http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport
