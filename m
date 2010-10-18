Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P7o5U-0005jX-5N
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2010 11:41:09 +0000
Date: Mon, 18 Oct 2010 13:41:04 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: yidong zhang <zhangyd6@gmail.com>
Subject: Re: Re :Re: [Help] SST39VF6401B Support
Message-ID: <20101018114104.GC15440@pengutronix.de>
References: <AANLkTinaRHUmLHeTqcDeVMDQyHfYm7B6vPbUGVkebK2_@mail.gmail.com>
	<20101016100744.GA10815@pengutronix.de>
	<AANLkTikOKx7hhF9jffRF+HvfwYFDghZAzNBgO-pZpAFv@mail.gmail.com>
	<20101016131752.GA2676@pengutronix.de>
	<AANLkTim+RBZRsYFyqXRD65tPw69s3rKogEnBFBQr4E5q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7qSK/uQB79J36Y4o"
Content-Disposition: inline
In-Reply-To: <AANLkTim+RBZRsYFyqXRD65tPw69s3rKogEnBFBQr4E5q@mail.gmail.com>
Cc: glecerf@gmail.com, taliaferro62@gmail.com, linux-mtd@lists.infradead.org,
	David.Woodhouse@intel.com, yegorslists@googlemail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--7qSK/uQB79J36Y4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 18, 2010 at 12:00:46PM +0800, yidong zhang wrote:
> hi
>    The 39VF*-B-Version flashes in the cfi_nopri_fixup_table don't work
> well in the current code.  Because of the mistaken use of
> command(0x30) in the 6th bus cycle, which should be 0x50. I think the
> 39VF*-B-Version flashes should be removed form the CFI probe mode. Or
> maybe the erase operation should be changed for the Compatibility.

Or we put in a variable like the unlock-address?

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--7qSK/uQB79J36Y4o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAky8Mk8ACgkQD27XaX1/VRtD1QCgvhKREHwzceC1STdpZXJ2qrum
Wg4An0JXJSQTkr5eShXUdykOn6lhlvbt
=3BkZ
-----END PGP SIGNATURE-----

--7qSK/uQB79J36Y4o--
