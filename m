Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SIimW-00041x-7K
 for linux-mtd@lists.infradead.org; Fri, 13 Apr 2012 15:51:28 +0000
Message-ID: <1334332456.13160.1.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 4/4] MTD: drivers return max_bitflips, mtd returns -EUCLEAN
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Fri, 13 Apr 2012 18:54:16 +0300
In-Reply-To: <20120403114818.1cea9f2b@pixies.home.jungo.com>
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331500873-9792-5-git-send-email-mikedunn@newsguy.com>
 <CAN8TOE_Zwg1evBBCSY3zcV6=O07WVyXf2ZOtgf7qgKGLUBcBrQ@mail.gmail.com>
 <4F765873.6090209@newsguy.com> <20120331093752.341037b4@halley>
 <4F79D668.9090903@newsguy.com>
 <20120403114818.1cea9f2b@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-rho1n8oXzqMw7tFnGy4S"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 Mike Dunn <mikedunn@newsguy.com>, David Woodhouse <David.Woodhouse@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-rho1n8oXzqMw7tFnGy4S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-04-03 at 11:48 +0300, Shmulik Ladkani wrote:
> Anyway, looking on it in a broader perspective, can you please state
> use-case examples where one might set different thresholds for
> different
> partitions of same device?
> I mean, do we really need that granularity?

Current MTD partitions support is very simple and makes it difficult to
distinguished between partitions and not partitions.

--=20
Best Regards,
Artem Bityutskiy

--=-rho1n8oXzqMw7tFnGy4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPiEwoAAoJECmIfjd9wqK0HcQQAK87KHsRjxtW1jHTPLnZ3+aO
aVvVf+bZ1H+RwwOo7w5ZXSR26+hhG1ESxfklVVtSi0FSP5EFaTJEU40BnCP9ApeX
IncvKHvGGhC4ebvPlBQs1tBE8HoM7GfvlQA4TVjlp93FAkqrZ55RPaBMpnFY97Cc
nxp9DzxspO9Et9ReRhEXxORgHZSNryCR6KhvUtEc+aDIe6p2tF4Qls9J1qqqDePb
Su0CmVwJYgIryAdBCB8E4xo1jFH+JlIQV/6ojr4Z1vrzYFCfX6uxGu/qDIfqVamG
Oy/2JAS8aD96gpFokhjrCGvsqbtVJFqYrFIsZticKYQhgkHzhjSfc2BN26QZ1T+L
aOPMropxpsSW9pej0xI9xOhZED+eFhi1+Io/UWLNXv4fwlWnHET4vkG1L6G5fkbV
p5uyvUXq2Xl/wfHiC5P8Z8/Dme3WTIqqq3ogJpO5KICUekyvSgibPuRc1CPu8LSc
coye3mPD2cIWck+0jZFSS9PEN8KmazVAVKrIN9Ewrds0JgaXhnA65tup1Pl+8jh/
6qkNd78TLYxJwWCLpvEa9JsMSRsuLXmWG8ZUUNeljDSTplJiK1o2YgFZmbbl/rrF
QbJiNfQV814N5pm69iWKbXmCsnPsYYRyqC4ho0WOLFTkSraGhHp3rEvoOGn7l848
KChrJAMOTNm7AY4z2r3A
=Rieh
-----END PGP SIGNATURE-----

--=-rho1n8oXzqMw7tFnGy4S--
