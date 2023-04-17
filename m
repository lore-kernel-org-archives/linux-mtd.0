Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C74C77B76
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Apr 2023 16:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5mZAQNSTZzs97ziAhUA8uQcAcfXhHuGJY4IfBztdQA=; b=RcQfNADwr8N9pWDnqf/P0uQmsm
	PgHJbQO7y+WIufUNeBroKXluMWvCUtpJwK6dz9GFwbgaY431Wv4ENeEYS+9HmCo8yKBdUS+D+3S5b
	qsR5ud5EzJWO8UEdzxO0i37m5IqBCx5a5FP1E8fjoAhiegbotPcoIqw1pvC8z5aG2t9G/0drf9gcX
	ud2mteXxldjLJuP+slhPmgyqbqi+4DrXHwp8AFv0ATObfgebhDeasSN8jYs027oP3UZDNU+t5Z53L
	8p27srXojoCP46knapsAXGJddYMO/Y9922HMtRG9/3I8k6bscEIn3Wn47dg0rMqULn1UwbtPnfrLw
	OSiertww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poRMo-00H00k-1Q;
	Mon, 17 Apr 2023 16:06:10 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poRMk-00Gzzh-2Q
	for linux-mtd@lists.infradead.org;
	Mon, 17 Apr 2023 16:06:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1poRMf-0006HH-5R; Mon, 17 Apr 2023 18:06:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1poRMc-00Buz1-Gv; Mon, 17 Apr 2023 18:05:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1poRMb-00DyPg-Px; Mon, 17 Apr 2023 18:05:57 +0200
Date: Mon, 17 Apr 2023 18:05:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: George Kennedy <george.kennedy@oracle.com>
Cc: vigneshr@ti.com, eorge.kennedy@oracle.com, richard@nod.at,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	syzkaller@googlegroups.com, linux-mtd@lists.infradead.org,
	harshit.m.mogalapalli@oracle.com, miquel.raynal@bootlin.com,
	kernel@pengutronix.de
Subject: Re: [Regression] Cannot overwrite VID header offset any more [Was:
 [PATCH] ubi: ensure that VID header offset + VID header size <= alloc, size]
Message-ID: <20230417160557.uic7ullodkavjr2x@pengutronix.de>
References: <ae901608-0580-010a-26e3-99d0b704b88b@oracle.com>
 <20230417160102.lw6n7bdxwrlkluwj@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230417160102.lw6n7bdxwrlkluwj@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_090606_948043_D1884D56 
X-CRM114-Status: GOOD (  31.89  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0958466369343342470=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0958466369343342470==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="usbftahkxpak76ui"
Content-Disposition: inline


--usbftahkxpak76ui
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Apr 17, 2023 at 06:01:02PM +0200, Uwe Kleine-K=F6nig wrote:
> On Tue, Nov 15, 2022 at 10:14:44AM -0500, George Kennedy wrote:
> > Ensure that the VID header offset + VID header size does not exceed
> > the allocated area to avoid slab OOB.
> >=20
> > BUG: KASAN: slab-out-of-bounds in crc32_body lib/crc32.c:111 [inline]
> > BUG: KASAN: slab-out-of-bounds in crc32_le_generic lib/crc32.c:179 [inl=
ine]
> > BUG: KASAN: slab-out-of-bounds in crc32_le_base+0x58c/0x626 lib/crc32.c=
:197
> > Read of size 4 at addr ffff88802bb36f00 by task syz-executor136/1555
> >=20
> > CPU: 2 PID: 1555 Comm: syz-executor136 Tainted: G        W
> > 6.0.0-1868 #1
> > Hardware name: Red Hat KVM, BIOS 1.13.0-2.module+el8.3.0+7860+a7792d29
> > 04/01/2014
> > Call Trace:
> >  <TASK>
> >  __dump_stack lib/dump_stack.c:88 [inline]
> >  dump_stack_lvl+0x85/0xad lib/dump_stack.c:106
> >  print_address_description mm/kasan/report.c:317 [inline]
> >  print_report.cold.13+0xb6/0x6bb mm/kasan/report.c:433
> >  kasan_report+0xa7/0x11b mm/kasan/report.c:495
> >  crc32_body lib/crc32.c:111 [inline]
> >  crc32_le_generic lib/crc32.c:179 [inline]
> >  crc32_le_base+0x58c/0x626 lib/crc32.c:197
> >  ubi_io_write_vid_hdr+0x1b7/0x472 drivers/mtd/ubi/io.c:1067
> >  create_vtbl+0x4d5/0x9c4 drivers/mtd/ubi/vtbl.c:317
> >  create_empty_lvol drivers/mtd/ubi/vtbl.c:500 [inline]
> >  ubi_read_volume_table+0x67b/0x288a drivers/mtd/ubi/vtbl.c:812
> >  ubi_attach+0xf34/0x1603 drivers/mtd/ubi/attach.c:1601
> >  ubi_attach_mtd_dev+0x6f3/0x185e drivers/mtd/ubi/build.c:965
> >  ctrl_cdev_ioctl+0x2db/0x347 drivers/mtd/ubi/cdev.c:1043
> >  vfs_ioctl fs/ioctl.c:51 [inline]
> >  __do_sys_ioctl fs/ioctl.c:870 [inline]
> >  __se_sys_ioctl fs/ioctl.c:856 [inline]
> >  __x64_sys_ioctl+0x193/0x213 fs/ioctl.c:856
> >  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> >  do_syscall_64+0x3e/0x86 arch/x86/entry/common.c:80
> >  entry_SYSCALL_64_after_hwframe+0x63/0x0
> > RIP: 0033:0x7f96d5cf753d
> > Code:
> > RSP: 002b:00007fffd72206f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> > RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f96d5cf753d
> > RDX: 0000000020000080 RSI: 0000000040186f40 RDI: 0000000000000003
> > RBP: 0000000000400cd0 R08: 0000000000000000 R09: 0000000000000000
> > R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000400be0
> > R13: 00007fffd72207e0 R14: 0000000000000000 R15: 0000000000000000
> >  </TASK>
> >=20
> > Allocated by task 1555:
> >  kasan_save_stack+0x20/0x3d mm/kasan/common.c:38
> >  kasan_set_track mm/kasan/common.c:45 [inline]
> >  set_alloc_info mm/kasan/common.c:437 [inline]
> >  ____kasan_kmalloc mm/kasan/common.c:516 [inline]
> >  __kasan_kmalloc+0x88/0xa3 mm/kasan/common.c:525
> >  kasan_kmalloc include/linux/kasan.h:234 [inline]
> >  __kmalloc+0x138/0x257 mm/slub.c:4429
> >  kmalloc include/linux/slab.h:605 [inline]
> >  ubi_alloc_vid_buf drivers/mtd/ubi/ubi.h:1093 [inline]
> >  create_vtbl+0xcc/0x9c4 drivers/mtd/ubi/vtbl.c:295
> >  create_empty_lvol drivers/mtd/ubi/vtbl.c:500 [inline]
> >  ubi_read_volume_table+0x67b/0x288a drivers/mtd/ubi/vtbl.c:812
> >  ubi_attach+0xf34/0x1603 drivers/mtd/ubi/attach.c:1601
> >  ubi_attach_mtd_dev+0x6f3/0x185e drivers/mtd/ubi/build.c:965
> >  ctrl_cdev_ioctl+0x2db/0x347 drivers/mtd/ubi/cdev.c:1043
> >  vfs_ioctl fs/ioctl.c:51 [inline]
> >  __do_sys_ioctl fs/ioctl.c:870 [inline]
> >  __se_sys_ioctl fs/ioctl.c:856 [inline]
> >  __x64_sys_ioctl+0x193/0x213 fs/ioctl.c:856
> >  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> >  do_syscall_64+0x3e/0x86 arch/x86/entry/common.c:80
> >  entry_SYSCALL_64_after_hwframe+0x63/0x0
> >=20
> > The buggy address belongs to the object at ffff88802bb36e00
> >  which belongs to the cache kmalloc-256 of size 256
> > The buggy address is located 0 bytes to the right of
> >  256-byte region [ffff88802bb36e00, ffff88802bb36f00)
> >=20
> > The buggy address belongs to the physical page:
> > page:00000000ea4d1263 refcount:1 mapcount:0 mapping:0000000000000000
> > index:0x0 pfn:0x2bb36
> > head:00000000ea4d1263 order:1 compound_mapcount:0 compound_pincount:0
> > flags: 0xfffffc0010200(slab|head|node=3D0|zone=3D1|lastcpupid=3D0x1ffff=
f)
> > raw: 000fffffc0010200 ffffea000066c300 dead000000000003 ffff888100042b40
> > raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
> > page dumped because: kasan: bad access detected
> >=20
> > Memory state around the buggy address:
> >  ffff88802bb36e00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >  ffff88802bb36e80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > ffff88802bb36f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >                    ^
> >  ffff88802bb36f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >  ffff88802bb37000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > Fixes: 801c135ce73d ("UBI: Unsorted Block Images")
> > Reported-by: syzkaller <syzkaller@googlegroups.com>
> > Signed-off-by: George Kennedy <george.kennedy@oracle.com>
> > ---
> >  drivers/mtd/ubi/build.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> > index a32050fecabf..53aa4de6b963 100644
> > --- a/drivers/mtd/ubi/build.c
> > +++ b/drivers/mtd/ubi/build.c
> > @@ -663,6 +663,12 @@ static int io_init(struct ubi_device *ubi, int max=
_beb_per1024)
> >  	ubi->ec_hdr_alsize =3D ALIGN(UBI_EC_HDR_SIZE, ubi->hdrs_min_io_size);
> >  	ubi->vid_hdr_alsize =3D ALIGN(UBI_VID_HDR_SIZE, ubi->hdrs_min_io_size=
);
> > +	if (ubi->vid_hdr_offset && ((ubi->vid_hdr_offset + UBI_VID_HDR_SIZE) >
> > +	    ubi->vid_hdr_alsize)) {
> > +		ubi_err(ubi, "VID header offset %d too large.", ubi->vid_hdr_offset);
> > +		return -EINVAL;
> > +	}
> > +
>=20
> This patch is in mainline as 1b42b1a36fc946f0d7088425b90d491b4257ca3e,
> and backported to various stable releases.
>=20
> For me this breaks
>=20
> 	ubiattach -m 0 -O 2048
>=20
> I think the check
>=20
> 	ubi->vid_hdr_offset + UBI_VID_HDR_SIZE > ubi->vid_hdr_alsize
>=20
> is wrong. Without -O passed to ubiattach (and dynamic debug enabled) I
> get:
>=20
> [ 5294.936762] UBI DBG gen (pid 9619): sizeof(struct ubi_ainf_peb) 56
> [ 5294.936769] UBI DBG gen (pid 9619): sizeof(struct ubi_wl_entry) 32
> [ 5294.936774] UBI DBG gen (pid 9619): min_io_size      2048
> [ 5294.936779] UBI DBG gen (pid 9619): max_write_size   2048
> [ 5294.936783] UBI DBG gen (pid 9619): hdrs_min_io_size 512
> [ 5294.936787] UBI DBG gen (pid 9619): ec_hdr_alsize    512
> [ 5294.936791] UBI DBG gen (pid 9619): vid_hdr_alsize   512
> [ 5294.936796] UBI DBG gen (pid 9619): vid_hdr_offset   512
> [ 5294.936800] UBI DBG gen (pid 9619): vid_hdr_aloffset 512
> [ 5294.936804] UBI DBG gen (pid 9619): vid_hdr_shift    0
> [ 5294.936808] UBI DBG gen (pid 9619): leb_start        2048
> [ 5294.936812] UBI DBG gen (pid 9619): max_erroneous    409
>=20
> So the check would only pass for vid_hdr_offset <=3D 512 -
> UBI_VID_HDR_SIZE; note that even specifying the default value 512 (i.e.
>=20
> 	ubiattach -m 0 -O 512
>=20
> ) fails the check.
>=20
> A less strong check would be:
>=20
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index 0904eb40c95f..69c28a862430 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -666,8 +666,8 @@ static int io_init(struct ubi_device *ubi, int max_be=
b_per1024)
>  	ubi->ec_hdr_alsize =3D ALIGN(UBI_EC_HDR_SIZE, ubi->hdrs_min_io_size);
>  	ubi->vid_hdr_alsize =3D ALIGN(UBI_VID_HDR_SIZE, ubi->hdrs_min_io_size);
> =20
> -	if (ubi->vid_hdr_offset && ((ubi->vid_hdr_offset + UBI_VID_HDR_SIZE) >
> -	    ubi->vid_hdr_alsize)) {
> +	if (ubi->vid_hdr_offset &&
> +	    ubi->vid_hdr_offset + UBI_VID_HDR_SIZE > ubi->peb_size) {
>  		ubi_err(ubi, "VID header offset %d too large.", ubi->vid_hdr_offset);
>  		return -EINVAL;
>  	}
>=20
> But I'm unsure if this would be too lax?!

I just learned in irc that

	1e020e1b96af ("ubi: Fix failure attaching when vid_hdr offset equals to (s=
ub)page size")

is supposed to fix that.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--usbftahkxpak76ui
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ9bmQACgkQj4D7WH0S
/k5pvwgArhhQZtMIqKSLAbg+XyKYFwa5oBHGtxRrenK60JhukhujPXDx291maf37
J1qO+z9ZeeEjfHyaR6hyXxFATCgcdMKWJl85opsvRZsUfdqulUd+TU+R/ovD6WZY
sp8eIoau1fLfXkU+L6Dhrw40a6jnp0pr5Nwqme1f0SROnQMU1eEWNjCW6QgoLGrc
GGSYwr1SMx8thuiCw97J3aUaxP9ZsUufpGjLm6ZTbltrGnqG9t7WWWfdoIoVUPqq
/sPLamQcDtq+2hHsq8WguuLl8vAs4YG6lVjZ2yLCr03b38a9uy/MruECYk7A6YrC
+T7ONvQGJGc/r3ux5f72wEipvrrgXg==
=zNOU
-----END PGP SIGNATURE-----

--usbftahkxpak76ui--


--===============0958466369343342470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0958466369343342470==--

