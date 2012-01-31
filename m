Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsDkK-00053J-Vi
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 13:27:42 +0000
Date: Tue, 31 Jan 2012 14:27:20 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 0/3] platform: add platform_devm_request_and_ioremap()
 common API
Message-ID: <20120131132720.GP2471@pengutronix.de>
References: <1328004002-24646-1-git-send-email-Barry.Song@csr.com>
 <1328008455.956.30.camel@sauron.fi.intel.com>
 <CAGsJ_4yVTaZQOE2dB4A3L6WCLE78b4eBPaOcDDJ7RH+0LN=R_A@mail.gmail.com>
 <1328015763.28171.2.camel@sauron.fi.intel.com>
 <1328016225.28171.7.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="/NwG7NuG0/W8LcLh"
Content-Disposition: inline
In-Reply-To: <1328016225.28171.7.camel@sauron.fi.intel.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Barry Song <21cnbao@gmail.com>,
 linux-kernel@vger.kernel.org, workgroup.linux@csr.com,
 linux-mtd@lists.infradead.org, Barry Song <Barry.Song@csr.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--/NwG7NuG0/W8LcLh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> To promote the idea further. If you manage to create a semantic patch
> for this, then you will just generate your patches automatically. You
> will also be able to make it more probable that people will use this new
> api by adding your semantic patch to scripts/coccinelle/api.

I'd think Julia is already at it [1], but the same issue has come up
there, too [2].

Regards,

   Wolfram

[1] http://lkml.org/lkml/2012/1/26/169
[2] http://lkml.org/lkml/2012/1/28/10

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--/NwG7NuG0/W8LcLh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk8n7DgACgkQD27XaX1/VRt3XwCfQ+egjVYitwN3nezvDCpbqj1Y
2IUAni6IBt+SY+K80WjAl+ozwy6dLRbu
=erOA
-----END PGP SIGNATURE-----

--/NwG7NuG0/W8LcLh--
