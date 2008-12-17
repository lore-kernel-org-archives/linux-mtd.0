Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCqu1-0001pF-9p
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 07:33:05 +0000
Subject: Re: UBIFS failures
From: Artem Bityutskiy <dedekind@infradead.org>
To: Bruce_Leonard@selinc.com
In-Reply-To: <1229498337.17960.15.camel@sauron>
References: <OF7D8D85A1.8CD2CCD5-ON88257521.007FE753-88257521.00803388@selinc.com>
	<1229498337.17960.15.camel@sauron>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2008 09:27:51 +0200
Message-Id: <1229498871.17960.21.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Barry_Grussling@selinc.com, linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-12-17 at 09:18 +0200, Artem Bityutskiy wrote:
> Hi,
>=20
> On Tue, 2008-12-16 at 15:20 -0800, Bruce_Leonard@selinc.com wrote:
> <snip>
> > 1154 with dirty 115584 and free 0
> > UBIFS DBG (pid 361): ubifs_tnc_start_commit: number of index LEBs 15
> > UBIFS DBG (pid 361): ubifs_tnc_start_commit: size of index 466936
> > UBIFS DBG (pid 361): get_cnodes_to_commit: committing 403 cnodes
> > UBIFS error (pid 361): alloc_lpt_leb: last LEB 8
> > Call Trace:
> > [df04bbb0] [c0007e64] show_stack+0x58/0x154 (unreliable)
> > [df04bbf0] [c0120680] alloc_lpt_leb+0x160/0x17c
> > [df04bc10] [c0122038] ubifs_lpt_start_commit+0x7dc/0xad4
> > [df04bc50] [c010c5b4] do_commit+0x130/0x77c
> > [df04bcd0] [c011f37c] ubifs_rcvry_gc_commit+0x6d4/0x71c
> > [df04bd10] [c00fc21c] ubifs_fill_super+0xc6c/0x1820
> > [df04bda0] [c00fdf10] ubifs_get_sb+0x318/0x37c
> > [df04be20] [c006d278] vfs_kern_mount+0xa0/0x138
> > [df04be50] [c006d360] do_kern_mount+0x40/0xf4
> > [df04be70] [c008795c] do_new_mount+0x6c/0xb8
> > [df04be90] [c0087b58] do_mount+0x1b0/0x1dc
> > [df04bf10] [c0087c18] sys_mount+0x94/0xe8
> > [df04bf40] [c000f234] ret_from_syscall+0x0/0x38
> <snip>
>=20
> Is it possible for you to share the UBIFS image so that I could
> reproduce the problem here (on nandsim) and investigate it?

I would be good if the answer was "yes". And if it is, then I need:

1. Information about your MTD/UBI setup:
	1.1 cat /proc/mtd
	1.2 ubinfo -a
2. UBIFS image: just do
	dd if=3D/dev/ubi0_Y of=3Dubifs.img bs=3D4096
	where /dev/ubi0_Y is the UBI volume node corresponding to
	the "ubi0:database" volume.
--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
