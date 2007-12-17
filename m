Received: from mailrelay009.isp.belgacom.be ([195.238.6.176])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J4IiU-0007j7-M0
	for linux-mtd@lists.infradead.org; Mon, 17 Dec 2007 16:21:25 +0000
Received: from mail.technotrade.biz (localhost [127.0.0.1])
	by mail.technotrade.biz (Postfix) with ESMTP id 3614A4E76
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Dec 2007 11:12:38 +0100 (CET)
Received: from pclaurent.technotrade.biz (pclaurent.technotrade.biz
	[192.168.1.47])
	by mail.technotrade.biz (Postfix) with ESMTP id E3E1E40CA
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Dec 2007 11:12:37 +0100 (CET)
From: Laurent Pinchart <laurentp@cse-semaphore.com>
To: linux-mtd@lists.infradead.org
Subject: Deadlock while accessing mtdchar device while erase in progress
MIME-Version: 1.0
Date: Mon, 17 Dec 2007 11:12:34 +0100
Content-Type: multipart/signed; boundary="nextPart3305129.2DHfmoRlAr";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200712171112.36903.laurentp@cse-semaphore.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart3305129.2DHfmoRlAr
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi everybody,

I'm having troubles fixing an MTD-related deadlock. I'm not sure if the=20
problem comes from an MTD and/or JFFS2 kernel bug, or from some userspace=20
operation performed as root that I shouldn't have started in the first plac=
e.=20
I'd appreciate if someone could share his thoughts (and experience :-)) abo=
ut=20
this.

Some background.

My embedded system has a single NOR flash chip (cfi_cmdset_0002 driver) wit=
h=20
128kB sectors. Flash space is divided in 4 partitions, the last one used wi=
th=20
a JFFS2 filesystem.

A userspace process run as root sets its scheduling policy to SCHED_RR. It=
=20
writes 400kB of data to the JFFS2 filesystem and restarts by exec()ing=20
itself, inheriting the SCHED_RR policy.

Soon after being restarted, it opens /dev/mtd0 (boot loader partition) and=
=20
reads a few bytes of data. It then close() /dev/mtd0, at which point the=20
kernel deadlocks.

I added debugging messages to the MTD subsystem and it turned out my proces=
s=20
blocks in cfi_amdstd_sync (drivers/mtd/chips/cfi_cmdset_0002.c). chip->stat=
e=20
is set to FL_ERASING, and the kernel keeps scheduling in the default case.

I'm not sure what goes wrong. I expect the JFFS2 garbage collector to have=
=20
kicked in. It might be erasing sectors when I close() /dev/mtd0, at which=20
point the mtdchar driver tries to sync() the flash and locks in=20
cfi_amdstd_sync because my process, being scheduled with a SCHED_RR policy,=
=20
never gives the JFFS2 garbage collector a chance to run. That's just a wild=
=20
guess though.

Any help regarding how to better diagnose the problem (to confirm or reject=
=20
the above suspicion) will be appreciated. A fix would be even more=20
welcome :-)

Best regards,

=2D-=20
Laurent Pinchart
CSE Semaphore Belgium

Chauss=E9e de Bruxelles, 732A
B-1410 Waterloo
Belgium

T +32 (2) 387 42 59
=46 +32 (2) 387 42 75

--nextPart3305129.2DHfmoRlAr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBHZkuU8y9gWxC9vpcRAvyqAJ4jTG2Od7pPdIaEBJGlWeM8tyeozwCghrty
Iza6rHgxSrWdyarVSk5xmUU=
=wOt5
-----END PGP SIGNATURE-----

--nextPart3305129.2DHfmoRlAr--
