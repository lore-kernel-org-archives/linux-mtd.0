Received: from cpe-144-132-145-175.nsw.bigpond.net.au ([144.132.145.175] helo=fuego.linuxaus.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LZRJ-0001ru-00
	for <linux-mtd@lists.infradead.org>; Sat, 22 Jun 2002 02:11:45 +0100
Received: from beamer.servat.com (beamer.servat.com [192.168.1.6])
	by fuego.linuxaus.com (Postfix) with ESMTP id E64BD82BA
	for <linux-mtd@lists.infradead.org>; Sat, 22 Jun 2002 11:11:40 +1000 (EST)
Subject: RE: X Windows Performance with DOC 2000
From: Gonzalo Servat <gonzalo@linuxaus.com>
To: Linux MTD <linux-mtd@lists.infradead.org>
In-Reply-To: <AIEOIMKIOAAJKHJOGAEFEEFJCEAA.david@forcedpotato.com>
References: <AIEOIMKIOAAJKHJOGAEFEEFJCEAA.david@forcedpotato.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-2tJlEyprZN0okuWInP9+"
Date: 22 Jun 2002 11:11:40 +1000
Message-Id: <1024708300.32427.10.camel@beamer.servat.com>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--=-2tJlEyprZN0okuWInP9+
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Makes me feel really positive about my embedded linux project using a
DoC 2000 :-)


On Sat, 2002-06-22 at 11:14, David Cooper wrote:
> I am using CF at the moment on a different platform.  Works well and it i=
s
> nice and easy to get it up and running (M-Systems Tech Support take note)=
.
>=20
> I am worried, however, about CF reliability at higher temperatures.  That=
 is
> why I am prepared to endure the blood, sweat and tears to implement a
> solution with DiskOnChip.
>=20
> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Christopher
> Fowler
> Sent: Friday, June 21, 2002 8:15 PM
> To: Ilguiz Latypov
> Cc: Linux MTD
> Subject: Re: X Windows Performance with DOC 2000
>=20
>=20
>=20
> Even if I could get it to work, I'm still going with CF.  M-SYS really
> needs to change the name Disk on Chip to Chip on Chip.  It is not
> seamless as their marketing department would like you to believe.
>=20
> Chris
>=20
> On Fri, 2002-06-21 at 20:01, Ilguiz Latypov wrote:
> >
> > I found one message of March 6, 2002 where the MTD-patched GRUB display=
ed
> > the prompt.  I think this was half a success as I am an optimist :-)
> >
> > I believe you did create a file system on top of NFTL layer and put the
> > /boot/grub/menu.lst configuration file there.  This file tells GRUB whi=
ch
> > partition to open and which kernel to load.
> >
> > The difficulties with reformatting DoC by using the M-Sys'es DFORMAT mi=
ght
> > be due to grub_firmware indeed.
> >
> > > So I do a dformat /win:D000 /s:DOC504.exb /FIRST /NOFORMAT /Y and I g=
et
> > > the following error:
> > >
> > > Error writing EXB
> > > Status code 26 (flUnknownMedia) received from flPlaceExbByBuffer.
> > > Format Failed.
> >
> > Perhaps, running the same utility with /s:* and without /noformat may h=
elp
> > in erasing the ext2 partitions.
> >
> > See pages 5 and 7 of
> >
> >     http://www.m-sys.com/files/Manuals%5Cdoc%5CDOC_Tool.pdf
> >
> > Ilguiz
> >
> > On 21 Jun 2002, cfowler wrote:
> >
> > > #2) Grub destroyed my first DOC.  I use doc-lilo.  Everytime I flash =
a
> > >     new kernel on the DOC I have to re-run doc-lilo.
> >
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >
> >
>=20
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20


--=-2tJlEyprZN0okuWInP9+
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA9E87MvTbSWKMx8O4RAvFAAJ41lmN7kFI/ZlOyLqVBus9il607PQCfYpfg
ShH8e8gK32s95xTJpLvT0Iw=
=oQp1
-----END PGP SIGNATURE-----

--=-2tJlEyprZN0okuWInP9+--
