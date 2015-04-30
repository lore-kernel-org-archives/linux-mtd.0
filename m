Received: from mail-lb0-x241.google.com ([2a00:1450:4010:c04::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnvHt-0007aO-Qt
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2015 20:42:26 +0000
Received: by lbio15 with SMTP id o15so2957908lbi.0
 for <linux-mtd@lists.infradead.org>; Thu, 30 Apr 2015 13:42:01 -0700 (PDT)
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Date: Thu, 30 Apr 2015 23:41:59 +0300
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH] jffs2: fix UTF-8 character in pr_info
Message-ID: <20150430204159.GB1829@nest>
References: <1430254445-32676-1-git-send-email-andrej.skvortzov@gmail.com>
 <CAFLxGvyivqeiJ_DWANg96p24cWiJGUEXgzvWDCn2e_s0+yusXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Y7xTucakfITjPcLV"
Content-Disposition: inline
In-Reply-To: <CAFLxGvyivqeiJ_DWANg96p24cWiJGUEXgzvWDCn2e_s0+yusXg@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Y7xTucakfITjPcLV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 28 Apr, Richard Weinberger wrote:
> On Tue, Apr 28, 2015 at 10:54 PM, Andrey Skvortsov
> <andrej.skvortzov@gmail.com> wrote:
> > Boot log contained string:
> > jffs2: version 2.2. \xffffffc2\xffffffa9 2001-2006 Red Hat, Inc.
> >
> > non-ASCII characters are printed in HEX. 0xC2A9 is copyright sign in UT=
F-8.
> > This patch replace it with '(c)' to make boot log readable.
> >
> > Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
>=20
> FYI
> http://lists.infradead.org/pipermail/linux-mtd/2013-April/046591.html

Richard,
thank you for the link.

My problem was actually missing utf-8 locale on the embedded board.
Now dmesg prints this string correct.=20

--=20
Best regards,
Andrey Skvortsov

Secure e-mail with gnupg: See http://www.gnupg.org/
PGP Key ID: 0x57A3AEAD



--Y7xTucakfITjPcLV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVQpOWAAoJEAF8y6L1SLCtSeEQAIMX/+HgKneih2+r7GYGydR8
zstSv38QEZFQGWCbAjprGxBZPdbUpAsZTe8Y9LiTaqTKH/KqhciTqy62KKb04gOx
umpZqdlv/fwHy3c4dCmA/RwkRGmsMJaRgY8oYpqr4H36LvdXr93vBLfhPCHw1UHk
Z+MlvmXFPjGPzmP/VVMHn5jZcKPlFCi9R8CkwzD4OjiLRcEpMoqhBQcHcKoYFw+9
7oCXY2J95Yus+gSKT8qpg5/K2uys/FNVRcAeIAII8oMKNYPXRyWuakMzPRLQK+hW
PATWDegR+VxlUkUUhRbu6bRzV1QHU+JLumFhNdD42d4Zll38uqNdK1Y1V5oK2YE/
tq/HVMU+YdnsNVGN70bGTslh63QnNhcoVK075H7Kb9Nn+uuHrSOsmrH1Bas1w6Bx
qdWzvVsHnF6TMWfpjUZQZC9sVXCiPY9yKR4NwqUI6hTp4zU5tzU6T2ojJ4enQfsW
VSe8tqPAjGsLgT8QyBKw1gE/GkroVjxEHhVe9eqybHAtnlRN7s5OH8QInhL9iO8i
OvHbraLGzckEpj64dqfFtM53AUDx7npa+FnJI2xexU6Wi+fb0Z+nevF50pWsD2Mu
5mpEQVX9CzBLJBbHaB6UBBL6N6pDZCUKdcLasQySV+xZpSQ9S3xcbGtf1tqBUCYc
uw/qS7m7p2OsAIi0nA4R
=AvZo
-----END PGP SIGNATURE-----

--Y7xTucakfITjPcLV--
