Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SrTD5-0008RU-5f
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2012 12:18:38 +0000
Received: by lbbgg6 with SMTP id gg6so2115784lbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2012 05:17:53 -0700 (PDT)
Message-ID: <1342613542.7530.21.camel@brekeke>
Subject: Re: [PATCH 1/2] mtd: fix wrong usage of ioremap_nocache() in
 uclinux.c map driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: gerg@snapgear.com
Date: Wed, 18 Jul 2012 15:12:22 +0300
In-Reply-To: <1336632929-26100-1-git-send-email-gerg@snapgear.com>
References: <1336632929-26100-1-git-send-email-gerg@snapgear.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-uXNj3YW8iUztqdJ4Tt6Q"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, uclinux-dev@uclinux.org,
 Greg Ungerer <gerg@uclinux.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-uXNj3YW8iUztqdJ4Tt6Q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-05-10 at 16:55 +1000, gerg@snapgear.com wrote:
> From: Greg Ungerer <gerg@uclinux.org>

Hi Greg, I had these 2 patches in my l2-mtd.git tree, but dwmw2 decided
to not pick them, so I dropped them as well. Please, re-send new
versions, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-uXNj3YW8iUztqdJ4Tt6Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQBqgmAAoJECmIfjd9wqK0kGMP/2NtF7H5kmHnE+f27T6vIvQ+
gxhFT9Wui4/xEiLGi+cuQYhA7fnSwiqNl/uOkHjb87IHa8mR+p2Q6Li9YUi/rNWU
CflM5boeP+zDNi4H/gXe6tTZ5N9PoFGl1qSsuXmuSpeOKUOEXCi5BcHFCRNFM6xi
tZyMEaXvfRGJ2Ap9l400UenZ5tU3jPW/Fo/L4OMROCVRM0tJg5jj+X2FiNMMDphG
sSJNBSJqqJdj1Tpf3LsObGYvjGB9DdhhW+RoCKlxWGI6F7pUYz/0S5Im2wjzZ7Hn
+YFLUSq2kEUeX+uhStlJnszl+rF48vTgEeLR1T9VhxRLYWtnNLlw2iddgl4bhTcF
wq6/0yamoyRj4kXwau5atKg3y4hq9hdOHZJPzx01KfEcLbMP1TSlGUwv9gbOYkYE
tndtmnVqFarxRFZKRSnsH/eaqw06oxV3VY7Oq8fhkdvv7/lyH11CCjlI/H4FlM4S
qT03Xb1qqjQPaS8jYGIeQX1lZ7tZiqdQ2C66x6DYVpPuNys0MM00m7UzA7Seg9NV
mLYIIINq6XHAhPHjyhLSCNavjz1TsXKy3BJc+PPdKv1NY0oYMdMEwd0MVOVAeA+K
XbCnIJdOOPf1CT8rt0apPEa/6kOEZjUDhuFm3CkHx4c5kaKxVqVYa0vUMCCTCIcS
c5FlhAUpP7lGfxAUvg1O
=6rBI
-----END PGP SIGNATURE-----

--=-uXNj3YW8iUztqdJ4Tt6Q--
