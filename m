Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1coEop-0000d4-CF
 for linux-mtd@lists.infradead.org; Wed, 15 Mar 2017 19:42:50 +0000
Date: Wed, 15 Mar 2017 20:41:41 +0100
From: Alban <albeu@free.fr>
To: Rob Herring <robh@kernel.org>
Cc: Aban Bedel <albeu@free.fr>, linux-kernel@vger.kernel.org, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard
 <maxime.ripard@free-electrons.com>, Mark Rutland <mark.rutland@arm.com>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH v2 1/2] doc: bindings: Add bindings documentation for
 mtd nvmem
Message-ID: <20170315204141.1381cd01@tock>
In-Reply-To: <20170315172401.35b5owbme4scqfgn@rob-hp-laptop>
References: <1488875164-30440-1-git-send-email-albeu@free.fr>
 <1488875164-30440-2-git-send-email-albeu@free.fr>
 <20170315172401.35b5owbme4scqfgn@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Z25TaLC=JLMo=r8vcDko7/I"; protocol="application/pgp-signature"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Sig_/Z25TaLC=JLMo=r8vcDko7/I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 15 Mar 2017 12:24:01 -0500
Rob Herring <robh@kernel.org> wrote:

> On Tue, Mar 07, 2017 at 09:26:03AM +0100, Alban wrote:
> > Config data for drivers, like MAC addresses, is often stored in MTD.
> > Add a binding that define how such data storage can be represented in
> > device tree.
> >=20
> > Signed-off-by: Alban <albeu@free.fr>
> > ---
> > Changelog:
> > v2: * Added a "Required properties" section with the nvmem-provider
> >       property
> > ---
> >  .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 33 ++++++++++++++=
++++++++
> >  1 file changed, 33 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.t=
xt
> >=20
> > diff --git a/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt b/Do=
cumentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> > new file mode 100644
> > index 0000000..8ed25e6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> > @@ -0,0 +1,33 @@
> > +=3D NVMEM in MTD =3D
> > +
> > +Config data for drivers, like MAC addresses, is often stored in MTD.
> > +This binding define how such data storage can be represented in device=
 tree.
> > +
> > +An MTD can be defined as an NVMEM provider by adding the `nvmem-provid=
er`
> > +property to their node. Data cells can then be defined as child nodes
> > +of the partition as defined in nvmem.txt.
> > +
> > +Required properties:
> > +nvmem-provider:	Indicate that the device should be registered as
> > +		NVMEM provider =20
>=20
> I think we should use a compatible string here (perhaps with a=20
> generic fallback), and that can imply it is an nvmem provider. The=20
> reason is then the compatible can also imply other information that=20
> isn't defined in DT.

That would work for partitions but not for unpartitioned MTD as these
will already have a compatible string for the MTD hardware. I was also
under the impression that capabilities/services provided by devices
were represented with such properties, like interrupt-controller or
gpio-controller, and not with compatible strings.

There is also another problem with unpartitioned MTD, earlier MTD
partitions binding allowed to have partitions as direct child nodes
without any compatible strings. The current nvmem binding do the same
for the nvmem cells, so it wouldn't be clear if a child node of the MTD
is a partition using the old binding or an nvmem cell.

As I think this problem could happen with some other device types I
suggested to re-work the nvmem binding to be more like the current MTD
partitions. See these threads[1][2], but a short example would look like
this:

flash {
	compatible =3D "vendor,flash-device-model";
	...
	nvmem-provider;
	nvmem-cells {
		compatible =3D "nvmem-cells";
		#address-cells =3D <1>;
		#size-cells =3D <1>;

		cell@100 {
			label =3D "mac-address";
			reg =3D <0x100 0x6>;
		};
	};
};

or like this if the device is partitioned:

flash {
	compatible =3D "vendor,flash-device-model";
	...
	partitions {
		compatible =3D "fixed-partitions"
		...
		partition@1000 {
			...
			nvmem-provider;
			nvmem-cells {
				compatible =3D "nvmem-cells";
				#address-cells =3D <1>;
				#size-cells =3D <1>;

				cell@100 {
					label =3D "mac-address";
					reg =3D <0x100 0x6>;
				};
			};
		};
	};
};

Alban

[1]:https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1344899.ht=
ml
[2]:https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1348295.ht=
ml

--Sig_/Z25TaLC=JLMo=r8vcDko7/I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYyZj1AAoJEHSUmkuduC28e4IP/3ROERFGJPK4upWA2IOb/AoJ
LriOFJhwiPJsIIk7Xoo6gEuYVFt0hBcX/WvvfAM4JCAIQFYOx8Ngb1aDVXMJQds9
41THgobfsjnlK7xrUWHzy4DEA8vLJpY0Ay4yAzSaULXpP5Fh8+pcbDTtgLHNeljs
8LeVYe5z6PmT8y+cFEOF6KPijw8HI1KWRV0ShnFoQg4XJ8XWzTOI4jEdHOOX2xx3
IRX6gbwiF+klP8NMg0Hs0/QAx50Ldltbb24GhxXhdNBnTZrv/zdzAObOD/5plMJq
mqriz6QJCRKgwrLAj9Iv1AXhznexQmsT6rVtCVDZpOG76FH/HVr0JzoseXw1I1eQ
gixdrhTOv2NQ2v3S/G0Axb52kNfkbydBZQhgtTZ9N2Z6uOvnpEIsivQ56C7vyBPu
9uiRON1QGk1s3EqB8oRvyCBnGPC8OWu1lMwHhL3rQrQXxLI/Csssi5KgHn8AQVOL
gnmTKEYcqFqMJqPqStGgVxMBOvrM7e28SPUKE4ngyiczTc01OD9WxlMGay3PZnKI
K+EfvKICVS7tTVvK3uWRR983KYiLxFFEYht5YqmHfWJqm/sv11yWWcjAC1zippwY
np4cLGDiQoc7IRvPp3II/XXUcaaKGJEZWcQg+4qQwmNWjEKyEjZ+Zc+xyuKrCM24
YkGi2SyasL7A7p4U/Z7H
=LtXj
-----END PGP SIGNATURE-----

--Sig_/Z25TaLC=JLMo=r8vcDko7/I--
