Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1euOMH-0006q7-CF
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2018 20:11:19 +0000
From: Richard Weinberger <richard@nod.at>
To: martin bayern <martinbayern@outlook.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: power loss results in mounting failure on SLC NAND
Date: Fri, 09 Mar 2018 21:12:26 +0100
Message-ID: <22711116.lYnEpaWOtA@blindfold>
In-Reply-To: <CWLP265MB0721344DBE1B7785E7D2C6A5D2DE0@CWLP265MB0721.GBRP265.PROD.OUTLOOK.COM>
References: <CWLP265MB0721344DBE1B7785E7D2C6A5D2DE0@CWLP265MB0721.GBRP265.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Martin,

Am Freitag, 9. M=C3=A4rz 2018, 20:39:27 CET schrieb martin bayern:
> Hi
>=20
> I encountered one issue on my board during power loss immunity testing. It
> has SLC Nand and Linux 4.2. From my initial analysis, seems the issue is
> related to fastmap.
>=20
> When disabling fastmap, the corrupted PEB, which was damaged by power-cut
> when erasing it, can be re-erased during Ubi attaching. So, in the end, I
> can=E2=80=99t see mounting failure.
>=20
> But, if enable fastmap, I will see mounting failure.
>=20
> I tracked Ubi source code, during attaching, Ubi will scan every PEB, and
> read EC&Vid pages if both pages are damaged, will erase it later due to
> uncompleted erase before.  While for the fastmap case, it doesn=E2=80=99t=
 scan each
> PEB, so, maybe it will miss re-erase corrupted PEB?

So, in this case the upper layer, namely UBIFS, will be unhappy because it=
=20
cannot deal with the ECC error, right?
I fear fastmap changed the semantics of UBI a bit and UBIFS trips over that.

Does the following patch make UBIFS happy again?
If so, we need to improve it further, to be more smart and check every mapp=
ing=20
only once.

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 250e30fac61b..617742948442 100644
=2D-- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -490,6 +490,37 @@ int ubi_eba_unmap_leb(struct ubi_device *ubi, struct=20
ubi_volume *vol,
 	return err;
 }
=20
+int fixup_mapping(struct ubi_device *ubi, struct ubi_volume *vol, int lnum=
,=20
int *pnum)
+{
+	int err;
+	struct ubi_vid_io_buf *vidb;
+
+	if (!ubi->fast_attach)
+		return 0;
+
+	vidb =3D ubi_alloc_vid_buf(ubi, GFP_NOFS);
+	if (!vidb)
+		return -ENOMEM;
+
+	err =3D ubi_io_read_vid_hdr(ubi, *pnum, vidb, 0);
+	if (err > 0 && err !=3D UBI_IO_BITFLIPS) {
+		int torture =3D 0;
+
+		if (err =3D=3D UBI_IO_BAD_HDR_EBADMSG || err =3D=3D UBI_IO_FF_BITFLIPS)
+			torture =3D 1;
+
+		down_read(&ubi->fm_eba_sem);
+		vol->eba_tbl->entries[lnum].pnum =3D UBI_LEB_UNMAPPED;
+		up_read(&ubi->fm_eba_sem);
+		ubi_wl_put_peb(ubi, vol->vol_id, lnum, *pnum, torture);
+
+		*pnum =3D -1;
+	}
+
+	ubi_free_vid_buf(vidb);
+	return 0;
+}
+
 /**
  * ubi_eba_read_leb - read data.
  * @ubi: UBI device description object
@@ -522,6 +553,13 @@ int ubi_eba_read_leb(struct ubi_device *ubi, struct=20
ubi_volume *vol, int lnum,
 		return err;
=20
 	pnum =3D vol->eba_tbl->entries[lnum].pnum;
+
+	if (pnum >=3D 0) {
+		err =3D fixup_mapping(ubi, vol, lnum, &pnum);
+		if (err < 0)
+			goto out_unlock;
+	}
+
 	if (pnum < 0) {
 		/*
 		 * The logical eraseblock is not mapped, fill the whole buffer
@@ -931,6 +969,12 @@ int ubi_eba_write_leb(struct ubi_device *ubi, struct=20
ubi_volume *vol, int lnum,
=20
 	pnum =3D vol->eba_tbl->entries[lnum].pnum;
 	if (pnum >=3D 0) {
+		err =3D fixup_mapping(ubi, vol, lnum, &pnum);
+		if (err < 0)
+			goto out;
+	}
+
+	if (pnum >=3D 0) {
 		dbg_eba("write %d bytes at offset %d of LEB %d:%d, PEB %d",
 			len, offset, vol_id, lnum, pnum);

Thanks,
//richard
