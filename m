Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bVcvE-0003cj-H3
 for linux-mtd@lists.infradead.org; Fri, 05 Aug 2016 11:04:13 +0000
Date: Fri, 5 Aug 2016 12:03:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, vigneshr@ti.com,
 bcm-kernel-feedback-list@broadcom.com, vikram.prakash@broadcom.com,
 andy.fung@broadcom.com, jon.mason@broadcom.com, jchandra@broadcom.com
Message-ID: <20160805110336.GR10383@sirena.org.uk>
References: <1469830393-13295-1-git-send-email-kdasu.kdev@gmail.com>
 <1469830393-13295-2-git-send-email-kdasu.kdev@gmail.com>
 <20160804210634.GM10383@sirena.org.uk>
 <1fddf72d-cbc1-225f-b482-d6ba99dab823@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6tPipYVl+OcoAvSh"
Content-Disposition: inline
In-Reply-To: <1fddf72d-cbc1-225f-b482-d6ba99dab823@gmail.com>
Subject: Re: [PATCH v5 1/8] Documentation: dt: spi: Add BRCMSTB SoC bindings
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--6tPipYVl+OcoAvSh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 04, 2016 at 03:20:17PM -0700, Florian Fainelli wrote:

> What's wrong with the subjects being used here? It's not like there is a
> consistent subject for DT bindings, is spi/dt what you would expect here?

As a quick look at the git log for the SPI DT bindings should show you
I'm looking for something in the same style as the drivers which at
least starts with "spi".  A *vanishingly* small number of them start
with Documentation which ought to be a bit of a warning sign.

> Can we save Kamal another round of patches and provide feedback on the
> patch contents (as well as their form)?

I will look at them when I have time, this is the result of the triage
where I work out if the patches are in some way relevant to me or I can
just delete them.  Please don't chase me for faster review unless
there's some strong reason, it tends to result in slower review.

--6tPipYVl+OcoAvSh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXpHKHAAoJECTWi3JdVIfQTGAH/1ExBIy6bB/aJ0cyh0PQRkTM
9wS+PFsDquTSGFePK/Uf9UXBqSS1aq51c/X07LJdVWYsbSZgp4eYMhrWAcJs9KRT
HX0Bu5mZPxW72wK6bIODPjQvlhHsoIjJmjwGdnO4pbZ2NYxqKQWGPHys7ISfjD1L
IUgS1rQ3M162DGHIcfVMhOC0IE06Tq6xIUqPzUMom8mWKC68U5m+ApvIrhWAhVjV
y4b5Cz2V5q6+GSZulI26/5tRGAzDF8nVNP2L9x3DuYD2AZCH9YYAy7blu7jiSaJ2
KoQK0B70c4fRpWqhyUxKtKSy/+1qAbtKEiLMyXKZi8HXMLhJM7NShWLmUI69p7Y=
=4De1
-----END PGP SIGNATURE-----

--6tPipYVl+OcoAvSh--
