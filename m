Received: from zeus.vortex.is ([193.4.145.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15CkFQ-000576-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Jun 2001 16:50:28 +0100
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-71211U5000L1850S0V35) with ESMTP id is
          for <linux-mtd@lists.infradead.org>;
          Wed, 20 Jun 2001 15:55:58 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <linux-mtd@lists.infradead.org>;
          Wed, 20 Jun 2001 15:55:57 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: jffs2_scan_medium effor
Date: Wed, 20 Jun 2001 15:55:57 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E314591D9@kolkrabbi.flaga.is>
From: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: "Frederic Giasson" <fgiasson@mediatrix.com>,
	"MTD mailing list (E-mail)" <linux-mtd@lists.infradead.org>
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
> this morning I checked out last CVS code and now the jffs2_scan_medium
> function does not seem to like my lock feature. =20
>=20
> It says: "Cowardly refusing to erase blocks on filesystem=20
> with no valid
> JFFS2 nodes."
>=20
> 	I guess that the way I "mapped" my flash is not MTD's=20
> way.  Could
> someone tell me what should be the "right" way to prevent jffs2 to use
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
