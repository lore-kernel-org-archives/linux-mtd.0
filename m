Received: from [212.122.115.61] (helo=ia.mail)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BNaU5-0003sR-Uj
	for linux-mtd@lists.infradead.org; Tue, 11 May 2004 17:52:03 +0100
Received: from josepascual by ia.mail
	with SMTP (MDaemon.PRO.v6.7.9.R)
	for <linux-mtd@lists.infradead.org>; Tue, 11 May 2004 19:01:18 +0200
From: "Jose Pascual" <josepascual@almudi.com>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 11 May 2004 19:01:00 +0200
Message-ID: <001f01c43779$893048f0$0319a8c0@dominio1.ingalmudi.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <000001c43751$ba92fb90$0319a8c0@dominio1.ingalmudi.com>
Subject: RE: symbolic link with jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi

I have found that symlink is broken if the length of char of the name is
pointing is odd
but not with even.

any suggestion?


> -----Mensaje original-----
> De: linux-mtd-bounces@lists.infradead.org=20
> [mailto:linux-mtd-bounces@lists.infradead.org] En nombre de=20
> Jose Pascual
> Enviado el: martes, 11 de mayo de 2004 14:16
> Para: 'David Vrabel'
> CC: linux-mtd@lists.infradead.org
> Asunto: RE: symbolic link with jffs2
>=20
>=20
> > >=20
> > > It seems as strlen of names in symbolic links is wrong
> >=20
> > Big-endian glibc bug?
>=20
> I'm not sure, I'm working in an ARM CPU with little-endian.=20
> Everything seems okey less symlink,
>=20
> >=20
> > David Vrabel
> > --
> > David Vrabel, Design Engineer
> >=20
> > Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
> > Cambridge CB1 7EA, UK         Web: http://www.arcom.com/
> >=20
> >=20
> > __________ Informaci=F3n de NOD32 1.756 (20040511) __________
> >=20
> > Este mensaje ha sido analizado con  NOD32 Antivirus System
> http://www.nod32.com
>=20
>=20
>=20
> __________ Informaci=F3n de NOD32 1.756 (20040511) __________
>=20
> Este mensaje ha sido analizado con  NOD32 Antivirus System
> http://www.nod32.com
>=20
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
>=20
> __________ Informaci=F3n de NOD32 1.756 (20040511) __________
>=20
> Este mensaje ha sido analizado con  NOD32 Antivirus System
> http://www.nod32.com
>=20
>=20
>=20
> __________ Informaci=F3n de NOD32 1.756 (20040511) __________
>=20
> Este mensaje ha sido analizado con  NOD32 Antivirus System
> http://www.nod32.com
>=20
>=20
