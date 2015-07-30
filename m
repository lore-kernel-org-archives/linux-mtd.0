Date: Thu, 30 Jul 2015 11:52:33 +0100
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
 devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>
Message-ID: <20150730105233.GO11162@sirena.org.uk>
References: <cover.1438170519.git.hramrach@gmail.com>
 <557c1962448393b2a8736f26bfa2a3a5ba4aeb7a.1438170519.git.hramrach@gmail.com>
 <20150729140046.GB11082@sirena.org.uk>
 <CAOMqctTZVET=U=2o65HpWSm4W660XZtYYbBND2k4u9CnfjfMhQ@mail.gmail.com>
 <20150729171613.GI11162@sirena.org.uk>
 <CAOMqctQzh69RCQu8pK1EuuYkrZsh6mg34+YWJFzSvimcK3B0rA@mail.gmail.com>
 <20150729184043.GL11162@sirena.org.uk>
 <CAOMqctQTc-8_rU6URCPHXno-OqH6wf_rHY4mW+Sf-epNhCwhFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9VrpJA1Ggqg13J4y"
Content-Disposition: inline
In-Reply-To: <CAOMqctQTc-8_rU6URCPHXno-OqH6wf_rHY4mW+Sf-epNhCwhFQ@mail.gmail.com>
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


--9VrpJA1Ggqg13J4y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 30, 2015 at 10:24:37AM +0200, Michal Suchanek wrote:

> So my suggestion is to

> 1) search of ofpart subnode in mtd node. If present read address and
> reg from it and search partitions as subnodes of the ofpart node. In
> this case unknown nodes can cause error.

> 2) failing that issue a warning and try to parse ofpart partitions
> from the mtd node itself. In this case unknown nodes cannot cause
> error for compatibility with other drivers including the already
> exisitn s3c64xx controller-data node.

> The parser code can be the same for both cases and only operate on
> different node with a flag to reject unknown subnodes or not.

That seems reasonable to me.

--9VrpJA1Ggqg13J4y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVugHxAAoJECTWi3JdVIfQdZwIAIVmxlDqQRuMpGGZjMcMZoD6
2BQ+6Sj04M6QWBFYkqvm3Dp6xMHJ9r0nre0HSmUcztLmYPtsnv+scgPOiO523am8
mv5BJcmVGejsSbwYEf1rxHM2bGeD9MUmmfr9BrQsr19RmaO6K3G9lSKa8znCfRsx
FiKKMWdpl97JVdAvES0KC4rbpnGUpUtNNLeuzI1+17l8bzcv0NmwuG/wf2zfLjku
q9FF2UNSExyz/7uQezKiwG9HlmPQkE7wxVUNleYQM1VWwsBgtjgTU5ncj5lZ6RY0
zML7Y/sWu93tWX5cBAV5cB49sxzE7erz0e2pV330cHSnPIda/eHyoZ8b7c9iQFw=
=/zjp
-----END PGP SIGNATURE-----

--9VrpJA1Ggqg13J4y--
