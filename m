Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SQDJ8-0005kv-GI
 for linux-mtd@lists.infradead.org; Fri, 04 May 2012 07:52:06 +0000
Message-ID: <1336118129.4275.1.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: fixup 1/0 vs. true/false
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 04 May 2012 10:55:29 +0300
In-Reply-To: <1336084208-20461-1-git-send-email-computersforpeace@gmail.com>
References: <1336084208-20461-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-8KUYlnQkzvQDcPIcTYVh"
Mime-Version: 1.0
Cc: Mike Dunn <mikedunn@newsguy.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-8KUYlnQkzvQDcPIcTYVh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-05-03 at 15:30 -0700, Brian Norris wrote:
> The 'oob_required' argument is an int, according to the boolean style use=
d in
> nand_base.c, so we should use 1 and 0 instead of true and false.
>=20
> Thanks Mike for spotting this.

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-8KUYlnQkzvQDcPIcTYVh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPo4txAAoJECmIfjd9wqK0evcQAKzd07swGbwCLzqRkSUNqwk3
S0P24bSGQFsJF9Yh9/2b2srAFgtoC+Nduc/6BjafrUPrAnL8flxdc5+lBSHaAZtY
w0kcOiS12xw7VRs6qErKIH+gtde7Iqejs4ZlYcocUk3tQg4q54I/btCV2MrPEbZc
lqfOzJ+GyktJ6Y5vYxcbZ8Z8y13YIX6TVpZTvxEtejZyIKnidNXrUa7F9xVw1SfU
mdw+xJCSDPKoPL1Xkic9876AqDgzEYS+4KiwKuH8EMJQ7TkJ78x/yKhWaWqp5Zah
MbN2MiKKqRbJU2+m6+HvZaRIBm/lBxNkFAi5p0OJCEx3btc6uyb1mirjBxIuJD8t
Or4d+3I+xuDbJQIzIsKYC2PkNjlJ4tvBrGmz2fmBqEEtR0Acvjr+Q9AmVnd/Ws/u
5jrgEv5bq79hqLERRy4NC1qQeL8OZw5iQmhCrWHNlTWFQT9n6rIQ6R3vxgCrKb4/
SZS4IUvjkfA44CZRCZvTJlhlbvv5noyrbGYrB2YFUl313kv8gfpfw32hgX7N/Kr2
IM32zHL3ZlQz/bD9DuFPv1VeDR9v9Qaj3eG+z88LXdh1x8QYMgxAWc4lsRrfxIh4
L9SI8SUHlKjiQcUGYymv+MMYgcrLEbAXt28P/PtGdxUKMcVO8DXkScC+uZHfpUJn
snH34/YY/FhtUHNalvHI
=kQwC
-----END PGP SIGNATURE-----

--=-8KUYlnQkzvQDcPIcTYVh--
