Received: from [213.154.159.179] (helo=pinot.profis.ro ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fi6T-000521-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2002 13:57:14 +0000
Date: Tue, 26 Feb 2002 16:11:31 -0500 (EST)
From: Radu Corlan <rcorlan@pcnet.ro>
To: Thomas Gleixner <gleixner@autronix.de>
cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
        Joerg Zastrau <dl1bku@amsat.org>
Subject: Re: Support for parallel access in nand chips
In-Reply-To: <0202261445370B.10190@thomas>
Message-ID: <Pine.LNX.4.10.10202261609070.706-100000@pinot.profis.ro>
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

it's ok, i modified nftl_setup - just wanted to know of there is a new
one. We are close to getting it work, so we'll keep at it for a while.

But indeed i should probably avoid using nftl.=20

Radu

On Tue, 26 Feb 2002, Thomas Gleixner wrote:

> On Tuesday, 26. February 2002 21:24, Radu Corlan wrote:
> > But nftl_format complains that the erase size is not 0x2000; Is there a
> > newer version than 1.17?
> You don't need NTFL on top of it. Just use JFFS2. There are some=20
> modifications neccecary fo the ECC layout.=20
>=20
> Radu: Can you send me your actual code, then I can give you some pointers
>=20
> --=20
> Thomas
> __________________________________________________
> Thomas Gleixner, autronix automation GmbH
> auf dem berg 3, d-88690 uhldingen-muehlhofen
> fon: +49 7556 919891 , fax: +49 7556 919886
> mail: gleixner@autronix.de, http://www.autronix.de =A0
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
>=20

-------------
Radu Corlan           Snail Mail: Bucuresti sect. 1,=20
rcorlan@pcnet.ro             str. Argentina nr. 28, 71206 Romania

   You can still escape the "Gates" of Hell!  =20
                 Use Linux!                      =20
-------------
