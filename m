Received: from smtp2.crystaltech.com ([216.119.106.211])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ISkU-0003S7-Vn
	for <linux-mtd@lists.infradead.org>; Wed, 21 May 2003 13:31:15 +0100
From: "John Burch" <jburch@vincisystems.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>,
	=?iso-8859-1?Q?'J=F6rn_Engel'?= <joern@wohnheim.fh-wedel.de>
Date: Wed, 21 May 2003 08:33:44 -0400
Message-ID: <000701c31f95$38ad1040$1200a8c0@JOHNB>
MIME-Version: 1.0
In-Reply-To: <1053509146.20074.2584.camel@passion.cambridge.redhat.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
> > What does "driver" mean? If you have two in-kernel drivers for the=20
> > same flash chip, they will use different locks and things=20
> will break.=20
> > If that is a user-space driver, using the /dev/mtdX=20
> devices, you are=20
> > perfectly safe. Which one is it?
>=20
> Hmmm. What he actually said was 'driver with its own flash=20
> support', which sounds bad. As long as everything accessing=20
> the flash goes through the MTD driver for the flash, using=20
> its read/write/erase functions rather than banging on the=20

When accessing "raw" flash via the char driver, how can I initiate a
sector erase?  Also, does the mtd driver for AMD CFI devices handle
AMD's ability to support erasure of multiple sectors simultaneously?

> hardware directly, it'll be fine. If your raw driver is=20
> actually dealing with the flash driver directly, that's broken.
>=20

David has it right.  The raw "in-kernel" driver deals with flash
directly on its own, not through mtd.
