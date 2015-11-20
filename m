Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zzkqz-0006tz-3h
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 12:31:49 +0000
Date: Fri, 20 Nov 2015 12:31:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, linux-mtd@lists.infradead.org,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 hramrach@gmail.com, martin@sperl.org
Message-ID: <20151120123123.GB1929@sirena.org.uk>
References: <564CEB61.2000601@gmail.com>
 <20151120000226.GP64635@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline
In-Reply-To: <20151120000226.GP64635@google.com>
Subject: Re: RfC: Handle SPI controller limitations like maximum message length
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 19, 2015 at 04:02:26PM -0800, Brian Norris wrote:
> On Wed, Nov 18, 2015 at 10:19:29PM +0100, Heiner Kallweit wrote:

> > I also add an example how a protocol driver could use this extension.
> > Appreciate any comment.

> One question I have: is it necessary to push the handling out into the
> protocol driver? I feel like I've seen a partial answer to this: the
> 'actual_legnth' return field suggests that the protocol driver already
> has to deal with shorter-than-desired transfers.

It should be possible to use actual_length if the hardware doesn't mind
the transfer being curtailed unexpectedly.

> Then I have another one: is the 'actual_length' field really
> insufficient? For instance, is it non-kosher for a spi_master to just
> cutoff the message at (for instance) 64K, and expect the protocol
> driver to handle that (e.g., with Michal's patch from [1])? And if that
> is kosher, then is there a good reason for the protocol driver to know
> the exact maximum for its spi_master?

It really depends if the hardware is able to cope with the error
handling (and ideally the SPI core will be able to transparently split
the transfer up into chunks the controller can cope with anyway).

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWTxKaAAoJECTWi3JdVIfQwCYH+wZOY+oLa+AY/juLNWZA587T
Ovr6Qp8O7bpN4gwW58D03SeKXQBsc2Yht8Tqvuzd08rtc5sncMvlVsxNo0O7gK3E
mj/nTyR6ShA9WHzXp68533GG0ys4EmYfvj4agqzEHolOH8JJr+0i9jp11pMRDhvf
0t5koZCFv0tEYCC2P/q3AIcyXdi1h8791wtFK/EAZqpBzh3KHNmfqHWkQP7sIixR
VAmd+r2kA0rmaiemMCwmDr6lsKA6E2do1GbtypB+3U2UzBZJDjhj6bg4bmXrP3VB
2Eq330kXlw7WaeBpD2GtVD8Z+kQVZqt1qjB+gKQ2kRNWHodxT3MyVkKA81k/tqg=
=WFGH
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--
