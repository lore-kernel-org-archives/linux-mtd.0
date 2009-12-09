Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NIOgt-0007R1-4Q
	for linux-mtd@lists.infradead.org; Wed, 09 Dec 2009 15:43:03 +0000
Subject: Re: kernel panics ubifs and at91sam9263ek
From: Jaap de Jong <jaap.dejong@nedap.com>
To: dedekind1@gmail.com
In-Reply-To: <1260347506.19669.1211.camel@localhost>
References: <1260268703.15086.6.camel@nvc1511>
	<1260347506.19669.1211.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 09 Dec 2009 16:42:51 +0100
Message-ID: <1260373371.12157.0.camel@nvc1511>
Mime-Version: 1.0
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

oobtest exits with no messages
pagetest

[  242.830000] ------------[ cut here ]------------
[  242.830000] WARNING: at kernel/sched.c:5268 search_module_extables+0x14/0xa0()
[  242.830000] Modules linked in: mtd_pagetest(+) mtd_oobtest
[  242.830000] [<c002cae0>] (unwind_backtrace+0x0/0xe0) from [<c003ea08>] (warn_slowpath_common+0x4c/0x68)
[  242.830000] [<c003ea08>] (warn_slowpath_common+0x4c/0x68) from [<c006d4c0>] (search_module_extables+0x14/0xa0)
[  242.830000] [<c006d4c0>] (search_module_extables+0x14/0xa0) from [<c002dc2c>] (fixup_exception+0x10/0x28)
[  242.830000] [<c002dc2c>] (fixup_exception+0x10/0x28) from [<c002ddc8>] (__do_kernel_fault+0x20/0x80)
[  242.830000] [<c002ddc8>] (__do_kernel_fault+0x20/0x80) from [<c002dfec>] (do_page_fault+0x1c4/0x1dc)
[  242.830000] [<c002dfec>] (do_page_fault+0x1c4/0x1dc) from [<c0027300>] (do_DataAbort+0x38/0x9c)
[  242.830000] [<c0027300>] (do_DataAbort+0x38/0x9c) from [<c0027a8c>] (__dabt_svc+0x4c/0x60)

any ideas?

On Wed, 2009-12-09 at 10:31 +0200, Artem Bityutskiy wrote:
> On Tue, 2009-12-08 at 11:38 +0100, Jaap de Jong wrote:
> > 	# for i in 0 1 2 3 4 5 6 7 8 9 ; do echo $i ; cp bigfile /mnt/ubifs/bigfile.$i ; done
> > 	0
> > 	1
> > 	2
> > 	3
> > 	4
> > 	5
> > 	[  830.860000] Unable to handle kernel paging request at virtual address 5b5b5b5a
> > 	[  830.870000] pgd = c3b78000
> > 	[  830.870000] [5b5b5b5a] *pgd=00000000
> > 	[  830.880000] Internal error: Oops: 80000005 [#1] PREEMPT
> > 	[  830.880000] last sysfs file: /sys/devices/virtual/ubi/ubi0/ubi0_0/name
> > 	[  830.880000] Modules linked in:
> > 	[  830.880000] CPU: 0    Not tainted  (2.6.32 #1)
> > 	[  830.880000] PC is at 0x5b5b5b5a
> > 	[  830.880000] LR is at nand_write_page_raw+0x34/0x3c
> > 	[  830.880000] pc : [<5b5b5b5a>]    lr : [<c02133b4>]    psr: 40000033
> > 	[  830.880000] sp : c3be59a8  ip : 0000005b  fp : 5b5b5b5b
> > 	[  830.880000] r10: 00000800  r9 : 00000000  r8 : 00005df7
> > 	[  830.880000] r7 : 00005df7  r6 : c3b87800  r5 : c39fe520  r4 : c39fe400
> > 	[  830.880000] r3 : 000000cf  r2 : fffffff0  r1 : c3806940  r0 : c5000000
> > 	[  830.880000] Flags: nZcv  IRQs on  FIQs on  Mode SVC_32  ISA Thumb  Segment user
> > 	[  830.880000] Control: 0005317f  Table: 23b78000  DAC: 00000015
> > 	[  830.880000] Process cp (pid: 922, stack limit = 0xc3be4270)
> > 	[  830.880000] Stack: (0xc3be59a8 to 0xc3be6000)
> > 	[  830.880000] 59a0:                   5b5b5b5b 5b5b5b5b 00000800 00000800 c39fe400 00000000
> > 	[  830.880000] 59c0: c3b87800 c0214874 00000000 00000000 00000000 00005df7 0000003f 00000000
> > 	[  830.880000] 59e0: 00000000 c3b87800 00000000 c39fe400 c39fe520 02efb800 00000000 00000800
> > 	[  830.880000] 5a00: c3a4a800 00000000 00000157 c0214a60 c39fe4ec c0035a14 02afb800 00000000
> > 	[  830.880000] 5a20: c3970a00 00000800 00000003 c020d450 00000800 c3be5a64 c3b87800 00000000
> > 	[  830.880000] 5a40: c39aaea0 00000157 0001b800 c0220344 00000800 c3be5a64 c3b87800 0000015a
> > 	[  830.880000] 5a60: 00000800 c39aaea0 0000015a c39aaea0 0000015a 00000800 00000000 c021e948
> > 	[  830.880000] 5a80: 00000800 c0035a14 00000000 c3be5a98 c0035784 c3b9201c c3011360 00000017
> > 	[  830.880000] 5aa0: 00000000 c3b73520 c3be5af4 c3be5ab8 00000000 c3be5ac0 c3b87800 0000015a
> > 	[  830.880000] 5ac0: c386a400 00000568 22222222 22222222 c032a0dc c39aaea0 0000015a 00000800
> > 	[  830.880000] 5ae0: c3b87800 00000003 c3a7a000 00000510 c30c8000 c021db4c 0001b000 00000800
> > 	[  830.880000] 5b00: 00000003 00000fe0 c3ae1160 00000fe0 00000000 00000fd9 c3a7a000 c016d4c0
> > 	[  830.880000] 5b20: 00000800 00000003 00000000 00000000 00000fd9 00000000 c3be5b70 c3ae1160
> > 	[  830.880000] 5b40: c30c8000 00000000 00000fd9 c3a7a000 0001b000 00000510 0000015a c0162f80
> > 	[  830.880000] 5b60: c3be5b74 c0035a14 c04f5660 c3be5ba8 00000fa9 00000001 00000004 00001000
> > 	[  830.880000] 5b80: c04f5660 c34ca8a8 c3a7a000 c3a7a008 c34ca950 00000000 00000004 c0165330
> > 	[  830.880000] 5ba0: 00001000 c34ca950 00000046 2000027a 00000080 c34ca950 00000001 c3be5ce0
> > 	[  830.880000] 5bc0: 00000080 c00909ec c04f5660 c0090ec4 0000000e 000200da 00000001 ffffffff
> > 	[  830.880000] 5be0: c34ca950 c00909d8 00000000 00000000 0000000e ffffffff 0000027b c3be5c14
> > 	[  830.880000] 5c00: 00000000 0000000e 00000000 c04f50c0 c04f50e0 c04f5100 c04f5120 c04f5660
> > 	[  830.880000] 5c20: c04f5640 c04f5620 c04f5600 c04f55e0 c04f55c0 c04f55a0 c04f5580 c04f5560
> > 	[  830.880000] 5c40: c04f5540 00000284 00000010 c34ca8a8 00000007 00000000 c3adda40 c3be5ce0
> > 	[  830.880000] 5c60: c3a7a088 c34ca950 c3a7a090 c00d4b6c c3a7a090 00000000 c34ca8a8 c3a7a068
> > 	[  830.880000] 5c80: c3adda40 c3be5ce0 c3be4000 c00d5508 00000000 00000000 0000cddd 00000000
> > 	[  830.880000] 5ca0: c3be5d18 c3be5ca4 c3be5ca4 c3adda00 00001b59 c3a7a008 0000099d 00000001
> > 	[  830.880000] 5cc0: c34ca950 c049542c 000002fa c3be4000 00000001 c00915a4 c0495444 00000000
> > 	[  830.880000] 5ce0: c3a7a008 00000000 00000000 00000000 000002fa 00000000 00000000 00000000
> > 	[  830.880000] 5d00: 00000000 00000000 00000030 00000000 c34ca8a8 00000804 00000a98 0000054c
> > 	[  830.880000] 5d20: 004d9000 00001000 00000000 004d8000 00000000 00000000 c34ca950 00000000
> > 	[  830.880000] 5d40: 00001000 c008aabc 00001000 00001000 c04ea280 c0035784 c3833820 c34ca950
> > 	[  830.880000] 5d60: 00001000 00000000 c0339164 c3be4000 c3be5f40 00000001 00001000 00000000
> > 	[  830.880000] 5d80: c0035784 c04ea280 c3011360 004d9000 00000000 004d8000 00000000 c34ca8a8
> > 	[  830.880000] 5da0: 00000000 00000000 c3833820 c008b1f8 004d8000 00000000 c3be5f00 00001000
> > 	[  830.880000] 5dc0: 00000000 c3be5dd0 c3be5f00 c3be5f40 c3be5eb0 c3833820 c34ca950 00001000
> > 	[  830.880000] 5de0: c0329180 00000001 22222222 22222222 22222222 22222222 c008b6ec 00001000
> > 	[  830.880000] 5e00: 00000000 c34ca918 00000000 c3be5eb0 c3be5f40 004d8000 00000000 00000001
> > 	[  830.880000] 5e20: c3833820 c008b2a8 00001000 00000000 0001244c 004d8000 00000000 c34ca8a8
> > 	[  830.880000] 5e40: c3a7a000 c3be5eb0 c3be5f40 00000001 be8728a8 c01646e0 004d8000 00000000
> > 	[  830.880000] 5e60: 000004d8 00000001 00000000 00001000 00000000 be8738a8 00000000 00001000
> > 	[  830.880000] 5e80: 00000002 c3be5eb0 c3be5eb0 c3833820 c3be5eb0 c3be5f40 c3be5f88 c3be4000
> > 	[  830.880000] 5ea0: fffffdee c00b722c 004d8000 00000000 00000000 c3b73520 00000000 00000001
> > 	[  830.880000] 5ec0: ffffffff c3833820 00000000 00000000 00000000 00000000 c3011360 c3be4000
> > 	[  830.880000] 5ee0: 00000000 00000000 00000001 c3011360 c00588a8 c3be5ef4 c3be5ef4 c3be5f08
> > 	[  830.880000] 5f00: 004d8000 00000000 c002707c ffffffff be8728a8 c3be5f20 00001000 c0327f24
> > 	[  830.880000] 5f20: 00001000 c3be5f48 004bc000 00000000 c3833420 00000000 00000002 c00b741c
> > 	[  830.880000] 5f40: be8728a8 00001000 00000000 c3833820 be8728a8 c3be5f88 00000004 00001000
> > 	[  830.880000] 5f60: 00000003 c00b7b04 00000000 00000000 004d8000 00000000 c3833820 00000004
> > 	[  830.880000] 5f80: c0028064 c00b80bc 004d8000 00000000 be873f10 00000000 00000004 be8728a8
> > 	[  830.880000] 5fa0: 00001000 c0027ee0 00000004 be8728a8 00000004 be8728a8 00001000 00000004
> > 	[  830.880000] 5fc0: 00000004 be8728a8 00001000 00000004 00000001 00000004 00000003 be8728a8
> > 	[  830.880000] 5fe0: 00000004 be872878 000132af 4017572c 40000010 00000004 00000000 00000000
> > 	[  830.880000] Code: bad PC value
> > 	[  832.740000] ---[ end trace 41c7c00bf69addd9 ]---
> > 	Segmentation fault
> > 	6
> 
> I'm sure this is not UBIFS-related. Probably you have broken NAND
> driver? Start with testing your NAND using MTD tests:
> 
> http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests
> 
> > I've seen more kernel panics at random places...
> > 
> > 	# ubiformat /dev/mtd4 -s 512
> > 	ubiformat: mtd4 (NAND), size 264241152 bytes (252.0 MiB), 131072 eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
> > 	libscan: scanning eraseblock 2015 -- 100 % complete
> > 	ubiformat: 2012 eraseblocks have valid erase counter, mean value is 0
> > 	ubiformat: bad eraseblocks: 248, 374, 1390, 1446
> > 	ubiformat: formatting eras[  592.270000] Unable to handle kernel paging request at virtual address 56b50000
> > 	e[  592.270000] pgd = c3098000
> > 	ubiformat: [  592.280000] [56b50000] *pgd=00000000formatting erasebloc
> > 	k [  592.290000] Internal error: Oops: 80000005 [#1] PREEMPT
> > 	[  592.290000] last sysfs file: /sys/class/ubi/version
> > 	[  592.290000] Modules linked in:
> > 	[  592.290000] CPU: 0    Not tainted  (2.6.32 #1)
> > 	[  592.290000] PC is at 0x56b50000
> > 	[  592.290000] LR is at nand_write_page+0x78/0xc8
> > 	[  592.290000] pc : [<56b50000>]    lr : [<c02138c0>]    psr: 40000013
> > 	[  592.290000] sp : c3b37e58  ip : 000000ff  fp : c39fe520
> > 	[  592.290000] r10: 00000200  r9 : 00000000  r8 : 00003f00
> > 	[  592.290000] r7 : 00003f00  r6 : c3806100  r5 : c39fe520  r4 : c39fe400
> > 	[  592.290000] r3 : ffffffff  r2 : ffffffff  r1 : 00000010  r0 : c39fe520
> > 	[  592.290000] Flags: nZcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
> > 	[  592.290000] Control: 0005317f  Table: 23098000  DAC: 00000015
> > 	[  592.290000] Process ubiformat (pid: 912, stack limit = 0xc3b36270)
> > 	[  592.290000] Stack: (0xc3b37e58 to 0xc3b38000)
> > 	[  592.290000] 7e40:                                                       00000000 c39fe400
> > 	[  592.290000] 7e60: fffff800 00000200 c39fe400 00000000 c3806100 c0214874 00000000 00000000
> > 	[  592.290000] 7e80: 00000000 00003f00 0000003f 00000000 00000000 c3ad2c00 00000000 c39fe400
> > 	[  592.290000] 7ea0: c39fe520 01f80000 00000000 00000200 0001dfc8 c3944a00 c3b37f88 c0214a60
> > 	[  592.290000] 7ec0: c39fe4ec 00000001 01b80000 00000000 c3944a00 c3b36000 00000200 c020d450
> > 	[  592.290000] 7ee0: 00000200 c3b37f3c c3ad2c00 c3ad2c00 00000200 00000000 c3ad2c00 c020f300
> > 	[  592.290000] 7f00: 00000200 c3b37f3c c3ad2c00 c0035a14 c39aae20 00000000 c30076c0 c3a877a0
> > 	[  592.290000] 7f20: 40084d02 c00c56f4 c002707c c0035a14 c01d9908 ffffffff fefff000 c00b741c
> > 	[  592.290000] 7f40: 00000003 c30076c0 0001dfc8 c3b37f88 00000004 00000200 c3b36000 0001dfc8
> > 	[  592.290000] 7f60: 0001bee8 c00b7b04 00000000 c00b6e3c 01b80000 00000000 c30076c0 00000004
> > 	[  592.290000] 7f80: c0028064 c00b80bc 01b80000 00000000 00000001 00000000 bef71c38 000000dc
> > 	[  592.290000] 7fa0: 00000000 c0027ee0 bef71c38 000000dc 00000003 0001dfc8 00000200 00000200
> > 	[  592.290000] 7fc0: bef71c38 000000dc 00000000 00000004 00000200 00000000 0001dfc8 0001bee8
> > 	[  592.290000] 7fe0: 01b80000 bef71b98 0000d8e4 400e172c 60000010 00000003 00000000 00000000
> > 	[  592.290000] Code: bad PC value
> > 	ubiformat: formatting eraseblock 210 -- 10 % c[  592.890000] ---[ end trace 0c735e4f06680d81 ]---
> > 	ubiformat: formatting eraseblock 220 -- 10 % complete
> 
> You need to debug this. This is not UBIFS, it is something else. This
> particular oops is in nand_write_page(), but it may be caused by memory
> corruptions.
> 
