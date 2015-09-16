Date: Wed, 16 Sep 2015 11:56:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Vignesh R <vigneshr@ti.com>
Cc: Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Russell King <linux@arm.linux.org.uk>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, hramrach@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Message-ID: <20150916105647.GK11268@sirena.org.uk>
References: <1441355402-6837-1-git-send-email-vigneshr@ti.com>
 <1441355402-6837-2-git-send-email-vigneshr@ti.com>
 <20150914183744.GF12027@sirena.org.uk> <55F93F89.7060708@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yr/DzoowOgTDcSCF"
Content-Disposition: inline
In-Reply-To: <55F93F89.7060708@ti.com>
Subject: Re: [PATCH 1/5] spi: introduce mmap read support for spi flash devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--yr/DzoowOgTDcSCF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 16, 2015 at 03:38:09PM +0530, Vignesh R wrote:

> But, I didn't get how to integrate with existing message queue. Memory
> mapped read by-passes message queue of SPI core. Could you please
> explain a bit more on integrating with message queue? Did you mean
> locking the existing message queue when memory mapped read is being
> requested?

Yes, and also making sure that we don't everything gets processed in
order so memory mapped requests come after any commands needed to set
them up and don't starve other work.

--yr/DzoowOgTDcSCF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV+UruAAoJECTWi3JdVIfQiDQH/0Hi5Z9tD7PeziQs0l+wtJjR
/EIB5RAhEyMzQ6Y+PiHd9eg/Vl+0ENDdP6RNXkigIortX74pLibDTpWn05X/STgq
Tr12ifAmSmQrnYYA0mmqRPhYzffA2N/dEYLb2F5Bp7S0qqEHNlkkGyEAxKYsLLRN
uxNzdtv6DAkSO1XuwMGYeutDwXwOglsUKcYbGAHTXk10QZOamopdy0fZPZqamYq3
OdRKBWgtSu3XUrLGCsv45uCs3GA7nivLYM+NnV0Q0aAwElK/dSy0Ok7TU0XakR4E
LXKT+eI2UdrS/iVQXuRXg88MwVEi3KvnefLE01FOn9jrgo76IUcqdmWYhGOjZro=
=BkOA
-----END PGP SIGNATURE-----

--yr/DzoowOgTDcSCF--
