Received: from mail.mediatrix.com ([205.237.248.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15D7gA-0006Uh-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Jun 2001 17:51:39 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D9954CF@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: =?iso-8859-1?Q?=27K=E1ri_Dav=ED=F0sson=27?= <kd@flaga.is>,
	"MTD mailing list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: RE: jffs2_scan_medium effor
Date: Thu, 21 Jun 2001 12:51:39 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

Thank you Kari for your help. =20

	I tried partionning as you suggested, but I loose a lot of space
because I have two seperate partitions on which I mount JFFS2.  It =
takes the
same space ( roughly 324 KB ) for its own usage per partition.  =
Therefore, I
can't afford the partitioning method to map my flash because I was =
already
tight on it with 324K taken by JFFS2.
=20
	Does someone has ideas about this issue?

Thanks!

Fr=E9d=E9ric Giasson





-----Original Message-----
From: K=E1ri Dav=ED=F0sson [mailto:kd@flaga.is]
Sent: Wednesday, June 20, 2001 11:56 AM
To: Frederic Giasson; MTD mailing list (E-mail)
Subject: RE: jffs2_scan_medium effor


Hi,

Create partitions for you chip.
Make those partitions resemble your flash chip layout, i.e. first
partition is the same size as your boot
monitor, next partiton is same size as the linux kernel image etc....
only mount the parttiton that jffs2 should touch, the others are not
touched.

You can look at cfi_flagadm.c (where I have four partitions,
bootmonitor, kernel image, ramdisk image and=20
a jffs2 partition) and other map drivers on how to set up the
partitions.

Hope this helps,

K.D.

> -----Original Message-----
> From: Frederic Giasson [mailto:fgiasson@mediatrix.com]
> Sent: 20. j=FAn=ED 2001 15:24
> To: MTD mailing list (E-mail)
> Subject: jffs2_scan_medium effor
>=20
>=20
> Hi all,
>=20
> 	I have some sectors on my flash memory that I don't give out to
> jffs2 because they contain boot data that I cannot integrate=20
> to jffs2.  I
> had locked them in a software way in my flash driver by=20
> simply not allowing
> erase calls on those sectors. Up to this morning it had=20
> worked fine.  But
> this morning I checked out last CVS code and now the =
jffs2_scan_medium
> function does not seem to like my lock feature. =20
>=20
> It says: "Cowardly refusing to erase blocks on filesystem=20
> with no valid
> JFFS2 nodes."
>=20
> 	I guess that the way I "mapped" my flash is not MTD's=20
> way.  Could
> someone tell me what should be the "right" way to prevent jffs2 to =
use
> sectors I don't want to give it at mount time?
>=20
> Thanks!
>=20
> Fr=E9d=E9ric Giasson
>=20
>=20
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
