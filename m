Received: from pinova.rz.uni-augsburg.de ([137.250.2.102])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bEzZB-0004ha-7y
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 13:48:42 +0000
Received: from limette.rz.uni-augsburg.de ([137.250.1.100])
 by pinova.rz.uni-augsburg.de with esmtps
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) (Exim 4.82)
 (envelope-from <pfaehler@isse.de>) id 1bEzYn-0005LU-AN
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 15:48:17 +0200
From: =?ISO-8859-1?Q?J=F6rg_Pf=E4hler?= <pfaehler@isse.de>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: UBI: recover_peb and power cut safety
Date: Mon, 20 Jun 2016 15:48:22 +0200
Message-ID: <4747649.kxTirKoIZH@pfaehler-pc>
In-Reply-To: <CAFLxGvzxEkRfGzxsxS3_xYupPvAXNO6X9AMi=6SQzXYqBLqiqQ@mail.gmail.com>
References: <1811946.TqycnYvpkR@pfaehler-pc>
 <CAFLxGvzxEkRfGzxsxS3_xYupPvAXNO6X9AMi=6SQzXYqBLqiqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

> Hmm, you are right, if ubi_eba_write() is facing -EIO from the MTD driver=
 we
> can lose the whole erase block upon power cut.
> So you found a bug. :-)
>
> Artem, can you tell more on this?
> I'd guess that recover_peb() is older than ubi_eba_atomic_leb_change() and
> therefore it was not used.
> And nobody noticed so far since the condition is hard to hit.
>=20
> That said, switching to ubi_eba_atomic_leb_change() seems like a good
> plan to me.
> J=F6rg, please send a patch and explain how you tested it.

=46irst of all, thanks for confirming this bug so quickly.

However, we would like to refrain from providing a patch. A little inspecti=
on=20
of the code revealed that the locking is different for both methods, i.e., =
one=20
cannot just call ubi_eba_atomic_leb_change. So it would be a larger change =
to=20
the code than we thought. Furthermore, we have no experience in writing or=
=20
debugging code for the linux kernel and we own only one flash chip for=20
testing, so we would not feel very confident in any patch we could provide.

We found the bug rather in the formal verification of a model of UBI/UBIFS=
=20
(see http://www.isse.de/flashix for more details on our project), where it=
=20
turned out that we modeled the feature differently.

MfG,
J=F6rg

=2D------------------------------------------------------------------------=
=2D------------
J=F6rg Pf=E4hler
Lehrstuhl f=FCr Softwaretechnik
Institut f=FCr Software and Systems Engineering
Universit=E4t Augsburg

Universit=E4tsstr. 6a, Raum 3014
tel:      (+49) 821/598-2229
e-mail:   pfaehler@isse.de<mailto:pfaehler@isse.de>
=2D------------------------------------------------------------------------=
=2D------------
