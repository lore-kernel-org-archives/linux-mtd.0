Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rkboy-0006Fe-Lg
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 13:33:01 +0000
Received: by iakk12 with SMTP id k12so1094550iak.36
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2012 05:32:56 -0800 (PST)
Message-ID: <1326202513.8847.20.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 02/17] mtd: do use mtd->point directly
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 10 Jan 2012 15:35:13 +0200
In-Reply-To: <CAN8TOE9bgyf3Lvwh7CN--2c0qBrcRqnRRNJp6MWQQ9Y1Ddk2Cg@mail.gmail.com>
References: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
 <1325506847-23470-3-git-send-email-dedekind1@gmail.com>
 <CAN8TOE9bgyf3Lvwh7CN--2c0qBrcRqnRRNJp6MWQQ9Y1Ddk2Cg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-iSvc35sTs+MwWRD6q6fG"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-iSvc35sTs+MwWRD6q6fG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-01-05 at 15:03 -0800, Brian Norris wrote:
> > +++ b/fs/jffs2/erase.c
> > @@ -336,12 +336,11 @@ static int jffs2_block_check_erase(struct jffs2_s=
b_info *c, struct jffs2_erasebl
> >        uint32_t ofs;
> >        size_t retlen;
> >        int ret =3D -EIO;
>=20
> I think this initialization (ret =3D -EIO) was unnecessary in the first
> place and certainly is unnecessary now. Remove it?

Fair enough. I've pushed this patch to my tree:

=46rom 162ab608ee94e01dc740c6cb55939f45aa184d44 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Tue, 10 Jan 2012 15:32:29 +0200
Subject: [PATCH] jffs2: do not initialize variable unnecessarily

Remove unnecessary initializer for a local variable.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/jffs2/erase.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index a01cdad..eafb8d3 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -335,7 +335,7 @@ static int jffs2_block_check_erase(struct jffs2_sb_info=
 *c, struct jffs2_erasebl
 	void *ebuf;
 	uint32_t ofs;
 	size_t retlen;
-	int ret =3D -EIO;
+	int ret;
 	unsigned long *wordebuf;
=20
 	ret =3D mtd_point(c->mtd, jeb->offset, c->sector_size, &retlen,
--=20
1.7.7.5

--=20
Best Regards,
Artem Bityutskiy

--=-iSvc35sTs+MwWRD6q6fG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPDD6RAAoJECmIfjd9wqK0610QAJmIk2Il2ynA4+l9/G4KHpvM
e+w7cd+gOyY4zb3yuDr0iJMkEj58o3BZDwfp/vIZQHUOwy85YXfDAS722WFKG5N4
9qNzIfnQ7KaxxGymMhmuB8I4uj51qXIKslQo1AcO+pahGhTuwKPzJPS7h4/crRBm
FfKa6IPmHFGZoreVD2lP55pYrchbOwBj3SXifRcspDOZi7SVfIbPsnyDw6OgeIsl
2K2qMkRBVpoQvC1mRPhxCezhab0O1wyV+CQbEIgtwhM/ikAf4uWdOFTv6skpqXE5
zzJ5alNEPqWI9VIivpw2UAt4H3wGG3bBEnQVdtONbVUok0cF303o1XaGixG6QnJa
XUjIWyuDq3HxJxB7f3ojUI86ZDLG9U9K+j3lv7LBD/PlBY466UuSdbJwECyrVor1
v+t+F3Hx14IOowwvls4rtidciXU9RsBJcwJSHOgrtBmL1EHMpePVgnrqBrxXdM9W
+1JINtXYFv33JmIDewKBnAjf1C3VG18hEdNyuSB/06QoP/b1AiM8yo9FWQR9pzvp
0yn1focfUGmqN4TNkCKqJ8PhHdk8Sr/KElNtsjWRN3lckfXO6moMsIzTpvi37sbh
w1ywYK/H7bt10fCD6PLC5wR2fbduDj4K1qkTnScXj9Y2A9cFXN+RCplCJAYXLzhq
x46Wbk+1fBaJ4h7WLtxL
=y1gL
-----END PGP SIGNATURE-----

--=-iSvc35sTs+MwWRD6q6fG--
