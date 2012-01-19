Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RnzrU-00032u-1z
 for linux-mtd@lists.infradead.org; Thu, 19 Jan 2012 21:49:37 +0000
Received: by eekb15 with SMTP id b15so154917eek.36
 for <linux-mtd@lists.infradead.org>; Thu, 19 Jan 2012 13:49:33 -0800 (PST)
Subject: Re: [PATCH] mtd: nand: fixup "mtd: nand: erase block before marking
 bad"
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 19 Jan 2012 23:49:31 +0200
In-Reply-To: <1326742845-22788-1-git-send-email-computersforpeace@gmail.com>
References: <1326742845-22788-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-u/bVEIEsOWvgeZIdtFeq"
Message-ID: <1327009772.2195.3.camel@koala>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-u/bVEIEsOWvgeZIdtFeq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-01-16 at 11:40 -0800, Brian Norris wrote:
> The following commit had an incorrect solution:
>=20
>    mtd: nand: erase block before marking bad
>    commit ece080820c9dddf467b6da08a8bfbab66615a03b

Squashed into, thank you!

--=20
Best Regards,
Artem Bityutskiy

--=-u/bVEIEsOWvgeZIdtFeq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJPGI/rAAoJEJtuLFy+q7feLNUH/3E59SNVNPNs4ygd7WoYEu06
68+FxS/fhDrBq2e5qiD1JBtRs6qhex/1uL32hNOcxFjmBo8Cr6F21P3VUWBrs67u
TkxPVEmgghfmJTmK6qOvIxKzWA7Klo88NZ/wjomIQgNPkuNP3I8i1CEn8rlkjOXC
QjRxmahNjk5PFRAcaIS8YaadkzOnzZOWY53euBDSNEbqoRO/nwqm0FiP/5GXsi9P
7sdNJtcHbsIG3jZnstwIuyPUr7xsDwLb+DRpSxXVTRUIALweroQe6jN6sjrbfx8R
/EE+f7n5Tb33BqxsrOoI5Sq71nJyGZME3Wzvj/zCNZx7i0+ffuDY9r4Os2Vl3UE=
=OkCD
-----END PGP SIGNATURE-----

--=-u/bVEIEsOWvgeZIdtFeq--
