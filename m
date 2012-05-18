Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVN62-0004Ej-Ne
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 13:19:55 +0000
Message-ID: <1337347403.2483.48.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] UBIFS: read crypto_lookup from datanodes to znodes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Fri, 18 May 2012 16:23:23 +0300
In-Reply-To: <alpine.DEB.2.00.1205161451250.27131@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1205151101100.17750@eristoteles.iwoars.net>
 <1337087022.2528.204.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1205161451250.27131@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-wD6DKjo42awzPpoXsJjc"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-wD6DKjo42awzPpoXsJjc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-16 at 14:52 +0200, Joel Reardon wrote:
> +	if (key_type(c, &(zbr->key)) =3D=3D UBIFS_DATA_KEY) {
> +		struct ubifs_data_node *dn =3D node;
> +		long long crypto_lookup =3D le64_to_cpu(dn->crypto_lookup);
> +		if (zbr->crypto_lookup !=3D 0)
> +			ubifs_assert(zbr->crypto_lookup =3D=3D crypto_lookup);
> +		else
> +			zbr->crypto_lookup =3D crypto_lookup;
> +	}

Could you please just inject this code directly to
'ubifs_tnc_read_node()' ? I think it is much easier and more nicer, no?

--=20
Best Regards,
Artem Bityutskiy

--=-wD6DKjo42awzPpoXsJjc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPtk1LAAoJECmIfjd9wqK0kZcP/1XEVMXn9Le+HBtv4j9Irs2X
gcXOdB1VWUx/zy6+enOHErvRGI0eZiVsvHebE4DMRmlaTfvX14dflWGo2k4inydE
9pGoX9x/LoOIbRt15SCz3LRAlnIM4G8cl5UmCjA6QHwCSf7KOK33qTM1r7q5y1C7
HSLEarmpeOyw8CPOCOJK4+KZCnyli99MOOJl1g8PmuQwGvX6FhYBJiNragq1bTIy
z7/ZmX4SiO0tQFXENqyJFSaqCFFbsVEaJM1Jz6Upp7ae21QJQAufBcZIvKpjqBST
3u+O7TfHF37Six7BcIqSQ5cI6FX9yFhe09fx+R5C8x64Z5v5gD5DuXqUNmp0xGQJ
0DlyS8/ZmTFy8AHJbEfwPa9RrugzgAJcN3EbU47cZYFx2X5ISPcZW/168HA9OKrA
8mvdIS/voBpI5tLSGazCELdRVaSPAKUHTUBrucAyKY47YRz3/AgjaGpcz13zPYQ7
l0bxO4kzUygqNd6KRi45xWF8KD9T5/+Zil02r1hEiVsXnf/zAugzlc00SvSTtUZq
pgTPU+v+u5zAJpPN5j6FUM4si1hBv0kFL4792nAyK6dwrx6mja4xXMkgl0TXFWk8
tR0EHAfKSTIMvYmRW0UocGoctPlL1ctiGSmylar00tnWAbqY2L+pt6fzvbnyxo9Z
jK8TIHxZWLrtv9L1yfOw
=5aab
-----END PGP SIGNATURE-----

--=-wD6DKjo42awzPpoXsJjc--
