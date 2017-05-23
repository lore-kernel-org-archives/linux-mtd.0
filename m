Date: Tue, 23 May 2017 21:52:39 +0200
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
Message-ID: <20170523195239.6nsv4ydrt4u7q6ge@flea.home>
References: <399ea126f3b18071fbe46bfc9787df6b@www.akkea.ca>
 <20170520171418.4e8a47e0@bbrezillon>
 <6f3cefa6c54776f82160ed8954f4d0d4@www.akkea.ca>
 <20170521074535.4a4ba6dd@bbrezillon>
 <20170522070117.mwk4gm34o7idedye@flea.home>
 <63aca137397dc3700a34993205c8cfba@www.akkea.ca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="ml72h6ataqqgzcx4"
Content-Disposition: inline
In-Reply-To: <63aca137397dc3700a34993205c8cfba@www.akkea.ca>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--ml72h6ataqqgzcx4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 22, 2017 at 10:32:42AM -0600, Angus Ainslie wrote:
> Hi Maxime
>=20
> On 2017-05-22 01:01, Maxime Ripard wrote:
> >=20
> > This just made me realise, this is also the time where the clocks are
> > disabled, and we changed our clock implementation in 4.11.
> >=20
> > And using the 4.4 DT will keep the old driver...
> >=20
> > Did you test in 4.11? If it's also broken, could you try to revert
> > 1f4ce3b6ca79 and 6b48644b1d29 (I'm not sure it's going to be a trivial
> > revert, but in that order it should work).
> >=20
>=20
> Thanks reverting those two allow the kernel to boot and mount the NAND.

Ok, good.

If you unrevert those patches, and add clk_ignore_unused to the kernel
command line, is it still broken?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ml72h6ataqqgzcx4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZJJMHAAoJEBx+YmzsjxAgqCwQAIqGaEjP9t3rObYnzecLAqZp
F+IPsp14FWcfGVkwe9vXF14W8L/4m7Dq9iDZBZg4UHSYO8yy9G74hQ/C3Gj2Tpvf
qqr9TpRyjd+1gjt36T2svcK3C1RGwMOTZSEzHckH9Hu36XQDOR5rsvSgTbDKXkiZ
jek4yniM9hXz5vlNcRPIOtMLjdjkY5HwohizoZ9kd4xBlb1YVVlVUleuGY0lVMi1
pYAELFNdG2Y6J7ukQ8zDLVnWPSwj3C+QNQnq45ReDDyffdKQUmb6qFBl3tLYb++A
TOJKXotmG40+CnRog9CuME0QRvZgco/DKWcdOOdcfS0hI1mSVtGzhtkMKZpn2SbT
b/pOHlrVHV34J1daHv84LiIfejYpiBkj7kHEL+S+Zmw0rBDl2D7adhRi/gxs620X
PUXtFdLKn3q9498gCKTiqJDMN2kt5zXgxkswekl1xWjgNbgsqZj1knXbJcfpXEQY
bONwLQgE4vpC2na6smFgyGfG5M8V3T2guKsFlUt2Do/6ejZ281xyIp1AV+jD/4lg
uXF4GIyDqhm9hu8wJO7RaTn/WbJAPworCq9huzgDnEEsTefhiA66LyfLAZPGl5Mk
UWIVVcPt3nhbAgmO/+VEs/pYtoQk4LtxlgQlC7r8xmLzT/ACJmOLbiFf40LiZWIW
L9XPVpYsi9hTgCOBTSyi
=7VBi
-----END PGP SIGNATURE-----

--ml72h6ataqqgzcx4--
