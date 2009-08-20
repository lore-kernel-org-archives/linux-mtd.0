Received: from wmproxy1-g27.free.fr ([212.27.42.91])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MeExA-0002AX-4a
	for linux-mtd@lists.infradead.org; Thu, 20 Aug 2009 21:13:52 +0000
Date: Thu, 20 Aug 2009 23:13:46 +0200 (CEST)
From: dimitri.gorokhovik@free.fr
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <420676341.3665461250802826403.JavaMail.root@zimbra3-e1.priv.proxad.net>
In-Reply-To: <20090819163426.fa90cf9f.akpm@linux-foundation.org>
Subject: Re: [PATCH] nftl: fix offset alignments
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: Scott James Remnant <scott@canonical.com>,
	David Brownell <dbrownell@users.sourceforge.net>,
	David Woodhouse <David.Woodhouse@intel.com>,
	linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>,
	linux-mtd@lists.infradead.org, Tim Gardner <tim.gardner@canonical.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"Andrew Morton" <akpm@linux-foundation.org> a =C3=A9crit :
> On Wed, 19 Aug 2009 00:06:28 +0200 (CEST) dimitri.gorokhovik@free.fr
> wrote:
> ...
> > +=09typeof(offs) mask =3D mtd->writesize - 1;
>=20
> I see no reason to use typeof here.  Plain old
>=20
> =09loff_t mask =3D mtd->writesize - 1;
>=20
> would be more conventional.

I use typeoff in this way to guard masking code against absent-minded
modifications.=20

Attached is a corrected version as suggested.=20

Maybe Julia can come up with a clever rule for detecting unusual masking=20
operations automatically :-) ?=20

---
From: Dimitri Gorokhovik <dimitri.gorokhovik@free.fr>
Subject: nftl: fix offset alignments

Arithmetic conversion in the mask computation makes the upper word
of the second argument passed down to mtd->read_oob(), be always 0
(assuming 'offs' being a 64-bit signed long long type, and
'mtd->writesize' being a 32-bit unsigned int type).

This patch applies over the other one adding masking in nftl_write,
"nftl: write support is broken".

Signed-off-by: Dimitri Gorokhovik <dimitri.gorokhovik@free.fr>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Tim Gardner <tim.gardner@canonical.com>
Cc: Scott James Remnant <scott@canonical.com>
---
 drivers/mtd/nftlcore.c |   15 +++++++++------
 1 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index 665d3eb..1002e18 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -135,16 +135,17 @@ static void nftl_remove_dev(struct mtd_blktrans_dev *=
dev)
 int nftl_read_oob(struct mtd_info *mtd, loff_t offs, size_t len,
 =09=09  size_t *retlen, uint8_t *buf)
 {
+=09loff_t mask =3D mtd->writesize - 1;
 =09struct mtd_oob_ops ops;
 =09int res;
=20
 =09ops.mode =3D MTD_OOB_PLACE;
-=09ops.ooboffs =3D offs & (mtd->writesize - 1);
+=09ops.ooboffs =3D offs & mask;
 =09ops.ooblen =3D len;
 =09ops.oobbuf =3D buf;
 =09ops.datbuf =3D NULL;
=20
-=09res =3D mtd->read_oob(mtd, offs & ~(mtd->writesize - 1), &ops);
+=09res =3D mtd->read_oob(mtd, offs & ~mask, &ops);
 =09*retlen =3D ops.oobretlen;
 =09return res;
 }
@@ -155,16 +156,17 @@ int nftl_read_oob(struct mtd_info *mtd, loff_t offs, =
size_t len,
 int nftl_write_oob(struct mtd_info *mtd, loff_t offs, size_t len,
 =09=09   size_t *retlen, uint8_t *buf)
 {
+=09loff_t mask =3D mtd->writesize - 1;
 =09struct mtd_oob_ops ops;
 =09int res;
=20
 =09ops.mode =3D MTD_OOB_PLACE;
-=09ops.ooboffs =3D offs & (mtd->writesize - 1);
+=09ops.ooboffs =3D offs & mask;
 =09ops.ooblen =3D len;
 =09ops.oobbuf =3D buf;
 =09ops.datbuf =3D NULL;
=20
-=09res =3D mtd->write_oob(mtd, offs & ~(mtd->writesize - 1), &ops);
+=09res =3D mtd->write_oob(mtd, offs & ~mask, &ops);
 =09*retlen =3D ops.oobretlen;
 =09return res;
 }
@@ -177,17 +179,18 @@ int nftl_write_oob(struct mtd_info *mtd, loff_t offs,=
 size_t len,
 static int nftl_write(struct mtd_info *mtd, loff_t offs, size_t len,
 =09=09      size_t *retlen, uint8_t *buf, uint8_t *oob)
 {
+=09loff_t mask =3D mtd->writesize - 1;
 =09struct mtd_oob_ops ops;
 =09int res;
=20
 =09ops.mode =3D MTD_OOB_PLACE;
-=09ops.ooboffs =3D offs & (mtd->writesize - 1);
+=09ops.ooboffs =3D offs & mask;
 =09ops.ooblen =3D mtd->oobsize;
 =09ops.oobbuf =3D oob;
 =09ops.datbuf =3D buf;
 =09ops.len =3D len;
=20
-=09res =3D mtd->write_oob(mtd, offs & ~(mtd->writesize - 1), &ops);
+=09res =3D mtd->write_oob(mtd, offs & ~mask, &ops);
 =09*retlen =3D ops.retlen;
 =09return res;
 }
--=20
1.6.3.3
