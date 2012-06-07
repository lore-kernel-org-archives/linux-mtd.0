Message-ID: <1339060265.6875.91.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v6] MTD: LPC32xx SLC NAND driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Date: Thu, 07 Jun 2012 12:11:05 +0300
In-Reply-To: <20120607081108.GO8262@n2100.arm.linux.org.uk>
References: <1338974414-5308-1-git-send-email-stigge@antcom.de>
 <1338989921.6875.50.camel@sauron.fi.intel.com>
 <20120607081108.GO8262@n2100.arm.linux.org.uk>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-HlyRmc8aspg0NFDOi0CL"
Mime-Version: 1.0
Cc: Roland Stigge <stigge@antcom.de>, srinivas.bakki@nxp.com, lars@metafoo.de,
 linux-doc@vger.kernel.org, leiwen@marvell.com,
 devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kevin.wells@nxp.com, b32955@freescale.com, linux-mtd@lists.infradead.org,
 hechtb@googlemail.com, dwmw2@infradead.org,
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


--=-HlyRmc8aspg0NFDOi0CL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-06-07 at 09:11 +0100, Russell King - ARM Linux wrote:
> On Wed, Jun 06, 2012 at 04:38:41PM +0300, Artem Bityutskiy wrote:
> > On Wed, 2012-06-06 at 11:20 +0200, Roland Stigge wrote:
> > > +#else
> > > +#define lpc32xx_nand_resume NULL
> > > +#define lpc32xx_nand_suspend NULL
> > > +#endif
> >=20
> > 0, not NULL.
>=20
> Err, what planet are you on there.  These are _pointers_ to functions,
> so using a _pointer_ is more correct than using an _integer_.

Yes, thanks, I was wrong.=20

--=20
Best Regards,
Artem Bityutskiy

--=-HlyRmc8aspg0NFDOi0CL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP0HApAAoJECmIfjd9wqK04RsQAI8lnLfEntn0nSK+pohXkzd4
Ea56RZe6g+mSUVieRq1g2L1BlbhRQ6KL3HByWSeFCrTwJOsy2crRJz8EuMc6meh5
u7eTmGjUP0mS2GK0W6serb2iwe/e5QC2WWXFoIYwhnekwoT7n90M9Pk7prcmGXos
IIoDpv7WMcbGBb6KJO9BwoBWg8d+S36+ddvlXgVmGGdEzFyXc33tEzx/KNjG7lEH
Y/h6CSwNw6LS9iVURkQ8wY+l34xk/U6uRHlBVP64xSGcTEpMAnBMnz687oBfMNAo
BsH3US4VVDPVT3qaZI/vyJohBi9Xf3+qF9RKaqYSa7l/n6ezHI1kNbkvHFxdxNr9
1x1u7ers7fN83ruyn5jlW+4fUTjXLe4ChlJdXQTNUxttO3AWHZF+9ltzBfxgg6O2
J1FP01ZSZTUb8ti1fHhnJ4eVP8Vi9RVR0eG7uvRXN7eDInz5lAuMrJ23zfAWua4j
2yLXSG4XskclVuoHvnnqQ9HxNP/0C5jAuPWh320sT3231+Bf6vMz5/SbN56EhOYP
vMPnjsWCnNXuytGf4lT+0L3JlJRLp3wH+Z/a8xgPFbOMGkTRDX5ocoQ/bITmiXH5
D00aF+H25mNC6SV8uAD8usY97BkorZcTfbctbl9rMZfk6GkeKr+VnHyYPP359DCP
w7ItUxvXp8zRIFQbm3NW
=+9MT
-----END PGP SIGNATURE-----

--=-HlyRmc8aspg0NFDOi0CL--
