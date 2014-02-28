Received: from malmo.connectblue.se ([62.109.50.233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJOpf-0007cg-If
 for linux-mtd@lists.infradead.org; Fri, 28 Feb 2014 14:54:36 +0000
From: Jonas Jonsson <jonas.jonsson@connectBlue.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Kernel panic during ubifs recovery
Date: Fri, 28 Feb 2014 14:53:34 +0000
Message-ID: <BDC40A63E95DEA429EEF34AD4A11573553046A4A@CHEWBACCA.connectBlue.local>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everybody,=0A=
=0A=
I have run into some problems with a kernel panic when mounting a ubifs vol=
ume.=0A=
Have tried most tips and tricks suggested on related issues but so far noth=
ing=0A=
has made any difference. =0A=
=0A=
The first mount after ubiformat and ubimkvol is always fine. Clean mounts=
=0A=
without recovery also works fine. The panic occurs when the mounted file sy=
stem=0A=
performs recovery, after making a sudden system reset. =0A=
=0A=
It does not matter if I use mkfs.ubifs and ubinize to make an image and fla=
shing=0A=
it using ubiformat or U-boot. In fact, all the valid configurations I have =
tried=0A=
have resulted in the same crash, at the same function in the code=0A=
(ubifs_tnc_remove_nm). Have searched lists and internet but not found anyth=
ing.=0A=
Would be very grateful for any hints to what might be wrong.=0A=
=0A=
Here is what I do:=0A=
=0A=
$ ubiformat /dev/mtd8 -s 2048 -O 2048=0A=
$ ubiattach /dev/ubi_ctrl -m 8 -O 2048=0A=
$ ubimkvol /dev/ubi0 -N testfs -s 51MiB=0A=
$ mount -t ubifs ubi0:testfs /media/testfs=0A=
- write file to volume=0A=
- Reset board (power cut)=0A=
- after reboot:=0A=
$ ubiattach /dev/ubi_ctrl -m 8 -O 2048=0A=
$ mount -t ubifs ubi0:testfs /media/testfs=0A=
---->crash----> See dump below=0A=
=0A=
I have also tried the same sequence with all params set to default,=0A=
but same panic.=0A=
=0A=
I have run mtd tests on the NAND. All tests look good except for the OOB te=
st=0A=
that fails. Read a post saying this should not affect ubifs.=0A=
=0A=
I have also enabled self-checks but got no extra info.=0A=
=0A=
System:=0A=
TI am335x CPU=0A=
Linux kernel 3.12.0=0A=
UBI/UBIFS version is two week old snapshot from public git=0A=
mdt-utils compiled from latest snapshot=0A=
Flash is 4 Gb Micron NAND MT29F4G08ABADAH4=0A=
=0A=
mtdinfo on NAND partition:=0A=
=0A=
Type:                           nand=0A=
Eraseblock size:                131072 bytes, 128.0 KiB=0A=
Amount of eraseblocks:          512 (67108864 bytes, 64.0 MiB)=0A=
Minimum input/output unit size: 2048 bytes=0A=
Sub-page size:                  512 bytes=0A=
OOB size:                       64 bytes=0A=
Character device major/minor:   90:16=0A=
Bad blocks are allowed:         true=0A=
Device is writable:             true=0A=
=0A=
Dumps from attach and mount after power loss (removed time stamps):=0A=
=0A=
root@wgp:~$ ubiattach /dev/ubi_ctrl -m 8 -O 2048=0A=
UBI: default fastmap pool size: 25=0A=
UBI: default fastmap WL pool size: 25=0A=
UBI: attaching mtd8 to ubi0=0A=
UBI: scanning is finished=0A=
UBI: attached mtd8 (name "Firmware Upgrade", size 64 MiB) to ubi0=0A=
UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes=0A=
UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 512=0A=
UBI: VID header offset: 2048 (aligned 2048), data offset: 4096=0A=
UBI: good PEBs: 512, bad PEBs: 0, corrupted PEBs: 0=0A=
UBI: user volume: 1, internal volumes: 1, max. volumes count: 128=0A=
UBI: max/mean erase counter: 11/7, WL threshold: 4096, image sequence numbe=
r: 185658281=0A=
UBI: available PEBs: 4, total reserved PEBs: 508, PEBs reserved for bad PEB=
 handling: 80=0A=
UBI: background thread "ubi_bgt0d" started, PID 219=0A=
UBI device number 0, total 512 LEBs (65011712 bytes, 62.0 MiB), available 4=
 LEBs (507904 bytes, 496.0 KiB), LEB size 126976 bytes (124.0 KiB)=0A=
=0A=
=0A=
root@wgp:~$ mount -t ubifs ubi0:testfs /media/testfs=0A=
UBI: background thread "ubi_bgt0d" started, PID 219=0A=
UBIFS: background thread "ubifs_bgt0_0" started, PID 222=0A=
UBIFS: recovery needed=0A=
Unable to handle kernel NULL pointer dereference at virtual address 0000000=
5=0A=
pgd =3D cf588000=0A=
[00000005] *pgd=3D8f55f831, *pte=3D00000000, *ppte=3D00000000=0A=
Internal error: Oops: 17 [#1] SMP ARM=0A=
Modules linked in:=0A=
CPU: 0 PID: 220 Comm: mount Not tainted 3.12.0 #26=0A=
task: cf5082c0 ti: cf5ec000 task.ti: cf5ec000=0A=
PC is at ubifs_tnc_remove_nm+0x13c/0x1b4=0A=
LR is at fallible_resolve_collision+0x234/0x3b0=0A=
pc : [<c02035c8>]    lr : [<c0200990>]    psr: 20000013=0A=
sp : cf5edcd0  ip : 00000000  fp : cf59ab3c=0A=
r10: 0000000b  r9 : 00000000  r8 : cf59a320=0A=
r7 : cf5edd58  r6 : cf59baa0  r5 : 00000001  r4 : cf59a000=0A=
r3 : 00000000  r2 : cf59a000  r1 : 00000001  r0 : c0774f30=0A=
Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user=0A=
Control: 10c5387d  Table: 8f588019  DAC: 00000015=0A=
Process mount (pid: 220, stack limit =3D 0xcf5ec248)=0A=
Stack: (0xcf5edcd0 to 0xcf5ee000)=0A=
dcc0:                                     cf5edd58 00000000 cf59a000 000000=
01=0A=
dce0: 3e06a71e 00000007 00000004 cf4ef49c 00000800 cf53a800 00000002 c02058=
8c=0A=
dd00: cf59a320 cf59baa0 cf5edd28 cf5ec000 cf59a320 cf59a000 cf59baa0 000000=
00=0A=
=0A=
------ cut some of the stack dump here --------=0A=
=0A=
dfc0: 00000000 beabcba8 b6fa74d0 00000015 00000000 00000000 00000000 000000=
00=0A=
dfe0: b6f179f0 beabcaa8 00045348 b6f17a00 60000010 beabcea5 00000992 00000a=
aa=0A=
[<c02035c8>] (ubifs_tnc_remove_nm+0x13c/0x1b4) from [<c02038c4>] (ubifs_tnc=
_add_nm+0x284/0x2d4)=0A=
[<c02038c4>] (ubifs_tnc_add_nm+0x284/0x2d4) from [<c0206938>] (ubifs_replay=
_journal+0xe08/0x1458)=0A=
[<c0206938>] (ubifs_replay_journal+0xe08/0x1458) from [<c01faf00>] (ubifs_m=
ount+0x1130/0x1da0)=0A=
[<c01faf00>] (ubifs_mount+0x1130/0x1da0) from [<c00f3bb4>] (mount_fs+0x70/0=
x164)=0A=
[<c00f3bb4>] (mount_fs+0x70/0x164) from [<c010a058>] (vfs_kern_mount+0x4c/0=
xc0)=0A=
[<c010a058>] (vfs_kern_mount+0x4c/0xc0) from [<c010c290>] (do_mount+0x74c/0=
x894)=0A=
[<c010c290>] (do_mount+0x74c/0x894) from [<c010c45c>] (SyS_mount+0x84/0xb8)=
=0A=
[<c010c45c>] (SyS_mount+0x84/0xb8) from [<c000e860>] (ret_fast_syscall+0x0/=
0x30)=0A=
Code: e3550000 ba000017 0a000012 e59d100c (e5913004) =0A=
---[ end trace 1be26c899cefce6a ]---=0A=
=0A=
=0A=
Regards,=0A=
Jonas=0A=
 =
