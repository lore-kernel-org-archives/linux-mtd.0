Received: from mail-out.m-online.net ([212.18.0.10])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pnrjd-00069R-Bl
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 12:04:26 +0000
Date: Fri, 11 Feb 2011 13:04:13 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Guillaume LECERF <glecerf@gmail.com>
Subject: Re: [PATCH 2/2] mtd: cfi: fix writebufsize initialization
Message-ID: <20110211130413.1de915e5@wker>
In-Reply-To: <AANLkTi=Jtc7cUZ3puU_krmxm34P1LB605i8FE6Rti1jp@mail.gmail.com>
References: <1296998270-19853-1-git-send-email-dedekind1@gmail.com>
	<1297350106-16383-3-git-send-email-agust@denx.de>
	<AANLkTi=Jtc7cUZ3puU_krmxm34P1LB605i8FE6Rti1jp@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Adrian Hunter <adrian.hunter@nokia.com>, linux-mtd@lists.infradead.org,
	Detlev Zundel <dzu@denx.de>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Guillaume,

On Thu, 10 Feb 2011 16:13:31 +0100
Guillaume LECERF <glecerf@gmail.com> wrote:

> Hi Anatolij.
>=20
> 2011/2/10 Anatolij Gustschin <agust@denx.de>:
> > When initializing mtd->writebufsize, we must take into account
> > possible flash chip interleaving. Wrong writebufsize initialization
> > caused UBIFS recovery issues resulting in unmountable UBIFS file
> > system on NOR flash partitions.
> > - =C2=A0 =C2=A0 =C2=A0 mtd->writebufsize =3D 1 << cfi->cfiq->MaxBufWrit=
eSize;
> > + =C2=A0 =C2=A0 =C2=A0 mtd->writebufsize =3D cfi_interleave(cfi) << cfi=
->cfiq->MaxBufWriteSize;
>=20
>=20
> This is exactly what I told you (
> http://lists.infradead.org/pipermail/linux-mtd/2010-December/033559.html
> ).

Yes, this is true. But it couldn't have worked without further fixes
for UBI:

ubiattach -m 8 -d 0 /dev/ubi_ctrl
UBI: attaching mtd8 to ubi0
UBI: physical eraseblock size:   262144 bytes (256 KiB)
UBI: logical eraseblock size:    262016 bytes
UBI: smallest flash I/O unit:    128
UBI: sub-page size:              1
UBI: VID header offset:          64 (aligned 64)
UBI: data offset:                128
UBI error: validate_ec_hdr: bad VID header offset 128, expected 64
UBI error: validate_ec_hdr: bad EC header
Call Trace:
[c3fbbc40] [c0009220] show_stack+0xac/0x1d8 (unreliable)
[c3fbbc90] [c0009378] dump_stack+0x2c/0x44
[c3fbbca0] [c0257d90] ubi_io_read_ec_hdr+0x2d8/0x3b4
[c3fbbcd0] [c025b868] ubi_scan+0x1b4/0xc80
[c3fbbd50] [c02513d8] ubi_attach_mtd_dev+0x5e0/0xf1c
[c3fbbe50] [c0252194] ctrl_cdev_ioctl+0x164/0x234
[c3fbbe90] [c00c0bd4] vfs_ioctl+0x48/0xa8
[c3fbbea0] [c00c0e58] do_vfs_ioctl+0x98/0x704
[c3fbbf10] [c00c1514] sys_ioctl+0x50/0x84
[c3fbbf40] [c0013564] ret_from_syscall+0x0/0x38
--- Exception: c01 at 0xff38b10
    LR =3D 0xffec8a8
UBI error: ubi_io_read_ec_hdr: validation failed for PEB 0
UBI error: ubi_attach_mtd_dev: failed to attach by scanning, error -22
ubiattach: error!: cannot attach mtd8
           error 22 (Invalid argument)

It works for me now when I use recent UBIFS patches from Artem
([PATCH v2 0/5] UBIFS: fix recovery on CFI NOR).

> Could you examine the (not compilable) patches I attached and merge
> them with your current patch ?

Currently we are seeing two other issues with UBIFS recovery after
power cuts, but these seem not to be caused by to big write buffer.
I'm looking for the reason for the observed corruptions now and
will look at your patches later.

Thanks!
Anatolij
