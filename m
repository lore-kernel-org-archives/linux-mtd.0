Date: Tue, 4 Aug 2015 16:52:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Vignesh R <vigneshr@ti.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@arm.linux.org.uk>,
 Huang Shijie <b32955@freescale.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
Message-ID: <20150804155236.GS20873@sirena.org.uk>
References: <1438072876-16338-1-git-send-email-vigneshr@ti.com>
 <1438072876-16338-5-git-send-email-vigneshr@ti.com>
 <20150731181903.GN20873@sirena.org.uk> <55BEF5D1.1050608@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DNbkntcEGyiBe7B+"
Content-Disposition: inline
In-Reply-To: <55BEF5D1.1050608@ti.com>
Subject: Re: [RFC PATCH 4/5] ARM: dts: DRA7: Add memory map region entries
 for qspi
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--DNbkntcEGyiBe7B+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 03, 2015 at 10:32:09AM +0530, Vignesh R wrote:
> On 07/31/2015 11:49 PM, Mark Brown wrote:

> >> -			reg = <0x47900000 0x100>;
> >> +			reg = <0x47900000 0x100>,
> >> +			      <0x30000000 0x3ffffff>;
> >> +			reg-names = "qspi_base", "qspi_mmap";

> > The DT binding document for the controller needs to be extended to
> > document this change in the binding.

> DT bindings are already documented at
> Documentation/devicetree/bindings/spi/ti_qspi.txt. Did you mean to add
> this node as an example in that file?

No, I mean you're changing the binding to add this new memory region -
that new region needs to be added to the documentation.

--DNbkntcEGyiBe7B+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVwN/DAAoJECTWi3JdVIfQDmgIAIR4xT4J2eYaCKDeCNkOZR0Z
oGMLIpACnU+bu9wiAPbfQMq43bQOdP7XSZAHrxKkXmLVZpVUPeGpOmN4Wa99U25W
whmSIjwJf73efIv8N8K4Y4QUiU73JL1RAfIDl2moe2708e4sFEJGN0NufeHcppHr
vZdjKfIfhVnZ6DuF7TkItapDBq6E5BVMXLoIr1RCN11gYcupBqBiqQGEhrY6fQsy
bVzX1OjtJoGtTaybt1or9KPgMWcP2EapqBJ8qTwcLdnAlsMr8Jb1qxS89in82Q6q
QqwahNKtFSNzzVtds/Mc7YOEGUBdl9qWc669cKTwJClNmbHv4chkuXAPCnkf7uU=
=Hgzf
-----END PGP SIGNATURE-----

--DNbkntcEGyiBe7B+--
