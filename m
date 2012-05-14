Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1STyfx-0001Sp-7m
 for linux-mtd@lists.infradead.org; Mon, 14 May 2012 17:03:14 +0000
Message-ID: <1337015186.2528.87.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] UBI: Kill data type hint
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Mon, 14 May 2012 20:06:26 +0300
In-Reply-To: <1337010952-39543-1-git-send-email-richard@nod.at>
References: <1337010952-39543-1-git-send-email-richard@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-6Gzu0Nv1MyRRwSE7T6lO"
Mime-Version: 1.0
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-6Gzu0Nv1MyRRwSE7T6lO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-05-14 at 17:55 +0200, Richard Weinberger wrote:
> We do not need this feature and to our shame it even was not working
> and there was a bug found very recently.
> 	-- Artem Bityutskiy
>=20
> Without the data type hint UBI2 (fastmap) will be easier to implement.
>=20
> Signed-off-by: Richard Weinberger <richard@nod.at>

Pushed to l2-mtd.git with a minor checkpatch.pl amendment. I've also
found few stale references to "short term" and the like in the comments,
as well as improved "dtype" description in ubi-user.h, so I've pushed
the following patch on top of yours.


Thanks!


=46rom 85ab49c3a38f68a20265c116971863e35d97ae66 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Mon, 14 May 2012 19:49:35 +0300
Subject: [PATCH] UBI: amend commentaries WRT dtype

Richard removed the "dtype" hint, but few commentaries were left and this p=
atch
removes them. I've also added a better description about the "dtype" field =
in
the ubi-user.h for people who may ever wonder what was that dtype thing abo=
ut.

This patch also adds an important note that it is better to use value "3" f=
or
the "dtype" field.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/wl.c   |    9 +--------
 fs/ubifs/super.c       |    5 ++---
 include/mtd/ubi-user.h |   11 +++++++++++
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index f0bc107..64ce993 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -41,12 +41,6 @@
  * physical eraseblocks with low erase counter to free physical eraseblock=
s
  * with high erase counter.
  *
- * The 'ubi_wl_get_peb()' function accepts data type hints which help to p=
ick
- * an "optimal" physical eraseblock. For example, when it is known that th=
e
- * physical eraseblock will be "put" soon because it contains short-term d=
ata,
- * the WL sub-system may pick a free physical eraseblock with low erase
- * counter, and so forth.
- *
  * If the WL sub-system fails to erase a physical eraseblock, it marks it =
as
  * bad.
  *
@@ -70,8 +64,7 @@
  *    to the user; instead, we first want to let users fill them up with d=
ata;
  *
  *  o there is a chance that the user will put the physical eraseblock ver=
y
- *    soon, so it makes sense not to move it for some time, but wait; this=
 is
- *    especially important in case of "short term" physical eraseblocks.
+ *    soon, so it makes sense not to move it for some time, but wait.
  *
  * Physical eraseblocks stay protected only for limited time. But the "tim=
e" is
  * measured in erase cycles in this case. This is implemented with help of=
 the
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 7a3ce9f..34e903f 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -814,9 +814,8 @@ static int alloc_wbufs(struct ubifs_info *c)
 	}
=20
 	/*
-	 * Garbage Collector head likely contains long-term data and
-	 * does not need to be synchronized by timer. Also GC head nodes are
-	 * not grouped.
+	 * Garbage Collector head does not need to be synchronized by timer.
+	 * Also GC head nodes are not grouped.
 	 */
 	c->jheads[GCHD].wbuf.no_timer =3D 1;
 	c->jheads[GCHD].grouped =3D 0;
diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index 370c750..8787349 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -358,7 +358,17 @@ struct ubi_rnvol_req {
  *                             requests.
  * @lnum: logical eraseblock number to change
  * @bytes: how many bytes will be written to the logical eraseblock
+ * @dtype: pass "3" for better compatibility with old kernels
  * @padding: reserved for future, not used, has to be zeroed
+ *
+ * The @dtype field used to inform UBI about what kind of data will be wri=
tten
+ * to the LEB: long term (value 1), short term (value 2), unknown (value 3=
).
+ * UBI tried to pick a PEB with lower erase counter for short term data an=
d a
+ * PEB with higher erase counter for long term data. But this was not real=
ly
+ * used because users usually do not know this and could easily mislead UB=
I. We
+ * removed this feature in May 2012. UBI currently just ignores the @dtype
+ * field. But for better compatibility with older kernels it is recommende=
d to
+ * set @dtype to 3 (unknown).
  */
 struct ubi_leb_change_req {
 	__s32 lnum;
@@ -369,6 +379,7 @@ struct ubi_leb_change_req {
=20
 /**
  * struct ubi_map_req - a data structure used in map LEB requests.
+ * @dtype: pass "3" for better compatibility with old kernels
  * @lnum: logical eraseblock number to unmap
  * @padding: reserved for future, not used, has to be zeroed
  */
--=20
1.7.10

--=20
Best Regards,
Artem Bityutskiy

--=-6Gzu0Nv1MyRRwSE7T6lO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPsTuSAAoJECmIfjd9wqK07hQP/1cZpKb5ivdnb8e3U0xIm1y6
ZYkqUBq7nMETMKovGwrgPh9F+m9RdqKhUBBCf+RN8PZq0cdj0Sb7U5bVt8Tnaqbr
39YFZDpqtAV6ofu0jBkHtK6JWCkp1xMAZASQtAfIkh8donpjaiM7/bLY+hjMo/go
97gNQZWtzQttkTwMUyn5f8Do/blitSfvWsWQSKITcl2d4eKar7WVW7aV8f8QPoy3
PWsiFO6mRbgA3yuJic/KGKicPJ37eDw+7DR/cFidI5GmJCE7WzRJ3Ob7sDOPwGbC
aP7udrotmw+kyFdfEpwdvcGIdvjEiGb194xHUw4DPuf2PZJbVYQ5QK4i8Gw83mpi
HkMQQvW6yIqqyMkM9iw9Rv3oSnBXyFwHuISJpaUB9Qv3PcFZF53/2G3CXDHGcv0Y
kU8mh9oGsHn7aA+8M7Nd/V8OTw3yd5SNXUn84qwg8mG0BN1TUWvnlYmQ4gDFr/RL
HY7VPhog4l1ROusMYs4hUNIbi9OiKFTuXv38AhK5wqJidZLYhPDIu6hCfHpGFnLT
MS8AVaLoJ0V6T7/r+BRiqtBzLkE4qTJSIgK739JJafViLKy2USObNWxXyhJjhsKD
eNgfmYKvzxIwDs9uv+U08feo+vpNP6l5Kqf5PP2PkWHU78MQx6duxL3Gnc9qL5ub
6vq8OlFgBdN2792j6dvP
=T59d
-----END PGP SIGNATURE-----

--=-6Gzu0Nv1MyRRwSE7T6lO--
