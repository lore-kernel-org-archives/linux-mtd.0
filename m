Received: from profis.ines.ro ([193.178.171.140] helo=pinot.profis.ro)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fW9e-0004Aj-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2002 01:11:42 +0000
Date: Tue, 26 Feb 2002 03:26:29 -0500 (EST)
From: Radu Corlan <rcorlan@pcnet.ro>
To: Thomas Gleixner <gleixner@autronix.de>
cc: linux-mtd@lists.infradead.org, Joerg Zastrau <dl1bku@amsat.org>
Subject: Re: Support for parallel access in nand chips
In-Reply-To: <0202260058520I.03406@thomas>
Message-ID: <Pine.LNX.4.10.10202260324540.905-100000@pinot.profis.ro>
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

> On Tuesday, 26. February 2002 07:30, Radu Corlan wrote:
> > On our application (a PPC405 embedded system), we use two TC58256 NAND
> > chips conected on a 16-bit bus. we designed it this way in order to
> > increase the read/write speed - it would double our bandwidth. The
> > problem, of course, is that nand.c only accesses the flash 8 bits at a
> > time.
> >
> > We intend to hack nand.c to use the 16-bit access (and make a special
> > entry in nand_chip with a double erase_size), but i'd like to know if
> > anybody thought of supporting the parallel access.
> No.=20
> But please don't hack nand.c. Build a nand16.c from nand.c and hack this.=
=20
> Else we get a mess in the code, which was cleaned up a few days ago :)
> And a lot of overhead of 8/16bit decisions. You just have to provide the =
same=20
> functionality as nand.c. You will not need a special entry in nand_chip. =
The=20
> information there is enough.=20

ok - i was going to make a separate source anyway. Do you know if the
upper layers mind the 32k erase size?

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
