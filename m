Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2LeO-0004EE-3F
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 12:27:40 +0000
Message-ID: <1345206743.27859.68.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: allow NAND_NO_SUBPAGE_WRITE to be set from
 driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 17 Aug 2012 15:32:23 +0300
In-Reply-To: <1342196904-13850-1-git-send-email-computersforpeace@gmail.com>
References: <1342196904-13850-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-uaHlZN+piYX6cyH3TS86"
Mime-Version: 1.0
Cc: Scott Wood <scottwood@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 Huang Shijie <shijie8@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-uaHlZN+piYX6cyH3TS86
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-07-13 at 09:28 -0700, Brian Norris wrote:
> The NAND_CHIPOPTIONS_MSK has limited utility and is causing real bugs. It
> silently masks off at least one flag that might be set by the driver
> (NAND_NO_SUBPAGE_WRITE). This breaks the GPMI NAND driver and possibly
> others.
>=20
> Really, as long as driver writers exercise a small amount of care with
> NAND_* options, this mask is not necessary at all; it was only here to
> prevent certain options from accidentally being set by the driver. But th=
e
> original thought turns out to be a bad idea occasionally. Thus, kill it.
>=20
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed to l2-mtd.git, thanks.

> If this is acceptable, should it go to -stable, since it fixes some major
> gpmi-nand breakage? It probably won't apply directly, since I've touched =
some
> code around it recently.

Done.

--=20
Best Regards,
Artem Bityutskiy

--=-uaHlZN+piYX6cyH3TS86
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLjnXAAoJECmIfjd9wqK04MsP/A5H5srD00CpYeDmF13oX4rG
+4572BVU3lAsEw89ve/Q7j9IL58cs1uo5Jv1ypI+n8lRb111YPmp81v7llA467kR
wIUF2NBjR64LMJmtkioVAPndf5sNbgTJ2j8CaYXVR/9a4ntB+Q2juda8wRgIqnwN
siprkZ9ny+ycwVYEmlef3FnrrE4VwLrySD2rQ9P+NbHXiQfHRPESW0rSBxk+z5rm
9X8V9jtWi46hO1swl6rZFV3Eu6+i7ei3d1205pyx+z1rKQ17SGyqnAvuNVEChy33
2nn8TOSVI8nFjtzgoXMwcfUct7T+QfHFTITa6Vv814n9RVlY+/AduZc9FqVB7Igh
RwGCgxaH0BA7Ul19r96jQ/j52alZ9rHebtCjuW5suK/d/TpVYuiT54lXBVc30OId
9Ep0fCWqdYld8C0eVwmAMBHFhdqVUPcNkYzcZF1ubYHCPJEY/Fxy9EpkWTZ30F8B
dQ4ykCxtjgad3llooCqSIFNOD6TBRCGfLEaqDQ51dshgWA0YyJtrnq2Ftiu1qnmt
P3oqyL3bikDL/Tnp9VDOY+f0aMhhfoh6LTHf/Q0lCxbeClTS5nIpAkJANSkrbya4
RVf0fj4CpPYdUJkWcbDIZsMAkPOIVG4CXmEfrPQsqQHuWM68jJk+jZQPWZISM9cX
u4Gl+cVxMiLEThgrVbNx
=jyB8
-----END PGP SIGNATURE-----

--=-uaHlZN+piYX6cyH3TS86--
