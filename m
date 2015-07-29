Date: Wed, 29 Jul 2015 15:00:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Michal Suchanek <hramrach@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Padmavathi Venna <padma.kvr@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org
Message-ID: <20150729140046.GB11082@sirena.org.uk>
References: <cover.1438170519.git.hramrach@gmail.com>
 <557c1962448393b2a8736f26bfa2a3a5ba4aeb7a.1438170519.git.hramrach@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline
In-Reply-To: <557c1962448393b2a8736f26bfa2a3a5ba4aeb7a.1438170519.git.hramrach@gmail.com>
Subject: Re: [RFC PATCH 2/2] dt: spi: s3c64xx: add compatible to
 controller-data
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 29, 2015 at 12:19:57PM +0200, Michal Suchanek wrote:

Please use subject lines matching the style for the subsytsem so people
can spot that the patch is in some way relevant.

> The controller-data subnode has no compatible. This can lead to other
> drivers getting confused by it. Add a compatible to make devicetreee
> unambiguous.

I can't tell from this commit message what the issue you're trying to
fix is, sorry.  Nodes without compatible strings are entirely normal and
don't need compatible strings.  It sounds like a bug in whatever other
driver is becoming confused.

> +	if (!of_get_property(data_np, "compatible", NULL) ||
> +	    strcmp(of_get_property(data_np, "compatible", NULL),
> +		   "samsung,s3c-controller-data"))
> +		dev_err(&spi->dev, "child node 'controller-data' does not have correct compatible\n");

This will break all existing users which is not acceptable for
mainline, we need to preserve compatibility with existing device trees.

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVuNyNAAoJECTWi3JdVIfQncsH/0G7MS0/qfSwdPHn0o6yz8aR
q6xkpNSqE5FpL28c5k57qt8dHrL1yuXpXVYn6c0rqGwLYA92iuDEOoqM8Zs6y3IQ
9v26r0JcA2RBko7VYCB/OhVGCu+4adCy6kVhdHRulRoEsbhT126hO/b05vcf9/DK
HQT9omMnBttIVQvoQembTmMLnjepBasqL6N5CE00OQFcR/zNXrPNqmrC8JAAuAy1
jK9H/UgkrBrITvpvA6wgiy4+1797Z1ovgqT9YefUqn+nBHFhcvo29VV/wxrZDqnG
JHRT4qzJsMfav5GRZN7fhKw8rt+Mqsrw4aLP2SDLchzDUuoprW3MG80hHSHOQmA=
=RsyY
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
