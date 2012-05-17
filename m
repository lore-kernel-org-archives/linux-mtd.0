Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUzL7-0001nz-Eu
 for linux-mtd@lists.infradead.org; Thu, 17 May 2012 11:57:54 +0000
Received: by laap9 with SMTP id p9so1522896laa.36
 for <linux-mtd@lists.infradead.org>; Thu, 17 May 2012 04:57:51 -0700 (PDT)
Message-ID: <1337255868.2564.5.camel@koala>
Subject: Re: [RFC v5] UBI: Fastmap support (aka checkpointing)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Thu, 17 May 2012 14:57:48 +0300
In-Reply-To: <4FB4E613.4020100@nod.at>
References: <1337201522-86521-1-git-send-email-richard@nod.at>
 <1337225964.2730.11.camel@brekeke> <4FB4E613.4020100@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-bViC0vpOHVCo7HvRhRXP"
Mime-Version: 1.0
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-bViC0vpOHVCo7HvRhRXP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-05-17 at 13:50 +0200, Richard Weinberger wrote:
> > Again, I am willing to do corresponding preparations for you, you'll
> > need to amend your code then.
>=20
> As I said, v6 will contain all requested changes.

I've made them - see the renaming branch. I need to do some more things,
then I'll post them and merge to master. I need to amend comments,
rename some functions, and re-structure some code.

--=20
Best Regards,
Artem Bityutskiy

--=-bViC0vpOHVCo7HvRhRXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPtOe8AAoJECmIfjd9wqK09EsP+QGBJ7VsWGIA3aptL8bzUk6h
YQoZ6Qe2AUQ+wljcEYthPztVU+PQaE58f2wW5xtKuFAPxIH6+vOQS79m41+5fkrc
l4L8VZvo29vUSzxnmud51VzpMZXBFlnL6ppSQxe3SxXdVAPGvtbVlWL5G65sx4JS
yXDoulv7rW7CYeYhmqj/ZFGAwjyNOCe6wO9jUzn9M+N+YqxAo24j7Sz37FEuhVPz
/kGIVd9WNrV9p20Akra8RrcraDhWQx6mRHFhgA+6BvgVa1jLmbHHQ/qLf6DCZbyj
EgbJ2I2K3QCaTOXbduhw9XoYpgsP90ri/EF2KaU+A9+QrS24PFIf3+FCBCivTNEE
b6+IQGX1IieNf9Tx1qhJF4bF8+LfEA9Y/k9eizGPYT07Hm2pR0OKLpSrkv5il5q2
G82+vrZPamgX3Ra+8BDMPgM/oin20pxDyOxo1Soy+wjUpvxYs3dgT/VJLy/4APvm
n9i6eCp1POWuYWYt7+01X64Q+P5QvPcCkHtjL7L5Xm9f1ZURkRQFQ2H+VIofL/jQ
Mkh/gXwpEWhl+58baRYhhgiEdquyFF9r1YYbGaijd6cmIRyX4ufXnJd3BA1d/PJm
Ci5SdrjVaA5gDOlHwm9pHDKoJEfXD4pWr2qm5ma25QlG7/cd3Txl6mOq1szZ5W5z
5g4fXp7v7pJcRhANfcvA
=cxAl
-----END PGP SIGNATURE-----

--=-bViC0vpOHVCo7HvRhRXP--
