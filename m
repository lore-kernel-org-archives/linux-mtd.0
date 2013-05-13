Received: from mail-we0-x230.google.com ([2a00:1450:400c:c03::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uc1sn-0000UV-NT
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 23:10:19 +0000
Received: by mail-we0-f176.google.com with SMTP id p60so6534166wes.7
 for <linux-mtd@lists.infradead.org>; Mon, 13 May 2013 16:09:55 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 13 May 2013 18:09:55 -0500
Message-ID: <CAP+RiCCTo-_iH=bXuZMYY_BCMZjZzAkTB7Nm0_B0i2FErv+VAQ@mail.gmail.com>
Subject: UBI leb_write_unlock NULL pointer Oops
From: Brent Taylor <motobud@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm working with an atmel at91sam9g20 evaluation board
(http://www.atmel.com/Images/doc6413.pdf) running the Linux kernel
version 3.6.9.  On two occasions I have had the following Oops
reported:

Unable to handle kernel NULL pointer dereference at virtual address 0000000c
pgd = c313c000
[0000000c] *pgd=231a5831, *pte=00000000, *ppte=00000000
Internal error: Oops: 17 [#1] ARM
Modules linked in:
CPU: 0    Tainted: G        W     (3.6.9-00.04 #1)
PC is at __up_write+0x34/0x16c
LR is at leb_write_unlock+0x2c/0x88
pc : [<c013493c>]    lr : [<c01933d4>]    psr: a0000093
sp : c3337c00  ip : 00000000  fp : 00000000
r10: c396e800  r9 : c3b89e38  r8 : c3972200
r7 : 000003c8  r6 : c3b89e3c  r5 : c396e800  r4 : c3b89e20
r3 : 00000000  r2 : 60000013  r1 : 00000000  r0 : c3b89e38
Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 0005317f  Table: 2313c000  DAC: 00000015
Process ipkg (pid: 25472, stack limit = 0xc3336270)
Stack: (0xc3337c00 to 0xc3338000)
7c00: 00001000 60000013 c3b89e20 c3b89e20 c396e800 00000293 000003c8 c3972200
7c20: c39feca0 c396e800 00000000 c01933d4 0001e800 00000000 c3a8f000 c0193acc
7c40: 00000800 000003c8 c3bac890 00000800 00000001 c00f46f0 00000000 00000800
7c60: 00000001 00000000 c3827adc 0000f2b2 c3a8eed0 c032dbf4 60000013 c0135814
7c80: 0000f2b2 c3a8eed0 c032dbe8 c3a8eed0 c032dbe8 c003109c 0000f2b2 23b61667
7ca0: 0000f2b2 c0031698 000003c8 0001edd8 70e5b867 0000f2b1 c3a8ee90 c3972200
7cc0: 00000800 00000800 000003c8 c396e800 c39feca0 00000000 c3a8f000 c0192874
7ce0: 00000800 00000800 c3a8eed0 c3a8f000 c3a4a000 00000800 000003c8 c033f178
7d00: c34bcdc0 c34463b8 00000188 c00dd268 00000800 000005d8 c033f178 c34bcdc0
7d20: c34463b8 c3a8ee90 c3a4a000 00000800 000005d8 c00dde20 00000800 c34bcdc0
7d40: c34463b8 c3b0f248 00000000 c3b0f200 c3a4a000 c348e460 c34463b8 c00d07bc
7d60: c3337d8c 00000001 c035ab68 c34463b8 00000000 00000001 00000048 000000a0
7d80: 00000043 000000a0 000003c8 000008a0 0000090c 45bfb79e 00000000 c0096178
7da0: 00000000 971f618a 00000000 00000048 00000000 c34463b8 00000000 c3a4a000
7dc0: c34bcdc0 c348e448 00000158 c00d7298 00000000 00000000 00000000 c34464f8
7de0: 00000018 00100050 00000000 00000180 000001d8 000000a0 c3337f08 00000000
7e00: c348e448 c34463b8 00000001 c3337ec0 c3b1e9a0 00000022 c3337f78 c0089e60
7e20: 00000301 c0089654 00000000 000081a4 c3337f00 c3445118 00000241 c008c94c
7e40: 00000003 c3337e60 00000000 c008a05c 000081b6 c3445118 00000000 00000001
7e60: c348e448 00000000 c34463b8 000003c8 00bfb79e 0000000a 00000000 00000000
7e80: c3337f00 c3b1e9a0 c3337f00 00000000 c3337f78 c3337ec0 c3336000 c3336000
7ea0: 00000000 c008cdf8 c3337ebc 00000000 c3a4a000 00000001 00000000 00000001
7ec0: c34b8068 c00d1050 00000000 00000000 000003c8 c3337f78 00000001 c336a000
7ee0: ffffff9c ffffff9c c3336000 00000000 be94e784 c008d47c 00000041 c0009424
7f00: c38121d0 c3445118 25bfb79e 0000000a c336a00f c032fca8 00000000 c3417338
7f20: c34463b8 00000301 00000002 00000000 00000000 c008ba04 00000005 c3821080
7f40: c335b380 00000000 ffffff9c c00970b8 bf000000 00000241 c336a000 00000241
7f60: c336a000 00000005 00000001 c007f8d4 00000000 00000000 00000241 000081b6
7f80: 00000022 00000300 5191533c 005491b0 b6f509b5 00000004 00000005 c0009424
7fa0: 00000000 c00092c0 005491b0 b6f509b5 00548e70 00000241 000001b6 000001b6
7fc0: 005491b0 b6f509b5 00000004 00000005 b6f509b4 00548cd0 00000001 be94e784
7fe0: 00000000 be94e72c b6e6c750 b6ebd0dc 60000010 00548e70 00000000 00000000
[<c013493c>] (__up_write+0x34/0x16c) from [<c01933d4>]
(leb_write_unlock+0x2c/0x88)
[<c01933d4>] (leb_write_unlock+0x2c/0x88) from [<c0193acc>]
(ubi_eba_write_leb+0xa0/0x984)
[<c0193acc>] (ubi_eba_write_leb+0xa0/0x984) from [<c0192874>]
(ubi_leb_write+0xe0/0x124)
[<c0192874>] (ubi_leb_write+0xe0/0x124) from [<c00dd268>]
(ubifs_leb_write+0x9c/0x130)
[<c00dd268>] (ubifs_leb_write+0x9c/0x130) from [<c00dde20>]
(ubifs_wbuf_sync_nolock+0x104/
0x34c)
[<c00dde20>] (ubifs_wbuf_sync_nolock+0x104/0x34c) from [<c00d07bc>]
(ubifs_jnl_update+0x2b8/0x60c)
[<c00d07bc>] (ubifs_jnl_update+0x2b8/0x60c) from [<c00d7298>]
(ubifs_create+0x108/0x1dc)
[<c00d7298>] (ubifs_create+0x108/0x1dc) from [<c0089e60>] (vfs_create+0x84/0xb4)
[<c0089e60>] (vfs_create+0x84/0xb4) from [<c008c94c>]
(do_last.isra.38+0x78c/0xb90)
[<c008c94c>] (do_last.isra.38+0x78c/0xb90) from [<c008cdf8>]
(path_openat+0xa8/0x448)
[<c008cdf8>] (path_openat+0xa8/0x448) from [<c008d47c>] (do_filp_open+0x2c/0x80)
[<c008d47c>] (do_filp_open+0x2c/0x80) from [<c007f8d4>] (do_sys_open+0xe8/0x180)
[<c007f8d4>] (do_sys_open+0xe8/0x180) from [<c00092c0>]
(ret_fast_syscall+0x0/0x2c)
Code: e5903004 e58d2004 e1560003 0a00002a (e593200c)
---[ end trace 287ddd4605e3394c ]---
Kernel panic - not syncing: Fatal exception


Unable to handle kernel NULL pointer dereference at virtual address 0000000c
pgd = c3168000
[0000000c] *pgd=230d9831, *pte=00000000, *ppte=00000000
Internal error: Oops: 17 [#1] ARM
Modules linked in:
CPU: 0    Tainted: G        W     (3.6.9-00.04 #52)
PC is at __up_write+0x34/0x16c
LR is at leb_write_unlock+0x2c/0x88
pc : [<c013493c>]    lr : [<c01933d4>]    psr: a0000093
sp : c3137d50  ip : 00000000  fp : 00000000
r10: c3947800  r9 : c3b32478  r8 : c3972200
r7 : 000001ab  r6 : c3b3247c  r5 : c3947800  r4 : c3b32460
r3 : 00000000  r2 : 60000013  r1 : 00000000  r0 : c3b32478
Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 0005317f  Table: 23168000  DAC: 00000015
Process ipkg (pid: 3180, stack limit = 0xc3136270)
Stack: (0xc3137d50 to 0xc3138000)
7d40:                                     00001000 60000013 c3b32460 c3b32460
7d60: c3947800 000001ae 000001ab c3972200 c39fee20 c3947800 00000000 c01933d4
7d80: 0001e800 00000000 c3a8f000 c0193acc 00000800 000001ab c3bd4ef8 00000800
7da0: 00000001 c00f46f0 00000000 00000000 00000001 00000000 c3861a50 0000139a
7dc0: c3a8eed0 c032dbf4 60000013 c0135814 0000139a c3a8eed0 c032dbe8 c3a8eed0
7de0: c032dbe8 c003109c 0000139a cda4b1d9 00001399 c0031698 000001ab 0001edc8
7e00: 1ad453d9 00001399 c3a8ee90 c3972200 00000800 00000800 000001ab c3947800
7e20: c39fee20 00000000 c3a8f000 c0192874 00000800 00000800 c3a8eed0 c3a8f000
7e40: c3a4a000 00000800 000001ab c033f178 c3488860 c3439860 00000198 c00dd268
7e60: 00000800 000005c8 c033f178 c3488860 c3439860 c3a8ee90 c3a4a000 00000800
7e80: 000005c8 c00dde20 00000800 c3488860 c3439860 c3bc6040 00000000 c3bc6000
7ea0: c3a4a000 c3443ac0 c3439860 c00d07bc c3137edc 00000001 c035ab68 c3439860
7ec0: 00000000 00000001 00000040 000000b8 0000003f 000000b8 000001ab 000008a0
7ee0: 000002bb 56598f8f 00000000 c0096178 00000000 39add542 00000600 00000018
7f00: 00000000 c3439860 00000000 c3a4a000 c3488860 c3443aa8 00000040 c00d70c8
7f20: 00000000 00000000 c3439860 c34399a0 00000002 00100c50 00000000 00000180
7f40: 000001f0 000000a0 00000000 00000000 c3443aa8 c3439860 00000053 c0009424
7f60: c3136000 00000000 00000000 c0089fd0 00000000 c008b72c 00000000 c30c0000
7f80: c30c0000 c3443aa8 007ed440 c008d84c c38121d0 c3437118 007ed400 00000270
7fa0: 007ed748 c00092c0 007ed400 00000270 007ed480 007ed440 0000a1ff 0000a000
7fc0: 007ed400 00000270 007ed748 00000053 b6f09198 007ed290 b6eda9d8 00000000
7fe0: b6e6af80 bed777b4 b6ef94c0 b6e6af8c 60000010 007ed480 00000000 00000000
[<c013493c>] (__up_write+0x34/0x16c) from [<c01933d4>]
(leb_write_unlock+0x2c/0x88)
[<c01933d4>] (leb_write_unlock+0x2c/0x88) from [<c0193acc>]
(ubi_eba_write_leb+0xa0/0x984)
[<c0193acc>] (ubi_eba_write_leb+0xa0/0x984) from [<c0192874>]
(ubi_leb_write+0xe0/0x124)
[<c0192874>] (ubi_leb_write+0xe0/0x124) from [<c00dd268>]
(ubifs_leb_write+0x9c/0x130)
[<c00dd268>] (ubifs_leb_write+0x9c/0x130) from [<c00dde20>]
(ubifs_wbuf_sync_nolock+0x104/0x34c)
[<c00dde20>] (ubifs_wbuf_sync_nolock+0x104/0x34c) from [<c00d07bc>]
(ubifs_jnl_update+0x2b8/0x60c)
[<c00d07bc>] (ubifs_jnl_update+0x2b8/0x60c) from [<c00d70c8>]
(ubifs_symlink+0x184/0x24c)
[<c00d70c8>] (ubifs_symlink+0x184/0x24c) from [<c0089fd0>]
(vfs_symlink+0x70/0xa0)
[<c0089fd0>] (vfs_symlink+0x70/0xa0) from [<c008d84c>] (sys_symlinkat+0x5c/0x8c)
[<c008d84c>] (sys_symlinkat+0x5c/0x8c) from [<c00092c0>]
(ret_fast_syscall+0x0/0x2c)
Code: e5903004 e58d2004 e1560003 0a00002a (e593200c)
---[ end trace 87f6e7e0bf0f559a ]---
Kernel panic - not syncing: Fatal exception

I'm sorry I don't have more information, but both oops' occurred while
the program 'ipkg' was unpacking a tarball into the root filesystem.
I tried to reproduce the problem by unpacking a tarball, deleting the
files, the unpacking the same tarball again.  The board ran
successfully for hours until I stopped the test.

I have found the ubifs-v3.6.git tree but since I'm using version
3.6.9, how can I easily apply all the patches from 3.6 to the current
release since some of the patches seem to have already made it into
the 3.6.9 release.

I didn't see anything in the patches listed in ubifs-v3.6.git that
would fix something like this.

Thanks for your time,
Brent Taylor
