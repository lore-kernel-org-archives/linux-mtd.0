Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P7r8Z-00021y-11
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2010 14:56:32 +0000
Date: Mon, 18 Oct 2010 16:56:20 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: zhangyd <zhangyd6@gmail.com>
Subject: Re: [PATCH] mtd: chips: Add SST38VF640x NOR-flashes
Message-ID: <20101018145620.GA22538@pengutronix.de>
References: <1287454010-2718-1-git-send-email-zhangyd6@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <1287454010-2718-1-git-send-email-zhangyd6@gmail.com>
Cc: Artem.Bityutskiy@nokia.com, ladis@linux-mips.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 18, 2010 at 10:06:50PM -0400, zhangyd wrote:
> Du to the wrong sector size description(The actual sector size is
> 8KBytes/sector, but the reporting size is 64KBytes/sector),you can get
> the wrong size of the memory. So they should be moved to the jedec_probe.
>=20
> Signed-off-by: yidong zhang<zhangyd6@gmail.com>

NACK as long as Guillaume has not finished updating the SST-support for CFI=
=2E He
said he is working on this at the moment, let's give him a chance to finish=
 :)

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAky8YBQACgkQD27XaX1/VRtz6ACeMLJleCWrFki71rpj+0ELYala
A8sAnA6Frg62shANhZn7xEW1196rHBxr
=P1xd
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
