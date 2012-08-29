Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T6dUd-0005Zv-I8
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2012 08:19:20 +0000
Message-ID: <1346228646.2848.437.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd: cmdlinepart: fix the wrong partitions number
 when truncating occurs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Wed, 29 Aug 2012 11:24:06 +0300
In-Reply-To: <CAMiH66GVNad4dzbA9M66BGxGGb-JxQz8NJjBVWHcqp6FRpNbAQ@mail.gmail.com>
References: <1345904767-23011-1-git-send-email-shijie8@gmail.com>
 <20120825120231.73577d6a@halley>
 <CAMiH66HyfNEzEHGyZUcLJ_01PNVHqA44fjAqXsyM2c-HHms8hQ@mail.gmail.com>
 <20120826090603.6b833e54@pixies.home.jungo.com>
 <CAMiH66GVNad4dzbA9M66BGxGGb-JxQz8NJjBVWHcqp6FRpNbAQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Ne6j7hv9Qe1COGgTAuET"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Ne6j7hv9Qe1COGgTAuET
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

While appreciating Shmulik's attention to details, I vote this way:

On Sun, 2012-08-26 at 02:47 -0400, Huang Shijie wrote:
> Could Artem or David point us a direction about this?
> [1]  Should the unsorted partitions be supported?

No, it is asking for troubles.

> [2] And what should we do when we meet a 1GB nand, and the cmdline is
>       gpmi-nand:100m(root),100m(kernel),1g(rootfs),1g(user),-(rest)=20

Drop 'user' and 'rest' - I've sent some explanations in the previous
e-mail.

--=20
Best Regards,
Artem Bityutskiy

--=-Ne6j7hv9Qe1COGgTAuET
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQPdGmAAoJECmIfjd9wqK0DM8P/0juGhYL/Vx8TClBgDL0tgiK
wkxHRDR3LnwCQ0FW7QW0jl9hLzJ9l9XRsQQzas2Avgke+dMdCbaKWQZ59p4HZt/0
wvtcTEV0bGzzmlmlcP7VIqn+tjkLBIFt5Ziwly9nR81IFb0S9Z4DoU0n/Orv3LH6
nNDj5Z4AB2UXYS6XG+xCfwW3FY1yLuhJjgAdbU+NhsP9ZbEaekX6itQljUbXSU+/
jU54+p18j7jcbS9Ppowh8fErnjy5GFLcb0EFbmrCHiPuRvhXesc1EA+BUMIKkayj
TPZ0fgGbRwU7ATfN7GwxzuGd9zc6er3u4kWWPCwOfxTHPz2wgyLc4YSBKN05ZhIt
pX2KosW/UDL4V4sleombToQKbVft8xSAcQZ6K+6ekL41m64bgOhnG3/qFaPj+++o
Y9HeeC2ARHL7RASfTJdk/tO/DCzaoZMjSpcTVY7NEOOexOTR+HM8iT/oRWBUNQ8D
1TlIMYXzHJ7kJhxCWW3xBAdMmtpjKFaVDWtp+yAcEfiETBvLLNCPcBaFaoK+XW/v
Cqjs+qkqGjCpFMBHQaVc3ZFlnAJCfL0LAkzpI45MQ77hv5fDB0/ILmf03h0a50Yb
srW/ecpAXhLC4FXIN4CvxG1wn3v8ecdNQQywxo/VqY5jfD7wGj83krwYMsYHYjMP
EwcBqG1BmsBiFvn40xLL
=keOQ
-----END PGP SIGNATURE-----

--=-Ne6j7hv9Qe1COGgTAuET--
