Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rbvok-0007DY-KN
 for linux-mtd@lists.infradead.org; Sat, 17 Dec 2011 15:04:55 +0000
Received: by iadk27 with SMTP id k27so5535104iad.36
 for <linux-mtd@lists.infradead.org>; Sat, 17 Dec 2011 07:04:53 -0800 (PST)
Message-ID: <1324134380.4240.40.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: write bad block marker even with BBT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sat, 17 Dec 2011 17:06:20 +0200
In-Reply-To: <CAN8TOE_i=c3ysugu+_swbzi0B4abCYT0LJtLzJhQ8r_KMG8yRQ@mail.gmail.com>
References: <1323292100-19280-1-git-send-email-computersforpeace@gmail.com>
 <1323723000.2297.4.camel@koala>
 <CAN8TOE9C9VEi7htM=-jypt29y23Ex3CCnYBOW3+OkTs1Zcra1A@mail.gmail.com>
 <20111213094805.04c4b8c9@pixies.home.jungo.com>
 <CAN8TOE_i=c3ysugu+_swbzi0B4abCYT0LJtLzJhQ8r_KMG8yRQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-sr/c5QJ5O0/dyjcy5ljr"
Mime-Version: 1.0
Cc: Kevin Cernekee <cernekee@gmail.com>, Jim Quinlan <jim2101024@gmail.com>,
 linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Matthieu CASTET <matthieu.castet@parrot.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-sr/c5QJ5O0/dyjcy5ljr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2011-12-14 at 12:46 -0800, Brian Norris wrote:
> This is one of the problems. We would need to invalidate both BBTs in
> step 1, making our attempts at mirroring pointless. In fact, in some
> power cut cases, we could be left in a worse condition than if we
> didn't try to compensate for power cuts, since we just killed our
> backup table.

I agree that it is not probably worth the effort, but would be nice to
do, if someone has time and thinks this is useful. But I think it would
be fair to request to add a comment which describes this hypothetical
issue and this possible solution, would it?

--=20
Best Regards,
Artem Bityutskiy

--=-sr/c5QJ5O0/dyjcy5ljr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO7K/sAAoJECmIfjd9wqK0/TEP/0RYXjsrameoL7jR40OpBl1F
7sSLcCDDckjJHTuLbGcbJdhBWWqgMu6bhuE8EKWFh5hH9psBVuJ8BjbbNQ6C6Jpz
IW8zn1KQEAB8PffJm/1RE6Rs7IKuNikDlzoAQ4Q2Le49HIJmqo1Mc+XNkNNV0g59
VkFbHiGIhhJUtL6x28KIEADeQlOcwKqCQoo0fuoe+HfujTvHT+4UYfI625fEeNE3
f1ITqk9m5lElxK+UjEQ4L45Ze3Gxn4RiwsCltTqKXaNvP0mV3B7TIh5qLoeS/qWl
YhoxaDgjDaU5n57/CNXpm6LcsXfVJkOX/WZ8ptgqCcLypi91BVrxpAeZBxxc8iE8
lFuvvDeHxGVlgZM1rbf7WHuV9UEkkpjDNMDfCy91iU2ntMj0uGhVC7KSuP9ujkwJ
+KIzMc23mjPKoa9JJY7PEo9S0jj6nk5HAoUgYCfBltAkts9+fkp3IbWa5Uk8NGIN
LVNaI2YJ/tUJLeMek9rWy2da9xB6rtRQoSCX+7j0YOiexFM7e53PeEQOXzxm9LQP
M0zKilmWH9nJKclpWtKHIubja3Bn4YS39yBij/zZ0HtgPlDKfIrDgdKkIE5Omlmk
MHyUbmmmdnl62XDb2N0AZXtt9oII7+qIHvOBbz3n4FdRot+mWmIetXcJxWHcluHI
z9MqjERDux4ixwqddZeI
=Y9Aq
-----END PGP SIGNATURE-----

--=-sr/c5QJ5O0/dyjcy5ljr--
