Received: from ztxmail04.ztx.compaq.com ([161.114.1.208])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C8oQB-0005BP-QQ
	for linux-mtd@lists.infradead.org; Sat, 18 Sep 2004 19:15:15 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Sep 2004 18:14:52 -0500
Message-ID: <C50AB9511EE59B49B2A503CB7AE1ABD108F82153@cceexc19.americas.cpqcorp.net>
From: "Cagle, John" <john.cagle@hp.com>
To: "Christian Borntraeger" <linux-kernel@borntraeger.net>,
	<linux-kernel@vger.kernel.org>, "Andrew Morton" <akpm@osdl.org>,
	"Torben Mathiasen" <device@lanana.org>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: RE: [Patch][RFC] conflicting device major numbers in devices.txt
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: Christian Borntraeger [mailto:linux-kernel@borntraeger.net]=20
> Sent: Saturday, September 18, 2004 5:04 PM
> To: linux-kernel@vger.kernel.org; Andrew Morton; Torben Mathiasen
> Cc: Cagle, John
> Subject: [Patch][RFC] conflicting device major numbers in devices.txt
>=20
> Hi all,
>=20
> some month ago a change to Documentation/devices.txt was=20
> submitted by John=20
> Cagle.=20
>=20
> http://linux.bkbits.net:8080/linux-2.6/cset%4040586a32fpYGPUC8
> ysFeU7GIfmmdUA
>=20
> The patch changed the major number of the s/390 dasd devices=20
> from 94 to 95.=20
> As you can see in include/major.h and=20
> drivers/s390/block/dasd.c the change=20
> to the documentation was bogus. The dasd device driver was=20
> using and will=20
> be using major number 94.=20
>=20
> Unfortunately, the "Inverse NAND Flash Translation Layer",=20
> which was added=20
> somewhen during 2.5 now uses the same major number.
>=20
> I attached a patch to restore the old state but I am not=20
> sure, how to deal=20
> with the inftla driver.=20
>=20
>=20
> Patch to restore the old state
<snip>

Christian,

Good catch.  The patch that originally corrected this (which is
contained within the bitkeeper patch you can view at
http://tinyurl.com/34zoy ) never made it to LANANA, so the
correction of dasd from 95 to 94 was never in our repository.
The recent update of devices.txt into the 2.5 kernel came from
our repository so it contains the same error.

I'm copying David Woodhouse and the Linux-MTD project who (I
think) are the maintainers of the inftl driver.  Hopefully, they
will be kind enough to accept a new block major for the inftl
driver.  If not, there's probably little chance of device conflict
in real-world use, since intftl is for embedded systems which
probably will not be attached to S/390 storage devices.

Torben -- please correct this in devices.txt and find a new block
major for the Linux-MTD project (if they will accept it).

Thanks,
John Cagle
(former LANANA maintainer)
