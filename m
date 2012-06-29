Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Skbt3-0004eb-6n
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 14:09:29 +0000
Message-ID: <1340979214.3070.218.camel@sauron.fi.intel.com>
Subject: Re: ubifs_iget: failed to read inode 1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Koen Beel <koen.beel.barco@gmail.com>
Date: Fri, 29 Jun 2012 17:13:34 +0300
In-Reply-To: <CAHMSPgOUuq8HKR+Q3ay5jr4-cYQYcB5129p4XcHYi4z2ydoH6Q@mail.gmail.com>
References: <CAHMSPgOUuq8HKR+Q3ay5jr4-cYQYcB5129p4XcHYi4z2ydoH6Q@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-/Np9nSpP4I7xFYTKagdH"
Mime-Version: 1.0
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 adrian.hunter@intel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-/Np9nSpP4I7xFYTKagdH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-29 at 10:48 +0200, Koen Beel wrote:
> Hi all,
>=20
> We are using UBIFS on nand flash and experienced the following issue.
> During attach of the ubi device we get the message 'recovery needed'
> and 'recovery complete'. Finally the ubi_attach fails with the error
> "UBIFS error (pid 229): ubifs_iget: failed to read inode 1, error -2".
>=20
> We are using and Freescale i.MX28 soc and using Micron NAND (see below).
> We are using kernel version 3.1.0.
> We have tested with latest mainline kernel but have not been able to
> trigger this issue.
> However, once the issue in the the flash, it can be reproduced at every b=
oot.
>=20
> Looking at the ubifs code, the error message traces back to:
> ubifs_iget: ubifs_tnc_lookup fails, goto out_ino, free mem and print erro=
r.
> ubifs_tnc_lookup
> ubifs_tnc_locate: returns -ENOENT (-2)
> ubifs_lookup_level0: the lookup fails

Something related to how you flash your image or to your driver. Run mtd
tests to start with. Try on nandsim. Try to mount empty flash, write
data, unmount, mount again.

--=20
Best Regards,
Artem Bityutskiy

--=-/Np9nSpP4I7xFYTKagdH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP7bgPAAoJECmIfjd9wqK0vRMQAMRNakns4l+aDJa8775pP+KX
brRSH6d/VuLjxPTOCMGBL8gepvc+KoPTJ+zMgriw2chwHm+Peaw+/+L9Xww/4Vjx
47e7bxD98b4xFop5trHSgxgmzjCBdJMX+tYEmZ/qqmv+DzWtGkuoktvaOVEL0XL3
XF/BMyGbp6UslkvDJs0isYikWcKlsd1e8AFpQX6iPMN9APOeOiQ87na7n/Pi082Y
r0X54e/ica197yzvN/ZbdgqindW5RImuwS4oYcDSlpQBrBM+2hmYt+cpzlrI7C2I
fqc22ymhIpL3YSEEOnnIJNMaJiDerkv0veZp0jaIauxeitefK2r77Kb+sesJWhCu
0p1ieS1q4WWz5DBnNPdZhWngATkU0TIXw0sHg/0ovvcWoKOfuQHcM5vvOpq41jCO
gujngA5EFGmF1V9OlZ7UIwO9WzHtkY7Qb1KohIWqwuRShwUhDDpBNi4a40bV3f8C
NgfHgbUqbl0jB0dBYT7CB9LxbiYsbhGI8SqJ+jBmywS6OPVbwtbpAWr8ctZ2u/56
TxjgCWYhOHFbhVe2qvExHXdr0vzzCrZYqtUA8jfbyGq/AtLSZ084L02Wa1i+V3Fl
dzTAhB+Gl8LPE+eAMZmj7yx0OrZqWZGup/LhlYsjI0F9QABoG5DSpuE6+nTqxpnR
1vM0ID8XjrHZZlAgjCsV
=2a53
-----END PGP SIGNATURE-----

--=-/Np9nSpP4I7xFYTKagdH--
