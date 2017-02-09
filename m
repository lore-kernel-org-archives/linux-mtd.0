Received: from mezzanine.sirena.org.uk ([106.187.55.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbdfC-0004lj-Bl
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 01:36:48 +0000
Date: Thu, 9 Feb 2017 01:33:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>
Message-ID: <20170209013348.kdylkzhjxbf2k4yi@sirena.org.uk>
References: <2f46eee5-35c1-291a-52e9-132ced5749a9@atmel.com>
 <1e124883-d21a-8066-2c22-e9aae98dd775@gmail.com>
 <0e2e8e2b-4003-5dae-2f6d-f72375d9ca03@gmail.com>
 <c89577f7-2908-3a75-6be4-78455c5cffcb@atmel.com>
 <20170208190939.GA97840@google.com>
 <20170208192236.muenymk6s36hrn42@sirena.org.uk>
 <20170208203922.GA105912@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wn25b73cpd3bca5r"
Content-Disposition: inline
In-Reply-To: <20170208203922.GA105912@google.com>
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 4.11
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--wn25b73cpd3bca5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 08, 2017 at 12:39:22PM -0800, Brian Norris wrote:

> So that actually sounds like drivers like m25p80 should never have to
> account for spi_max_transfer_size(), but instead should have to account
> for only spi_max_message_size().

You might have both depending on how the hardware is structured, some
things support multiple transfers while controlling the chip select
internally.

> > and in fact this is already done in spi_split_transfers_maxsize().=20

> > We're missing masking that out in spi_max_transfer_size() though so
> > clients won't know if we can handle things, it's overly conservative.

> Huh, I've never noticed spi_split_transfers_maxsize(). That looks like
> work for it got dropped on the floor somewhere though; nobody is using
> it yet, and it's over a year since its introduction.

Yeah, the optimisation for rpi ground to a halt.  We should probably
just unconditionally do that in the core if something declares a maximum
transfer size.

--wn25b73cpd3bca5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlibxvsACgkQJNaLcl1U
h9BESgf/RVDWLGZ2qerjgmj8KzGdBoSRDM90hVP2I5ojKgF90CfwIR9D0bN+VDcN
hoPvct18UgKdBayZmM+hipUXPo9pA5QRD6PMlQHyyCAddv9Xf1mkq7xVx8oW/CHL
83TOsDCXFdsqxM9idmNa2oDxwDLeKVEk8X/TKYZLuMfLmPjAkD3+X6DkF7XBbjTr
Xu5mgNPTMsmNV/7g99jXNNvVf3DX2ssyxiBJA32tJbPcZzLtyUfysK8TQAxjg9oc
fsO/Xvp6iC5VJF3IG+EtSjEc7jnenTlpWk7n1dBWodeSJcNWbK857C/p9S675qiN
NMd8cWivj3w41rktpclBw4HPGTh2rA==
=Sh/P
-----END PGP SIGNATURE-----

--wn25b73cpd3bca5r--
