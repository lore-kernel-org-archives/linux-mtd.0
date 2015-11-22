Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0UWa-0006lQ-NJ
 for linux-mtd@lists.infradead.org; Sun, 22 Nov 2015 13:17:49 +0000
Date: Sun, 22 Nov 2015 13:16:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Michal Suchanek <hramrach@gmail.com>, Martin Sperl <martin@sperl.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Message-ID: <20151122131626.GN26072@sirena.org.uk>
References: <20151119114057.GN31303@sirena.org.uk>
 <F224F5F3-FAD5-47FE-9419-39E53BCBB8C6@sperl.org>
 <20151119171538.GO31303@sirena.org.uk>
 <9CDADBED-FD18-4635-82A9-5AB14C9ABCAE@sperl.org>
 <20151120120502.GT31303@sirena.org.uk>
 <08871ECD-52DF-4CBF-AF3D-4C3A442C008A@sperl.org>
 <20151121134946.GI26072@sirena.org.uk> <56507B3B.4080608@gmail.com>
 <CAOMqctR=UDEPbgJDY3YvxpbVEEp4t6ajkyv=cVAZp2fLBNBanA@mail.gmail.com>
 <5650F7D4.1090209@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Y4VYWfdFdHwFhC6D"
Content-Disposition: inline
In-Reply-To: <5650F7D4.1090209@gmail.com>
Subject: Re: [PATCH 1/3] spi: core: add max_msg_size to spi_master
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Y4VYWfdFdHwFhC6D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 22, 2015 at 12:01:40AM +0100, Heiner Kallweit wrote:
> Add a member to spi_master allowing to better handle
> SPI chips with a message size HW limit.

How many devices have an actual message size limit (as opposed to a
transfer size limit)?  It seems like the restrictions here are really on
transfer sizes and that we probably want a second limit for devices that
aren't able to deal with multiple transfers independently.

For slightly more complex things like this it probably also makes sense
to use an accessor - I can see us wanting to combine restrictions from
DMA engines into restrictions for the SPI controller for example.  That
gives us a bit of insulation between the clients and the API.

--Y4VYWfdFdHwFhC6D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWUcApAAoJECTWi3JdVIfQ4XUH/3LAysWT0IHOek1MOZ6Onkft
rzI2snBSXHn7zKmCJaaxQexOy7f2nsdc6HA5CzPJXfS3hhyUgBevxq4bUW0FjIz1
i2suXaobAg5gr5RiT42XqGvWTLCCoUGvymDLmRB8olA3mvwIoS2VMaDnsYQKALtO
mmhrzx7lGVJVIutUWEtmr+147S9mYWIOeC5kjL7CsBr68o+Itm/aFUDX2loKGIqE
+aps418wOFw0E7TyRIeC6NHL2CDV1zGvgZai2SqdsNFeR51nttsq9ANUDH9OBFWZ
PFNuynaJMDtzzeUdnG272dzJtPXm2qig9eh32KYpHlpCPUx97gKK+aGqK2AAFb0=
=CKFi
-----END PGP SIGNATURE-----

--Y4VYWfdFdHwFhC6D--
