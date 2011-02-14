Subject: Re: Numonyx NOR and chip->mutex bug?
Mime-Version: 1.0 (Apple Message framework v1082)
Content-Type: text/plain; charset=us-ascii
From: Michael Cashwell <mboards@prograde.net>
In-Reply-To: <OF4712116F.F6D6711D-ONC1257833.0060F6D7-C1257833.0061BCF8@transmode.se>
Date: Mon, 14 Feb 2011 10:59:18 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <CC06A96F-91EF-4E33-BCC0-1F9592F65690@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<0488D3BA-7BA3-4E98-B289-3F3D1DB485D4@prograde.net>
	<OF2C1ABD39	<4D5005E4.1040506@keymile.com>	<OFFF2C6D34.91E5D6C3-ONC1257	<96BD3889-E8AD-408D-8275-ED1A5FD55F1B@prograde.net>
	<OF9738D658.F46	<4C117A67-5057-4ACD-8EBE-04E9C782570C@prograde.net>	<OF6D40AC82.1008D3DD-ONC1
	<4D53E660.4020305@users.sourceforge.net>	<OF4E49CFD6.F0E578FE-ONC1257833.004BF8B1-C1257833.004D48AA@transmode.se>
	<85661EDC-9882-41B1-A926-0A88EF1CEF2E@prograde.net>	<OFEF05BB2C.A2E3BADF-O
	<97165996-D766-468D-AB90-974E29ABCFB7@prograde.net>	<OFBD6C1723.E5530FEB-ONC1257833.005BF5C1-C1257833.005C2C61@transmode.se>
	<OF4FEF6422.2B862198-ONC125783	<3B106371-0DA1-4F15-9482-7307110A86E2@prograde.net>
	<OF626FDFE6.CA621532-ONC1257833.005E857C-C1257833.005F4BE2@transmode.se>
	<OF4712116F.F6D6711D-ONC1257833.0060F6D7-C1257833.0061BCF8@transmode.se>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Cc: linux-mtd-bounces@lists.infradead.org, linux-mtd@lists.infradead.org,
	Holger brunck <holger.brunck@keymile.com>, stefan.bigler@keymile.com,
	=?iso-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To verify things are as expected when doing the erase suspend I added =
some status checks. That section of chip_read() shown next. I wanted to =
be sure that once the for (;;) loop ends that we were properly in a =
suspended erase state with no unexpected status bits.

	case FL_ERASING:
...
		/* Erase suspend */
		map_write(map, CMD(0x70), adr);
		map_write(map, CMD(0xB0), adr);
...
		map_write(map, CMD(0x70), adr);
		chip->oldstate =3D FL_ERASING;
		chip->state =3D FL_ERASE_SUSPENDING;
		chip->erase_suspended =3D 1;
		for (;;) {
			status =3D map_read(map, adr);
			if (map_word_andequal(map, status, status_OK, =
status_OK))
			        break;
...
		}
		if (!map_word_bitsset(map, status, CMD(0x40)))
			printk(KERN_ERR "%s: Erase-suspend completed =
instead.\n", map->name);

		if (map_word_bitsset(map, status, CMD(0x3f))) {
			printk(KERN_ERR "%s: Erase-suspend had =
unexpected status bits %lx.\n", map->name, status.x[0]);
			BUG();
		}

		chip->state =3D FL_STATUS;
		return 0;

During UBI writing via rsync things failed:

NOR Flash: Erase-suspend had unexpected status bits c4.
kernel BUG at drivers/mtd/chips/cfi_cmdset_0001.c:874!
Unable to handle kernel NULL pointer dereference at virtual address =
00000000
pgd =3D c7ee4000
*pte=3D0000000025
Internal error: Oops: 817 [#1] PREEMPT
last sysfs file: /sys/class/ubi/ubi4/ubi4_0/name
Modules linked in: sc16is7uart gpiopps gpiodriver
CPU: 0    Not tainted  (2.6.35.7 #22)
PC is at __bug+0x1c/0x28
LR is at __bug+0x18/0x28
pc : [<c0026f40>]    lr : [<c0026f3c>]    psr: 60000013
sp : c7ee1b78  ip : 00000000  fp : 00000188
r10: c7cf2f10  r9 : ffffda32  r8 : 017a3000
r7 : c7cf2ef8  r6 : c0349730  r5 : 000000c4  r4 : c7c857ac
r3 : 00000000  r2 : 00020000  r1 : 00002040  r0 : 0000003d
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 0000397f  Table: a7ee4000  DAC: 00000015
Process rsync (pid: 399, stack limit =3D 0xc7ee0278)
Stack: (0xc7ee1b78 to 0xc7ee2000)
...
[<c0026f40>] (__bug+0x1c/0x28) from [<c01a5980>] =
(chip_ready+0x20c/0x36c)
[<c01a5980>] (chip_ready+0x20c/0x36c) from [<c01a5f48>] =
(get_chip+0x8c/0x224)
[<c01a5f48>] (get_chip+0x8c/0x224) from [<c01a6648>] =
(cfi_intelext_writev+0x1a4/0x600)
[<c01a6648>] (cfi_intelext_writev+0x1a4/0x600) from [<c01a6ad4>] =
(cfi_intelext_write_buffers+0x30/0x38)
[<c01a6ad4>] (cfi_intelext_write_buffers+0x30/0x38) from [<c019f5c4>] =
(part_write+0x8c/0xa0)
[<c019f5c4>] (part_write+0x8c/0xa0) from [<c01b0ddc>] =
(ubi_io_write+0x4c/0xa4)
[<c01b0ddc>] (ubi_io_write+0x4c/0xa4) from [<c01af22c>] =
(ubi_eba_write_leb+0x7c/0x770)
[<c01af22c>] (ubi_eba_write_leb+0x7c/0x770) from [<c01ae328>] =
(ubi_leb_write+0xf4/0xf8)
[<c01ae328>] (ubi_leb_write+0xf4/0xf8) from [<c0134020>] =
(ubifs_wbuf_write_nolock+0x230/0x324)
[<c0134020>] (ubifs_wbuf_write_nolock+0x230/0x324) from [<c0129704>] =
(write_head.clone.12.clone.14+0x40/0x60)
[<c0129704>] (write_head.clone.12.clone.14+0x40/0x60) from [<c01299c0>] =
(ubifs_jnl_update+0x29c/0x4f4)
[<c01299c0>] (ubifs_jnl_update+0x29c/0x4f4) from [<c012ea04>] =
(ubifs_create+0x114/0x1b8)
[<c012ea04>] (ubifs_create+0x114/0x1b8) from [<c009683c>] =
(vfs_create+0x84/0x88)
[<c009683c>] (vfs_create+0x84/0x88) from [<c00997d0>] =
(do_last.clone.55+0x55c/0x63c)
[<c00997d0>] (do_last.clone.55+0x55c/0x63c) from [<c0099a40>] =
(do_filp_open+0x190/0x4e4)
[<c0099a40>] (do_filp_open+0x190/0x4e4) from [<c008d4c0>] =
(do_sys_open+0x5c/0xa8)
[<c008d4c0>] (do_sys_open+0x5c/0xa8) from [<c0023f40>] =
(ret_fast_syscall+0x0/0x2c)
Code: e59f0010 e1a01003 eb098786 e3a03000 (e5833000)=20

The c4 status above is strange. chip->status was FL_ERASING but after =
the suspend we had both ESS and PSS status set. That means that both and =
erase and a program have been suspended.

Huh? How do we ever get PSS set? I thought that without xip the code =
would not suspend writes. So I'm quite confused by this.

It's also interesting that do_write_buffer() is not shown in the stack =
dump. I assume it's being inlined.

Still looking...

-Mike
