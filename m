Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPp5a-0007rk-PN
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 06:00:31 +0000
Received: by lagy4 with SMTP id y4so1246573lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 23:00:27 -0700 (PDT)
Message-ID: <1336024825.2056.2.camel@koala>
Subject: Re: [PATCH v3 02/10] ARM: sh-mobile: mackerel: Add error IRQ resource
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Date: Thu, 03 May 2012 09:00:25 +0300
In-Reply-To: <201205022249.30426.rjw@sisk.pl>
References: <1335951710-9390-1-git-send-email-hechtb@gmail.com>
 <1335951710-9390-3-git-send-email-hechtb@gmail.com>
 <201205022249.30426.rjw@sisk.pl>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-lEFCa0v/2i+SKulozd6j"
Mime-Version: 1.0
Cc: linux-sh@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 linux-mtd@lists.infradead.org,
 Laurent Pichart <laurent.pinchart@ideasonboard.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Bastian Hecht <hechtb@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-lEFCa0v/2i+SKulozd6j
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-02 at 22:49 +0200, Rafael J. Wysocki wrote:
> On Wednesday, May 02, 2012, Bastian Hecht wrote:
> > Supply the platform data for the FLSTEI error IRQ.
> >=20
> > Signed-off-by: Bastian Hecht <hechtb@gmail.com>
>=20
> I'm going to take this patch into the renesas.git tree and push it
> upstream throuch arm-soc, if that's not a problem.

It is already in the MTD tree with the rest of the 10 patches...
--=20
Best Regards,
Artem Bityutskiy

--=-lEFCa0v/2i+SKulozd6j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPoh75AAoJECmIfjd9wqK0HjoQAIsAnuoJQ8qqRwk8FONCXFpt
2QXtk90bZ0FLp8PUgr8nMH18BuO4xB6gxu6zJcpi/pU6Xh42uwGqSfeCva/h5rTE
Q7tlFol23jI3dmyg7DMiK4IcBfOoYS/TvnS2Sg/+dBywBZ6pE2N333Su0TNoksdm
+jKILVO6jLA7Td7kdG4A0NlkyM3+syh5AZHSDfGdz+ZgCNUdNCm4aliiYnwefqMh
9h0rbCrWenvYS9ksPf6ACbcW3wQhQHNPMBH9rJiC4QB5GKPrpiNvrDVgiJn6QCTh
rwa1n1MKBrE4a9Dau2j+DbzNay3NKtK4PhtfTJMPibyyA4CciNOyVPc7ossVVlcJ
ha9CbHSZ18J9M2QYDojHv/dWQyaqWBKrKgKDUiL1MjO7uI4pq/o4zPdVEvsIRmfS
cBvRuyxkakA4oQRSL+vBWiutRVsbS21IQjZ343bfJThIZtSrNMxyBA/EeUKSkwxg
IM7ewUywBlIYsRdG0E8uNOhtF5Zo+fOwhykdmBNvFVr1l+CTXzP3Och6LYdNoosd
/b5Z+AeQByldUAUs+VeYMRIskh6gF+EHIZAwU/IKEwQRPuJjS1RLC7oz7qKfUxWx
kirLpWMh9/LbAu0mLEDxXCdve51Z6ThD+8WxfEPJATDoWPcRzOsDQPzX9TaELRGq
6UJWErkPFW6H38jBRiwt
=v7rv
-----END PGP SIGNATURE-----

--=-lEFCa0v/2i+SKulozd6j--
