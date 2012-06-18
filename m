Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SgiYn-0008Ha-Ox
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 20:28:30 +0000
Received: by bkwj4 with SMTP id j4so5085924bkw.36
 for <linux-mtd@lists.infradead.org>; Mon, 18 Jun 2012 13:28:28 -0700 (PDT)
Message-ID: <1340051296.1971.5.camel@koala>
Subject: Re: [PATCH] mtd: nand: Use the mirror BBT descriptor when reading
 its version
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Mon, 18 Jun 2012 23:28:16 +0300
In-Reply-To: <87ehpc1oyb.fsf@free.fr>
References: <20120610135812.01dce4e7@pixies.home.jungo.com>
 <CAN8TOE_Li5bysfUS_MPPaBOF-vC64s3j-feTqfUJQsR6c_yb+A@mail.gmail.com>
 <1339497736.2401.24.camel@sauron.fi.intel.com>
 <CAN8TOE9icRO8t_qwn-k3R+Q1y1X39-PZU=devSW07YpDW_KqNQ@mail.gmail.com>
 <1340017963.2420.29.camel@sauron.fi.intel.com> <87ehpc1oyb.fsf@free.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-YCXHW71VKs60BPr3Dmj+"
Mime-Version: 1.0
Cc: Mike Dunn <mikedunn@newsguy.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-YCXHW71VKs60BPr3Dmj+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-06-18 at 19:59 +0200, Robert Jarzmik wrote:
> To store worn out blocks, each filesystem implementation has to do someth=
ing
> smart. UBI has it way, SAFTL (docg3 fs) has its way, etc ...

UBI does not do anything about storing the bad block table. UBI relies
on the MTD layer - it may mark a block as bad and MTD should take care
of storing this information either in the OOB or in the BBT on in both
places.

> But in the end, the bad block table is immutable, and represents factory =
bad
> blocks, not up-to-date list of bad blocks.

How do you store the information about the later developed bad blocks?

> As to whether you should kill it or not, it's up to the maintainer of dis=
konchip
> I suppose.

There is no DoC maintainer, you can consider yourself to be the
maintainer, because you and Mike are the only people who care about this
AFAICS.

--=20
Best Regards,
Artem Bityutskiy

--=-YCXHW71VKs60BPr3Dmj+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP349gAAoJECmIfjd9wqK0rm4QALYrfSPP4WX4EtKwgrWUcDbO
0oij6xTfP+npGv9sjssxA8uuDKmZ4fGLJ8i7IBDv+ldtvp5V9isnTeD0iKK1P2Iy
dWeyJvNAsYSsqYJj/FnwAjX7dfb1/vCvjAYz4J7ObGBw7IodlNPxKu/+R3ix7qAg
EznYIMIQ9YIyhD90TXgIvwiov1PrM+vw5rwDFAU7NgyurDTibH6snGYsKBfTR/Cm
3RxPlutQMH/tgbgYsnuAEWAgGs/SujDM0E9+exJVsO9SWPXQ44T0T93x3qb7pGxV
dZorZwYxZ2BRHvBYKVtC5dACxxH4gVdQWKbLbKrp1X/Bqe89YBNZRWQQxXIK2aEg
oRcHa8u/hK4SQmGam4WzDxMoOphsY/L/EczcogRxrPlWpvzlcuYQoobXtnjh+Yf0
tahL+GSz9o6FFjM83rHNvGMvC3aOAE3DRdaAjOIpbjC++D1oleTzRDcpCSoXyQ/I
DTLMfK6xdpdtrr0M9XmWaQ1kDQYaEFzektsBFxDBKx1UYv6g0iTVztMYLP3xH962
N8G2gnM7cy2olBFDMNMBdxN+NysHotCHbPhvf7HLd9NnTO26wKEtY08eSp3PHidR
3O0HwsubzSgew0PzQIDcNcB/qeIj47ok3JOf95VLnfzf1XT16+Jt9VaFp9YAN2CX
FALtMbivuCcmoHdvWUO/
=bVWp
-----END PGP SIGNATURE-----

--=-YCXHW71VKs60BPr3Dmj+--
