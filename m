Message-ID: <1350305263.4115.3.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ARM: nomadik: fixup some FSMC merge problems
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 15 Oct 2012 15:47:43 +0300
In-Reply-To: <1349994182-26116-1-git-send-email-linus.walleij@linaro.org>
References: <1349994182-26116-1-git-send-email-linus.walleij@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ETyacHZxWBLQmF15l8IG"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
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


--=-ETyacHZxWBLQmF15l8IG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-10-12 at 00:23 +0200, Linus Walleij wrote:
> Due to a clash between refactoring and due to loss of a header
> file that remained in my working tree the Nomadik stopped
> compiling after switching to the FSMC driver. This patch fixes
> it up.
>=20
> Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Pushed this one to l2-mtd.git as well, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-ETyacHZxWBLQmF15l8IG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQfAXvAAoJECmIfjd9wqK00y0P/2e22O7UUphVxvcfosonAgqV
qJ3P1GnhE3CynSL8493SSOazJHeUN2FMBRPCX/Rpe4Mywnf1u+5MJpaE8xSbhs1t
3syha1uqZnunwkcN2lA2P/5Sh8JUyddjK6H0c/nQ1iSjuyj0sj7ucQzPJvDfXVgq
XWGwxraJ0hi9imFXMHlMT4/tQcFFKrhTX/5xV2qjB1KzzrgZ1I696zwgBG008X52
Ijh2d7WsdXKcEPUimTd0OjHepYUxAiQzl9IL3XGZyeADotTPEjDXcZEnLmGxqyx7
MaTSx3v8JAzCHQ+JtH+2fgg1lu49EypGSzG0evMQ3YSmqAkC936bDr4pr0/e9C76
JoRV6lMukduICA604I3PogeBVlYZMhOPj8Lg7jaIn4hnl/EXPJ0WplRefPpQcAWS
BnDo7Gra91pYMtAZYy0tbhPkOmo5C/1pjCVUvhKT4fwaUYrsbj5z/9fcGxtR3qGz
xES9JWUwM5fUYy4wii6HzGU15go5qACyQ83x5PFbQE+cG8DA84C+yRTRi3P59D47
0kJfd5X6WfmAqOacNDhdZNU/+vdqazigt0VAddM7qyzRu5PWO+efCPZAPKtEPa6j
7FIIOUt7GG5WInsjrL+HkSFJelBSIyJL0acwVIUQmbJMeJzNX5A+yipQOkktkQmp
gPsLntSmvr66mnRSqcjo
=nt0w
-----END PGP SIGNATURE-----

--=-ETyacHZxWBLQmF15l8IG--
