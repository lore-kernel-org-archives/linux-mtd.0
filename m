Received: from isdn252.bb0.pcnet.ro
	([213.154.130.51] helo=pinot.profis.ro ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fm95-0005Mt-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2002 18:16:11 +0000
Date: Tue, 26 Feb 2002 20:30:13 -0500 (EST)
From: Radu Corlan <rcorlan@pcnet.ro>
To: Thomas Gleixner <gleixner@autronix.de>
cc: linux-mtd@lists.infradead.org
Subject: Re: nftl problem
In-Reply-To: <0202261903150J.10190@thomas>
Message-ID: <Pine.LNX.4.10.10202262018550.952-100000@pinot.profis.ro>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=X-UNKNOWN
Content-Transfer-Encoding: QUOTED-PRINTABLE
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

> > Anyway, i gave up on nftl; my mtd seems to run ok now, as i put a ext2
> > filesystem on the mtdblock0 device and it runs fine.
> >
> > But i can;t get jffs2 to work - i used the code from the latest snapsho=
t
> > on the infradead site - is it ok? Can i get a 'stable' version somewher=
e?
> > my kernel is 2.4.2.
> What does not work on JFFS2? You must setup the ECC config in your nand16=
=20
> driver.=20

I didn't do the 16-bit stuff yet - use just one chip at this time. when i
try to mount the jffs2 fisesystem, i get a loong delay; with debug
enabled, it seems that it scans the device for freespace markers or
something; After that, is mounts the filesystem, shows the right amount of
free space, but when i write to it, the changes are not maintained over a
remount or reboot.

But i'm just thinking: the ppc is big endian; maybe i must set the option
on mkfs?


Radu

> There's a lot of development going on. But try to use the code from CVS. =
I=20
> have just updated the nand stuff to support variable command delays and f=
ixed=20
> a the CONFIG_ECC_LAYOUT stuff in nand.c



>=20
> --=20
> Thomas
> __________________________________________________
> Thomas Gleixner, autronix automation GmbH
> auf dem berg 3, d-88690 uhldingen-muehlhofen
> fon: +49 7556 919891 , fax: +49 7556 919886
> mail: gleixner@autronix.de, http://www.autronix.de =A0
>=20
>=20

-------------
Radu Corlan           Snail Mail: Bucuresti sect. 1,=20
rcorlan@pcnet.ro             str. Argentina nr. 28, 71206 Romania

   You can still escape the "Gates" of Hell!  =20
                 Use Linux!                      =20
-------------
