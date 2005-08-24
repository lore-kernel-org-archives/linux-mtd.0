Received: from xproxy.gmail.com ([66.249.82.199])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E7qAG-0005yn-Tt
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2005 03:59:23 -0400
Received: by xproxy.gmail.com with SMTP id i30so25673wxd
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Aug 2005 00:59:14 -0700 (PDT)
Message-ID: <802ad8b60508240052462d2d5c@mail.gmail.com>
Date: Wed, 24 Aug 2005 13:22:12 +0530
From: Suresh K <sureshkanniappan@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <430B1B29.2010004@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <802ad8b60508222243345b5e18@mail.gmail.com>
	<802ad8b60508230349683751c6@mail.gmail.com>
	<430B1B29.2010004@inf.u-szeged.hu>
Cc: 
Subject: Re: JFFS2 Mount issue
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Can you send me more information about it? For example kernel log with
> debug level 1. And please make sure that you use the latest mtd          =
  > snapshot
> with newest summary patch - use only erase block summary, centralized
> summary is now under construction.

   Initially I have used the EBS patch and mtd-snapshots released on
11/08/2005. I faced the segmentation fault issue with this patches
used in 2.6.10 kernel.

   Today I have downloaded the latest EBS patch and mtd-snapshot
released on 23/08/2005 from the below sites

   http://www.inf.u-szeged.hu/jffs2/mount.php - EBS patch
   ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/ - MTD 23/08/05

Applied the EBS patches to JFFS2 utilities in MTD snapshots, patched
the 2.6.10 kernel with the command /mtd/kernelpatch.sh -2
/usr/src/linux-2.6.10.
Created the jffs2 image with new mkfs.jffs2 utility. Created the jffs2
image with sumtool utility. Mounted the same. Copied the 1.5MB file to
JFFS2 partition, still i faced the Segmentation fault issue. The
following are the debug messages posted by the kernel.

/dev/hdc13 (120MB) - jffs2 image created by mkfs.jffs2 utility
/dev/hdc14 (120MB) - jffs2 image created with sumtool utility after
mkfs.jffs2 utility.

Only 472K of 1.5MB file is copied into the JFFS2 partition in both the
cases. This is FYI.

-----------------------------Kernel Message Starts-------------------------=
---
blkmtd: version $Revision: 1.26 $
blkmtd: mtd0: [/dev/hda14] erase_size =3D 256KiB=20
JFFS2 version 2.2. (NAND) (SUMMARY)  (C) 2001-2003 Red Hat, Inc.
jffs2: Flash size not aligned to erasesize, reducing to 128256KiB
JFFS2: jffs2_sum_write_sumnode(): empty summary info!!!
------------[ cut here ]------------
kernel BUG at fs/jffs2/summary.c:661!
invalid operand: 0000 [#1]
PREEMPT SMP=20
Modules linked in: jffs2 zlib_deflate zlib_inflate blkmtd via_rhine ehci_hc=
d
CPU:    0
EIP:    0060:[<de90b7ac>]    Not tainted VLI
EFLAGS: 00010202   (2.6.10)=20
EIP is at jffs2_sum_write_sumnode+0x2c/0x170 [jffs2]
eax: 0000003b   ebx: 0000003c   ecx: d4553c9c   edx: de90f7e0
esi: d98f4890   edi: dd420a00   ebp: d98f4890   esp: d4553c98
ds: 007b   es: 007b   ss: 0068
Process cp (pid: 2492, threadinfo=3Dd4552000 task=3Dd629a5e0)
Stack: de90f7e0 0000003c d98f4890 dd420a00 00000012 de8ff0eb dd420a00 00000=
012=20
       dd420a00 00000000 dd420a00 de8fec9a dd420a00 000000c4 d4553d3c d4553=
d40=20
       00000012 000000b4 d4552000 d94491b0 000000b4 00000000 dd420aec 00000=
00d=20
Call Trace:
 [<de8ff0eb>] jffs2_do_reserve_space+0x15b/0x190 [jffs2]
 [<de8fec9a>] jffs2_reserve_space+0x14a/0x1d0 [jffs2]
 [<de901581>] jffs2_write_inode_range+0x51/0x2a0 [jffs2]
 [<de8fce99>] jffs2_commit_write+0xc9/0x1be [jffs2]
 [<c013b1a5>] generic_file_buffered_write+0x195/0x580
 [<c010400c>] apic_timer_interrupt+0x1c/0x30
 [<c01766e3>] __mark_inode_dirty+0x193/0x1a0
 [<c0139ba6>] do_generic_mapping_read+0x336/0x4a0
 [<c013b814>] __generic_file_aio_write_nolock+0x284/0x4a0
 [<c013bb5a>] __generic_file_write_nolock+0x9a/0xc0
 [<c012e3f0>] autoremove_wake_function+0x0/0x40
 [<c013bd50>] generic_file_write+0x40/0xb0
 [<c0156702>] vfs_write+0x92/0xe0
 [<c01567fd>] sys_write+0x3d/0x70
 [<c0102fd9>] sysenter_past_esp+0x52/0x79
Code: 57 56 53 8b 44 24 14 8b 90 58 01 00 00 8b a8 8c 00 00 00 8b 42
04 85 c0 74 07 8b 42 0c 85 c0 75 1d 68 e0 f7 90 de e8 64 fe 80 e1 <0f>
0b 95 02 27 fb 90 de 58 8b 44 24 14 8b 90 58 01 00 00 8b 02
 <6>note: cp[2492] exited with preempt_count 1
scheduling while atomic: cp/0x00000001/2492
 [<c038afd6>] schedule+0xb66/0xb70
 [<c01470fa>] unmap_page_range+0x3a/0x60
 [<c0147327>] unmap_vmas+0x207/0x250
 [<c014b690>] exit_mmap+0x80/0x170
 [<c0119184>] mmput+0x24/0x80
 [<c011db45>] do_exit+0x195/0x450
 [<c010480a>] die+0x16a/0x170
 [<c0104a90>] do_invalid_op+0x0/0x90
 [<c0104b0a>] do_invalid_op+0x7a/0x90
 [<de90b7ac>] jffs2_sum_write_sumnode+0x2c/0x170 [jffs2]
 [<c012e40b>] autoremove_wake_function+0x1b/0x40
 [<c01172f6>] __wake_up_common+0x36/0x60
 [<c0117348>] __wake_up+0x28/0x40
 [<c01040eb>] error_code+0x2b/0x30
 [<de90b7ac>] jffs2_sum_write_sumnode+0x2c/0x170 [jffs2]
 [<de8ff0eb>] jffs2_do_reserve_space+0x15b/0x190 [jffs2]
 [<de8fec9a>] jffs2_reserve_space+0x14a/0x1d0 [jffs2]
 [<de901581>] jffs2_write_inode_range+0x51/0x2a0 [jffs2]
 [<de8fce99>] jffs2_commit_write+0xc9/0x1be [jffs2]
 [<c013b1a5>] generic_file_buffered_write+0x195/0x580
 [<c010400c>] apic_timer_interrupt+0x1c/0x30
 [<c01766e3>] __mark_inode_dirty+0x193/0x1a0
 [<c0139ba6>] do_generic_mapping_read+0x336/0x4a0
 [<c013b814>] __generic_file_aio_write_nolock+0x284/0x4a0
 [<c013bb5a>] __generic_file_write_nolock+0x9a/0xc0
 [<c012e3f0>] autoremove_wake_function+0x0/0x40
 [<c013bd50>] generic_file_write+0x40/0xb0
 [<c0156702>] vfs_write+0x92/0xe0
 [<c01567fd>] sys_write+0x3d/0x70
 [<c0102fd9>] sysenter_past_esp+0x52/0x79
 Segmentation Fault
-----------------------------Kernel Message Ends---------------------------=
-

I am not facing this kind of segmentation fault with 2.4.25 kernel. It
is working fine in 2.4 kernel.

> Another question: is there any reason that you use 2.6.10 instead of the
> newest kernel?
  =20
   Yet to try with higher kernel version. It is not mandatory to use
2.6.10 kernel.

Provide ur comments on this. Kindly help me in this issue.

Regards,
K. Suresh

On 8/23/05, Ferenc Havasi <havasi@inf.u-szeged.hu> wrote:
> Hi,
>=20
> >  1. Compiled the kernel with JFFS2 summary support. Created the JFFS2
> >image with the following command.
> >      mkfs.jffs2 -d testjffs2 -e 0x40000 --pad=3D0x7800000 -o jffs2.img =
-v
> >
> >      This comand created the JFFS2 image of size 120MB.
> >      Copied the jffs2.img to one of the partition in Hard Disk.
> >Mounted
> >      the partition using blkmtd support. It takes around 27 seconds
> >to
> >      mount.
> >
> >      Why the mount time is high even if the kernel having the "JFFS2
> >summary" support?.
> >
> >
> Because there was no summary support in your image, so the original
> scanning method had to be applied. Summary support means to process this
> summary information and generate it automatically if you write date onto
> the filesystem.
>=20
> >   2. Created the JFFS2 image with summary information inbuilt support
> >using sumtool2 utility.
> >         sumtool2 -e 0x40000 -i jffs2.img -o jffs2-sum.img
> >
> >       Copied the jffs2-sum.img to other partition in Hard Disk.
> >Mounted
> >       the partition using blkmtd support. It takes around 6 seconds
> >to
> >       mount.
> >Another problem is that "Segmentation fault" occurs when copying a
> >directory of size 10MB to JFFS2 partition after mount.
> >
> >Following are the error posted when copying the directory.
> >
> >
> Can you send me more information about it? For example kernel log with
> debug level 1. And please make sure that you use the latest mtd snapshot
> with newest summary patch - use only erase block summary, centralized
> summary is now under construction.
>=20
> It would be also good to know that if it works without summary.
>=20
> Another question: is there any reason that you use 2.6.10 instead of the
> newest kernel?
>=20
> Bye,
> Ferenc
>=20
>
