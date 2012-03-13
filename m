Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7QmS-0000cg-P9
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 12:24:45 +0000
Message-ID: <1331641636.3595.25.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/4] MTD: flash drivers set ecc strength
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Tue, 13 Mar 2012 14:27:16 +0200
In-Reply-To: <1331500873-9792-3-git-send-email-mikedunn@newsguy.com>
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331500873-9792-3-git-send-email-mikedunn@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-MOU2LhjRAS20KJxaBFFi"
Mime-Version: 1.0
Cc: Ivan Djelic <ivan.djelic@parrot.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-MOU2LhjRAS20KJxaBFFi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-03-11 at 14:21 -0700, Mike Dunn wrote:
> Flash device drivers initialize 'ecc_strength' in struct mtd_info, which =
is the
> maximum number of bit errors that can be corrected in one writesize regio=
n.

Looks ok, so pushed to l2-mtd.git. But please, try to find a list of
possibly relevant people and send them a "please, take a look" request
to make sure we give people a chance to fix possible errors early.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-MOU2LhjRAS20KJxaBFFi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPXz0kAAoJECmIfjd9wqK0bxEQAKFqAjD+dt/Y6EbN6uNA9P7V
Q8+1L0Hqnda/rftO5g/e0tSrT23P343l9mu7eXm4XbQaAkWQaawsszXAq9wt7YOa
6XFBkuaCs8I1JZIJsvqw9apFk5HvMEO1nHXTcdIB6vVZF2g0VlHW2dXLmNHW4FeV
s2o+yZPpmtjkEzaHKdJwF7kwlUmALBhRqCm2WBEsrLFa2JSO8bqcoa4MX5J+JGdn
CJ70iT7mVIz11I08yyk7uePAG6EBDlK6xCbbpxkF/zbpiPaIeh5SNtd2ZyWTBFmD
1dydrv18c5EGtyAn5rcqJZjwwORCUbPsdMnk7xHsISJufw6xpO+3vx+BtVRG0eex
5h2ld5BFIBLmr2vOFvoFamig9rpTwJ/S5740aDCQS3ZmjU1EJzz0cpUZuTRbGwL8
hXMHg4hFE1t34WE5rRE+j0Htn/oGy2hKX7wVvzVOP0DNGzf1lJD3xxXC1Zrj6GRz
JWM+PLz2Q8clva+Lpska7svMVI94euH/w32wGoxrdaC0F5xfY+jlnmTvAZVCJMMm
96V5R6xAWXn0Sc+1QEXF6mT7q7gzQN579RF8pkr0bsH+RoVqwwZ7BAc0rSgNMBQ2
R1GyBTu8RfGEYQfH4fBbfB+lpNAvKp4S/sXTA1mY2NVlL8U/TbBsuNbrxd5sU4+1
Vk63KgGvi58nkMsuQwyv
=87K7
-----END PGP SIGNATURE-----

--=-MOU2LhjRAS20KJxaBFFi--
