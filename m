Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TFktX-0005Pz-Eh
 for linux-mtd@lists.infradead.org; Sun, 23 Sep 2012 12:02:43 +0000
Received: by bkwj4 with SMTP id j4so131729bkw.36
 for <linux-mtd@lists.infradead.org>; Sun, 23 Sep 2012 05:02:41 -0700 (PDT)
Message-ID: <1348401749.1889.0.camel@kyv>
Subject: Re: [PATCH] mtd: nand: Rename create_bbt()'s 'len' variable to
 'numpages'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Sun, 23 Sep 2012 15:02:29 +0300
In-Reply-To: <20120922215447.331f6480@halley>
References: <20120820162915.7f93e6c4@pixies.home.jungo.com>
 <20120922215447.331f6480@halley>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-CLTyQufi20QlWMBK/15G"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-CLTyQufi20QlWMBK/15G
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-09-22 at 21:54 +0300, Shmulik Ladkani wrote:
> Ping.

It is in my tree for a long time, I just somehow forgot to notify you.

commit 88b9e2c45297129863e0befc47881b3899402850
Author: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date:   Mon Aug 20 16:29:15 2012 +0300

    mtd: nand: rename create_bbt()'s 'len' variable to 'numpages'
   =20
    Rename 'len' variable of create_bbt/scan_block_fast/scan_block_full to
    'numpages', since it really means number of pages to scan when
    searching for the BBM (and not the byte length of the scan).
   =20
    Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
    Reviewed-by: Brian Norris <computersforpeace@gmail.com>
    Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

--=20
Best Regards,
Artem Bityutskiy

--=-CLTyQufi20QlWMBK/15G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQXvpVAAoJECmIfjd9wqK05a8P/j3vCDdjEx8ghAE5WeXmadmJ
nNrIXlsAJ6fy07uZZQvJzzZ7R52F0TyK8iNayf2d3vKQRSOrwy86n6bg7U21Va3P
l30T+R6Hp8n5rvxR0As7zLzFhLA86bC4VCr0CDyXaWe7QGOi52G8nyNCWWDfkZDZ
/VywyknvfO90lssjcuSkjia4ffV40JFy2J3GS4I6wIw2mI8Zp1H+nCJ5ad4HV5O/
llxoYIK/ebj8joS9gT5ypIv52Vk+sM9UFYFm7OqnVRpni6/dwBhFbmAwrJqxy5HQ
NUPVAwEAZBYMEW2X28T0FE5xKq16yYN95leZwyf4YI11LJXawT/gSepWQS91y8O3
KdeDL0+6fSQZOxS5b0hiU8XTyGC35/MvAF/GIgXMMmgoguC3GUNULiMIxHNQvoCU
dCYsBKHITwaY1JQTg3CbFz/LqnKyHZMbMGzgaEgt+ajyOYh8DsGKmcsuP3S1S2i+
qVtJVO5AvaObKaXomDzJTVACUNMlEBsI1PhglnN8T+DVAny5Zwv9ySFsUp3E38vS
mLAIZc3CDv9Ze9LTLtPSiNdnPMl8299DuCyc9Yt1ddx3aVJv5msCJR3GUEvMNEAu
11NhJR+5L4hgty2xkVReAP9JznHcmkzkjN+2mieWTxiNz6/r7pSf7sB6uoCGD7EJ
yePodetpNIoPO2zBuxLq
=zsuT
-----END PGP SIGNATURE-----

--=-CLTyQufi20QlWMBK/15G--
