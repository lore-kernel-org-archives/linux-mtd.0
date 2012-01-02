Received: from p3plsmtp16-04-2.prod.phx3.secureserver.net ([173.201.193.60]
 helo=p3plwbeout16-04.prod.phx3.secureserver.net)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RhoT0-0007JB-Qm
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2012 20:26:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
Message-Id: <20120102131455.9a4f1a4b2a45238f732670fb1ee2460e.0d3c9ab8df.wbe@email16.secureserver.net>
From: "Brad Parker" <brad@heeltoe.com>
To: linux-mtd@lists.infradead.org
Subject: ubifs panic with 2.6.39 stable
Date: Mon, 02 Jan 2012 13:14:55 -0700
Mime-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Running and older 2.6.31 kernel with UBIFS I saw a panic which appears=0Ato=
 be during recovery=0Aof a bad block. The root fs (which is UBIFS) won't mo=
unt and the kernel=0Apanics.=0A=0AI upgraded the kernel 2.6.39-stable, hopi=
ng that would fix the problem,=0Aas I noticed a lot of=0Arecovery fixes had=
 gone in.  It still panics; it appears the recovery=0Afails.=0A=0AThe board=
 is essentially an Olimex SAM9-L9260, with Samsung NAND.=0A=0ABelow are the=
 interesting parts of the log (and the panic).  I'm curious=0Aif this looks=
 familiar=0Aand if there might be fixes post 2.5.39...  thanks for any insi=
ght.=0A=0A-brad=0A=0A=0A...=0A=0Aatmel_nand atmel_nand: No DMA support for =
NAND access.=0ANAND device: Manufacturer ID: 0xec, Chip ID: 0xdc (Samsung N=
AND 512MiB=0A3,3V 8-bit)=0AScanning device for bad blocks=0ABad eraseblock =
2521 at 0x000013b20000=0ABad eraseblock 3214 at 0x0000191c0000=0ACreating 2=
 MTD partitions on "NAND 512MiB 3,3V 8-bit":=0A0x000000000000-0x00000040000=
0 : "Bootloader Area"=0A0x000000400000-0x000020000000 : "Root Filesystem"=
=0AUBI: attaching mtd1 to ubi0=0AUBI: physical eraseblock size:   131072 by=
tes (128 KiB)=0AUBI: logical eraseblock size:    126976 bytes=0AUBI: smalle=
st flash I/O unit:    2048=0AUBI: VID header offset:          2048 (aligned=
 2048)=0AUBI: data offset:                4096=0AUBI: max. sequence number:=
       66253=0AUBI: attached mtd1 to ubi0=0AUBI: MTD device name:          =
  "Root Filesystem"=0AUBI: MTD device size:            508 MiB=0AUBI: numbe=
r of good PEBs:        4062=0AUBI: number of bad PEBs:         2=0AUBI: num=
ber of corrupted PEBs:   0=0AUBI: max. allowed volumes:       128=0AUBI: we=
ar-leveling threshold:    4096=0AUBI: number of internal volumes: 1=0AUBI: =
number of user volumes:     1=0AUBI: available PEBs:             219=0AUBI:=
 total number of reserved PEBs: 3843=0AUBI: number of PEBs reserved for bad=
 PEB handling: 40=0AUBI: max/mean erase counter: 45/16=0AUBI: image sequenc=
e number:  0=0AUBI: background thread "ubi_bgt0d" started, PID 269=0A=0A...=
=0A=0AVFP support v0.3: not present=0AUBIFS: recovery needed=0AUBI error: u=
bi_io_read: error -74 (ECC error) while reading 126976 bytes=0Afrom PEB 297=
0:4096, read 126976 bytes=0AUBIFS error (pid 1): ubifs_check_node: bad CRC:=
 calculated 0xf510fb95,=0Aread 0x4f0a3196=0AUBIFS error (pid 1): ubifs_chec=
k_node: bad node at LEB 3589:45128=0A[<c002a8f0>] (unwind_backtrace+0x0/0xe=
c) from [<c010c234>]=0A(ubifs_check_node+0x2b0/0x2f4)=0A[<c010c234>] (ubifs=
_check_node+0x2b0/0x2f4) from [<c0113e7c>]=0A(ubifs_scan_a_node+0x18c/0x2f0=
)=0A[<c0113e7c>] (ubifs_scan_a_node+0x18c/0x2f0) from [<c0128de0>]=0A(ubifs=
_recover_leb+0x10c/0x8e4)=0A[<c0128de0>] (ubifs_recover_leb+0x10c/0x8e4) fr=
om [<c0114ed0>]=0A(ubifs_replay_journal+0x8b0/0x1990)=0A[<c0114ed0>] (ubifs=
_replay_journal+0x8b0/0x1990) from [<c0108a08>]=0A(ubifs_fill_super+0xd34/0=
x18fc)=0A[<c0108a08>] (ubifs_fill_super+0xd34/0x18fc) from [<c0109868>]=0A(=
ubifs_mount+0x298/0x310)=0A[<c0109868>] (ubifs_mount+0x298/0x310) from [<c0=
08e0bc>]=0A(mount_fs+0x10/0xc4)=0A[<c008e0bc>] (mount_fs+0x10/0xc4) from [<=
c00a3d60>]=0A(vfs_kern_mount+0x50/0x88)=0A[<c00a3d60>] (vfs_kern_mount+0x50=
/0x88) from [<c00a3ddc>]=0A(do_kern_mount+0x34/0xc8)=0A[<c00a3ddc>] (do_ker=
n_mount+0x34/0xc8) from [<c00a448c>]=0A(do_mount+0x61c/0x684)=0A[<c00a448c>=
] (do_mount+0x61c/0x684) from [<c00a4578>]=0A(sys_mount+0x84/0xc4)=0A[<c00a=
4578>] (sys_mount+0x84/0xc4) from [<c0008ba4>]=0A(mount_block_root+0x100/0x=
2ac)=0A[<c0008ba4>] (mount_block_root+0x100/0x2ac) from [<c0008e3c>]=0A(pre=
pare_namespace+0x88/0x178)=0A[<c0008e3c>] (prepare_namespace+0x88/0x178) fr=
om [<c0008404>]=0A(kernel_init+0x100/0x13c)=0A[<c0008404>] (kernel_init+0x1=
00/0x13c) from [<c0026e34>]=0A(kernel_thread_exit+0x0/0x8)=0AUBIFS error (p=
id 1): ubifs_recover_leb: bad node=0AUBIFS error (pid 1): ubifs_scanned_cor=
ruption: corruption at LEB=0A3589:45128=0AUBIFS error (pid 1): ubifs_scanne=
d_corruption: first 8192 bytes from LEB=0A3589:45128=0AUBIFS error (pid 1):=
 ubifs_recover_leb: LEB 3589 scanning failed=0AVFS: Cannot open root device=
 "ubi0:rootfs" or unknown-block(0,0)=0APlease append a correct "root=3D" bo=
ot option; here are the available=0Apartitions:=0AKernel panic - not syncin=
g: VFS: Unable to mount root fs on=0Aunknown-block(0,0)=0A[<c002a8f0>] (unw=
ind_backtrace+0x0/0xec) from [<c024e1c0>]=0A(panic+0x54/0x17c)=0A[<c024e1c0=
>] (panic+0x54/0x17c) from [<c0008d00>]=0A(mount_block_root+0x25c/0x2ac)=0A=
[<c0008d00>] (mount_block_root+0x25c/0x2ac) from [<c0008e3c>]=0A(prepare_na=
mespace+0x88/0x178)=0A[<c0008e3c>] (prepare_namespace+0x88/0x178) from [<c0=
008404>]=0A(kernel_init+0x100/0x13c)=0A[<c0008404>] (kernel_init+0x100/0x13=
c) from [<c0026e34>]=0A(kernel_thread_exit+0x0/0x8)=0A=0A=0A
