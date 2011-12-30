Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RgdaJ-0002CI-3u
 for linux-mtd@lists.infradead.org; Fri, 30 Dec 2011 14:37:28 +0000
Date: Fri, 30 Dec 2011 15:36:58 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2] MTD/GPMI bugfix : reset the BCH module when it is not
 MX23
Message-ID: <20111230143658.GA9141@pengutronix.de>
References: <1325233646-3343-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
In-Reply-To: <1325233646-3343-1-git-send-email-b32955@freescale.com>
Cc: baruch@tkos.co.il, koen.beel.barco@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, Artem.Bityutskiy@intel.com, shijie8@gmail.com,
 linux-arm-kernel@lists.infradead.org, LW@KARO-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 30, 2011 at 04:27:26PM +0800, Huang Shijie wrote:
> In MX28, if we do not reset the BCH module. The BCH module may
> becomes unstable when the board reboots for several thousands times.

Do you have more details when and why this happens? What happens on MX23 th=
en?

> Signed-off-by: Huang Shijie <b32955@freescale.com>

Is this Bug 2847 from the errata? Should be mentioned in the commit message=
 and
comments of the patch if so.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk79zIoACgkQD27XaX1/VRu/KgCfaX8z9JCjvQzNYJhRY5LGDjpR
aywAmgIgXeabO8wq+IqgIR3EpFc48Tq5
=FWLs
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
