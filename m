Received: from nz-out-0102.google.com ([64.233.162.206])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FeDdt-0006A6-Cb
	for linux-mtd@lists.infradead.org; Thu, 11 May 2006 12:04:05 -0400
Received: by nz-out-0102.google.com with SMTP id z6so198150nzd
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 May 2006 09:03:56 -0700 (PDT)
Message-ID: <c384c5ea0605110903v4262784ate1f1462b8db9b45@mail.gmail.com>
Date: Thu, 11 May 2006 18:03:56 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: "David Vrabel" <dvrabel@arcom.com>, linux-mtd@lists.infradead.org
In-Reply-To: <44635DD6.10805@arcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <c384c5ea0605110820m606a04e7nc87cbc9302fd619c@mail.gmail.com>
	<44635DD6.10805@arcom.com>
Cc: 
Subject: Re: [PATCH] Do not oops when configured flash size is less then
	chip size
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello David,

On 5/11/06, David Vrabel <dvrabel@arcom.com> wrote:
> Leon Woestenberg wrote:
> >
> > [MTD] CHIPS: Do not oops when configured flash size is less then chip s=
ize
> >
> > My kernel oopsed when the on-board flash chips where quadruple the size=
 of the
> > platform default physmap_map.size. Turned out that max_chips becomes ze=
ro,
>
> This sounds like a valid, if unlikely, board configuration.  e.g., a
> board with chips fitted that are larger than the chip-select memory windo=
w.
>
Yes and no; many (development) boards come with different memory
sizes. A simple fix is that the platform should deal with the largest
common size, but this has only temporal meaning.

> It might be better to pretend such configuration is a single chip that's
> smaller than it physically is.

Yes, but the fact is MTD subsystem will not handle this case, so we
better bail out and warn the user. See the bootlog with your proposed
fixed below. Havoc occurs elsewhere.

Best regards,
--=20
Leon

...
Single flash chip size exceeds the configured flash size. Assuming at
least one chip.
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
cmdlinepart partition parsing not available
Searching for RedBoot partition table in phys_mapped_flash at offset 0x1fc0=
000
Unable to handle kernel paging request at virtual address c8840000
pgd =3D c0004000
[c8840000] *pgd=3D00000000
Internal error: Oops: 5 [#1]
Modules linked in:
CPU: 0
PC is at _memcpy_fromio+0x14/0x2c
LR is at cfi_intelext_read+0x244/0x2d0
pc : [<c0022958>]    lr : [<c0150004>]    Not tainted
sp : c02dbeb4  ip : 00000001  fp : c02dbec0
r10: c5c420e4  r9 : 01fc0000  r8 : c023d5c0
r7 : 00000000  r6 : 00000000  r5 : 01fc0000  r4 : 01fc0000
r3 : 00000000  r2 : 00040000  r1 : c8840000  r0 : c7081000
Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  Segment kernel
Control: C000717F  Table: 00004000  DAC: 00000017
Process swapper (pid: 1, stack limit =3D 0xc02da198)
Stack: (0xc02dbeb4 to 0xc02dc000)
bea0:                                              c02dbf08 c02dbec4 c01500=
04
bec0: c0022954 00040000 c5c420ac 00000000 00040000 00000000 01fc0000 000000=
00
bee0: 01fc0000 c001b584 00000000 c5c43ca4 00000000 00000000 c0285a40 c02dbf=
64
bf00: c02dbf0c c013ffcc c014fdd0 c02dbf34 c7081000 00000000 00000000 c0285a=
40
bf20: c5c43ca4 c7081000 00000000 c023d1c4 c02dbf4c 00000000 00000000 c023d1=
c4
bf40: c001b584 00000000 c5c43ca4 00000000 00000000 c0285a40 c02dbf8c c02dbf=
68
bf60: c013ebfc c013ff44 c0285a40 00000000 c0285a44 00000000 00000000 000000=
00
bf80: c02dbfac c02dbf90 c001487c c013eb94 c0019414 c0018ea8 c02da000 000000=
00
bfa0: c02dbff4 c02dbfb0 c001c0e0 c001479c 00000000 00000000 c001c058 c0038f=
bc
bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 000000=
00
bfe0: 00000000 00000000 00000000 c02dbff8 c0038fbc c001c068 c02dbff8 c02dbf=
f8
Backtrace:
[<c0022944>] (_memcpy_fromio+0x0/0x2c) from [<c0150004>]
(cfi_intelext_read+0x244/0x2d0)
[<c014fdc0>] (cfi_intelext_read+0x0/0x2d0) from [<c013ffcc>]
(parse_redboot_partitions+0x98/0x3f0)
[<c013ff34>] (parse_redboot_partitions+0x0/0x3f0) from [<c013ebfc>]
(parse_mtd_partitions+0x78/0xf4)
[<c013eb84>] (parse_mtd_partitions+0x0/0xf4) from [<c001487c>]
(init_physmap+0xf0/0x19c)
[<c001478c>] (init_physmap+0x0/0x19c) from [<c001c0e0>] (init+0x88/0x264)
 r7 =3D 00000000  r6 =3D C02DA000  r5 =3D C0018EA8  r4 =3D C0019414
[<c001c058>] (init+0x0/0x264) from [<c0038fbc>] (do_exit+0x0/0x81c)
 r7 =3D 00000000  r6 =3D 00000000  r5 =3D 00000000  r4 =3D 00000000
Code: e92dd800 e24cb004 e3a0c000 ea000001 (e4d13001)
 <0>Kernel panic - not syncing: Attempted to kill init!

 CTRL-A Z for help | 57600 8N1 | NOR | Minicom 2.1    | VT102 |      Offlin=
e
