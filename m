Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4TcI-00070J-5w
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2012 09:22:18 +0000
Message-ID: <1345714020.2848.217.camel@sauron.fi.intel.com>
Subject: Re: [PATCH MTD-UTILS v2 1/4] libubi: factorize ubi_attach and
 ubi_attach_mtd code
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 23 Aug 2012 12:27:00 +0300
In-Reply-To: <1345651477-5301-2-git-send-email-richard.genoud@gmail.com>
References: <1345651477-5301-1-git-send-email-richard.genoud@gmail.com>
 <1345651477-5301-2-git-send-email-richard.genoud@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-0+k3y2/9j+s4oElkmRlf"
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


--=-0+k3y2/9j+s4oElkmRlf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-22 at 18:04 +0200, Richard Genoud wrote:
> The req->mtd_num value is now updated with the MTD device number found
> by mtd_node_to_num.
>=20
> If it's not acceptable, I'll do a static __ubi_detach_mtd() function to
> prevent that, and still factorize code.

Pushed to mtd-utils, thanks. On top of this pushed a patch which removes
'ubi_attach_mtd()' completely, because we do not have users and
'ubi_attach()' does the job anyway.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-0+k3y2/9j+s4oElkmRlf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNfdkAAoJECmIfjd9wqK0RBAQAI7afn+0QRhxxh78aD27Pf31
kXYFsQTB3AE+9CIzlMDiUU0nL/zR1JeWnkeYDnoMxEX/PDX2aPHcohFoPemCB6eR
7anknHKFvT8S2BpvsaKBSI4EwKPvYnO2Uf+0wSgMDkMPJ7cY1lwRcQX5fxzp4+WH
b1qCFr462gILvNVE1KqUf9bBB8pv6rxw+yTQZCpoNHG7G4ZFZVBvCH03Yg1QpiUD
qMjqdn3k0wyYEuRwWOXL0aMLXU/CpV9XeQmaQkao08S9MfUvaV28mFpTCYByH0VV
NfgaGmwxDAt/MTNVBTfdXjc3PHLrFe3c9Bp17oay2RbQme38r5CO6FbFcCN90Qym
TYgJmqY0BVqwU5k7/hvk9PGvNqS1yjcAUpKCWWEZdpxD/jRHS+kmhf2v7K79veyF
4Fq+/1yvmWOfLFjdMB145hTAcsbrufg6HABljugvZItkzm+7er55sIDpSmcjBkxY
jid1Bh+O/RWnvnJ+9ebh7NFGf0LIs/b/8F6x8L1pYwzkArsl2oNDgA+5jx0rTwYl
mYOUS+3+XIRtEBAmLVFdNeic60+o3aKwruRIOHPeSllec23TrwWlXLEtZ9yg7MFO
f34dJjYErNlc4GF2qOypuP3DIeEhX18USOa0MWm739GBRaaGjsLj/7khKEmXesxT
l7k4Dc03X888UG4dSB1H
=MbyJ
-----END PGP SIGNATURE-----

--=-0+k3y2/9j+s4oElkmRlf--
