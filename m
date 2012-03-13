Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7LAG-0007Y4-5O
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 06:24:56 +0000
Received: by bkcjk13 with SMTP id jk13so141143bkc.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Mar 2012 23:24:54 -0700 (PDT)
Subject: Re: UBIFS crash (was Re: Problems with mtd_oobtest)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matej Kupljen <matej.kupljen@gmail.com>
Date: Tue, 13 Mar 2012 08:24:43 +0200
In-Reply-To: <CAHMF36EA-99oYmoBPuOjrohYefTMtoUQ6KLMrMw=XxGmWm3ehQ@mail.gmail.com>
References: <CAHMF36G-dXbjZfBMnzEuqK_bkNM81+aCZW5gDHSAKEeyE8VKTg@mail.gmail.com>
 <1331559644.12037.33.camel@sauron.fi.intel.com>
 <CAHMF36ExY=Q2CFgF_V2dVZTsC_znNLGx6wk8GAh5SRKwjJXi3Q@mail.gmail.com>
 <CAHMF36EA-99oYmoBPuOjrohYefTMtoUQ6KLMrMw=XxGmWm3ehQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-R/R/zsE6a2Eg7ffze61M"
Message-ID: <1331619893.2443.10.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-R/R/zsE6a2Eg7ffze61M
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-03-13 at 07:20 +0100, Matej Kupljen wrote:
>=20
> What could be the cause of such many errors in FS?
> I am really running out of ideas, how to solve this, so any hint would
> be appreciated.=20

This looks like non-UBI/UBIFS issue but more like issue with your flash
driver or HW. Start stress-testing the driver. Try MTD running mtd tests
over night.

--=20
Best Regards,
Artem Bityutskiy

--=-R/R/zsE6a2Eg7ffze61M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJPXugrAAoJEJtuLFy+q7fe5gEH/jgZpn753DehBRGYVZPWuWFd
BgGZzJdEmktvoFnPMoMh818l0vGm0llOF9XuMIax5KE0ImskP66PULhxJy4rcS2b
8+i+kHK/pINM9yrrSpf5uRaAIvP2AZt5bB4ZkJqjkvs6nh/6etskuhW2CM/6xlQm
DdIoMvPoOvCtET8g/PK4pq4XQfDYPlHKKPEiaguyaoO27wmxoleomSnVVWlevc+O
VwVFH0E0Ekmi3QnbqPSg2teIxluBoHtFec82OiwSXSNBnsXahn/tJJeizoWd+x3R
X5gGdMOeBInToFaprQMp8NWVGDJegunTmgIkJTBwvZqFSUnITOr6GdAZ1y+8P4U=
=L59B
-----END PGP SIGNATURE-----

--=-R/R/zsE6a2Eg7ffze61M--
