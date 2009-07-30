Received: from mail-yw0-f183.google.com ([209.85.211.183])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWcs0-0005Td-M1
	for linux-mtd@lists.infradead.org; Thu, 30 Jul 2009 21:09:05 +0000
Received: by ywh13 with SMTP id 13so1100184ywh.15
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jul 2009 14:09:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090730202637.GH16220@n2100.arm.linux.org.uk>
References: <3972542e0907301124n104c9eafnc99e989d1a9f8d51@mail.gmail.com>
	<200907302036.24243.marek.vasut@gmail.com>
	<3972542e0907301314p4a8c9539uc7b5fdd80abec443@mail.gmail.com>
	<20090730202637.GH16220@n2100.arm.linux.org.uk>
Date: Thu, 30 Jul 2009 16:08:58 -0500
Message-ID: <3972542e0907301408r7ae0c06bkf4417724dcec9459@mail.gmail.com>
Subject: Re: Internal error: Oops: 817 [#1]
From: E Robertson <e.robertson.svg@gmail.com>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 30, 2009 at 3:26 PM, Russell King - ARM
Linux<linux@arm.linux.org.uk> wrote:
> On Thu, Jul 30, 2009 at 03:14:43PM -0500, E Robertson wrote:
>> I got 2.6.31-rc4 and patch it which wasn't painful.
>> However, no change.
>> Here are the results: My initramfs initially mount the two nand
>> partitions and that's where the initial
>> uncorrectable error comes from.
>
> It would really help if you enabled verbose BUG reporting, so that
> people get a clear indication that it's a BUG() statement that's
> being hit.
>

Yes, that's where it is.


# cp /bin/ts_calibrate /mnt/home
Data CRC 73ec70d8 != calculated CRC af36398e for node at 03fc0078
kernel BUG at fs/jffs2/file.c:251!
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c1c8c000
[00000000] *pgd=21c58031, *pte=00000000, *ppte=00000000
Internal error: Oops: 817 [#1] PREEMPT
CPU: 0    Not tainted  (2.6.31-rc4 #2)
PC is at __bug+0x20/0x2c
LR is at preempt_schedule+0x44/0x60
pc : [<c00db3a0>]    lr : [<c02958a0>]    psr: 60000013
sp : c1ca1d0c  ip : c1ca1c58  fp : c1ca1d18
r10: 00000000  r9 : c181bf54  r8 : 00000000
r7 : c0340ba0  r6 : c181beb8  r5 : 00001000  r4 : 00001000
r3 : 00000000  r2 : c1ca0000  r1 : c1c9f9c0  r0 : 00000029
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 0005317f  Table: 21c8c000  DAC: 00000015
Process cp (pid: 1085, stack limit = 0xc1ca0260)
Stack: (0xc1ca1d0c to 0xc1ca2000)
1d00:                            c1ca1d68 c1ca1d1c c019575c c00db390 00000000
1d20: 00001000 c1ca1d3c 00001000 00001000 00000000 c1fc8c00 c0fdd000 00000000
1d40: 00001000 00001000 00000000 00000000 00000000 c181bf54 00000000 c1ca1de4
1d60: c1ca1d6c c0118e84 c0195520 00001000 00001000 c0340ba0 c1ca1de8 c1ca1ea0
1d80: c1caaf20 c181bf54 c029f4ac c181beb8 00001000 00001000 00000000 c029f4ac
1da0: c1ca0000 c1ca1f24 00000001 00000000 00001000 c1ca1de8 c0340ba0 00002000
1dc0: 00000000 00001000 00000000 c181beb8 00000000 00001000 c1ca1e58 c1ca1dec
1de0: c011970c c0118cf0 00001000 00000000 c1ca1ee8 00001000 00000000 c1ca1ee8
1e00: c1ca1f24 c1ca1ea0 c1caaf20 c181bf54 00000000 00000001 00001000 00000000
1e20: c1ca1e94 c1ca1e30 c01284b4 00001000 c181bf28 c181beb8 c1ca1ea0 00001000
1e40: 00000000 00000001 c1ca1f24 c1ca1e94 c1ca1e5c c0119a68 c0119280 bedecbac
1e60: 00000000 c1caaf20 c181bf54 c1ca1ea0 c1caaf20 c1ca1ea0 c1ca1f24 c1ca1f80
1e80: c1ca0000 fffffdee c1ca1f50 c1ca1e9c c013ce94 c01199f8 00001000 00000000
1ea0: 00000000 bedeb000 00000000 00000001 ffffffff c1caaf20 00000000 00000000
1ec0: 00000000 00000000 c1c45c80 00000000 00000000 00000817 c1c45c80 c0103d50
1ee0: c1ca1ee0 c1ca1ee0 00001000 00000000 00000003 00000003 c1ca1fac c1ca1f08
1f00: 00001000 c00dd25c 00000000 00000000 00000000 c1ca1f38 c1ca1f24 00000000
1f20: 00000000 bedebbac 00001000 c1caaf20 bedebbac c1ca1f80 00000004 00001000
1f40: 00000003 c1ca1f7c c1ca1f54 c013d7bc c013cdd8 00000000 00000000 00001000
1f60: 00000000 c1caaf20 00000004 c00d7fc4 c1ca1fa4 c1ca1f80 c013dddc c013d714
1f80: 00001000 00000000 00000000 00001000 bedebbac 00000004 00000000 c1ca1fa8
1fa0: c00d7e20 c013dda0 00001000 bedebbac 00000004 bedebbac 00001000 000000c1
1fc0: 00001000 bedebbac 00000004 00000004 00000004 00000003 00000003 00000000
1fe0: 000065fd bedebb80 00024b0c 0001c8b4 20000010 00000004 00000000 00000000
Backtrace:
[<c00db380>] (__bug+0x0/0x2c) from [<c019575c>] (jffs2_write_end+0x24c/0x264)
[<c0195510>] (jffs2_write_end+0x0/0x264) from [<c0118e84>]
(generic_file_buffered_write+0x1a8/0x308
)
[<c0118ce0>] (generic_file_buffered_write+0x4/0x308) from [<c011970c>]
(__generic_file_aio_write_no
lock+0x49c/0x4ec)
[<c0119270>] (__generic_file_aio_write_nolock+0x0/0x4ec) from
[<c0119a68>] (generic_file_aio_write+
0x84/0x100)
[<c01199e8>] (generic_file_aio_write+0x4/0x100) from [<c013ce94>]
(do_sync_write+0xcc/0x11c)
[<c013cdc8>] (do_sync_write+0x0/0x11c) from [<c013d7bc>] (vfs_write+0xb8/0x164)
[<c013d704>] (vfs_write+0x0/0x164) from [<c013dddc>] (sys_write+0x4c/0x80)
 r8:c00d7fc4 r7:00000004 r6:c1caaf20 r5:00000000 r4:00001000
[<c013dd90>] (sys_write+0x0/0x80) from [<c00d7e20>] (ret_fast_syscall+0x0/0x2c)
 r6:00000004 r5:bedebbac r4:00001000
Code: e1a01000 e59f000c eb00523a e3a03000 (e5833000)
---[ end trace 0250fd28502e5e96 ]---
Segmentation fault
