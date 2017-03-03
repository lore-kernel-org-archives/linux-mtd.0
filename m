Received: from smtp6-g21.free.fr ([212.27.42.6])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cjm9t-00030Z-KO
 for linux-mtd@lists.infradead.org; Fri, 03 Mar 2017 12:18:07 +0000
Date: Fri, 3 Mar 2017 13:17:05 +0100
From: Alban <albeu@free.fr>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Aban Bedel <albeu@free.fr>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Richard Weinberger <richard@nod.at>, Marek
 Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard
 <maxime.ripard@free-electrons.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH 1/3] doc: bindings: Add bindings documentation for mtd
 nvmem
Message-ID: <20170303131705.119021f4@tock>
In-Reply-To: <20170302212220.4c3c7bef@bbrezillon>
References: <1488484223-844-1-git-send-email-albeu@free.fr>
 <1488484223-844-2-git-send-email-albeu@free.fr>
 <20170302212220.4c3c7bef@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//WcVBIwnCqlfkEDj3C3PmZa"; protocol="application/pgp-signature"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Sig_//WcVBIwnCqlfkEDj3C3PmZa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 2 Mar 2017 21:22:20 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Thu,  2 Mar 2017 20:50:21 +0100
> Alban <albeu@free.fr> wrote:
>=20
> > Add the binding to expose MTD partitions as nvmem providers. =20
>=20
> Looks good. Maybe you should take the case you describe in your
> cover-letter into account and add an extra layer: add an nvmem sub-node
> containing the nvmem cells, so that you can expose nvmem cells directly
> under master MTD devices (and not only partitions).=20

I think that would be the better solution. This can be done
independently, once we agree on a binding we just have to fix
of_nvmem_cell_get(). My suggestion would be to have the new binding
looking like this:

nvmem-device@10 {
	...
	nvmem-provider;
	nvmem-cells {
		compatible =3D "nvmem-cells";
		#address-cells =3D <1>;
		#size-cells =3D <1>;

		nvmem-cell@100 {
			label =3D "mac-address";
			reg =3D <0x100 0x200>;
		}

		...
	}
}

I would also suggest making the "nvmem-provider" property mandatory
to indicate that the device provides this capability. Up to now all
nvmem providers only support this API but I think there might be more
multi function devices in the future.

Alban

--Sig_//WcVBIwnCqlfkEDj3C3PmZa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYuV7BAAoJEHSUmkuduC28F5cP/R8xJyu2TL6rMp7ZuE1TkTYr
/lw1pQhEVnQcNiIFGzJsWv6gVOvDBXsy985hC/sp847twtUSBzy4DSagNHSR8Cui
NByS2M8IrfzF/yb11pGLoJIhzD825u8f51N/TpLpOE8jK8+T+sO+ZvjlyUi1wf18
QZUPdXrVSCAeJyfvLh4uYUaoUkD72OFGLCw8my729gQ7sLLKJeSBaD/+SU1WoTPA
0umOEdp6BHJPLcrlrejzk4JHsQMW0t2TFooJF1xeBr7yDjNoBGwlrmLfqtVYjNUj
n7OsYUn8GtM9SOqTZS32InkseOEuVYp85FHSjqMy5nLgUe0pG6aREYN0VTWKxy9l
KymY9kYOnXCBU/C+wr54eo/BcfHJ45rcnHqqI79JMcAqrgFSZSpnIWVS4ZAqIbkU
FEaL3aJH1FUH3zIsZIRaFFxswVHvfnGCqR5dNhpk0F9LOWRk5BHkytPVIgiAUo+C
zOgSoXaBBbSWEWyH+9cda1tSVXfdrb8UvjBidKAJo1CjYonupmH5ojHMU/hfzeYT
UTkgIXRNjN7d215FSQ8wzeuXlzs0NTo6eN2Qxnz3nPdidY87PfqNAN58XAfQu/mH
AmjXnQTDIndKpJ4XvHsUTohGwMKJHsAQB/3D/Aann20sGrn9yEd0e+n7DnclNShq
7j9qCzFLObp2bYQBaspn
=aa3s
-----END PGP SIGNATURE-----

--Sig_//WcVBIwnCqlfkEDj3C3PmZa--
