Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T2hsc-0008PW-E5
 for linux-mtd@lists.infradead.org; Sat, 18 Aug 2012 12:11:51 +0000
Received: by wgbez12 with SMTP id ez12so2986144wgb.18
 for <linux-mtd@lists.infradead.org>; Sat, 18 Aug 2012 05:11:46 -0700 (PDT)
From: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] UBI: Do not try to autoresize in readonly mode
Date: Sat, 18 Aug 2012 14:11:42 +0200
Message-ID: <8381186.XTLIOQGYR2@pali>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1865680.IAdRWtXqUK";
 micalg="pgp-sha1"; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--nextPart1865680.IAdRWtXqUK
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hello,

when I'm tried to mount ubifs image from readonly mtd device (e.g=20
virtual, only for unpacking data) it failed because image has=20
autoresize flag on ubi block. ubi build.c code trying to=20
autoresize ubi image if has autoresize flag and if autoresize=20
failed, attaching ubi failed. So it is not possible to mount=20
ubifs image if ubi has autoresize flag in read only mode (because=20
resizing is not possible on read only device).

I'm sending small patch which skip autoresizing ubi in readonly=20
mode. I think it is really not good idea to try resize in ro=20
mode.

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 738772c..ad911ab 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -927,7 +927,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd,=20
int ubi_num, int vid_hdr_offset)
 =09=09goto out_debugging;
 =09}
=20
-=09if (ubi->autoresize_vol_id !=3D -1) {
+=09if (!ubi->ro_mode && ubi->autoresize_vol_id !=3D -1) {
 =09=09err =3D autoresize(ubi, ubi->autoresize_vol_id);
 =09=09if (err)
 =09=09=09goto out_detach;

With this patch I'm able to mount & unpack data from ubifs image=20
on read only (virtual/simulated) nand device with autoresize=20
flag. Consider including this patch to ubi-2.6 git tree.

BTW, is there userspace tool for unpacking data from ubifs image=20
without need to simulate nand device in kernel?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
--nextPart1865680.IAdRWtXqUK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlAvhn4ACgkQi/DJPQPkQ1IWUgCcCkrqbskDqe9HU6pzFz27iEDw
0JgAn3Sl/m6Nv+KB3hK6fHwhuwUy6cFh
=iQA2
-----END PGP SIGNATURE-----

--nextPart1865680.IAdRWtXqUK--
