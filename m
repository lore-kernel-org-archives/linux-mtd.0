Message-ID: <1345202984.27859.54.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/1 v2] MTD: atmel nand: fix gpio missing request
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Fri, 17 Aug 2012 14:29:44 +0300
In-Reply-To: <1342081868-5995-1-git-send-email-plagnioj@jcrosoft.com>
References: <1342071036-15905-1-git-send-email-plagnioj@jcrosoft.com>
 <1342081868-5995-1-git-send-email-plagnioj@jcrosoft.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-kxblVJkNsyviuL3FH01l"
Mime-Version: 1.0
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-kxblVJkNsyviuL3FH01l
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-07-12 at 10:31 +0200, Jean-Christophe PLAGNIOL-VILLARD
wrote:
> without this the gpio will not be muxed as a gpio by the current custom p=
inmux
> or later by the pinctrl
>=20
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> Cc: Nicolas Ferre <nicolas.ferre@atmel.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-kxblVJkNsyviuL3FH01l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLisoAAoJECmIfjd9wqK0OG8P/3j8ejGjIhr179IcriGPCrw8
w8fFt4sIO+FA2MTi8YIli/oQn6hJ2TY/xAkfshWVzkW7XSM0K4x3b3aEn145fX3L
dhoc/9kdxZipH3xzUjVdubZv5SunybYKTB208DHTd9v2uNFveCXW51fWU1QE3LdV
2l4PnBdyspNQZPJQdxCk0h336iPv1fuDFBcAGYyykCWdSYAlR82kr5enTJIDVw1J
ff4aFvyo5bkur0n8k9mCxxDKOZdUEDQEuNlnnf50OfTenOdgdd/3NAyJLzwzF5ov
aHGLBDZaX1u0ZIZwuiMuToh4ZOMl0OWP6zh7vptpT5lNat5IuWpEdZkjiWqST1qu
QEFDgCHfRMSRzbgyFdgJQpsMdNRYZbuRBODqk5ztnmcpo4GSo6qIntGNiWzTCcLb
x2X/iLnA7Eg7OBlJbHXgdueg1/uteQSASfPM11NtvFXDa0rwtP6jVk0ozbakPZoL
c++LGWKj3MyZM2LnGIDPEXUfUsRoJxdMFLmzxMqkqgDz/KPtvEcabH5bXTqW+7Wx
c1L7yUQCuLo7zO2fvNI20MnRei2ruVMABwGBBya8ui55uPoorzMlfIJO6R4B6+0M
j2ExnjhjWvMYkXIDYZlyKFAwiLD4v/L2Tv9mtEI+mPegZwcUBKUFMbtj30sP2zJQ
HuVDGW8wyYfGkS2/Dhi5
=ZskA
-----END PGP SIGNATURE-----

--=-kxblVJkNsyviuL3FH01l--
