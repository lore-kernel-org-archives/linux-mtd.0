Received: from wx-out-0506.google.com ([66.249.82.224])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IW8KU-0001Sh-EE
	for linux-mtd@lists.infradead.org; Fri, 14 Sep 2007 06:23:21 -0400
Received: by wx-out-0506.google.com with SMTP id s7so791600wxc
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Sep 2007 03:23:17 -0700 (PDT)
Message-ID: <be4b62bb0709140323i1cedf449of881c3935127b581@mail.gmail.com>
Date: Fri, 14 Sep 2007 11:23:16 +0100
From: "Andre Oliveira" <anbadeol@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: DiskOnChip 2000
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Aug 09 2007, Andy Kennedy wrote on linux-mtd:
> The struggle continues.  This particular chip is the MD2202-D32-X.
> Has anyone ever had any success with installing Linux on this chip?

Hi!
Unfortunately, I have to work with those exact chips, too! :-(
And I also could never get them to work with Linux MTD (see below),
and the proprietary drivers from the (now gone) M-Systems are for
Linux 2.4, at best, which is just too old for my purposes.

So, I finally ended up writing a driver for Linux 2.6 (2.6.22) from
scratch. Unfortunately, it still uses the proprietary libosak.a from
M-Systems, so it is not entirely free :-( But at least it works for
me! Here it is:
http://anbadeol.googlepages.com/doc2000.html

I also wrote a HOWTO with the steps I take to install and boot a Linux
kernel image from the DiskOnChip:
http://anbadeol.googlepages.com/doc2000-howto.html

I hope any of these help you!

> What is so different between this chip and others that would make
> it so I cannot get it to behave correctly?

I do not know, either. :-( But the last time I tried Linux MTD with
this chip, it got automatically formated during boot, without asking
me anything:

<5>Linux version 2.6.22 (abo@lula) (gcc version 4.1.1) #2 Thu Aug 9
12:03:29 WEST 2007
...
<6>NFTL driver: nftlcore.c $Revision: 1.98 $, nftlmount.c $Revision: 1.41 $
<5>DiskOnChip found at 0xd0000
<6>DiskOnChip 2000 responds to DWORD access
<7>Detected 2 chips per floor.
<6>NAND device: Manufacturer ID: 0x98, Chip ID: 0x73 (Toshiba NAND
16MiB 3,3V 8-bit)
<6>2 NAND chips detected
<6>Found DiskOnChip ANAND Media Header at 0x10000
<6>Found DiskOnChip ANAND Media Header at 0x14000
<6>    DataOrgID        =3D ANAND
<4>    NumEraseUnits    =3D 2044
<4>    FirstPhysicalEUN =3D 4
<4>    FormattedSize    =3D 32768000
<4>    UnitSizeFactor   =3D 0
<4>UnitSizeFactor=3D0x00 detected.  Correct value is assumed to be 0xff.
<7>Bad block table at page 129, version 0x55
<7>Bad block table at page 161, version 0x55
<4>Formatting block 6
<4>Formatting block 7
...
<4>Formatting block 135
<6> nftla: unknown partition table
<7>Found alias of DOC at 0xd0000 to 0xd2000
<7>Found alias of DOC at 0xd0000 to 0xd4000
<7>Found alias of DOC at 0xd0000 to 0xd6000

Then, I rebooted, and got a kernel panic:

<6> nftla: unknown partition table
<1>BUG: unable to handle kernel paging request at virtual address c3075280
<1> printing eip:
<4>c019af1e
<1>*pde =3D 00000000
<0>Oops: 0002 [#1]
<0>CPU:    0
<0>EIP:    0060:[<c019af1e>]    Not tainted VLI
<0>EFLAGS: 00010282   (2.6.22 #4)
<0>EIP is at nand_fill_oob+0x36/0xd2
<0>eax: c1151f78   ebx: c105d4b8   ecx: 00000004   edx: 00000010
<0>esi: c1151f78   edi: c3075280   ebp: 00007fe0   esp: c1151b44
<0>ds: 007b   es: 007b   fs: 0000  gs: 0000  ss: 0068
<0>Process nftld (pid: 110, ti=3Dc1150000 task=3Dc1153a90 task.ti=3Dc115000=
0)
<0>Stack: c105d4b8 c105d400 00000200 00000000 c117d000 00007fe0
c019b41b ffffffff
<0>       00000003 c105d590 c105d400 c105d4b8 00007fff 00000001
0000ffe0 0000001f
<0>       00000000 00000200 c1151f78 c117d000 c1151bcc c1151f78
01ffc000 00000000
<0>Call Trace:
<0> [<c019b41b>] nand_do_write_ops+0x260/0x2f0
<0> [<c019b547>] nand_write_oob+0x9c/0xb1
<0> [<c0197200>] nftl_write+0x48/0x59
<0> [<c0197dc8>] nftl_writeblock+0x82e/0x83e
<0> [<c012a671>] __alloc_pages+0x51/0x27b
<0> [<c0137a90>] cache_alloc_refill+0x1ff/0x3b3
<0> [<c01471da>] d_alloc+0x1b/0x150
<0> [<c013f391>] do_lookup+0x4f/0x140
<0> [<c01465f6>] d_kill+0x37/0x47
<0> [<c014661b>] dput+0x15/0xcb
<0> [<c0149c16>] mntput_no_expire+0x11/0x47
<0> [<c0140c8a>] __link_path_walk+0x9d9/0xa08
<0> [<c0149c16>] mntput_no_expire+0x11/0x47
<0> [<c0140d5e>] link_path_walk+0xa5/0xaf
<0> [<c010cc78>] __activate_task+0x1c/0x28
<0> [<c011c88a>] autoremove_wake_function+0x15/0x35
<0> [<c010cb4f>] __wake_up_common+0x31/0x4f
<0> [<c01290f1>] mempool_free+0x4a/0x4e
<0> [<c0154182>] bio_free+0x21/0x2c
<0> [<c0152c46>] end_bio_bh_io_sync+0x0/0x37
<0> [<c0154041>] bio_put+0x22/0x23
<0> [<c0152c79>] end_bio_bh_io_sync+0x33/0x37
<0> [<c01541e8>] bio_endio+0x50/0x57
<0> [<c016edbf>] elv_rb_del+0x20/0x2e
<0> [<c016f0cb>] elv_dispatch_add_tail+0x1b/0x3d
<0> [<c0196ea9>] mtd_blktrans_thread+0xf9/0x150
<0> [<c0196db0>] mtd_blktrans_thread+0x0/0x150
<0> [<c011c720>] kthread+0x36/0x5a
<0> [<c011c6ea>] kthread+0x0/0x5a
<0> [<c0103417>] kernel_thread_helper+0x7/0x10
<0> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
<0>Code: 24 89 d0 8b 51 0c 8b 09 83 f9 01 74 30 72 09 83 f9 02 0f 85
a4 00 00 00 8b 7b 14 8b 1c 24 89
d1 89 c6 c1 e9 02 03 bb 80 00 00 00 <f3> a5 89 d1 83 e1 03 74 02 f3 a4
01 d0 e9 83 00 00 00 8b 34 24
<0>EIP: [<c019af1e>] nand_fill_oob+0x36/0xd2 SS:ESP 0068:c1151b44

Can anyone help me? I give up! :-(

--
Andr=E9 Oliveira
http://anbadeol.googlepages.com
