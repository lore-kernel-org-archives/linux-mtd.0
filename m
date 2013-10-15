Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:214:c2ff:fe64:b2d3]
 helo=smtp.gentoo.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VW7Sp-0005jp-Vx
 for linux-mtd@lists.infradead.org; Tue, 15 Oct 2013 16:27:20 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: "Shah, Minal" <minal.shah@ti.com>
Subject: Re: MTD utils v1.5.0: MEMERASE64 ioctl failed error
Date: Tue, 15 Oct 2013 12:26:48 -0400
References: <566CE8F1DB913147957287757DA6396B3E9D5FD4@DBDE04.ent.ti.com>
 <20131011222459.GQ23337@ld-irv-0074.broadcom.com>
 <566CE8F1DB913147957287757DA6396B3E9D6A93@DBDE04.ent.ti.com>
In-Reply-To: <566CE8F1DB913147957287757DA6396B3E9D6A93@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart9487416.E4tyZkA1RH";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201310151226.51513.vapier@gentoo.org>
Cc: "Mukherjee, Somnath" <somnath@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "Parikh, Urmil" <urmil@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart9487416.E4tyZkA1RH
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tuesday 15 October 2013 04:32:23 Shah, Minal wrote:
> Hi Brian,
> Thanks a lot for the explanation; I understood the reason for failure.
>=20
> > So why do you want to erase bad blocks?
>=20
> The reason why I want to erase bad blocks is because they actually don't
> seem to be bad. Block0 itself is shown as bad.
> I have few partitions (like MLO and u-boot env) of size equal to 1 erase
> block. The block is marked as bad and hence I cannot write anything to
> this partition. One of the solutions is to increase that partition size to
> 2 blocks so even if 1 block is bad then it will atleast be able to write
> to the other block of the same partition. But I don't think I should do
> this while the block is not really bad (what if all the blocks for some
> reason are marked as bad while they are actually not).
>=20
> This question came in my mind from the fact that "nand scrub" command is
> allowed from u-boot which allows to also completely erase all the bad
> blocks; so why not from the kernel level.

as mentioned, there was discussion some time ago about adding this=20
functionality.  but the work never finished.  if you're interested, i'd sug=
gest=20
picking up the work there.
=2Dmike

--nextPart9487416.E4tyZkA1RH
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJSXWzLAAoJEEFjO5/oN/WBjRMQAIiCtOAuVWdIC9c7wJU8WZsh
h82T3i5gh9aSanHcgrD78cW0+kdgZAg0vXRWoVTXSRsBoLdVC7KLK33/byW7IJXl
frHZgVYvadevKQ1f1Z8J+Z2FRpAbG8H8mLj0hlE7tKZmJZX6bNjeOuksiwPxraDy
XyeWigxWvFOvIOzQAmC7aX7p6xuzqBF7+ZsTRhwbPQYU+4wO+s3oJYSInE52nydb
G6yDNiOrMVz0a/jO8M7ia0HEizKbLcRQqVuLlLB9oWPJFHx9VeSMglpHe/Kv5kws
ZB7NM9AOOQWfziqurLcKKV2TA2PGwtyWuf02U27kui760NjPff4/EUkHd2cTzzZl
xIPVdteHkmHB9uu+prHe4s/OxoNqcUxjPxthnr6HXHxQvFoq488O4f06fMZm0uVz
Xln5QuM5vFJqsOS1Jf2tTKU38L/RI6mW5t0CQVYAHka11cstlSDrczWZe4hyAHdy
DG4nf+034EoHIIHfJSFDSyOmAGDp7IiL4m8ufLBKV3IQhzDHpXZoOKK7Luxdf7Nj
/mm/DTiSd9kpcBWmbfpQJokfKo1slkivf400+tlMa1cxgwiibWZY6p22BQo6o2v+
BxEE00WOwSEtpY1OBBkppxahStfppxjRzY55+qX3vKNRXu8H6Ouv8zeVIg+R00Zn
MJgq9UKOR2SE8lwsH2Oe
=0F0t
-----END PGP SIGNATURE-----

--nextPart9487416.E4tyZkA1RH--
