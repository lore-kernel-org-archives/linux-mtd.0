Received: from smtp2.crystaltech.com ([216.119.106.211])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19IpL1-0007ps-Bc
	for <linux-mtd@lists.infradead.org>; Thu, 22 May 2003 13:38:27 +0100
From: "John Burch" <jburch@vincisystems.com>
To: =?iso-8859-1?Q?'J=F6rn_Engel'?= <joern@wohnheim.fh-wedel.de>
Date: Thu, 22 May 2003 08:40:59 -0400
Message-ID: <000301c3205f$669ca630$1200a8c0@JOHNB>
MIME-Version: 1.0
In-Reply-To: <20030521155703.GA30187@wohnheim.fh-wedel.de>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
cc: 'David Woodhouse' <dwmw2@infradead.org>
cc: 'Jonas Holmberg' <jonas.holmberg@axis.com>
cc: linux-mtd@lists.infradead.org
Subject: RE: Mtd block access (jffs2 formatted) and mtd char
 access(unformatted) on different partitions of a single flashdevice
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> >=20
> > Not that I know of.  I think the best case scenario would=20
> be that all=20
> > AMD devices supported it - then only the manuf ID would have to be=20
> > checked.  However, that would have to be confirmed by AMD.
>=20
>=20
> If I read this correctly, AMD won't confirm your assumption.
>=20

AMD has confirmed that all of their flash devices support the multiple
sector erase capability as described in their datasheets under "Sector
Erase Command Sequence".  Note that it requires that any additional
erase commands be written within 50us of the previous erase command.
