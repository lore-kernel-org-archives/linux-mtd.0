Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bVPsD-00017T-9B
 for linux-mtd@lists.infradead.org; Thu, 04 Aug 2016 21:08:13 +0000
Date: Thu, 4 Aug 2016 22:07:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, vikram.prakash@broadcom.com,
 andy.fung@broadcom.com, jon.mason@broadcom.com, jchandra@broadcom.com
Message-ID: <20160804210747.GN10383@sirena.org.uk>
References: <1469830393-13295-1-git-send-email-kdasu.kdev@gmail.com>
 <1469830393-13295-5-git-send-email-kdasu.kdev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BHMq0+oGliEfCAkH"
Content-Disposition: inline
In-Reply-To: <1469830393-13295-5-git-send-email-kdasu.kdev@gmail.com>
Subject: Re: [PATCH v5 4/8] mtd: m25p80: Let m25p80_read() fallback to spi
 transfer
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--BHMq0+oGliEfCAkH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 29, 2016 at 06:13:09PM -0400, Kamal Dasu wrote:
> In m25p80_read() even though spi_flash_read() is supported
> by some drivers, under certain circumstances like unaligned
> buffer, address or address range limitations on certain SoCs
> let it fallback to core spi reads. Such drivers are expected
> to return -EAGAIN so that the m25p80_read() uses standard
> spi transfer.

You need to send this to the MTD maintainers, I see you've CCed the list
but not Brian and any comaintainers he has AFAICT.

--BHMq0+oGliEfCAkH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXo66iAAoJECTWi3JdVIfQ7e0H/1YN54yTzY0FzVXL4YZI2kU1
K0pS+1xT3YiD6dG5U7i97KS9BqBJpwd1geLL0Q1ZBnPti/e9/+JNEOQD1LPE8xhH
5S/OAbUKwzuMWErXpAZroneEWR/NFqnigkj+kY7ivuc36DDFNe2+CRjsTuJFLyk7
t1O6mJEnQvwiMaNEjrCeGt3ySCF4Ekl6paOvqZNDNTEMrw7CLmvrUOkPFmkTXq8a
36qWzOFtEu0/fZTVyLCPLBA0NUG1ZNg9CcbEkD1/K0LSALx3xwUzuuK7qHR2u21x
/zM28rxxQnmtnQFzyCTf9M1CXH/I35gaDRSZL/VAK8o1KZO7KhgxE297Fj4NQMU=
=IcZO
-----END PGP SIGNATURE-----

--BHMq0+oGliEfCAkH--
