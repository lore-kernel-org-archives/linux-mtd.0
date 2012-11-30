Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TeMwT-0002Kh-CA
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2012 09:31:29 +0000
Message-ID: <1354267938.30168.74.camel@sauron.fi.intel.com>
Subject: Re: UBIFS: Advice request on how to reduce orph_buf size
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josselin Costanzi <josselin.costanzi@mobile-devices.fr>
Date: Fri, 30 Nov 2012 11:32:18 +0200
In-Reply-To: <CAJA4uhezA7uc2x-fxJ1YLJZH2DX5HWFi=+4DgVowDW+FDZ0rUw@mail.gmail.com>
References: <CAJA4uhcD+bGAdKMb6Nv-Kvs+o229PaLQL-9Dok-ddCUS5rbGpg@mail.gmail.com>
 <CAJA4uhezA7uc2x-fxJ1YLJZH2DX5HWFi=+4DgVowDW+FDZ0rUw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-U6xvPotMVbBaq2CMxmV1"
Mime-Version: 1.0
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-U6xvPotMVbBaq2CMxmV1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-11-22 at 12:24 +0100, Josselin Costanzi wrote:
> For anyone interested, we chose to limit the number of orphan
> depending on orph_buf size so we can tune the number of orphan we can
> create depending on our memory constraints. I don't think it's a
> change that should be integrated in the mainline but if someone wants
> to see the patch, I should be able to provide it.

Yeah, sounds more like a band-aid than a solid long-term solution.

--=20
Best Regards,
Artem Bityutskiy

--=-U6xvPotMVbBaq2CMxmV1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQuH0iAAoJECmIfjd9wqK0O3sP/2lfB6epNbcn4MVERezPVAGt
3ssWHGAOiJ/I5FSOnOnAe4fyJ0xnaYw9Lr2PcmSCBOYahuky4oU7qi2t4aZ5vIfe
XRrdMQdzrcXEF92OlxliElf2G/NeNLur/3s3FQTiS3qhbLgBVQlb/CGoovj+75/J
xyFFZbGTB8AfpKQuJjhNTJKFUkbZChooTr9GcHMy9pd7HVAYqSH+yhwZaumA7aMP
BNOy1POt6wg2HXk/5yffLnoVa8Z8Qz6n/mbS30UW2j6//7dTiyua2zgPpdxFRMWw
lWFKk05l/oChuVzXd7MeVtIQddHzOCele3uHNjtaXfWSI4hNB8B5BbWeb6oacVFe
UEan+V9dU89auIpU9P3qE42hi5kw1VzViJfdB7l5wQXLGVb85BnO6xT7nwS78I3m
6DOZhdJEre/0ZtCmVc1amTHEYuyY3BuRW9v8ttWAIfp2+k4AREJ4jfJq2/vDbNdS
5PSfMU6U6OEI5by9EP2q+1ZTPi+9cFz/22HLAmRjzMCyrY28BtNyAEweP+HPDkKe
cSz1M96QnDPutrDWD/Fg5QqCO8yR4wAq8HQ1gViGaDABH2NGQrjZfW/PjuwUVBEe
HdlT55wtkkiySi8ILzYiz/jV/gbQdHNfRH9e50VjhtK48598vIm2q80dz1UO99/5
CPTva4kTbwI6SoCOZQCY
=wZFn
-----END PGP SIGNATURE-----

--=-U6xvPotMVbBaq2CMxmV1--
