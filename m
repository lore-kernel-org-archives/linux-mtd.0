Received: from mail1.bemta12.messagelabs.com ([216.82.251.7])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WxSp9-0007N8-Ps
 for linux-mtd@lists.infradead.org; Thu, 19 Jun 2014 03:15:41 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Thu, 19 Jun 2014 13:15:11 +1000
Subject: Correct behaviour of ubiattach / ubiformat in the face of ECC errors?
Message-ID: <EACD232272DA4849B060F0828564D13B0AA3DB90FC@ntcex01.corp.netcomm.com.au>
Content-Language: en-AU
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


Hi all,


I'm debugging a NAND driver and I'm unsure about what the correct behaviou=
r
of ubiformat / ubiattach ought to be in the face of uncorrectable ECC erro=
rs.

This is a 2.6.35 kernel, with UBI/UBIFS updated to the top of
git://git.infradead.org/~dedekind/ubifs-v2.6.35.git and mtd-utils v1.5.1.

My question is, what is ubiattach / ubiformat supposed to do if a non-corr=
ectable=20
ECC error occurs in a block during the scan?

My gut feeling says that ubiattach should fail if the PEB was in use, but =
ubiformat
should mark the PEB as bad and continue.

This is not the behaviour I'm observing. The broken PEB in the examples be=
low
contains a EC header, but no VID header - it's not in use.

To complicate matters, I'm also unsure about the correct return value from=
 the
NAND driver in this situation. Depending on which documentation I read, it=
 should
now return -1, -EIO or -EBADMSG.

So I tried all of them.

Ubiformat. fails for -EPERM & -EIO, enters infinite read loop for -EBADMSG=
:

[   14.800000] SWECC(1) - MBE=20detected ([5ff00]-0000/0)
[   14.810000] [T49]bovine_nand_read_page_hwecc:671: Returned -1 [-EPERM],=
 page=3D0x5ff00
libmtd: error!: cannot read 64 bytes from mtd6 (eraseblock 13796, offset 0=
)
        error 1 (Operation not permitted)
ubiformat: error!: failed to scan mtd6 (/dev/mtd6)

[   14.840000] [T49]bovine_nand_read_page_hwecc:671: Returned -5 [-EIO], p=
age=3D0x5ff00
libmtd: error!: cannot read 64 bytes from mtd6 (eraseblock 13796, offset 0=
)
        error 5 (Input/output error)
ubiformat: error!: failed to scan mtd6 (/dev/mtd6)

[   27.040000] HWECC(1) - MBE detected ([5ff00]-0000)
[   27.040000] SWECC(1) - MBE detected ([5ff00]-0000/0)
[   27.050000] [T4a]bovine_nand_read_page_hwecc:671: Returned -74 [-EBADMS=
G], page=3D0x5ff00
[   27.060000] HWECC(1) - MBE detected ([5ff00]-0000)
[   27.060000] SWECC(1) - MBE detected ([5ff00]-0000/0)
[   27.070000] [T4a]bovine_nand_read_page_hwecc:671: Returned -74 [-EBADMS=
G], page=3D0x5ff00
[   27.080000] HWECC(1) - MBE detected ([5ff00]-0000)
[   27.080000] SWECC(1) - MBE detected ([5ff00]-0000/0)
[   27.090000] [T4a]bovine_nand_read_page_hwecc:671: Returned -74 [-EBADMS=
G], page=3D0x5ff00
[   27.090000] HWECC(1) - MBE detected ([5ff00]-0000)
[   27.100000] SWECC(1) - MBE detected ([5ff00]-0000/0)
[   27.100000] [T4a]bovine_nand_read_page_hwecc:671: Returned -74 [-EBADMS=
G], page=3D0x5ff00
[   27.110000] HWECC(1) - MBE detected ([5ff00]-0000)
[   27.120000] SWECC(1) - MBE detected ([5ff00]-0000/0)
... Goes on forever.

Ubiattach. This fails in all cases, although the error is significantly di=
fferent when -EBADMSG
is returned:

[   19.910000] HWECC(1) - MBE detected ([5ff00]-0000)
[   19.920000] SWECC(1) - MBE detected ([5ff00]-0000/0)
[   19.920000] [T84]bovine_nand_read_page_hwecc:671: Returned -1 [-EPERM],=
 page=3D0x5ff00
[   19.930000] UBI warning: ubi_io_read: error -1 while reading 64 bytes f=
rom PEB 13796:0, read only 0 bytes, retry
[   19.940000] HWECC(1) - MBE detected ([5ff00]-0000)
[   19.950000] SWECC(1) - MBE detected ([5ff00]-0000/0)
[   19.950000] [T84]bovine_nand_read_page_hwecc:671: Returned -1 [-EPERM],=
 page=3D0x5ff00
[   19.960000] UBI warning: ubi_io_read: error -1 while reading 64 bytes f=
rom PEB 13796:0, read only 0 bytes, retry
[   19.970000] HWECC(1) - MBE detected ([5ff00]-0000)
[   19.970000] SWECC(1) - MBE detected ([5ff00]-0000/0)
[   19.980000] [T84]bovine_nand_read_page_hwecc:671: Returned -1 [-EPERM],=
 page=3D0x5ff00
[   19.990000] UBI warning: ubi_io_read: error -1 while reading 64 bytes f=
rom PEB 13796:0, read only 0 bytes, retry
[   20.000000] HWECC(1) - MBE detected ([5ff00]-0000)
[   20.000000] SWECC(1) - MBE detected ([5ff00]-0000/0)
[   20.010000] [T84]bovine_nand_read_page_hwecc:671: Returned -1 [-EPERM],=
 page=3D0x5ff00
[   20.020000] UBI error: ubi_io_read: error -1 while reading 64 bytes fro=
m PEB 13796:0, read 0 bytes
[   20.020000] [<c002a420>] (unwind_backtrace+0x0/0xec) from [<c01e23a0>] =
(ubi_io_read+0x1dc/0x2a4)
[   20.030000] [<c01e23a0>] (ubi_io_read+0x1dc/0x2a4) from [<c01e2814>] (u=
bi_io_read_ec_hdr+0x68/0x214)
[   20.040000] [<c01e2814>] (ubi_io_read_ec_hdr+0x68/0x214) from [<c01e6d3=
0>] (scan_peb+0x54/0x5e8)
[   20.050000] [<c01e6d30>] (scan_peb+0x54/0x5e8) from [<c01e73a8>] (scan_=
all+0xe4/0x2f8)
[   20.060000] [<c01e73a8>] (scan_all+0xe4/0x2f8) from [<c01e75c8>] (ubi_a=
ttach+0xc/0xbc)
[   20.070000] [<c01e75c8>] (ubi_attach+0xc/0xbc) from [<c01dcabc>] (ubi_a=
ttach_mtd_dev+0x1e4/0x570)
[   20.080000] [<c01dcabc>] (ubi_attach_mtd_dev+0x1e4/0x570) from [<c01dcf=
b8>] (ctrl_cdev_ioctl+0xd0/0x160)
[   20.090000] [<c01dcfb8>] (ctrl_cdev_ioctl+0xd0/0x160) from [<c0095898>]=
 (vfs_ioctl+0x2c/0x70)
[   20.090000] [<c0095898>] (vfs_ioctl+0x2c/0x70) from [<c0095fa4>] (do_vf=
s_ioctl+0x300/0x32c)
[   20.100000] [<c0095fa4>] (do_vfs_ioctl+0x300/0x32c) from [<c0096008>] (=
sys_ioctl+0x38/0x5c)
[   20.110000] [<c0096008>] (sys_ioctl+0x38/0x5c) from [<c0024e80>] (ret_f=
ast_syscall+0x0/0x2c)
[   20.120000] UBI error: ubi_attach_mtd_dev: failed to attach mtd6, error=
 -1
ubiattach: error!: cannot attach mtd6
           error 1 (Operation not permitted)
ubimount: [ubiattach /dev/ubi_ctrl -m 6 -d 11 -O 4096]->255

[   19.940000] HWECC(1) - MBE detected ([5ff00]-0000)
[   19.940000] SWECC(1) - MBE detected ([5ff00]-0000/0)
[   19.950000] [T01]bovine_nand_read_page_hwecc:671: Returned -5 [-EIO], p=
age=3D0x5ff00
[   19.960000] UBI warning: ubi_io_read: error -5 while reading 64 bytes f=
rom PEB 13796:0, read only 0 bytes, retry
[   19.970000] HWECC(1) - MBE detected ([5ff00]-0000)
[   19.970000] SWECC(1) - MBE detected ([5ff00]-0000/0)
[   19.980000] [T01]bovine_nand_read_page_hwecc:671: Returned -5 [-EIO], p=
age=3D0x5ff00
[   19.980000] UBI warning: ubi_io_read: error -5 while reading 64 bytes f=
rom PEB 13796:0, read only 0 bytes, retry
[   19.990000] HWECC(1) - MBE detected ([5ff00]-0000)
[   20.000000] SWECC(1) - MBE detected ([5ff00]-0000/0)
[   20.000000] [T01]bovine_nand_read_page_hwecc:671: Returned -5 [-EIO], p=
age=3D0x5ff00
[   20.010000] UBI warning: ubi_io_read: error -5 while reading 64 bytes f=
rom PEB 13796:0, read only 0 bytes, retry
[   20.020000] HWECC(1) - MBE detected ([5ff00]-0000)
[  =2020.030000] SWECC(1) - MBE detected ([5ff00]-0000/0)
[   20.030000] [T01]bovine_nand_read_page_hwecc:671: Returned -5 [-EIO], p=
age=3D0x5ff00
[   20.040000] UBI error: ubi_io_read: error -5 while reading 64 bytes fro=
m PEB 13796:0, read 0 bytes
[   20.050000] [<c002a420>] (unwind_backtrace+0x0/0xec) from [<c01e2374>] =
(ubi_io_read+0x1dc/0x2a4)
[   20.060000] [<c01e2374>] (ubi_io_read+0x1dc/0x2a4) from [<c01e27e8>] (u=
bi_io_read_ec_hdr+0x68/0x214)
[   20.070000] [<c01e27e8>] (ubi_io_read_ec_hdr+0x68/0x214) from [<c01e6d0=
4>] (scan_peb+0x54/0x5e8)
[   20.070000] [<c01e6d04>] (scan_peb+0x54/0x5e8) from [<c01e737c>] (scan_=
all+0xe4/0x2f8)
[   20.080000] [<c01e737c>] (scan_all+0xe4/0x2f8) from [<c01e759c>] (ubi_a=
ttach+0xc/0xbc)
[   20.090000] [<c01e759c>] (ubi_attach+0xc/0xbc) from [<c01dca90>] (ubi_a=
ttach_mtd_dev+0x1e4/0x570)
[   20.100000] [<c01dca90>] (ubi_attach_mtd_dev+0x1e4/0x570) from [<c01dcf=
8c>] (ctrl_cdev_ioctl+0xd0/0x160)
[   20.110000] [<c01dcf8c>] (ctrl_cdev_ioctl+0xd0/0x160) from [<c0095898>]=
 (vfs_ioctl+0x2c/0x70)
[   20.120000] [<c0095898>] (vfs_ioctl+0x2c/0x70) from [<c0095fa4>] (do_vf=
s_ioctl+0x300/0x32c)
[   20.130000] [<c0095fa4>] (do_vfs_ioctl+0x300/0x32c) from [<c0096008>] (=
sys_ioctl+0x38/0x5c)
[   20.130000] [<c0096008>] (sys_ioctl+0x38/0x5c) from [<c0024e80>] (ret_f=
ast_syscall+0x0/0x2c)
[   20.150000] UBI error: ubi_attach_mtd_dev: failed to attach mtd6, error=
 -5
ubiattach: error!: cannot attach mtd6
           error 5 (Input/output error)
ubimount: [ubiattach /dev/ubi_ctrl -m 6 -d 11 -O 4096]->255

[   20.080000] HWECC(1) - MBE detected ([5ff00]-0000)
[   20.080000] SWECC(1) - MBE detected ([5ff00]-0000/0)
[   20.090000] [T88]bovine_nand_read_page_hwecc:671: Returned -74 [-EBADMS=
G], page=3D0x5ff00
[   20.090000] UBI warning: ubi_io_read: error -74 (ECC error) while readi=
ng 64 bytes from PEB 13796:0, read only 0 bytes, retry
[   20.110000] HWECC(1) - MBE detected ([5ff00]-0000)
[   20.110000] SWECC(1) - MBE detected ([5ff00]-0000/0)
[   20.120000] [T88]bovine_nand_read_page_hwecc:671: Returned -74 [-EBADMS=
G], page=3D0x5ff00
[   20.120000] UBI warning: ubi_io_read: error -74 (ECC error) while readi=
ng 64 bytes from PEB 13796:0, read only 0 bytes, retry
[   20.140000] HWECC(1) - MBE detected ([5ff00]-0000)
[   20.140000] SWECC(1) - MBE detected ([5ff00]-0000/0)
[   20.150000] [T88]bovine_nand_read_page_hwecc:671: Returned -74 [-EBADMS=
G], page=3D0x5ff00
[   20.150000] UBI warning: ubi_io_read: error -74 (ECC error) while readi=
ng 64 bytes from PEB 13796:0, read only 0 bytes, retry
[   20.170000] HWECC(1) - MBE detected ([5ff00]-0000)
[   20.170000] SWECC(1) - MBE detected ([5ff00]-0000/0)
[   20.180000] [T88]bovine_nand_read_page_hwecc:671: Returned -74 [-EBADMS=
G], page=3D0x5ff00
[   20.180000] UBI error: ubi_io_read: error -74 (ECC error) while reading=
 64 bytes from PEB 13796:0, read 0 bytes
[   20.190000] [<c002a420>] (unwind_backtrace+0x0/0xec) from [<c01e23a0>] =
(ubi_io_read+0x1dc/0x2a4)
[   20.200000] [<c01e23a0>] (ubi_io_read+0x1dc/0x2a4) from [<c01e2814>] (u=
bi_io_read_ec_hdr+0x68/0x214)
[   20.210000] [<c01e2814>] (ubi_io_read_ec_hdr+0x68/0x214) from [<c01e6d3=
0>] (scan_peb+0x54/0x5e8)
[   20.220000] [<c01e6d30>] (scan_peb+0x54/0x5e8) from [<c01e73a8>] (scan_=
all+0xe4/0x2f8)
[   20.230000] [<c01e73a8>] (scan_all+0xe4/0x2f8) from [<c01e75c8>] (ubi_a=
ttach+0xc/0xbc)
[   20.240000] [<c01e75c8>] (ubi_attach+0xc/0xbc) from [<c01dcabc>] (ubi_a=
ttach_mtd_dev+0x1e4/0x570)
[   20.240000] [<c01dcabc>] (ubi_attach_mtd_dev+0x1e4/0x570) from [<c01dcf=
b8>] (ctrl_cdev_ioctl+0xd0/0x160)
[   20.250000] [<c01dcfb8>] (ctrl_cdev_ioctl+0xd0/0x160) from [<c0095898>]=
 (vfs_ioctl+0x2c/0x70)
[   20.260000] [<c0095898>] (vfs_ioctl+0x2c/0x70) from [<c0095fa4>] (do_vf=
s_ioctl+0x300/0x32c)
[   20.270000] [<c0095fa4>] (do_vfs_ioctl+0x300/0x32c) from [<c0096008>] (=
sys_ioctl+0x38/0x5c)
[   20.280000] [<c0096008>] (sys_ioctl+0x38/0x5c) from [<c0024e80>] (ret_f=
ast_syscall+0x0/0x2c)
[   20.290000] UBI assert failed in ubi_io_read at 203 (pid 197)
[   20.290000] [<c002a420>] (unwind_backtrace+0x0/0xec) from [<c01e23e4>] =
(ubi_io_read+0x220/0x2a4)
[   20.300000] [<c01e23e4>] (ubi_io_read+0x220/0x2a4) from [<c01e2814>] (u=
bi_io_read_ec_hdr+0x68/0x214)
[   20.310000] [<c01e2814>] (ubi_io_read_ec_hdr+0x68/0x214) from [<c01e6d3=
0>] (scan_peb+0x54/0x5e8)
[   20.320000] [<c01e6d30>] (scan_peb+0x54/0x5e8) from [<c01e73a8>] (scan_=
all+0xe4/0x2f8)
[   20.330000] [<c01e73a8>] (scan_all+0xe4/0x2f8) from [<c01e75c8>] (ubi_a=
ttach+0xc/0xbc)
[   20.340000] [<c01e75c8>] (ubi_attach+0xc/0xbc) from [<c01dcabc>] (ubi_a=
ttach_mtd_dev+0x1e4/0x570)
[   20.340000] [<c01dcabc>] (ubi_attach_mtd_dev+0x1e4/0x570) from [<c01dcf=
b8>] (ctrl_cdev_ioctl+0xd0/0x160)
[   20.350000] [<c01dcfb8>] (ctrl_cdev_ioctl+0xd0/0x160) from [<c0095898>]=
 (vfs_ioctl+0x2c/0x70)
[   20.360000] [<c0095898>] (vfs_ioctl+0x2c/0x70) from [<c0095fa4>] (do_vf=
s_ioctl+0x300/0x32c)
[   20.370000] [<c0095fa4>] (do_vfs_ioctl+0x300/0x32c) from [<c0096008>] (=
sys_ioctl+0x38/0x5c)
[   20.380000] [<c0096008>] (sys_ioctl+0x38/0x5c) from [<c0024e80>] (ret_f=
ast_syscall+0x0/0x2c)
[   20.390000] UBI error: ubi_attach_mtd_dev: failed to attach mtd6, error=
 -5
ubiattach: error!: cannot attach mtd6
           error 5 (Input/output error)
ubimount: [ubiattach /dev/ubi_ctrl -m 6 -d 11 -O 4096]->255


Best reagrds,

Iwo

______________________________________________________________________
This communication contains information which may be confidential or privi=
leged. The information is intended solely for the use of the individual or=
 entity named above.  If you are not the intended recipient, be aware that=
 any disclosure, copying, distribution or use of the contents of this info=
rmation is prohibited.  If you have received this communication in error, =
please notify me by telephone immediately.
______________________________________________________________________
