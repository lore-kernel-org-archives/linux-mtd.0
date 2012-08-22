Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T46aI-0007DN-9P
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 08:46:43 +0000
Message-ID: <1345625473.2848.131.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 3/7] UBI: accept empty string for vid_hdr_offs parameter
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Wed, 22 Aug 2012 11:51:13 +0300
In-Reply-To: <20120821231933.722f5be4@halley>
References: <1345464561-24464-1-git-send-email-richard.genoud@gmail.com>
 <1345464561-24464-4-git-send-email-richard.genoud@gmail.com>
 <20120820155210.64d64803@pixies.home.jungo.com>
 <1345467898.2848.29.camel@sauron.fi.intel.com>
 <20120821231933.722f5be4@halley>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-zTIuv9vE5XWDSv7/rhNy"
Mime-Version: 1.0
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-zTIuv9vE5XWDSv7/rhNy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-08-21 at 23:19 +0300, Shmulik Ladkani wrote:
> But either case, I guess the user will probably still need to take a
> look at the description to understand how to "avoid specifying" the
> vid_hdr_offs ;-)
> So no real benefit supporting ",,"

We have 0 as the default value already, no need to have the second way
to specify the same.

--=20
Best Regards,
Artem Bityutskiy

--=-zTIuv9vE5XWDSv7/rhNy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNJ2CAAoJECmIfjd9wqK0iPsQANLEefxo6905BuZDuOjR4yr7
VvYp5zbRnTL8oiMjsoBvBzF082xPiYEC8bee46Fuh9wVM7MbSxACImAR5tayddbh
JC5uKiB/H6PomKW+rzW5YCUuwF/SkkHs2LH2uSrlTQWuK21zthxeuw5DABbTuH2c
IcWsU2Sprc4xU6pPnfBbaWY1WBxTb4+LZwqlK4IqEwwjdJJF6q7xXqiQmaIxUugU
jpUyERBaPCpgFvmDJcJwGFIdMbe0RJYG92gUbX7Y0zEHKDbxcQbcpO9vjs2bMu20
Y08o2k0AezdKhrxaM5/v1jhQMkJuGLPgoqo94JjWsDcjh8T3MFY+J6f0/Qq24/G8
XiPUNXwvlX5ZKpE3bAvKa0bHqGFqx0wSfl0RnSdLJPhfADdP0aOtGnY9E2Nvk+Ea
TyOmMqtAzWPFSv2EnFKPiERRoXa480t1/OxLbccuGbmTuzCtwKcQQWW+e5qS6fL0
dU2Snj81J8ObMiTs/XdhUxLxSuSHNfkvjmnKBOdbl5MXe8MVAuzkeU8gKl9nZc0X
k/70gnYuQPYUYYyB8Sqdb/tcAX/AuYewOibnVuca0sLt3zxA75ShjVdaiVnGFAMF
Amm3oZzpFJLoRVoxvvr0Yd2epcoKv4bxWjgHEtDDdwM9wo0rCt6i9VWZtlEIS3Yd
jBSKl7DvSgvrvhlbV85X
=pu7e
-----END PGP SIGNATURE-----

--=-zTIuv9vE5XWDSv7/rhNy--
