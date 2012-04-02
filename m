Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SEbTM-0002je-8S
 for linux-mtd@lists.infradead.org; Mon, 02 Apr 2012 07:14:40 +0000
Message-ID: <1333351068.5440.85.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 4/4] MTD: drivers return max_bitflips, mtd returns -EUCLEAN
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Mon, 02 Apr 2012 10:17:48 +0300
In-Reply-To: <4F765B2D.5040604@newsguy.com>
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331500873-9792-5-git-send-email-mikedunn@newsguy.com>
 <CAN8TOE_Zwg1evBBCSY3zcV6=O07WVyXf2ZOtgf7qgKGLUBcBrQ@mail.gmail.com>
 <1333109630.5440.18.camel@sauron.fi.intel.com>
 <4F765B2D.5040604@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-BLyHxyrAxZmOqb5yA9SQ"
Mime-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-BLyHxyrAxZmOqb5yA9SQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-03-30 at 18:17 -0700, Mike Dunn wrote:
> Artem, I don't think you pushed the offending patches (3 and 4).  If you =
want to
> leave the first two patches in, I'll be happy to fix them (they currently=
 don't
> do anything) when the whole efort is done.  Or else you can pull them and=
 I'll
> start from scratch.  Or slink away in shame :)  But I'd prefer to get thi=
s done
> right.

Yeah, I won't touch them so far and will just wait for incremental
patches.

--=20
Best Regards,
Artem Bityutskiy

--=-BLyHxyrAxZmOqb5yA9SQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPeVKcAAoJECmIfjd9wqK00c8QAIUeGrqz2z5zqsc4x030n5vO
oIW2lyREVavkrJMv2mVvs++7OQNXi9TgAhnbG/kksf53paHJuWl3UEALS1VSHKAF
oQzPe4FVBwUTHk5uX2FJSyZvKVeIfw3t3i97keuPiRREKNuMZF1A+wLsKXbQbI9B
hf6jiPZmPauE3j/2Kg3lGkyHktuJuJy4BHi5ussL1Y1mBIIZHliy2juJF/dnVRyI
tDVM2m/TjUqSL+mgeKDPPcLdKLVc8ott0mB6i7Yodm2dCh3MuJ1YsPN4SjxHht9Y
ojMwSX3EdWECNAa7LipUSl6DZwA05wIMYp8LdRXPfcb8Oj6RCSr9UeifgCAGJJnQ
Kf1lf4tz/gQrIWef5H3DidlArxhJfkd3VT/nedAjiNlrkh8y4nOa/1SjHiFpp+pa
5bd1fq1ELV7z3meUn3fslt0gCPdMhUAPiQ1JTHe11BVzaR6+xQcxpUdFUg8RgjfA
bXnXssXHTzE6N/Wt3n/mpPStZy+OPXhQJvBqSz2ZV8+iUtOr2C4fMhvP4aOMsh0h
qtZokrg+mgdoHlD+z0XeRNKavCc/aLsi754IbHxfawg9yLR2xmRSgACzu1jIEYqZ
Gvnc5trMsuM6EHIPmyaONV6HHz7+pTBAjE09jc5Br73qZP0t87XeSmieDJUeBgKN
E7To7KxEoZ3srajy6sb1
=EGdp
-----END PGP SIGNATURE-----

--=-BLyHxyrAxZmOqb5yA9SQ--
