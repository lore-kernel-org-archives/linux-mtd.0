Received: from phoenix.mvhi.com ([195.224.96.167] helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19IUkR-0003tk-Kb
	for <linux-mtd@lists.infradead.org>; Wed, 21 May 2003 15:39:19 +0100
Received: from smtp2.crystaltech.com ([216.119.106.211])
	by phoenix.infradead.org with smtp (Exim 4.10)
	id 19IUgP-0006DA-00
	for linux-mtd@lists.infradead.org; Wed, 21 May 2003 15:35:09 +0100
From: "John Burch" <jburch@vincisystems.com>
To: =?iso-8859-1?Q?'J=F6rn_Engel'?= <joern@wohnheim.fh-wedel.de>
Date: Wed, 21 May 2003 10:36:14 -0400
Message-ID: <000b01c31fa6$561c8e10$1200a8c0@JOHNB>
MIME-Version: 1.0
In-Reply-To: <20030521135230.GA18635@wohnheim.fh-wedel.de>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
cc: 'Jonas Holmberg' <jonas.holmberg@axis.com>
cc: 'David Woodhouse' <dwmw2@infradead.org>
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

>=20
> On Wed, 21 May 2003 09:49:30 -0400, John Burch wrote:
> >=20
> > As far as I know, the feature is unique to AMD though I=20
> don't know if=20
> > it is supported across their entire product line.  Also, it=20
> is not a=20
> > CFI specific feature.  For example, it's discussed in the 29LV008B=20
> > (not a CFI compliant device) data sheet under the "Sector Erase=20
> > Command Sequence" section.
>=20
> Is there a way to know if a given chip supports this feature=20
> without checking the chip id against a table?
>=20

Not that I know of.  I think the best case scenario would be that all
AMD devices supported it - then only the manuf ID would have to be
checked.  However, that would have to be confirmed by AMD.

John
