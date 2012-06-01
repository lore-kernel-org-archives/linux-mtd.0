Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaVzc-000294-MW
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 17:50:33 +0000
Received: by bkwj4 with SMTP id j4so2808879bkw.36
 for <linux-mtd@lists.infradead.org>; Fri, 01 Jun 2012 10:50:30 -0700 (PDT)
Message-ID: <1338573027.2053.9.camel@koala>
Subject: Re: UBI: Fastmap updates (v7+)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Fri, 01 Jun 2012 20:50:27 +0300
In-Reply-To: <1338563804-85990-1-git-send-email-richard@nod.at>
References: <1338563804-85990-1-git-send-email-richard@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-abT3Ya+Vs5iLxJZX0LZC"
Mime-Version: 1.0
Cc: adrian.hunter@intel.com, Heinz.Egger@linutronix.de,
 linux-mtd@lists.infradead.org, shmulik.ladkani@gmail.com, tglx@linutronix.de,
 tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-abT3Ya+Vs5iLxJZX0LZC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-01 at 17:16 +0200, Richard Weinberger wrote:
> All patches have been tested with ubi-tests.

While this is being reviewed, you could enable the bit-flips emulation
in UBI (there is a debugfs switch for this) and test how this handles
bit-flips.

--=20
Best Regards,
Artem Bityutskiy

--=-abT3Ya+Vs5iLxJZX0LZC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPyQDjAAoJECmIfjd9wqK0nFEQAJM6o5XJIc2amP6qEVK2k+rd
f7VkWV2ra2fHir30woz8fA15SJycYkHPGsvpj6x4j0QES/68GQwINxJgiMrOchnF
b8pPw4iMC34vJDZjjCZS2ZdmZ/nC4R98Za0u+yJq2c/PHRP+as9GCM9zc51gUggH
GsOo5pvWMGLQmNz2EETgrrgQq42ZaQPqQEv2VtLrGT8S1CX71HDqeNYYnZs46HKN
ran/Uun0sT/vM72kH9eWUGePY++74Nntwdi5qO0tWXo9/1AuAM8JhBXlWeOgsMVU
GiGiauMzIZR4RNXAMm+Hb/nN55po7NuQKJX1tN49mFeU9rgfWRtOKSkqD72ncboc
Yg/9gyyCxVSElunVe+qNoglUtDzMZj02c17EPnkqoTGBJi2bX4vwTnEdcpN7nB32
LDCuJM2cPm4yvUslrCRUSyJoTCvQkiShuAZZeRl0fv7qq85E6mcOZDdqpgx9oIVa
ZbExEL6JQ6KpkYvb6uwqj81XPcXey1OuX12NP8+1kpdlCU4zxsihwZev8mirV1mI
YvVMU8VGBHfuNAst5PD505pdagGMFG6oJKe1k3g2hqQryGZdp5H3On5EUGrElVou
UkH7lcJ7TBDSdIy/+PC58BAcfTP2lCYaxD7UGD++VXaRGBCtssArnWhE9DVAVbUB
jo61OfZQ7wgV38prC9/B
=MvqA
-----END PGP SIGNATURE-----

--=-abT3Ya+Vs5iLxJZX0LZC--
