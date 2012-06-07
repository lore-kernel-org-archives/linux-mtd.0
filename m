Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScZaH-0006T2-T1
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2012 10:04:54 +0000
Message-ID: <1339063722.6875.94.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: elbc nand: use drvdata to only remove the relevant
 chip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Date: Thu, 07 Jun 2012 13:08:42 +0300
In-Reply-To: <20120606233639.GA13977@tyr.buserror.net>
References: <20120606233639.GA13977@tyr.buserror.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-dirkQ5nQZ32phUzqD07c"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-dirkQ5nQZ32phUzqD07c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-06 at 18:36 -0500, Scott Wood wrote:
> Previously the remove method was looping and removing all chips,
> which is obviously not the right thing to do -- left over from when
> the driver was organized differently and that was the remove method for
> the entire controller.  This would result in bad things happening if
> you have more than one NAND chip, and remove the module.
>=20
> This also fixes priv->dev to properly point to the chip's device rather t=
han
> the controller's.  Until now priv->dev was only used for error/debug prin=
ts
> (and it's an improvement there), so this shouldn't break anything.
>=20
> Signed-off-by: Scott Wood <scottwood@freescale.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-dirkQ5nQZ32phUzqD07c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP0H2qAAoJECmIfjd9wqK0EX4P/jcgh6AY7gV2kyd7vQU+EmG3
maCumN5svXIKhIVxxXaS9++Fj6YcnQkKGGHxSjxGoMB8h0MgR+b86B5qie94zGcy
jKQm63zmg1vkPDeVgriHa/1od2DdI0VXJqpWzWkIFgT0Z6VCE8BornztMy16uwoD
Yu7/AzryLMto7rC287+z2P5BaWFbdRJlEAZnAwOyuuV17+nOXTAlbd+ab4SDUkBW
Fc/S5uaOZfvfMWAAzX++DEq1Vv+P2xgbI4Lw4P+jGw7e3LmUHYlJ8eoBRQlRR9pS
cz8ugkEXOCyk7eOKBPzZbifyJTLvf0vOVd8TfSUBAB401xi/cd26p8Vl0w5HzUas
liFmu4CTwdYb+PxKvAEVBjPGLu+P39SXG+Ft/Zh40/a8PSJ6+fkzxIi23QNZMHTd
CVlMuzQBUQYiLymVq3dOvWjajF/KkyNrGs95Akrjr8lNE20/M9ci+M9wRYlXMbz9
jTrDBqySWL5p6ewMuGDsqWMWNqvxOsSGv1LUvMKTNpmyhu47IA1o1DI7L4hb5uLA
aePWKu/Qgql1aATOu+OiP0Gjn5I4oOOANHJrhadw4gxnH+my3j76cBvdfzgb4oZL
7tqmWpHJxDQC7T98T9vWgpEgcejfy63ACDhW4Pj+n9/c3y4yLOZ+86qUAX/O5EV3
Xhd8Y0TVcQ3RkoX0Iugk
=nZsG
-----END PGP SIGNATURE-----

--=-dirkQ5nQZ32phUzqD07c--
