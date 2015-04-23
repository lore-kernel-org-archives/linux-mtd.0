Received: from skprod3.natinst.com ([130.164.80.24] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YlNAJ-0002y6-LY
 for linux-mtd@lists.infradead.org; Thu, 23 Apr 2015 19:52:04 +0000
Date: Thu, 23 Apr 2015 14:50:43 -0500
From: Josh Cartwright <joshc@ni.com>
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Subject: Re: [PATCH v6 1/2] Devicetree: Add pl353 smc controller devicetree
 binding information
Message-ID: <20150423195043.GS27115@jcartwri.amer.corp.natinst.com>
References: <1428941512-26411-1-git-send-email-punnaia@xilinx.com>
 <e3a73fa0-9159-4fbe-b042-4737dc9b041f@BN1BFFO11FD010.protection.gbl>
MIME-Version: 1.0
In-Reply-To: <e3a73fa0-9159-4fbe-b042-4737dc9b041f@BN1BFFO11FD010.protection.gbl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UlsYxwg8UDQn+EKZ"
Content-Disposition: inline
Cc: mark.rutland@arm.com, jussi.kivilinna@iki.fi, linux-doc@vger.kernel.org,
 artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>, arnd@arndb.de,
 michal.simek@xilinx.com, ezequiel.garcia@free-electrons.com,
 grant.likely@linaro.org, devicetree@vger.kernel.org, jason@lakedaemon.net,
 pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, joern@logfs.org,
 kpc528@gmail.com, robh+dt@kernel.org, acourbot@nvidia.com,
 kalluripunnaiahchoudary@gmail.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, rob@landley.net, galak@codeaurora.org,
 ivan.khoronzhuk@ti.com, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--UlsYxwg8UDQn+EKZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Punnaiah-

A few nitpicks here, in case you'll be spinning up a new version of your
patchset.

On Mon, Apr 13, 2015 at 09:41:51PM +0530, Punnaiah Choudary Kalluri wrote:
> Add pl353 static memory controller devicetree binding information.
>
> Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
[..]
> @@ -0,0 +1,37 @@
> +Device tree bindings for ARM PL353 static memory controller
> +
> +PL353 static memory controller supports two kinds of memory
> +interfaces. i.e NAND and SRAM/NOR interfaces.
> +The actual devices are instantiated from the child nodes of pl353 smc node.
> +
> +Required properties:
> +- compatible		: Should be "arm,pl353-smc-r2p1"
> +- reg			: Controller registers map and length.
> +- clock-names		: List of input clock names - "memclk", "aclk"
> +			  (See clock bindings for details).
> +- clocks		: Clock phandles (see clock bindings for details).

Technically not clock phandles, but clock specifiers.

> +- address-cells	: Address cells, must be 1.
> +- size-cells		: Size cells. Must be 1.

These should have the leading '#' as in '#address-cells' and
'#size-cells'.

  Josh

--UlsYxwg8UDQn+EKZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJVOU0OAAoJEKp7ZBKwQFArRsoH/jqayKE/frgryBvVuVL0NglS
6XHfvrHFZLA56uC5ourwK1L88F6lg0lJK73uPLy7e5ag2buXgbe1r0CVqn9QrszT
fFpTAehqnvPRm7uUa4CKo8de6iI3G6GetEaToEsIBzPrP+I3zk91/legfVwEE81O
92FAvLgOT73rUoC700Zp5bPmEqPCzjw01CFhh6aKomIWgG3GJDO0dqgwN/WPOsN9
IMqMZpjTPhJXu2HjVk6JYQUi6kFfmWxGJtde7o8HKEB/lJp66dDn5weJNNQF3eaF
tsky9+z9AkfdGlfJGzA3nsMuz8pVY1JobONszH/wWGN16o4MC+d7lJ+dWRFrWI0=
=fjRC
-----END PGP SIGNATURE-----

--UlsYxwg8UDQn+EKZ--
