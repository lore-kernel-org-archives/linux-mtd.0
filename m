Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RtCOI-0007m3-8M
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 06:12:58 +0000
Received: by iafj26 with SMTP id j26so5144099iaf.36
 for <linux-mtd@lists.infradead.org>; Thu, 02 Feb 2012 22:12:57 -0800 (PST)
Message-ID: <1328249696.6750.41.camel@sauron.fi.intel.com>
Subject: Re: [RFC/PATCH] mtd: m25p80: set writebufsize
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Fri, 03 Feb 2012 08:14:56 +0200
In-Reply-To: <20120201111153.3c1fe085@pixies.home.jungo.com>
References: <1327997163-9354-1-git-send-email-computersforpeace@gmail.com>
 <CAGiDA6Jw52CGM6KT5EANaGb8xxQQEH0Lf5ms24NGZLeMtqgjGA@mail.gmail.com>
 <CAN8TOE-Yt445aXE_sA9xo8ycV4EQB=5OtwL6yyfPBGusYd93CA@mail.gmail.com>
 <20120201111153.3c1fe085@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-pjE41ozStIUqKEalpvdH"
Mime-Version: 1.0
Cc: "Shawn J. Goff" <shawn7400@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 agust@denx.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-pjE41ozStIUqKEalpvdH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-02-01 at 11:11 +0200, Shmulik Ladkani wrote:
> On Tue, 31 Jan 2012 09:46:40 -0800 Brian Norris <computersforpeace@gmail.=
com> wrote:
> > I'm wondering now: how do we guarantee that we're picking the
> > *correct* writebufsize and not just one that *works*? It's only used
> > by UBI, I think, so it depends on UBI's needs.
> >=20
>=20
> According to mtd.h, 'writebufsize' should be set to the "Size of the
> write buffer used by the MTD".
>=20
> m25p->page_size should be set to the size of the device's data buffer
> (used by the Page Program operation).
>=20
> Hence for m25p80, 'flash->mtd.writebufsize =3D flash->page_size' seems
> right.
>=20
> BTW 'writebufsize' is propagated to UBI's 'max_write_size' which
> currently affects UBIFS write-buffer size.
>=20
> It should be set to "the maximum amount of bytes the underlying flash is
> able to program at a time" (according to ubifs/io.c).
>=20
> Hence again, for m25p80, 'flash->page_size' seems adequate.

This parameter was introduced for NOR flashes, and in NAND flashes
context it looks weird. Probably we could document this better. But
basically, it describes how much data the driver is able to write at a
time. All NAND drivers write only one page at a time, so this parameter
should be set to NAND page size.

Imagine if you created a striping layer on top of 2 MTD devices to
speed-up the I/O. In this case you would most probably make
'writebufsize' =3D 2xNAND pages. UBIFS would then try to do I/O in
'writebufsize' units for optimal performance, unless there is a sync
command for example, in which case UBIFS would write the last chunk of
date in smaller 'min_io_size' (=3DNAND page size) unit to waste less
space.

UBIFS also needs to know max_write_size for recovery to calculate how
fare a corruption caused by an unclean reboot can span (on the above
example, a normal corruption can only affect 2 NAND pages).

To summarize:

mtd->writesize =3D UBIFS->min_io_size - normal min. I/O unit
mtd->writebufsize =3D UBIFS->max_write_size - how much data the driver may
write at a time, defines the max. corruption size, gives fastest I/O.

And there is also mtd->subpage_shft -> sub-page size :-) This exists on
some NANDs. UBI uses it to pack its headers more tightly and waste less
space. We do not make this to be our min_io_size because we assume the
I/O speed in subpage-sized units is slow. Indeed, in case of normal
NANDs the whole page is written anyway, just padded with 0xFFs.

Anyway, pushed to l2-mtd.git, thanks! Added
Cc: stable@kernel.org [2.6.38+] as well.

--=20
Best Regards,
Artem Bityutskiy

--=-pjE41ozStIUqKEalpvdH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPK3tgAAoJECmIfjd9wqK0Kj0P/11o97vBE1BDeEaz23qn5GXy
HL4IpovL74tL9XnEU7cksV/A/NNLDsvFg3sg6rkMwVctReAoZpcVhG3YosTRJ9aj
lPVIf0lvIedUzTROvW6sXwv2UIh/5VSQc12c1kb3yUmWT7grgPJg7DZrJEFvA4Sz
JFYuCc3FgMs8o28yKv0roHKCj2jVFGag6gbhEpqahpXXkz+0nZoD6chhHidXNPIe
sBkRynqtZtwKW8P3GNyeeJH+VAA5yGSaDUkubzUx6P7JVaaOWrwF18zyJTJT1c0J
6vxRExMQ0vNMPeH1+lyyiOkGNIpg6LXlscicpolQ3pvGJsKkMljuYSlCVD9hHkPa
tt+FfMGEI9QlobK4vahD8e0uxP1vlnBwEQy9QhMnuEs22xqn33cLJi7c1XwTOdGa
2N0eNwQebb9t2SXZzDVpjh9KbnlN2jrwu73uMFt+6UwAuaeafg1hXakWpy8WhdQe
2pMvVpaUA849uNdJZrYEeI3Lm5E8ixwEjxbzUocM1noyn6o/+WaSlA/JNBNkJvto
kPD3ReA1gcTc6UFigeItb9PyYkjIXHWqUWCA9/As2Qarfm3Dpqo32XRlklXiNjpR
aONJKlWAB+B5ohkbgtvaXHdE4o5CcKXn2jR+ivh7Y8p8SJ3vUwGRgrr694pPTVdI
8Dxyt7w80Y5EkmPfZ3xy
=yQ4+
-----END PGP SIGNATURE-----

--=-pjE41ozStIUqKEalpvdH--
