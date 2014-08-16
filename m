Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XIlg3-0002NV-6z
 for linux-mtd@lists.infradead.org; Sat, 16 Aug 2014 21:38:19 +0000
Date: Sat, 16 Aug 2014 17:33:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Message-ID: <20140816163315.GX28623@sirena.org.uk>
References: <CACna6rzhD9=Pkb5gRqd9A23gfaqnHmYe_vm0fwT_mefAibmhYQ@mail.gmail.com>
 <20140802020036.GR3711@ld-irv-0074>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="sL7C0a98p/u5aVah"
Content-Disposition: inline
In-Reply-To: <20140802020036.GR3711@ld-irv-0074>
Subject: Re: Writing SPI flash driver for Broadcom BCM53xx ARM SoC
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, linux-spi@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, Andre Renaud <andre@bluewatersys.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--sL7C0a98p/u5aVah
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 01, 2014 at 07:00:36PM -0700, Brian Norris wrote:

> You can probably write a pure SPI driver (drivers/spi/) that uses only
> the MSPI hardware to do (slow, single-I/O) true SPI, and hooks into
> m25p80.c.

This seems like a good first pass at any rate, it's uncontroversial and
at least functional even if slow.

> But if you want to integrate the accelerated BSPI for reads, it gets
> harder. You might be able to export a kind of 'lock' API from the MSPI
> driver, so that a BSPI driver can utilize the MSPI for most
> transactions, but then lock it down when doing BSPI/read operations. I
> think with a little bit of work, spi-nor.c can accomodate the right kind
> of callbacks to allow you to do this. But the coordination between
> drivers/spi/<MSPI> and drivers/mtd/spi-nor/<BSPI> would be the hardest
> to architect, I think.

Right, I think we'd need something that allowed the MTD controller to
take ownership of the device, lock out other users and then do what it
wants with the controller.  If we provide a way for the SPI and MTD
drivers to get hold of each other and pass around the underlying device
we probably don't even need to architect the interface too much, we can
just say it's a private arrangement between the two drivers, given that
I don't think we have a good picture of what a standard interface would
look like and the hardware seems to have a reasonable amount of
variation in how things are split this may actually be the most tasteful
thin we can do for the time being.

--sL7C0a98p/u5aVah
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT74fIAAoJELSic+t+oim9bhAP/3+R5/tY9jm+awrweAXldKuh
qN2Q1r+huRkr5NwvY+Md5GJLkWMza9D19qMC8qdAVBKHTVeR/1iWdhHqCV7KBOwU
/8JqgYhObao1EcT0ZUvpXnYf2kkX0P6eEQ02gMNYxfyw+R8idDirwup5AON0sqxy
ezC9ohFhfM09q98HMjbsTGGmvgFBekzseBYJEpZX4k/XhE5KZy9iPvtqXx+vxyZf
d5iIU+r1MSfch5Ldbbc0DxIdrcPI3i1oImUqHmEHYLqhwmxUaLdyWqII/MZwcOtB
GJewmozxE/1uNkaqW9W6C1HPz9egf4tQKFH7qTBYz9htbogLy3ymvCSFn0AeOgIR
eGpdIB5UUjQZYMvqI12b7v9c98XqmnwIwxjvviDh0IMA+ua0d60YBmfTdUGmPjF8
YAGbqkOQIpNVkqzjCiIxuDj3Y3lNNO4AO7+PNJT2QgGs7EqiarYFVOJll/cF7UN1
HN6WtGiE7UsA93mEBra+G19Omw0wzg/u6vlVtIMBuiKBTZiAhSNtockzk1gU6kYR
hjPYvRLN77vwBFSNxc7PbL9fKoXJO2E/6oCbrksV8cHiUj8gzHNqu6PSXOlfVc1A
pI7to7aFMeTu9aa5d8ocOFTSQ5x5IQImYSj0CkfQ/hRJAcytRx70x2QCX1QcXwtq
PHtgUy7+bvbgRFE/hpcd
=IKL5
-----END PGP SIGNATURE-----

--sL7C0a98p/u5aVah--
