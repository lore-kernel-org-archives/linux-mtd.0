Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sjsby-0004lY-51
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 13:48:52 +0000
Message-ID: <1340805168.3070.11.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/8] NAND and NAND-BBT improvements
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 27 Jun 2012 16:52:48 +0300
In-Reply-To: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-D3sMixXVu+9POBIkHixi"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, Mike Dunn <mikedunn@newsguy.com>,
 linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-D3sMixXVu+9POBIkHixi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pushed these patches to l2-mtd.git, thanks!

mtd: move mtd_read_oob() definition out of mtd.h
mtd: nand_bbt: refactor check_pattern_no_oob()
mtd: nand: rename "no_bbt" descriptors to "no_oob"


--=20
Best Regards,
Artem Bityutskiy

--=-D3sMixXVu+9POBIkHixi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6xAwAAoJECmIfjd9wqK0eZcP/jQdZ9wdabLObIImeZepl2Yr
12eMKhUjeotwfjV4ovhHnSCnNEJJFXpSU2GwHoPAnayEcKiiGq1yHF9ujNdIergb
hbcmhkxXOqHIS0m6okDLHftSQXJvTzCvDH5TZ8Y5XWbbstWkebnC969Qfj4VnomA
u7/Gne4+wqK36DqKvc938B0wKxAhuHkE8BATRficSOUFHxbJx4eLTDW4XF0wnHYR
zScKDkDz5Rx9as4I5Mp54v6zBMNB67+kkKqNRA6HByWo4KEQjkQSyMECx8n4iKu5
oJ2cjUnwA7dDHjapSG4vPMpWT5VFQw5OqZ1xT25tqAcboK2zbKGvvodq39a+Dq+B
4eeBb5oO5A5f1kM92zPFPOXcWeP3wqcKvNj9nWyqEXXjstMvstMG0sXeHKFIajkf
nGHEJrhm1HzL3aR3XdtAsjA8X3xKBMmAtxTxU/T4cM0FN6638SjP6/wdjRdsNxvH
b3a6mMD7UyyCTBwnV/lP/pfyy5+yzMbeTU31hNxF/arC8SOCdWkKY+XeVUwZTGFd
GWJqWLIIewUzffM2nqNdSOS90bEAvxO8DtXzqSHaJy9rn0YjmAfshOT6hEw4qEsy
ExjBG91pkGCYrbU7NdUz/jixYzRlWZ1usiauQ0jqvMuljuyviEXziPIGNs2yk4h9
kaR26oUkV7u9/iUH/9Dn
=w6Ns
-----END PGP SIGNATURE-----

--=-D3sMixXVu+9POBIkHixi--
