Received: from host.kingdommedia.net ([209.239.36.136] helo=host2.fw2.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173iCj-0005bw-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 May 2002 19:54:53 +0100
Received: from localhost (CPE0080c8df51b7.cpe.net.cable.rogers.com [24.112.28.188])
	by host2.fw2.com (8.10.2/8.10.2) with ESMTP id g43Isqx04887
	for <linux-mtd@lists.infradead.org>; Fri, 3 May 2002 14:54:52 -0400
Received: from [10.0.0.19] (helo=localhost.localdomain ident=slayne)
	by localhost with esmtp (Exim 3.12 #1 (Debian))
	id 173iCi-0006Vj-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 May 2002 14:54:52 -0400
Subject: A few questions (cramfs as root, flash permissions and JFFS2 on
	2.2.18)
From: Chris AtLee <catlee@canada.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-lr84uXUKzmKmk26KagDH"
Date: 03 May 2002 14:54:51 -0400
Message-Id: <1020452092.878.45.camel@geb>
Mime-Version: 1.0
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

--=-lr84uXUKzmKmk26KagDH
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi there,

I'm trying to get MTD (from CVS as of a few days ago) up and running on
my embedded device which is using an Intel Strataflash 4 MB flash chip
(mapped into physical memory) and running linux 2.2.18.

I've created my own mapping which defines four partitions: bootloader,
kernel, applications and data.  At this point I am able to boot up the
unit from mtdblock2 with a romfs image on it and then mount cramfs
images from mtdblock3.

My first question is, why can I not use a cramfs image on the boot
partition?  Whenever I try, I get a message "VFS mounting root
filesystem (cramfs)", then "Warning: could not open initial console" and
then it complains that it can't find "init"

My second question has to do with protection on the flash chip itself.=20
Whenever I try to mount a jffs image I get lots of errors saying that
Erasing failed horribly.  So I tried the erase and eraseall utilities
and get the message that I'm trying to erase a Read-Only filesystem.  My
bootloader allows me to peek and poke memory manually, so I played
around with locking / unlocking sections of flash and it seems that I
can lock and unlock blocks of flash just fine, it's just that they
aren't reported correctly by the Read Configuration command...Is this
what is meant by "Legacy lock/unlock" in the MTD debug output?  MTD
detects this at unsupported on my unit.

My third question is what's the status (if any) of jffs2 on 2.2.18
kernel?

Thanks!
Chris



--=-lr84uXUKzmKmk26KagDH
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA80tz7oOgacgDd/cQRAo9EAJsEXNeYg1iWi2qb0ilhcBHhmp337gCgopJG
9tzlG8AWUwJGQJvbdWa1ku8=
=KkGA
-----END PGP SIGNATURE-----

--=-lr84uXUKzmKmk26KagDH--
