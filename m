Message-ID: <1350478062.5769.147.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 11/11] nand: Increase the ecc placement locations to 640
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vipin Kumar <vipin.kumar@st.com>
Date: Wed, 17 Oct 2012 15:47:42 +0300
In-Reply-To: <67e0aae3b23f37feb30789f5c6cb342b5684911a.1349778821.git.vipin.kumar@st.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <67e0aae3b23f37feb30789f5c6cb342b5684911a.1349778821.git.vipin.kumar@st.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-nDyU00X7jkP3dzNCOhnv"
Mime-Version: 1.0
Cc: plagnioj@jcrosoft.com, linus.walleij@linaro.org, spear-devel@list.st.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-nDyU00X7jkP3dzNCOhnv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-10-09 at 16:14 +0530, Vipin Kumar wrote:
> Few devices like H27UBG8T2CTR have a writesize/oobsize of 8KB/640B.
> This means that the maximum oobsize has gone up to 640 bytes and conseque=
ntly
> the maximum ecc placement locations have also gone up to 640.
>=20
> Signed-off-by: Vipin Kumar <vipin.kumar@st.com>

Pushed this one to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-nDyU00X7jkP3dzNCOhnv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQfqjuAAoJECmIfjd9wqK0KZEP/3DNaRlNY9aMG1LSnU42eN9Y
LKbQoPsl9dSGJZMD7cHGGBM8TvxXv+abAOSHXQ0teMXAaROmBdL54KMnco8Hsxh8
5p/+nPGDOgOawOvMWErg93yK8nHL/k1GiElz/AN10zb8Ic54HmZ4FcMZrbhlIoyJ
Kzp4yJvaE2UvmPgfn54kNwmXZEzVjz/nQWYbu3QT3y79rM5QZXtv+MAgaPLoX69M
OvMRUo2fsBGWEm1Q/oiXLiEuSVGm0VxinXtJUXaieFwB9v0RtXhBxEsVML2l/+o1
MGPGMijXvSBiiMG4LhJzUeLwnX2IsVqOXTw/AuAz+hAz7bm69yXgQEGFf3d4GrgQ
grtmo2fO/dUkQOa2eEowBa/TGV0L5xE1CQ4pVorvmlz7RFGX7mjtTUoRJ9oIzVDL
ZeNTol2kJEfWAkE45Wt7eCAhyupDaSStKZY42mFJlz2jyoHN+uQVPI1tLpc+zvAO
TQJEkJLvisQR8UErkJ+z11hPyVmtNXtzbCAtH5TwJYa/Ri8DtlXoC9A8WM8xOkRD
x80L5pN7rERWDMFebKRUJoBlbhTOCyWTHOmQSKzudlKAubAAs54V55Ap4jMeItYO
wBwEo9W4J9jhxyVAePAZ0iFob+4QAN5k6NondqYvJ3WGg2gU3J7BW2SyBnAIZrqp
b2zoN/GuxIvwiupUsK1R
=1qU2
-----END PGP SIGNATURE-----

--=-nDyU00X7jkP3dzNCOhnv--
