Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3RXO-0007uK-7w
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2015 16:42:52 +0000
Date: Mon, 30 Nov 2015 16:42:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Michal Suchanek <hramrach@gmail.com>, Martin Sperl <martin@sperl.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Message-ID: <20151130164223.GE1929@sirena.org.uk>
References: <20151120120502.GT31303@sirena.org.uk>
 <08871ECD-52DF-4CBF-AF3D-4C3A442C008A@sperl.org>
 <20151121134946.GI26072@sirena.org.uk> <56507B3B.4080608@gmail.com>
 <CAOMqctR=UDEPbgJDY3YvxpbVEEp4t6ajkyv=cVAZp2fLBNBanA@mail.gmail.com>
 <5650F7D4.1090209@gmail.com> <20151122131626.GN26072@sirena.org.uk>
 <5651EA08.5090400@gmail.com> <20151123113846.GH1929@sirena.org.uk>
 <5658AE7C.3050507@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Tk7bxryrhVQGv1nz"
Content-Disposition: inline
In-Reply-To: <5658AE7C.3050507@gmail.com>
Subject: Re: [PATCH 1/3] spi: core: add max_msg_size to spi_master
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Tk7bxryrhVQGv1nz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 27, 2015 at 08:26:52PM +0100, Heiner Kallweit wrote:
> Am 23.11.2015 um 12:38 schrieb Mark Brown:

> > No, for the clients so they aren't peering at the struct.

> Sure, do you think of a simple getter like this or a more complex thing?

> size_t spi_get_max_msg_size(struct spi_master *master)
> {
> 	return master->max_msg_size;
> }

That's fine, the point is to allow it to get complicated later rather
than that we have anything else to put in there right now.

--Tk7bxryrhVQGv1nz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWXHxuAAoJECTWi3JdVIfQhz8H/j6Q8safY93quZf53Pc3ZifY
MebdOPRqkXqW4jqJbDWJlMZWQxQT9GN8pX2jXpJ5ET+uuve6AnBKBZF2aTKOWJBK
XxSAEkIywhVmrjOv1ihsvjx6rZe+hKrBrXC/I7p0Krxzlq0Kv3rUsK0J/51E7+jZ
Cu73/qRyGc6/Y1tWhH/25UFL6ii0YyPRC9SAaxiuxYTmFcQh8L+vUgdSGHpuqptX
uhgP0bBCEUSj0yZZre2ZUkd97rO2ZN7hqgoWf+1pGUrkDDBLkoUWav2Gnhjqp35h
Er2+pA0iH7xQSHeAWa0m0tswxRvLvmJshHMxhaC6hbD/e2FWhqM/8hcFRxNhpPI=
=pmZU
-----END PGP SIGNATURE-----

--Tk7bxryrhVQGv1nz--
