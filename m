Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T1avi-00034H-EM
 for linux-mtd@lists.infradead.org; Wed, 15 Aug 2012 10:34:29 +0000
Message-ID: <1345027147.3393.125.camel@sauron.fi.intel.com>
Subject: Re: Mainlining MTD drivers (lpc32xx)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roland Stigge <stigge@antcom.de>
Date: Wed, 15 Aug 2012 13:39:07 +0300
In-Reply-To: <501FA8CE.9040106@antcom.de>
References: <501F7E21.4010606@antcom.de>
 <1344244399.23461.44.camel@shinybook.infradead.org>
 <501FA8CE.9040106@antcom.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-X8BIjrUEq9vItYJWTQo8"
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


--=-X8BIjrUEq9vItYJWTQo8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-06 at 13:21 +0200, Roland Stigge wrote:
> On 08/06/2012 11:13 AM, David Woodhouse wrote:
> >> during the v3.5-rc phases, I prepared some drivers (lpc32xx_slc and
> >> lpc32xx_mlc) which ended up being accepted into l2-mtd and linux-next.
> >> Now I realize that they are not in v3.6-rc1.
> >>
> >> Is there anything I can do at this point? Did anything go wrong or is
> >> there a reason for postponing?
> >=20
> > No, sorry. This is entirely my fault. I failed to get the pull request
> > in to Linus in time for 3.6-rc1. Apologies for that.
>=20
> Any chance for getting it into a 3.6-rc or needing to wait for 3.7?

I am nod David, but I think no, Linus is not accepting new drivers that
late.

--=20
Best Regards,
Artem Bityutskiy

--=-X8BIjrUEq9vItYJWTQo8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQK3xLAAoJECmIfjd9wqK0Cl4P/AjXpnsfLQ74bqweAoxG+SvJ
Az0W0WfXC3KItTs2JpNnja7IhmThCciMrUDl6pgdeAgADnzkxbl6q0//nhlofcDE
VKqDXeS6vNBFmpvFRLEUaq4+kNsc7b/xXT2QhTmpkw0gnL+d8EGHNYfsK59tI6uO
iZnbTH+wJwu5UYt63jlHjnaPeoNStKtD2RPjKoIRfGCz5Cuhvkyy/p0dl81zTVUk
1fy0jI1TBoUCQZaBUlOHwilCBo5Go18aDQeeLdierO+4GJPYgIF/7VM9sXFWcsTn
0wVsLjS0EiQPQ07XZHJdSBYbtc3FB+sGclIU79MGfB0/gNFf6k4HSOJN9fOvVVsd
ChioFUe4sQ5hAuswsGQkNt4POxswI6NLGSdHGf/zPv2v+XkYdmApj1SBx0IHiQsN
xw6xl0SsNGsPd46WfjccuQOFG1WU2SgWOf7pFRHbSV7dAeyZr6Rj3WtmhdWXQ0DG
Nf9Xx/pQWWMEsxezHtB0nwSxAFXN7w8BMZlPmcJd5fK87evE9XmX+R4pzrSiiuy8
6TnIsn3k4e/uHnOgf0Euae75SbKEBbUpcxAwTJ2gbkm7fMstEWQUoPDepqhAkka8
698xS3gtNPogVTldk/rbHpDn2dp/oB5aOTCm+rDmE23F8gAo6fZ+owQ+SA5v4SkA
8pauQ1k7p6VoSI7Xfu+b
=eMM8
-----END PGP SIGNATURE-----

--=-X8BIjrUEq9vItYJWTQo8--
