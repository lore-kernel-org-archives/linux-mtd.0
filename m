Date: Wed, 24 May 2017 08:34:08 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Angus Ainslie <angus@akkea.ca>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Chen-Yu Tsai <wens@csie.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: CHIPPro NAND issue with 4.12 rc1
Message-ID: <20170524063408.wjo3tn6j6ymwmnns@flea.home>
References: <399ea126f3b18071fbe46bfc9787df6b@www.akkea.ca>
 <20170520171418.4e8a47e0@bbrezillon>
 <6f3cefa6c54776f82160ed8954f4d0d4@www.akkea.ca>
 <20170521074535.4a4ba6dd@bbrezillon>
 <20170522070117.mwk4gm34o7idedye@flea.home>
 <63aca137397dc3700a34993205c8cfba@www.akkea.ca>
 <20170523195239.6nsv4ydrt4u7q6ge@flea.home>
 <a022aed57030622591a8e7eb97a59ff1@www.akkea.ca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="z2lep4o6i7n4bcph"
Content-Disposition: inline
In-Reply-To: <a022aed57030622591a8e7eb97a59ff1@www.akkea.ca>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--z2lep4o6i7n4bcph
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2017 at 10:05:14PM -0600, Angus Ainslie wrote:
> On 2017-05-23 13:52, Maxime Ripard wrote:
> >=20
> > Ok, good.
> >=20
> > If you unrevert those patches, and add clk_ignore_unused to the kernel
> > command line, is it still broken?
> >=20
> > Maxime
>=20
>=20
> If I use the clk_ignore_unused flag with the patches below then the kernel
> can boot and mount the nand.
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun5i.c
> b/drivers/clk/sunxi-ng/ccu-sun5i.c
> index 5c476f9..700944c 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun5i.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun5i.c
> @@ -251,7 +251,7 @@ static SUNXI_CCU_GATE(ahb_mmc1_clk, "ahb-mmc1",
> "ahb",
>  static SUNXI_CCU_GATE(ahb_mmc2_clk,    "ahb-mmc2",     "ahb",
>                       0x060, BIT(10), 0);
>  static SUNXI_CCU_GATE(ahb_nand_clk,    "ahb-nand",     "ahb",
> -                     0x060, BIT(13), 0);
> +                     0x060, BIT(13), CLK_IS_CRITICAL);
>  static SUNXI_CCU_GATE(ahb_sdram_clk,   "ahb-sdram",    "ahb",
>                       0x060, BIT(14), CLK_IS_CRITICAL);
>  static SUNXI_CCU_GATE(ahb_emac_clk,    "ahb-emac",     "ahb",

That doesn't really make much sense, clk_ignore_unused and
CLK_IS_CRITICAL are roughly doing the same thing

Could you paste the whole kernel logs?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--z2lep4o6i7n4bcph
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZJSlgAAoJEBx+YmzsjxAgjXsQAJoAyXJmMpt37PX/dQgBTg0d
q7QxmPUIauWNQ2u+wODybJlUuu4gDyicJoWXgXq4PdnpMOx2dlxD3YrNB65if+Ob
glO9QHGCGOsH613DMjuDmh3TvWp4LNFTUeg5GAvw8tIG8YZyTv5CX7X1I0G04ruJ
V/7YChmM41jOa0XdE9XQ5hF4WTtiNnz+0CSEA9i6ReONeZBct91UgfL7Fbf2XYis
9oVE0lTNLT69iyMvGHeNlpqvN/g2MWJiojd3I4C5OYIdU8UV4BhxBCnlG/uURSJW
LmRcese+jt0FkG//SD4drZ/ZQI/zIqkcg+v3DpAPScKRvGKZRqKwDH07lDIiJA2H
dPRr80/+4uIbJr2nXU/aV463Lh+6J5DUa18jb/VeqCYcPDIxfVnKOC58d/rceU9r
p9j5Lzjpq1amERtGw9kTfqq1Xmr6JFea8u7nLsFSLEOz8pWPmqePOlRkmOyUY8ZK
DtKd+/gY1pu5uKvxWGqAd2Mt6WIQEO0Yr7VehVQwvLCcQJ078PD8Ur9yDFCxhxki
048MZcf7YZzZqBq7Ern18wgxASVGTjcqN/0ru2Dk7w136RdJazhE3sShTKU2WU+0
0w3eRCR6chCRA/1zsFM0+xQd6RCyR9xCeV+QPiazAJFeqHQwzVO2BbZ0SyIWU17A
tHa0OrWlR5/5cBU41upY
=7LAq
-----END PGP SIGNATURE-----

--z2lep4o6i7n4bcph--
