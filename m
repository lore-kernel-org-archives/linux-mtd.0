Date: Tue, 12 Apr 2016 07:10:07 +0100
From: Mark Brown <broonie@kernel.org>
To: P L Sai Krishna <lakshmi.sai.krishna.potthuri@xilinx.com>
Cc: Michal Simek <michal.simek@xilinx.com>,
 Soren Brinkmann <soren.brinkmann@xilinx.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Stephen Warren <swarren@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Andrew F. Davis" <afd@ti.com>, Marek Vasut <marex@denx.de>,
 Jagan Teki <jteki@openedev.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Harini Katakam <harinik@xilinx.com>,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
 Anirudha Sarangi <anirudh@xilinx.com>,
 P L Sai Krishna <lakshmis@xilinx.com>
Message-ID: <20160412061007.GY3351@sirena.org.uk>
References: <1460039969-9835-1-git-send-email-lakshmis@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3C3ZMpwu25Mtx3MN"
Content-Disposition: inline
In-Reply-To: <1460039969-9835-1-git-send-email-lakshmis@xilinx.com>
Subject: Re: [LINUX PATCH v2 1/3] spi: Added dummy_cycle entry in the
 spi_transfer structure.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--3C3ZMpwu25Mtx3MN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 07, 2016 at 08:09:27PM +0530, P L Sai Krishna wrote:

> + * @dummy_cycles: number of dummy cycles. If host controller requires
> + * 	dummy cycles rather than dummy bytes which send along with Cmd
> + *	and address then this dummy_cycles is used.

I'm having a very hard time parsing this, partly because it is entirely
flash specific (the whole concept of cmd and address is missing from
SPI).  As Cyrille said perhaps this should go in a flash specific
interface?

--3C3ZMpwu25Mtx3MN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXDJE9AAoJECTWi3JdVIfQbdgH/i6pQrJlheEnY2+TpzqaJH9N
0gliGNtTfhiTWHRE+5bQwYR35WuWGrz21nKodsX1eTlHB9aF22Wee3zo7qRWodnp
PwJpNcpKTTG2sjzAeC25gRQ2WYNHiQzgCou7kP3yut8AvsFTqyTa/mQ1yHXNW6dW
8sc63rb9zIFoFGF5vRRBfffADUv8GCOymFKGLVL+7nuSW+zi6xZc77FAZ+dToz54
qKpEinZ4cIUYuwKY7u3V5HYRyrfB3WhnkAM8DWFTxMVo5xp6ICPv8RBmEZZd1+jH
ic74Pv1GUyckoB2mj9h9LTAoINTJVSW7adAtaZhIy3zw78oJz4tPNlvHnm0yNnE=
=Rl6x
-----END PGP SIGNATURE-----

--3C3ZMpwu25Mtx3MN--
