Received: from [213.154.159.185] (helo=pinot.profis.ro ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fmJk-0005P0-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2002 18:27:13 +0000
Date: Tue, 26 Feb 2002 20:42:38 -0500 (EST)
From: Radu Corlan <rcorlan@pcnet.ro>
To: Thomas Gleixner <gleixner@autronix.de>
cc: linux-mtd@lists.infradead.org
Subject: Re: nftl problem
In-Reply-To: <0202261937400K.10190@thomas>
Message-ID: <Pine.LNX.4.10.10202262041540.1131-100000@pinot.profis.ro>
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

On Tue, 26 Feb 2002, Thomas Gleixner wrote:

> On Wednesday, 27. February 2002 02:30, Radu Corlan wrote:
>=20
> > I didn't do the 16-bit stuff yet - use just one chip at this time. when=
 i
> > try to mount the jffs2 fisesystem, i get a loong delay; with debug
> > enabled, it seems that it scans the device for freespace markers or
> > something; After that, is mounts the filesystem, shows the right amount=
 of
> > free space, but when i write to it, the changes are not maintained over=
 a
> > remount or reboot.
> >
> > But i'm just thinking: the ppc is big endian; maybe i must set the opti=
on
> > on mkfs?
> Due to the fact, that we changed the complete layout, there's currently n=
o=20
> support to use a Image, which was built on your development system. Use t=
he=20
> raw flash. mount it. copy files to it. Please get the latest source out o=
f=20
> CVS. There was a change in nand.c concerning the delays and the ECC_LAYOU=
T.
> Enable Use JFFS2 layout for OOB area (CONFIG_MTD_NAND_ECC_JFFS2).=20

I don;t care about the image anyway - i thought it was required. I'll try
again tomorrow. Thanks a bunch.

Radu

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
