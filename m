Message-ID: <1337938976.30969.12.camel@sauron.fi.intel.com>
Subject: Re: Problem with UBI / UBIFS (mainly ucorrectable error) on kernel
 higher than 2.6.30.10
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?=C5=81ukasz?= Nowak <lukasz.nowak@homersoft.com>
Date: Fri, 25 May 2012 12:42:56 +0300
In-Reply-To: <1337938767.30969.9.camel@sauron.fi.intel.com>
References: <1337255133.2457.66.camel@debian.softace>
 <1337348152.2483.59.camel@sauron.fi.intel.com>
 <1337605024.2646.16.camel@debian.softace>
 <1337673875.2483.116.camel@sauron.fi.intel.com>
 <CAJpamw4XDgWiB1Za5qGDns1wV=Jnk1DyRS6MYBSypd8ab41hVQ@mail.gmail.com>
 <OF453BD14D.DB41E7C8-ONC1257A06.003568DE-C1257A06.00357A39@transmode.se>
 <CACYZ3J4rP=JbB8XoVfg-dqWEhTXt_gGt4FsBf3NWngyCKaa+JQ@mail.gmail.com>
 <1337938767.30969.9.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-gDwhvZWdglAiaRLZjuGo"
Mime-Version: 1.0
Cc: linux-mtd-bounces@lists.infradead.org, Guillaume LECERF <glecerf@gmail.com>,
 linux-mtd@lists.infradead.org,
 Joakim Tjernlund <joakim.tjernlund@transmode.se>,
 Nicolas Pitre <nico@fluxnic.net>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-gDwhvZWdglAiaRLZjuGo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-25 at 12:39 +0300, Artem Bityutskiy wrote:
> On Fri, 2012-05-25 at 11:04 +0200, =C5=81ukasz Nowak wrote:
> > So maybe the best solution right now will be to just add additional
> > flag to the kernel configuration MTD_ORION_NAND_BURSTS_READS turned of
> > as default? I saw that a lot of people had similar problems to mine.
> >=20
> Fist of all, someone should investigate what is happening and why
> exactly. Then we should find out the right solution - be that a flag or
> just a revert of that change.

Fixing the e-mail address of Nicolas. It apparently has changed.

--=20
Best Regards,
Artem Bityutskiy

--=-gDwhvZWdglAiaRLZjuGo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPv1QgAAoJECmIfjd9wqK0afQP/23DKOY1aEpeTQNuK4F8b3s7
2ElfYlIkoHXVu1bsrmKRhH7e0AZZT0Y1WBGSZiBmSmcpWMF6An6FfoMtbRhrrRb1
efGmbQUyQcOYr4f7l3IMxDcf1/DIg2rVCDuN/HRZo/Px6RjCX+kYVUYm3vJhwJKf
R/5SsP0lu2B7i/0mzHAvK5zgamjLS8Cte1YlzEgzMexvbPr5rnKBu+Ha8R3j86p3
XE2oMxUb/vHr3c2zKDdy5NViozoS4FcU8WTg65WZNKYx8UcZqrBoVet7pkh9E/E6
NGdsQS6ciO9B7vUVpKqoT+39w3ejGIvgyZtR42dw7NFUvL7Usv7APIxo/E/ipIIe
V2i8obC/5Am3hXUNnjsMFWdO94WRZxb1Fv6kfJxKg0acLubtLmBv8+8Io9mSXr/V
oGlRu1n8rVvP9naYgUpBBFEQWsf7CgddFvVDtt7ZKLeoqxRXeXhKKi4E2F5PtKNR
GoHl76A7H1VSiHPAlJ64pm9G96FPBsD2AJnMdkU4+ur124+MwsLxzLbzsd1AL+Et
yYT10VDEYwqDEn07/sV160qITDeuhNHncLx01ZQaTBceuC+9R/q2uZaKgpLTjU0E
GvuNK7uU1ekgTcNaXj/6KttRhMrWRXRO9OUDgnneTKd0r4psXqcOQQ9xHii/IDI4
CLrrB7wG4KyDC68ug85V
=qvCo
-----END PGP SIGNATURE-----

--=-gDwhvZWdglAiaRLZjuGo--
