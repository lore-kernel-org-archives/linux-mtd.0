Received: from proxy.tritec.de ([193.141.224.1] helo=nimrod.tritec.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15I8XR-0004j0-00
	for <linux-mtd@lists.infradead.org>; Thu, 05 Jul 2001 13:47:21 +0100
Message-Id: <200107051252.OAA04851@gideon.tritec.de>
Date: Thu, 5 Jul 2001 14:52:57 +0200 (MET DST)
From: Peter Blum <pb@tritec.de>
Reply-To: Peter Blum <pb@tritec.de>
Subject: RE: SmartMedia Card Flash File System
To: kd@flaga.is, linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: TEXT/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-MD5: 5AMvq9E5zsImw+EcEMc30Q==
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

You are write. But it is fat12 on top of a kind of maping=20
from logical sector numbers to physical page numbers within
the SmartMedia.
This maping is made in my PCMCIA card making the SmartMedia
Card look like an IDE drive.

Peter

>
>=20
> I think it is fat12.
>=20
> K.D.
>=20
> > -----Original Message-----
> > From: Peter Blum [mailto:pb@tritec.de]
> > Sent: 5. j=FAl=ED 2001 12:32
> > To: linux-mtd@lists.infradead.org
> > Subject: SmartMedia Card Flash File System
> >=20
> >=20
> > Hello,
> >=20
> > does anybody know what kind of flash file system is used for
> > SmartMedia Card?
> >=20
> > I got a driver working on 2.4.5 ppc kernel and can use the mtdchar
> > device to read the raw contens of the card. It seems that neither ftl
> > nor nftl can't be used.
> >=20
> >=20
> > Peter
> >=20
> > _____________________________________________________________________
> > Peter Blum                                 Tel. +49 (6131) 922 237
> > Tritec Electronic AG                        Fax +49 (6131) 922 229
> > Carl-Zeis-Strasse 41                      email Peter.Blum@tritec.de
> > D-55129 Mainz                               URL http://www.tritec.de
> >=20
> >=20
> >=20
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >=20

_____________________________________________________________________
Peter Blum                                 Tel. +49 (6131) 922 237
Tritec Electronic AG                        Fax +49 (6131) 922 229
Carl-Zeis-Strasse 41                      email Peter.Blum@tritec.de
D-55129 Mainz                               URL http://www.tritec.de
