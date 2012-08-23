Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4Ycv-00011S-2r
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2012 14:43:19 +0000
Message-ID: <1345733153.2848.244.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3 0/6] UBI: add max_beb_per1024 parameter / ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 23 Aug 2012 17:45:53 +0300
In-Reply-To: <CACQ1gAhs6E5jHGnTy1RhbnuzKq7uAJk0DeHfi0k73jC_8noiAg@mail.gmail.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345716615.2848.229.camel@sauron.fi.intel.com>
 <20120823133655.72157b18@pixies.home.jungo.com>
 <1345725030.2848.236.camel@sauron.fi.intel.com>
 <20120823154404.51e31873@pixies.home.jungo.com>
 <1345726686.2848.241.camel@sauron.fi.intel.com>
 <CACQ1gAhs6E5jHGnTy1RhbnuzKq7uAJk0DeHfi0k73jC_8noiAg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-NM1PnOr3WIxtYsSRGvFW"
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


--=-NM1PnOr3WIxtYsSRGvFW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-23 at 15:13 +0200, Richard Genoud wrote:
> I could do some more tests with the final version.

Thanks!

> I guess that the documentation to update is there:
> http://www.linux-mtd.infradead.org/doc/ubi.html

Yes, a separate section about how UBI reserves eraseblocks for bad PEBs
handling is needed.

> The message commit of dccaefbd68ce0c4d83f1d57667726868bdc03cce (UBI:
> use the whole MTD device size to get bad_peb_limit)
> could be a start for the "Why?"

Sure.

Additionally, all places where we mention 2% should be amended
correspondingly. I guess this commit can be used to locate the places:
http://git.infradead.org/mtd-www.git/commit/2b91234cf1dd9968d18679b19d7dbe2=
2b6508cff

Also, this section should be amended:
http://www.linux-mtd.infradead.org/doc/ubi.html#L_overhead

--=20
Best Regards,
Artem Bityutskiy

--=-NM1PnOr3WIxtYsSRGvFW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNkIhAAoJECmIfjd9wqK0fIkP/js8Pqw71YGWY5TGHXZVRH8y
S8AirPis1bKyq6z4xXq1qcMXJ4p5O+XR0L6kxsal9Xvo6SEf2sc04bLuokHbv0Y+
XSaL28NIGzY9bVLorobHShreW6n7PAs5cYqeYRVhV7cJpmFGTQES7qPPhXbSCMPg
0kkXYYlFObpvywMeFPiseu+jFkAuLMn7Jx5/IqbI48HIv/pBrhow//Lyo/4zAoEc
T5PRMeoroYkITdyhcPc2jTsn4OYwbe4y9FMUk/i4LvvN9FQQb9lkC5MtmddNwT89
S0/1VjVK4BDB1qVeZM/iBxFsjMSdvw0TYOhUj5AkY2muo5hFFfgI43eSKgcnxUG0
c04GMFuzHfjK3JCYtGgnkh2StbUxKZ4oaCeapyXh+A+e7ATp7Bd4UtXcT7VJFYBE
SBLm0nlk9gZwsA1rrfz70neIXrWBXyjzqumoxvoN3LsDdNfmHNlgbNYh2BM0SOqa
Dp6/fA+vGiDUeCyXuHkVLqwaRdBQUHFLQHt0zxbP+54jjzIR1apSDZv2hZJvZ2o0
z4STqYbkcTcLhEzOKlGDHGQ+MufeaNqGuYlKsHt7zfvJMmcr5ADvqnwuSOpodbjt
Ba02E3lAMyWocfNM1/gdK56avzvzrpOzduKT/bQgwa0l6Pkj7nzeFBEiqUj/kTur
Tsq1rHzahN0n3eR/crtj
=eoZA
-----END PGP SIGNATURE-----

--=-NM1PnOr3WIxtYsSRGvFW--
