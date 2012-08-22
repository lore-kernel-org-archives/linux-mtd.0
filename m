Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T48zE-0004UC-PR
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 11:20:37 +0000
Message-ID: <1345634711.2848.145.camel@sauron.fi.intel.com>
Subject: Re: [PATCH MTD-UTILS 5/5] ubiattach: introduce max_beb_per1024 in
 UBI_IOCATT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 22 Aug 2012 14:25:11 +0300
In-Reply-To: <CACQ1gAieJw9uAovWs0Cr-D71_GKAjSHyEQBjDF8krXJ2x4Yc7g@mail.gmail.com>
References: <1345627680-8166-1-git-send-email-richard.genoud@gmail.com>
 <1345627680-8166-6-git-send-email-richard.genoud@gmail.com>
 <1345632176.2848.144.camel@sauron.fi.intel.com>
 <CACQ1gAieJw9uAovWs0Cr-D71_GKAjSHyEQBjDF8krXJ2x4Yc7g@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-foZB9qbbhgMOX0HS80R+"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-foZB9qbbhgMOX0HS80R+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-22 at 13:17 +0200, Richard Genoud wrote:
> 2012/8/22 Artem Bityutskiy <dedekind1@gmail.com>:
> > If the feature is not supported (the kernel is old), the tool will just
> > return success and the kernel will just ignore max-beb-per1024, which i=
s
> > not very nice.
> >
> > It would be better if ubiattach complained like this instead:
> >
> > ubiattach error: your UBI driver does not allow changing the reserved
> >                  PEBs count, probably you run old kernel? The support
> >                  was added in kernel version 3.7.
> yes, you're right, I'll change that.

The question is how :-)

--=20
Best Regards,
Artem Bityutskiy

--=-foZB9qbbhgMOX0HS80R+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNMGYAAoJECmIfjd9wqK0Mb0P/AwYrot6YWvtbujLYBaGF+uL
15jTM/x4qPWBF5guR+zW0Zo+RLcAMoOGnnfEi3zADWqomc5HGvkJPu4To9pQq10D
Jm1UJNcGpU+kRj8amkUWiZZpmGZOSuqNv/vDvna7NV61kT9O0u0n7N/sZ8t3ExEd
GScmkXYLo3jU+rE0fjedGKjRzRIwVgRWL+8/7u3qJtWb/Xp+c2mLwCHzPSKEdIDQ
ey1a8gxT/gHJxQ29KBS7IBp0g4oDO+7trQTdXl8MZ03B7HfOK4z33GtyyOusc+Nj
etqh7kAx5uARbOi2AUkNscGhVwVkwaRyfSNaUvlpGepYOU+hbc2E0EF11OYy7F2y
vXYyfhhAX1TnkuRHyLJdyxWMmAqJo2wacmX/ULc64D4+tV/ThgCEnXMPO6XdLe35
Oi75TzmRIMoNNH9uBT66wG+FGqGHwxnRXyTZ2uBG9vLHgNkqshC42ANLcAOavulS
UHEWynHhb8g+Oyw2sD4RRgSutyIxdoWoHIB3o1ZGvcqZvRqgvaK9YsK2i8PrLwFZ
XBfkPFwWiK6Ah6HPDUo3b1G8oXyl0Pu/gUkr88RWY8d0QvLRlxiNzTrLc46W1819
/oUIjFni0WGiiiVJ8Mr1wOCycFLA33yTqH2b1YlPvaolB/O5BRV8AMSWdNcWQG9g
G6vIkT52SXB89dAG+HMW
=SOaV
-----END PGP SIGNATURE-----

--=-foZB9qbbhgMOX0HS80R+--
