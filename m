Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VF1Hz-0001TF-Ss
 for linux-mtd@lists.infradead.org; Thu, 29 Aug 2013 12:25:28 +0000
Date: Thu, 29 Aug 2013 13:25:00 +0100
From: Mark Brown <broonie@kernel.org>
To: wangyuhang <wangyuhang2014@gmail.com>
Message-ID: <20130829122500.GC10783@sirena.org.uk>
References: <1377738110-4219-1-git-send-email-wangyuhang2014@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="pQjS7IR0m4/DQQ0Q"
Content-Disposition: inline
In-Reply-To: <1377738110-4219-1-git-send-email-wangyuhang2014@gmail.com>
Subject: Re: [PATCH V2] spi: dual and quad support(add single macro)
Cc: linux-mtd@lists.infradead.org, pekon@ti.com, linux-spi@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--pQjS7IR0m4/DQQ0Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 29, 2013 at 09:01:50AM +0800, wangyuhang wrote:

> fix two things in patch:
> commit id:f477b7fb13df2b843997559ff34e87d054ba6538

> 1.Add SPI_TX_SINGLE and SPI_RX_SINGLE to specify SINGLE mode.
>  Instead of using default value in mode.
> 2.Delete a "return" when commit the patch to a new kernel version
>  by mistake. So recover it.

These two changes aren't related to each other so should be sent as two
separate patches.

> @@ -89,8 +89,12 @@ struct spi_device {
>  #define	SPI_READY	0x80			/* slave pulls low to pause */
>  #define	SPI_TX_DUAL	0x100			/* transmit with 2 wires */
>  #define	SPI_TX_QUAD	0x200			/* transmit with 4 wires */
> +/* transmit with 1 wire(not using dual-tx and quad-tx) */
> +#define	SPI_TX_SINGLE	~(SPI_TX_DUAL | SPI_TX_QUAD)
>  #define	SPI_RX_DUAL	0x400			/* receive with 2 wires */
>  #define	SPI_RX_QUAD	0x800			/* receive with 4 wires */
> +/* receive with 1 wire(not using dual-rx and quad-rx) */
> +#define	SPI_RX_SINGLE	~(SPI_RX_DUAL | SPI_RX_QUAD)

These don't look right, they're going to set all bits which is going to
interfere with all the other flags.  Why do we need this define at all?

--pQjS7IR0m4/DQQ0Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSHz2ZAAoJELSic+t+oim9ZaMP/iKaysa+7M2U2fI8I7PH4FSh
YfQZhbVUjoR9NQK2jgq/MYL8p+bg1oJLwZSTI9y50lbUF/HsgzyNdjpqZrYWRcws
T1KJivCbdh56sK0/t5J4+bHNrLmKm2hHULEyk35wSgSDBN+84+3h4hwa89b1pVU/
Dq2X4A+c65KbTxej0dL4ZnvOlnSxGQqQciJIqT/NgxIw4O3fyZlIqhGyxk8SgK6Z
p3/eehh+RhjrKa75aeay0SGl8Fids1HBE5/MtgxTs1yEpsLvnbuf0e+SAa5Jt1ID
t4iz6Nwude+b06Bd5hhpft9949T9WA8aIXJySwdmfKdpRPs66/LYFE86QVXgKCF1
41+YMVgnKv6PseX65mevzni3hRAka2m67S7lFWYlSUJzWCAssX3EqGFlT1NPF0Zl
QvNuOZd0Zvju3QAztAe/3IuK1GI2qw7JV/CyoL0Nk5BrRr3DePs9HMYxPIvx4mS7
dotJx3dG4qcdXeFNrMDv2EVXdQur4vxe45bmScTVm/bqqmhpFR8NEI6yLbKxhsMT
zoqMdhbOlVdO1T3Nmuffq0R8uWj5UZBk83yP6E46S/S3fsYWbBJqQifqmXic5PSG
hptjXpvXA0DyfvZQzHjEahAYddF7DIg0aJuURWCrZGMiNG7+wII/aiXV33DUM502
lvVsmQPPCOcTyPzIoWmf
=kKpK
-----END PGP SIGNATURE-----

--pQjS7IR0m4/DQQ0Q--
