Date: Fri, 23 Aug 2013 13:01:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Message-ID: <20130823120156.GH25263@sirena.org.uk>
References: <1376885403-12156-1-git-send-email-b32955@freescale.com>
 <201308222229.01778.marex@denx.de>
 <20130822233611.GA25263@sirena.org.uk>
 <201308230158.05909.marex@denx.de>
 <20130823094141.GE25263@sirena.org.uk> <52174BAC.3070901@gmail.com>
 <52174D25.9050805@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="9sSKoi6Rw660DLir"
Content-Disposition: inline
In-Reply-To: <52174D25.9050805@gmail.com>
Subject: Re: [PATCH V1 3/5] mtd: m25p80: add the quad-read support
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 b44548@freescale.com, dedekind1@gmail.com, b18965@freescale.com,
 linux-spi@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, shawn.guo@linaro.org,
 dwmw2@infradead.org, wangyuhang <wangyuhang2014@gmail.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--9sSKoi6Rw660DLir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 23, 2013 at 04:53:09AM -0700, Brian Norris wrote:
> On 08/23/2013 04:46 AM, Brian Norris wrote:

> >     Signed-off-by: wangyuhang <wangyuhang2014@gmail.com>
> >     Signed-off-by: Mark Brown <broonie@linaro.org>

> Speaking of which, the new device-tree properties are not documented
> in Documentation/devicetree/bindings/spi/spi-bus.txt yet.

Yes, indeed - if you look at the review you'll see I asked for a
followup patch doing that.

--9sSKoi6Rw660DLir
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSF08xAAoJELSic+t+oim9pnMP/0LJTzMR5WbU9mW/gkSI7LUX
U/tHkFLp++KTkyCyDI+X7sGD5EWa6uvxmz9dfiAtbcB0/Qzr35kaThptoSiju1Sz
9BNlZ/j9NsAhkSd1egar67frcIXd2v8QycWBkNOBRhQXc2WUZCx5M8wK/VU6eyPW
D3X84sxL41LuEC/tR9Y1U8+W9xDBWPpcADHQoZdfsN82WWgX0GMVKQoyqqQJOFtv
Gr7K0AK3jWKG4wn5xaodk0i/2sfOXJum0ztYf0+tOhfYPbmh6yhWpu75MPmMo8i1
OYS1hR8jjejHUeWucHC/yx3ZlCRBAX7CtNer2ChScaeytlpDNA+p2mTKmHgPvfE+
Krs1WQnar61l5lQCATnnC0bILFPsqUtqN/xmCusjD433CVi8bDkyK7gWo+uFVEGR
DKRHUwaWXi4ebn8+RDPc6SyKGdsWB6pzvH5KQ3MPq3SJm614z5ECMXvpmv4ZA4I7
ok9WcUdQxya9htzo6DsNOeL+9UqsMlnbckp6f4VduwoG31ju7AZdLAFSnqHwqTcj
EzQB3+AOU+q1X3Kf5wirrZ5AcXwCxps+JIOqn/F1iGX65nN5CydJqaGLX6ptgIFY
RydJQs6OwLoAO4rKoriPxnp8e/ORpIzOByNsvDfDdkx47pppZpcvW62asW+r7BuW
7K1GV8uOf8c2kmsGMzez
=k4dS
-----END PGP SIGNATURE-----

--9sSKoi6Rw660DLir--
