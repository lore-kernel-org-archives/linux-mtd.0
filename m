Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rm5Eg-0004Rp-F3
 for linux-mtd@lists.infradead.org; Sat, 14 Jan 2012 15:09:39 +0000
Received: by iakl21 with SMTP id l21so7056966iak.36
 for <linux-mtd@lists.infradead.org>; Sat, 14 Jan 2012 07:09:37 -0800 (PST)
Message-ID: <1326553866.14299.0.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ubi: Use UBI_LAYOUT_VOLUME_{TYPE, ALIGN}
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Sat, 14 Jan 2012 17:11:06 +0200
In-Reply-To: <1326214623-15938-1-git-send-email-richard@nod.at>
References: <1326214623-15938-1-git-send-email-richard@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-3/FcbhsEN29EQGTtC5+2"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-3/FcbhsEN29EQGTtC5+2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-01-10 at 17:57 +0100, Richard Weinberger wrote:
> UBI_LAYOUT_VOLUME_TYPE and UBI_LAYOUT_VOLUME_ALIGN are currently
> defined but not used.
> Use them at least once. 8-)
>=20
> Signed-off-by: Richard Weinberger <richard@nod.at>

Hi Richard,

This will break backward compatibility - older and current kernels which
do not have this patch will error out when the find a volume without a
name. The right way to do this would be to change the UBI format
version, but you would need a really strong reason for this.

--=20
Best Regards,
Artem Bityutskiy


--=-3/FcbhsEN29EQGTtC5+2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPEZsKAAoJECmIfjd9wqK0fY4P/0g1HtmhvU7arCT/8wpQYFPT
28Jre5pVEG5ULI2/anuN9u8Ch2AsuhBn4jwAigQPSGQA3O9oqq8A88yLiXpjIQrv
JaukR3TTVbzg0Mu0yzPE9ol3OZo4Wzvgqff/YbbpuWEijP2z8HnoOZMWPfZkY2jd
LM++tVwiL0YiyK34yagKUKlz4ErcdFN9AXNqmPxQealoaVB3UDBmX+3M6JMeXFVN
8ZDqzTkBA79Vbu4nLwyT7+dZ9K7RASBQ2g5iCqE2WhxrjuqKGX6oFqcuVg2sIeh9
Y9j6qqkAlIFavw/UqLyzeKBzgZCqy0nBJaV5Qhp//B5E20c792HXL1nqwMDsnGjg
yB1/VEbEKVzZtLyCCcW1v7ecnOZ6q2XT/NM/vq0YUM1ra8MZFHwhVsNsI2PA76ZU
tJBZoEup3s15JN14L3Byv8HLD453RA6oaEt8R3UiVElbr3Z79qwnwHX4KEj7B92Z
qmTJXBFyvzffSi+KaIbjEtBpnNC7i3JUpcAfYADBi7rnMqYdcHeKiy3EMR9ZHR7B
9KeFgckpKaUPV114f/a3Wl2BvkWNWaFQsmUHoDUVatf6j5qblbqLjHVWyd8D3TOQ
HEJePjKSkTnSQ/mV/mw79eVwLs6pTSKH+ffrTqwT6UMOnz73XYPVVu5GnesGNShW
XVVIscXmun74tvfVOG3Z
=I31S
-----END PGP SIGNATURE-----

--=-3/FcbhsEN29EQGTtC5+2--
