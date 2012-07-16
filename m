Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SqmxU-0005mp-MC
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2012 15:11:37 +0000
Received: by eeil10 with SMTP id l10so799901eei.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2012 08:11:28 -0700 (PDT)
Message-ID: <1342451162.7270.7.camel@brekeke>
Subject: Re: [PATCH 1/2] mtd: replace the hard code with the proper macro
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Mon, 16 Jul 2012 18:06:02 +0300
In-Reply-To: <1341305055-29218-1-git-send-email-b32955@freescale.com>
References: <1341305055-29218-1-git-send-email-b32955@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-xw7Y9c2GQ/1GVeh9wysJ"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-xw7Y9c2GQ/1GVeh9wysJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-07-03 at 16:44 +0800, Huang Shijie wrote:
> Use the MTD_OPS_PLACE_OOB to replace the hard code "0".
> Make the code more readable.
>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Pushed both to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-xw7Y9c2GQ/1GVeh9wysJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQBC3aAAoJECmIfjd9wqK0UFwP+wTZCFFAeD09tTZ0B3HFXMdt
c3WUYrl1XqvwkJuVtrv7tYn3N3oRcWRkU/q2l7I6KjCGN/Is8El9zQIY6ZYPY3jP
nxzFng8Cb0Z6AvkEAuAbtfZYNi/cO3WWxpftC3udbLbUOi20oLetRJeoorptub5X
/bq70fOAcwF9xQlAt6GykYEkvvoisupPYqIl8c1ShjCfkrIEQb9RPU3OMHbNxXJZ
2s+Sq0AxTAblc3UU0/541f4Z0OAFPn94pqcFc/9GT9Fo47krTtPLnqE2BA4jtj84
7IHQeXl12Zyte2QnM81y9M8ImZ1qf0Zgjlqb3Sn+ypCgMlDSR53yS9EQUhYmufeR
GdHBcsdxSTqDMFI+7z2fH7QFUmWDqoHPhzMTsOLkS98iBTlBxY0O85FRqvm1mtPJ
FiXAJEuNwSkHdGFaUFGSwdH0f/BGO6fBSkwKhMQvoGuvOIDy+sVQYzRn6+aGDyDu
SgJRTsx2qpjZ7SD1QKc7sRBpCt4UFU+elJXlYEp/sVsW/lbMcP7mJwbXmgGZs119
pzFq8liLiZwbCbGuU51GrONF1TWCqH1PG7rPxgo0qhaoer0h0ib/0oGGZ9f3clSc
3FAL1PiAPcmWdw+SaKlnnmvVtJhhkqvEaoCzbpkTaWovZGdvDlgT0bHQ6d+uFf9e
zlDtDStRs/7iW/YrUrG/
=wkvZ
-----END PGP SIGNATURE-----

--=-xw7Y9c2GQ/1GVeh9wysJ--
