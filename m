Received: from [213.154.159.190] (helo=pinot.profis.ro ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fULG-00040j-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2002 23:15:35 +0000
Received: from localhost (IDENT:rcorlan@localhost.localdomain [127.0.0.1])
	by pinot.profis.ro (8.9.3/8.8.7) with ESMTP id BAA01266
	for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2002 01:21:25 -0500
Date: Tue, 26 Feb 2002 01:21:24 -0500 (EST)
From: Radu Corlan <rcorlan@pcnet.ro>
To: linux-mtd@lists.infradead.org
Subject: Re: problem in nand.c v 1.16
In-Reply-To: <0202251944320H.03406@thomas>
Message-ID: <Pine.LNX.4.10.10202260102070.701-100000@pinot.profis.ro>
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

Sure, that would do ok.=20

Radu

On Mon, 25 Feb 2002, Thomas Gleixner wrote:

> On Tuesday, 26. February 2002 02:11, Radu Corlan wrote:
> > I'm using the nand driver with a Toshiba TC58256 flash chip. We have fo=
und
> > that the delay at the end of nand_command (currently 15us) is not enoug=
h
> > for this part (the datasheet calls for 25us). Before making the change,=
 we
> > got a 0xff instead of the first byte of the page.
> > Please take this into account in the next revision.
>=20
> Maybe we can solve it with a additional entry in the nand_chip structure.
> =09=09
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
