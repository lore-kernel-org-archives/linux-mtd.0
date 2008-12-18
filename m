Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LDCAB-0003cJ-Sx
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2008 06:15:12 +0000
Subject: Re: ubifs backtrace for - BUG: scheduling while atomic - when runs
	out of space
From: Artem Bityutskiy <dedekind@infradead.org>
To: Cal Page <pagcal@runbox.com>
In-Reply-To: <1229580771.17960.46.camel@sauron>
References: <49491CA7.5020200@runbox.com> <1229580771.17960.46.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Thu, 18 Dec 2008 08:16:01 +0200
Message-Id: <1229580961.17960.51.camel@sauron>
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

On Thu, 2008-12-18 at 08:12 +0200, Artem Bityutskiy wrote:
> On Wed, 2008-12-17 at 10:37 -0500, Cal Page wrote:
> > !!! Note: BUG() placed at kernel/sched.c schedule() at 'scheduling whil=
e atomic'
> >=20
> > Backtrace:=20
> >=20
> > [<c0e1e640>] (schedule+0x0/0x6dc) from [<c0d2245c>] (wait_op_done+0xb0/=
0x150)
> > [<c0d223ac>] (wait_op_done+0x0/0x150) from [<c0d22740>] (send_prog_page=
+0x64/0x74)
> >  r5 =3D C0F2ABE0  r4 =3D C661FAC0=20
> > [<c0d226dc>] (send_prog_page+0x0/0x74) from [<c0d22934>] (mxc_nand_comm=
and+0x16c/0x3ec)
> > [<c0d227c8>] (mxc_nand_command+0x0/0x3ec) from [<c0d1ddd8>] (nand_write=
_page+0x80/0xd4)
> > [<c0d1dd58>] (nand_write_page+0x0/0xd4) from [<c0d1e83c>] (nand_do_writ=
e_ops+0x2b0/0x340)
> >  r7 =3D 0004AA60  r6 =3D C4B07000  r5 =3D 00000000  r4 =3D 00000800
> > [<c0d1e58c>] (nand_do_write_ops+0x0/0x340) from [<c0d1f71c>] (nand_writ=
e+0xa0/0xc0)
> > [<c0d1f67c>] (nand_write+0x0/0xc0) from [<c0d153e8>] (part_write+0xb0/0=
xec)
> > [<c0d15338>] (part_write+0x0/0xec) from [<c0d2a6b0>] (ubi_io_write+0x78=
/0xb4)
> >  r7 =3D FFFFFFE2  r6 =3D C4B07000  r5 =3D 00000000  r4 =3D 00010000
> > [<c0d2a638>] (ubi_io_write+0x0/0xb4) from [<c0d28af0>] (ubi_eba_write_l=
eb+0x94/0x83c)
> > [<c0d28a5c>] (ubi_eba_write_leb+0x0/0x83c) from [<c0d27d9c>] (ubi_leb_w=
rite+0xec/0x104)
> > [<c0d27cb0>] (ubi_leb_write+0x0/0x104) from [<c0c77fac>] (dbg_leb_write=
+0x9c/0xb8)
> >  r8 =3D C4B07000  r7 =3D 0000003C  r6 =3D C509BB00  r5 =3D 00000800  r4=
 =3D C44DE000=20
> > [<c0c77f10>] (dbg_leb_write+0x0/0xb8) from [<c0c542ac>] (ubifs_wbuf_wri=
te_nolock+0x444/0x6f4)
> > [<c0c53e68>] (ubifs_wbuf_write_nolock+0x0/0x6f4) from [<c0c46f30>] (wri=
te_head+0x10c/0x150)
> > [<c0c46e24>] (write_head+0x0/0x150) from [<c0c470d0>] (ubifs_jnl_write_=
inode+0x12c/0x25c)
> > [<c0c46fa4>] (ubifs_jnl_write_inode+0x0/0x25c) from [<c0c50c38>] (ubifs=
_write_inode+0x118/0x18c)
> > [<c0c50b20>] (ubifs_write_inode+0x0/0x18c) from [<c0bf2e68>] (__writeba=
ck_single_inode+0x200/0x384)
> >  r7 =3D C405C5EC  r6 =3D C459EC00  r5 =3D C405C554  r4 =3D 00000001
> > [<c0bf2c68>] (__writeback_single_inode+0x0/0x384) from [<c0bf32a0>] (sy=
nc_sb_inodes+0x1d8/0x2c8)
> > [<c0bf30c8>] (sync_sb_inodes+0x0/0x2c8) from [<c0bf35a4>] (generic_sync=
_sb_inodes+0x10/0x14)
> > [<c0bf3594>] (generic_sync_sb_inodes+0x0/0x14) from [<c0c65534>] (ubifs=
_budget_space+0x98c/0xe98)
> > [<c0c64ba8>] (ubifs_budget_space+0x0/0xe98) from [<c0c4a578>] (ubifs_pr=
epare_write+0x18c/0x1a4)
> > [<c0c4a3ec>] (ubifs_prepare_write+0x0/0x1a4) from [<c0bb22f4>] (generic=
_file_buffered_write+0x2a0/0x694)
> > [<c0bb2058>] (generic_file_buffered_write+0x4/0x694) from [<c0bb2c24>] =
(__generic_file_aio_write_nolock+0x53c/0x5bc)
> > [<c0bb26e8>] (__generic_file_aio_write_nolock+0x0/0x5bc) from [<c0bb2d2=
0>] (generic_file_aio_write+0x7c/0xf0)
> > [<c0bb2ca8>] (generic_file_aio_write+0x4/0xf0) from [<c0c49220>] (ubifs=
_aio_write+0x1b4/0x244)
> > [<c0c49070>] (ubifs_aio_write+0x4/0x244) from [<c0bd2718>] (do_sync_wri=
te+0xc0/0x114)
> > [<c0bd2658>] (do_sync_write+0x0/0x114) from [<c0bd30d8>] (vfs_write+0xb=
8/0x194)
> >  r6 =3D C44DFF80  r5 =3D BEF15AF8  r4 =3D C5183CA0=20
> > [<c0bd3020>] (vfs_write+0x0/0x194) from [<c0bd37f0>] (sys_write+0x4c/0x=
80)
> >  r7 =3D 00000004  r6 =3D 00000000  r5 =3D 0006E000  r4 =3D C5183CA0
> > [<c0bd37a4>] (sys_write+0x0/0x80) from [<c0b6fde0>] (ret_fast_syscall+0=
x0/0x2c)
> >  r6 =3D 4001D660  r5 =3D BEF15AF8  r4 =3D 00002000=20
> > Code: e59f0650 ebf5b444 ebf554f6 e3a03000 (e5833000)=20
>=20
> Sorry, I do not have ideas. It sounds like you have schedule() called
> while having a spinlock locked. None of these functions seem to do have
> spinlocks.
>=20
> What I would do, I'd put explicit 'schedule()' call at the beginning of
> each function in the dump. Hopefully this would show the offender
> function.

Also, please, enable lockdep. It is under "Kernel hacking -> Lock
debugging: prove locking correctness" in the kernel config menu.
--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
