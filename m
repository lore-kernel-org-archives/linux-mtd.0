Received: from mail-px0-f177.google.com ([209.85.216.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MeYX2-0006IK-T0
	for linux-mtd@lists.infradead.org; Fri, 21 Aug 2009 18:08:13 +0000
Received: by pxi7 with SMTP id 7so4439972pxi.3
	for <linux-mtd@lists.infradead.org>;
	Fri, 21 Aug 2009 11:08:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <a64f67eb0908202331q73230351pe27f1434470707ae@mail.gmail.com>
References: <a64f67eb0908202331q73230351pe27f1434470707ae@mail.gmail.com>
Date: Fri, 21 Aug 2009 11:08:00 -0700
Message-ID: <1c3f4270908211108w416019deh9aa4b2575d6a1b82@mail.gmail.com>
Subject: Re: JFFS2 crash in linux-2.6.30
From: Manoj <manoj23@gmail.com>
To: linux newbie <linux.newbie79@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

You may want to try this patch if you don't have it in yet:
http://git.infradead.org/mtd-2.6.git/commit/57ca7deb062abf56168d15f000c16e25f88a9cf3

On Thu, Aug 20, 2009 at 11:31 PM, linux newbie<linux.newbie79@gmail.com> wrote:
> Hi,
>
> I compiled 2.6.30 kernel with arm-xscale-linux-gcc version 4.0.2.
> Everything is working fine as before (previous version is in linux
> 2.6.26.3). But on copying files of large size (tested with 2MBytes and
> more) from USB to NAND, causes crash.
>
> If I enable JFFS2 debug messages, I am not observing the crash.
>
> Below is the crash message. Can anyone let me know, what might be the problem?
>
> Internal error: Oops: 817 [#1]
> Modules linked in:
> CPU: 0 Not tainted (2.6.30 #61)
> PC is at __bug+0x20/0x2c
> LR is at release_console_sem+0x1b8/0x1ec
> pc : [<c002927c>] lr : [<c0040a10>] psr: 60000013
> sp : c7bcfd0c ip : c7bcfc48 fp : c7bcfd18
> r10: 00000000 r9 : 00001000 r8 : c04ca6e0
> r7 : 00000000 r6 : c741fbf8 r5 : 001b5000 r4 : c02b7c48
> r3 : 00000000 r2 : 60000013 r1 : 00002a4e r0 : 00000026
> Flags: nZCv IRQs on FIQs on Mode SVC_32 ISA ARM Segment user
> Control: 0000397f Table: a7004000 DAC: 00000015
> Process cp (pid: 596, stack limit = 0xc7bce260)
> Stack: (0xc7bcfd0c to 0xc7bd0000)
> fd00: c7bcfd70 c7bcfd1c c00e73f4 c0029268 001b5000
> fd20: 00000000 c7bcfd44 001b5000 00000000 001b5000 00000000 c741fbd0 c78f4c00
> fd40: 00001000 00000000 c02b7c48 001b5000 00000000 c7bce000 00001000 00000000
> fd60: 00000000 c7bcfdec c7bcfd74 c006a514 c00e7390 00001000 00001000 c04ca6e0
> fd80: c7bcfdf0 c7bcfeb4 c7bebe80 c741fc90 c02b7c48 c741fbf8 00001000 c02b7c48
> fda0: 00000000 00001000 c741fc90 c7bcff38 00000001 00001000 00001000 c7bcfdf0
> fdc0: c04ca6e0 c7bcfefc 00002000 001b4000 00000000 c741fbf8 00000000 00000000
> fde0: c7bcfe6c c7bcfdf4 c006bd64 c006a3a0 001b4000 00000000 c7bcfefc 00002000
> fe00: 00000000 c7bcfefc c7bcff38 c7bcfeb4 c00a697c 0000006d c7bebe80 c741fc90
> fe20: 001b6000 00000000 00000001 c7bcfe38 c006b38c c00a1dd8 0000019c 00000002
> fe40: 00002000 c741fc64 c7bcfeb4 c7bcff38 c741fbf8 001b4000 00000000 00000001
> fe60: c7bcfea8 c7bcfe70 c006be3c c006b938 00000000 bea6ac70 c7bebe80 c741fc90
> fe80: c7bcfeb4 c7bebe80 c7bcff80 00002000 c0025fc4 c7bce000 00000003 c7bcff58
> fea0: c7bcfeb0 c008fedc c006bdcc 001b4000 00000000 c0044ea0 c0044c5c 00000000
> fec0: 00000001 ffffffff c7bebe80 00000000 00000000 00000000 00000000 c783a900
> fee0: 00000000 00000000 c0044dcc c783a900 c0053c08 c7bcfef4 c7bcfef4 001b4000
> ff00: 00000000 c7bcff7c c7bcff14 c00259c4 c002500c 00002000 00000000 00002000
> ff20: 00168000 00000000 00000000 c74336f0 00000001 c742b380 bea68c70 00002000
> ff40: c7bebe80 bea68c70 c7bcff80 c7bcff7c c7bcff5c c00908c0 c008fe28 00000000
> ff60: c7bebe80 001b4000 00000000 00000004 c7bcffa4 c7bcff80 c0090fac c0090814
> ff80: 001b4000 00000000 00000000 00002000 00002000 bea68c70 00000000 c7bcffa8
> ffa0: c0025e20 c0090f6c 00002000 00002000 00000004 bea68c70 00002000 ffe4c000
> ffc0: 00002000 00002000 bea68c70 00000004 00000004 0000c9c8 00000003 00000000
> ffe0: 0007797c bea68c48 00059e40 401927b4 20000010 00000004 a04ee021 a04ee421
> Backtrace:
> [<c002925c>] (__bug+0x0/0x2c) from [<c00e73f4>] (jffs2_write_end+0x70/0x274)
> [<c00e7384>] (jffs2_write_end+0x0/0x274) from [<c006a514>]
> (generic_file_buffered_write+0x184/0x2f8)
> [<c006a394>] (generic_file_buffered_write+0x4/0x2f8) from [<c006bd64>]
> (__generic_file_aio_write_nolock+0x438/0x490)
> [<c006b92c>] (__generic_file_aio_write_nolock+0x0/0x490) from
> [<c006be3c>] (generic_file_aio_write+0x80/0xfc)
> [<c006bdc0>] (generic_file_aio_write+0x4/0xfc) from [<c008fedc>]
> (do_sync_write+0xc0/0x114)
> [<c008fe1c>] (do_sync_write+0x0/0x114) from [<c00908c0>] (vfs_write+0xb8/0x144)
> r6:c7bcff80 r5:bea68c70 r4:c7bebe80
> [<c0090808>] (vfs_write+0x0/0x144) from [<c0090fac>] (sys_write+0x4c/0x80)
> r7:00000004 r6:00000000 r5:001b4000 r4:c7bebe80
> [<c0090f60>] (sys_write+0x0/0x80) from [<c0025e20>] (ret_fast_syscall+0x0/0x2c)
> r6:bea68c70 r5:00002000 r4:00002000
> Code: e1a01000 e59f000c eb005ecc e3a03000 (e5833000)
> ---[ end trace a38925e81ca40a22 ]---
> Segmentation fault
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
