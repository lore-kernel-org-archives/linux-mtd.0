Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SDafF-0008FZ-6G
 for linux-mtd@lists.infradead.org; Fri, 30 Mar 2012 12:10:45 +0000
Message-ID: <1333109630.5440.18.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 4/4] MTD: drivers return max_bitflips, mtd returns -EUCLEAN
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 30 Mar 2012 15:13:50 +0300
In-Reply-To: <CAN8TOE_Zwg1evBBCSY3zcV6=O07WVyXf2ZOtgf7qgKGLUBcBrQ@mail.gmail.com>
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331500873-9792-5-git-send-email-mikedunn@newsguy.com>
 <CAN8TOE_Zwg1evBBCSY3zcV6=O07WVyXf2ZOtgf7qgKGLUBcBrQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-D5FqMXdzcjv8Ey84ETfC"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Mike Dunn <mikedunn@newsguy.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-D5FqMXdzcjv8Ey84ETfC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-03-29 at 10:30 -0700, Brian Norris wrote:
> On Sun, Mar 11, 2012 at 2:21 PM, Mike Dunn <mikedunn@newsguy.com> wrote:
> > The drivers' read methods, absent an error, return a non-negative integ=
er
> > indicating the maximum number of bit errors that were corrected in any =
one
> > writesize region.  MTD returns -EUCLEAN if this is >=3D euclean_thresho=
ld, 0
> > otherwise.  Note that this is a subtle change to the driver interface.
> >
> > This and the preceeding patches in this set were tested ubi on top of t=
he
> > nandsim and docg4 devices, running the ubi test io_basic from mtd-utils=
.
>=20
> Did you test any non-NAND devices? I'm getting the feeling that some
> of this is misguided or at least needs some fixing. See below.

Brian,

you are right, these 2 should be reverted and Mike should come back with
a better patch-set. I was not careful enough, and thanks for the review.

--=20
Best Regards,
Artem Bityutskiy

--=-D5FqMXdzcjv8Ey84ETfC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPdaN+AAoJECmIfjd9wqK0dHUQAIT1ImjCLkS4B43j0WHWVz5N
m4PvVgFhXTxS1eU6Yox4CX0NznYvq/nivx0bELMAhMJkPXlyuNm4uV6KdjQMWiWJ
9ODMet0D8F7NBXf7YRaeHAJQG6Hz4RS0d+JufK6Epd1rYgIMIu647xncD2EH9Nd/
hAvS1P2XqFaS00d61hqbE+31DYtS8BwVZwL2WltT9gwohlLMcH0Pb3ycSq2mSKz1
/1rK+//A3iYw3TAUzL38nGaewvVvwuhFhCW5NSkm40RG2Z5egT/NAtxchD6Gp9rw
InpkbUKY+GUfgB0yvI5Fdwc2ijfkz4ZTYPq0gORjr4it/wROH38OoZ3+Ux3MyQEn
eplYOHYNVK7fe82Xy1XrRUY4SkDeQK++meBl9MqWXYKzArpjN+Xf5cuDCme9y1xm
GY1229n2fIpLa1Qy0VYjNEFHT96xQAYoyZcHGffJqH6QDGanJX1L2ohmKb+TFxfj
ZADQGmjPoVSrLDrD9l7OXZG975FQnyS2b11GW4ej6hI9opZzxLUy2uPed6A1poFP
dhhvSW9DWF3GDKju4daTgcQ2eFF0YEMGpb9fq4CItzDh6AqWCGkmJt8tJifTb17m
fv7qJ7uVcq5Utvajpmzfy90Y+5jgQlvzidZ9LCo7lMK3dHEYB/vWkXmBqk/zpS0k
PutjhVfL73ISNsSO6jiQ
=QMax
-----END PGP SIGNATURE-----

--=-D5FqMXdzcjv8Ey84ETfC--
