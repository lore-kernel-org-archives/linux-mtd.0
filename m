Received: from phoenix.infradead.org ([195.224.96.167])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19IVsr-0004T6-CM
	for <linux-mtd@lists.infradead.org>; Wed, 21 May 2003 16:52:05 +0100
Received: from smtp2.crystaltech.com ([216.119.106.211])
	by phoenix.infradead.org with smtp (Exim 4.10)
	id 19ITxG-00064L-00
	for linux-mtd@lists.infradead.org; Wed, 21 May 2003 14:48:31 +0100
From: "John Burch" <jburch@vincisystems.com>
To: "'Jonas Holmberg'" <jonas.holmberg@axis.com>,
	"'David Woodhouse'" <dwmw2@infradead.org>
Date: Wed, 21 May 2003 09:49:30 -0400
Message-ID: <000a01c31f9f$ceb90940$1200a8c0@JOHNB>
MIME-Version: 1.0
In-Reply-To: <3C6BEE8B5E1BAC42905A93F13004E8AB01CAF732@mailse01.axis.se>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
cc: =?iso-8859-1?Q?'J=F6rn_Engel'?= <joern@wohnheim.fh-wedel.de>
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

> > > Also, does the mtd driver for AMD CFI devices handle
> > > AMD's ability to support erasure of multiple sectors=20
> simultaneously?
> >=20
> > Probably not yet, but there's no reason why it shouldn't.=20
> Criticism in=20
> > 'diff -u' form is preferred :)
> >=20
>=20
> Is this chip-feature "probable"? We used to do simutaneous=20
> erases in a bootloader, but after a while we started using=20
> chips that couldn't do that so we had to change the behaviour=20
> to be able to handle all sorts of chips. I'm not sure if CFI=20
> covers that particular feature, but it would be great if it=20
> did. It wouldn't be so great to have to check JEDEC IDs...
>=20

As far as I know, the feature is unique to AMD though I don't know if it
is supported across their entire product line.  Also, it is not a CFI
specific feature.  For example, it's discussed in the 29LV008B (not a
CFI compliant device) data sheet under the "Sector Erase Command
Sequence" section.
