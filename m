Message-ID: <1345201835.27859.52.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ARM: LPC32xx: Provide DMA filter callbacks via platform
 data
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roland Stigge <stigge@antcom.de>
Date: Fri, 17 Aug 2012 14:10:35 +0300
In-Reply-To: <1345201311.27859.51.camel@sauron.fi.intel.com>
References: <1345122935-22115-1-git-send-email-stigge@antcom.de>
 <1345198171.27859.39.camel@sauron.fi.intel.com>
 <502E2279.1030604@antcom.de>
 <1345201311.27859.51.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-QI+4qYqAJ+EA4syHG23T"
Mime-Version: 1.0
Cc: srinivas.bakki@nxp.com, linux@arm.linux.org.uk, arnd@arndb.de,
 linux-kernel@vger.kernel.org, kevin.wells@nxp.com,
 linux-mtd@lists.infradead.org, aletes.xgr@gmail.com, dwmw2@infradead.org,
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


--=-QI+4qYqAJ+EA4syHG23T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-08-17 at 14:01 +0300, Artem Bityutskiy wrote:
> > To later avoid collisions on subsystem merge, can you please leave the
> > patch with arch/arm/mach-lpc32xx/phy3250.c for arm-soc.git? (I will
> > provide a pull request for Arnd and Olof, as usual.)
>=20
> Only if Arnd insists. Otherwise I'd prefer to resolve collisions (they
> cannot be hard with this patch) than pulling the soc tree to the mtd
> tree.

Actually the mtd patches do not compile-depend on it, sorry, I am
dropping it from the MTD tree. Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-QI+4qYqAJ+EA4syHG23T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLiarAAoJECmIfjd9wqK0KTwQAIBuZnv8JZz8t5wucrbYo4WJ
VXhOH9XxxejjlmW4h+w5bPA15ALs1x1Z5aLm5vVbYf622DN6VrAP6mXO35OtJgtm
KjQFBNPz6Yq+x+CkuPu/VrucEGBvLDYnAoGL5p/sT8ZpWZay51Rh7X0l2T/oGdSY
4vz/QWsxGZtZxBb+EUL5YGLhoOcJQRD09Jy/Icccbjs99YERxCe0kkmktVg1AIcd
feQWlVUvRSsR9ey4bPm3xZUsM5J2V/y3fDkiIaqFhKhsz9944300mfXLGv6HeeLg
TQYPTNzpPUs4mosRrHg2KMoFN4Ubvd86jySxM/wPe9cGobF8F2lBeuvaKPsQEcUd
rPli13dRkuXb03OKoBolp97BDp0l0rxwbSIPCuGcgsbeITGlYHUGiEDX6bRfrqT6
kaY3zDD9e64BRBSLNC/J6KWOJpT2pogtHVlkGUgjsQo25xW6PuJpOCDZHjoaxP91
ghEcxrB0wyqLoi+za9DnYJdGlVJzo/9ErkPaRBno60yrgNMhTTAp7HL+u5kMMlFA
6JzCq8VsJ4infJGuzTgoEAXg5pvOlcRdeHuv9xChblhcM5lM8zCBMCLSMjXtARiK
WafICAgfzBLDGS9DzWfWuJcWtS1MyLZtpiZF4K+eS+Uk9A4azjKpvKvkmr354kqp
xtGTqzkx+KPtIXNjUv2S
=XHLj
-----END PGP SIGNATURE-----

--=-QI+4qYqAJ+EA4syHG23T--
