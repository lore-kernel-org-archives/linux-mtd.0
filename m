Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCwKS-00005X-L9
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 13:20:45 +0000
Subject: Re: ubifs mount fails at ubifs_unpack_bits+0x120/0x1fc
From: Artem Bityutskiy <dedekind@infradead.org>
To: Cal Page <pagcal@runbox.com>
In-Reply-To: <4948E874.4040206@runbox.com>
References: <4948E874.4040206@runbox.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 17 Dec 2008 15:18:13 +0200
Message-Id: <1229519894.17960.31.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: ubifs <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-12-17 at 06:54 -0500, Cal Page wrote:
> Here's the attach followed by a mount request that fails with
>  ubifs_unpack_bits+0x120/0x1fc.
>=20
> Any ideas?
>=20
> Cal Page
>=20
> UBI: attaching mtd12 to ubi0
> UBI: physical eraseblock size:   131072 bytes (128 KiB)
> UBI: logical eraseblock size:    126976 bytes
> UBI: smallest flash I/O unit:    2048
> UBI: sub-page size:              512
> UBI: VID header offset:          2048 (aligned 2048)
> UBI: data offset:                4096
> UBI: attached mtd12 to ubi0
> UBI: MTD device name:            "nand_part2"
> UBI: MTD device size:            512 MiB
> UBI: number of good PEBs:        4095
> UBI: number of bad PEBs:         1
> UBI: max. allowed volumes:       128
> UBI: wear-leveling threshold:    4096
> UBI: number of internal volumes: 1
> UBI: number of user volumes:     2
> UBI: available PEBs:             0
> UBI: total number of reserved PEBs: 4095
> UBI: number of PEBs reserved for bad PEB handling: 40
> UBI: max/mean erase counter: 8/4
> UBI: background thread "ubi_bgt0d" started, PID 2077
> UBI device number 0, total 4095 LEBs (519966720 bytes, 495.9 MiB), availa=
ble 0 L
> EBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
> UBIFS: background thread "ubifs_bgt0_1" started, PID 2082
> UBIFS: recovery needed
> Unable to handle kernel paging request at virtual address c88d9003
> pgd =3D c5ca4000
> [c88d9003] *pgd=3Da7c18011, *pte=3D00000000, *ppte=3D00000000
> Internal error: Oops: 7 [#1]
> Modules linked in:
> CPU: 0
> PC is at ubifs_unpack_bits+0x120/0x1fc
> LR is at is_a_node+0x3c/0xf0
> pc : [<c0c697c8>]    lr : [<c0c73acc>]    Not tainted
> sp : c5c91b18  ip : c5c91b40  fp : c5c91b3c
> r10: c5c91b44  r9 : 0000000c  r8 : 0000001c
> r7 : c5c91b40  r6 : 00000000  r5 : c88d9002  r4 : 00000004
> r3 : 00000000  r2 : 00000004  r1 : c5c91b40  r0 : c5c91b44
> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  Segment user
> Control: 5317F
> Table: A5CA4000  DAC: 00000015
> Process mount (pid: 2081, stack limit =3D 0xc5c90250)
> Stack: (0xc5c91b18 to 0xc5c92000)
> 1b00:                                                       c5c1c000 c5c1=
c000=20
> 1b20: c88d9000 c88d9002 00000000 00000000 c5c91b68 c5c91b40 c0c73acc c0c6=
96b8=20
> 1b40: 00000000 c88d9002 c60ff620 c5c1c000 0001eee4 c5c90000 0000000c c5c9=
1bb8=20
> 1b60: c5c91b6c c0c73d04 c0c73aa0 0001f000 00000000 00000000 c88d9000 0001=
a26b=20
> 1b80: 000003c8 00000000 00000000 00000100 c5c91c24 c5c1c000 c5c1c000 0000=
0000=20
> 1ba0: 00000004 c5c1c3c4 00000120 c5c91bec c5c91bbc c0c75788 c0c73b90 0000=
0120=20
> 1bc0: 00000000 c5c91c24 c65124e4 c5c1c000 00000000 00000004 c5c1c000 0000=
0120=20
> 1be0: c5c91c64 c5c91bf0 c0c5fb9c c0c7571c c60ff83c c0d28a54 00000000 0000=
0000=20
> 1c00: 80000001 c5c1c000 c5b6c2f0 00fa3df8 00000000 c5c91c58 c5c91c24 c0c6=
efd8=20
> 1c20: c0c6e018 00000000 00000000 c657a780 000006ba 00013ee0 00000058 0000=
0007=20
> 1c40: c5c90000 c5c1c09c c5c1c000 c5c1c000 c6512400 00000000 c5c91c80 c5c9=
1c68=20
> 1c60: c0c603a8 c0c5fa74 c5c1c338 c0f22240 000000ad c5c91ccc c5c91c84 c0c7=
3284=20
> 1c80: c0c6029c 00000000 00000020 00000000 00000000 000009dd 00000000 c891=
c00b=20
> 1ca0: 00000000 c5c1c338 c5c1c338 00000000 00000000 0001f000 00000001 0000=
0000=20
> 1cc0: c5c91d50 c5c91cd0 c0c4f21c c0c72bf4 c5c91d0c c5c91ce0 c5c1c8bc c5c9=
1cfc=20
> 1ce0: 00000020 00000005 c0e43ad8 c6512724 c6512724 00000005 c0ca7188 0000=
0000=20
> 1d00: c5c90020 c6512600 c5c90000 c5cea000 c6512600 c66b1be0 c5c1c37c c5c1=
c4c4=20
> 1d20: c5c1c374 00000000 00000000 c6512600 c66b1be0 c6512600 00008000 c5ce=
a000=20
> 1d40: c0e98bac c5c91dbc c5c91d54 c0c5114c c0c4e6bc c0beb244 00000000 0000=
0001=20
> 1d60: 00000f2d 1d673000 00000000 c5c89000 00000003 00000000 00000000 0000=
0001=20
> 1d80: 0001f000 00000004 c66aa5dc 0f800002 c5c89006 c7c0caa0 fffffff4 c5c8=
9000=20
> 1da0: c5cea000 c0e98bac c5cea000 c5c86000 c5c91de4 c5c91dc0 c0bd5044 c0c5=
0e74=20
> 1dc0: c7c0caa0 c0e98bac ffffffed c5cea000 c5c89000 00008000 c5c91e00 c5c9=
1de8=20
> 1de0: c0bd592c c0bd4ffc 00000000 00000000 00000000 c5c91f74 c5c91e04 c0be=
c880=20
> 1e00: c0bd5904 00000002 c65fc394 c5c91e28 c5c91e1c c0ba4fc8 c0ca69f0 c5c9=
1e60=20
> 1e20: c5c91e2c c0b7592c c0ba4fc8 00000000 c5c91f4c 00000017 ffffffff c0e8=
e788=20
> 1e40: 00000017 c5c91f0c 00076000 20000013 40169000 c5c91f08 c5c91e64 c0b7=
5ab0=20
> 1e60: c0b75724 c64d18a0 c5c91ecc c5c91ecc c6071000 c5c91ea8 c5c91e84 c0bd=
dc8c=20
> 1e80: c0bdd694 c5c91e90 c6071000 00000001 fffffffe 00000001 c5c91ecc c5c9=
0000=20
> 1ea0: 20000013 c5c90000 c5c91f00 c5c91eb8 c0bb52e4 c0bb4c30 00000044 0000=
0044=20
> 1ec0: 000200d0 00000001 00000000 00000001 c0e948bc c0e948bc 00000000 0007=
5018=20
> 1ee0: 000000d0 c0e948bc ffffffff c5c91f40 00000018 c6b07a14 c7c0c7a0 c5c9=
1f74=20
> 1f00: c5c91f0c c0b6f980 00000001 00000001 00000000 00000000 00076000 0000=
1000=20
> 1f20: 00075018 00000018 c5cea000 c5c91f84 c5c90000 40169000 c5c91f74 0000=
0000=20
> 1f40: c5c91f54 00000000 c0beb080 00000000 c6071000 bec92e6f 00008000 c0b6=
ff84=20
> 1f60: c5c90000 40169000 c5c91fa4 c5c91f78 c0bec978 c0bec2c0 c5cea000 c5c8=
9000=20
> 1f80: c5c86000 c5cea000 00075018 bec92ca0 4001d660 00000015 00000000 c5c9=
1fa8=20
> 1fa0: c0b6fde0 c0bec8f8 00075018 bec92ca0 bec92e6f bec92e76 bec92e69 0000=
8000=20
> 1fc0: 00075018 bec92ca0 4001d660 00075018 00008000 00000000 40169000 0000=
0000=20
> 1fe0: 40111e60 bec92bec 00034968 40111e6c 60000010 bec92e6f 00000000 0000=
0000=20
> Backtrace:=20
> [<c0c696a8>] (ubifs_unpack_bits+0x0/0x1fc) from [<c0c73acc>] (is_a_node+0=
x3c/0xf
> 0)
> [<c0c73a90>] (is_a_node+0x0/0xf0) from [<c0c73d04>] (dbg_check_ltab+0x184=
/0x644)
>  r8 =3D 0000000C  r7 =3D C5C90000  r6 =3D 0001EEE4  r5 =3D C5C1C000
>  r4 =3D C60FF620=20
> [<c0c73b80>] (dbg_check_ltab+0x0/0x644) from [<c0c75788>] (ubifs_lpt_star=
t_commi
> t+0x7c/0xabc)
> [<c0c7570c>] (ubifs_lpt_start_commit+0x0/0xabc) from [<c0c5fb9c>] (do_com=
mit+0x1
> 38/0x828)
> [<c0c5fa64>] (do_commit+0x0/0x828) from [<c0c603a8>] (ubifs_run_commit+0x=
11c/0x1
> 58)
> [<c0c6028c>] (ubifs_run_commit+0x0/0x158) from [<c0c73284>] (ubifs_rcvry_=
gc_comm
> it+0x6a0/0x740)
>  r6 =3D 000000AD  r5 =3D C0F22240  r4 =3D C5C1C338=20
> [<c0c72be4>] (ubifs_rcvry_gc_commit+0x0/0x740) from [<c0c4f21c>] (ubifs_f=
ill_sup
> er+0xb70/0x18a0)
> [<c0c4e6ac>] (ubifs_fill_super+0x0/0x18a0) from [<c0c5114c>] (ubifs_get_s=
b+0x2e8
> /0x364)
> [<c0c50e64>] (ubifs_get_sb+0x0/0x364) from [<c0bd5044>] (vfs_kern_mount+0=
x58/0x9
> 0)
> [<c0bd4fec>] (vfs_kern_mount+0x0/0x90) from [<c0bd592c>] (do_kern_mount+0=
x38/0x4
> c)
>  r8 =3D 00008000  r7 =3D C5C89000  r6 =3D C5CEA000  r5 =3D FFFFFFED
>  r4 =3D C0E98BAC=20
> [<c0bd58f4>] (do_kern_mount+0x0/0x4c) from [<c0bec880>] (do_mount+0x5d0/0=
x638)
>  r6 =3D 00000000  r5 =3D 00000000  r4 =3D 00000000=20
> [<c0bec2b0>] (do_mount+0x0/0x638) from [<c0bec978>] (sys_mount+0x90/0xdc)
> [<c0bec8e8>] (sys_mount+0x0/0xdc) from [<c0b6fde0>] (ret_fast_syscall+0x0=
/0x2c)
>  r7 =3D 00000015  r6 =3D 4001D660  r5 =3D BEC92CA0  r4 =3D 00075018
> Code: e3130004 1a000000 ebfc28ad e3560000 (e5d5e001)=20
>  Segmentation fault

Hmm.
What is your kernel?
What is the last UBIFS commit you have?
Could please you put printks to ubifs_unpack_bits() (it is in
fs/ubifs/lpt.c) and find out which exactly line of C code causes
segfault and why?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
