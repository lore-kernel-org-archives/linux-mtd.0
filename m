Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SrOEk-0008RM-Qg
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2012 06:59:56 +0000
Received: by lbbgg6 with SMTP id gg6so1756945lbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jul 2012 23:59:51 -0700 (PDT)
Message-ID: <1342594461.31927.9.camel@brekeke>
Subject: Re: [PATCH 0/5] ubi: Fix bad PEBs reserve caclulation
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Wed, 18 Jul 2012 09:54:21 +0300
In-Reply-To: <20120717102333.26cb10fb@pixies.home.jungo.com>
References: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
 <1342452837.7270.15.camel@brekeke>
 <20120717102333.26cb10fb@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-gCT1bM7wyGyKRD97ohmA"
Mime-Version: 1.0
Cc: Richard Genoud <richard.genoud@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-gCT1bM7wyGyKRD97ohmA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-07-17 at 10:23 +0300, Shmulik Ladkani wrote:
> But it would only make sense after accepting Richard's patchset as well,
> which suggests configuring per-ubi-device beb limit via the attach ioctl.

Yes, sure, you are right.

--=20
Best Regards,
Artem Bityutskiy

--=-gCT1bM7wyGyKRD97ohmA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQBl2dAAoJECmIfjd9wqK00lMP/00D5rELb3GzXlhij1zpWkFV
WjbPs/JjdiBl+ilM8ZzkLWc8wyJy6ebtXrvGhRNErkHjecW3+9o3l/3xu7wlPX+k
0w3sP0Vq5/MQprI53besEkb4QI0lQLIdfbZzz9T1sOhu7tozM39nm6s6kwVkH0Q/
B6Uyg1s/J2SxFj4f2tP0ZVli4mX+lSb0+pcyDihIZLJU2EGuc+9XjM/tssvBjLZh
qTLfEhOIExZl2nqn8M5nI70MFKyJvfn0d7wR+4PxnmjDHhguG65Ozhyqs37ie3vx
OeV1wJndxry6fyOGv6PFtMrpgcNJSsfh3VstlhSD1jEpf5E4ISi5krxSauh6p/1P
nNxUOVAg/l43O6aSzV/4DZxiZnzH1D8ECIzHfww34RvPUZtd2ppM1xOTbh4+0WtO
aAm5CTe4Ge+HaVxjYq4AKCXy574XDDrjX5kF2mNa76jy1egarovmHXikbXjQayVq
P3YSDFpFD7XBVH+rvQHmfqsJmOPC/PEti3P8wyK89zBXvYBZfPAiv7v5KB4YqDsJ
rvFj0Tr6Bu2ym00WpoxLIkskp+/rPJc6gWNw9lwqdIM9IywTIC6FkLkt449htQ2P
Er/oNH7bgyUvS9jCZCu5ffOzW/GCbGMd9/FPL1ZIDvTtUSkg/R0EUqAjtJDXlAh9
2OzIjvZ9cw4C20dXx0M/
=R+25
-----END PGP SIGNATURE-----

--=-gCT1bM7wyGyKRD97ohmA--
