Received: from host.kingdommedia.net ([209.239.36.136] helo=host2.fw2.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173jUu-0005kn-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 May 2002 21:17:44 +0100
Received: from localhost (CPE0080c8df51b7.cpe.net.cable.rogers.com [24.112.28.188])
	by host2.fw2.com (8.10.2/8.10.2) with ESMTP id g43KHhT22315
	for <linux-mtd@lists.infradead.org>; Fri, 3 May 2002 16:17:43 -0400
Received: from [10.0.0.19] (helo=localhost.localdomain ident=slayne)
	by localhost with esmtp (Exim 3.12 #1 (Debian))
	id 173jUt-0006XM-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 May 2002 16:17:43 -0400
Subject: Re: A few questions (cramfs as root, flash permissions and JFFS2 on
	2.2.18)
From: Chris AtLee <catlee@canada.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1020452092.878.45.camel@geb>
References: <1020452092.878.45.camel@geb>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-8z7srWFAmgfHfJoIysaV"
Date: 03 May 2002 16:17:42 -0400
Message-Id: <1020457063.12077.52.camel@geb>
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

--=-8z7srWFAmgfHfJoIysaV
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

> My second question has to do with protection on the flash chip itself.=20
> Whenever I try to mount a jffs image I get lots of errors saying that
> Erasing failed horribly.  So I tried the erase and eraseall utilities
> and get the message that I'm trying to erase a Read-Only filesystem.  My
> bootloader allows me to peek and poke memory manually, so I played
> around with locking / unlocking sections of flash and it seems that I
> can lock and unlock blocks of flash just fine, it's just that they
> aren't reported correctly by the Read Configuration command...Is this
> what is meant by "Legacy lock/unlock" in the MTD debug output?  MTD
> detects this at unsupported on my unit.

Ok, I fixed this problem by adding a command to mtd->unlock for the
addresses corresponding to the partition I want to be read/write.  Is
this the correct solution?

Cheers,
Chris

--=-8z7srWFAmgfHfJoIysaV
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA80vBmoOgacgDd/cQRAgwzAJ0W6QwKsJQSDY1FpldzeTKX21pkbgCeL1hg
fzCWJudxI8h9ZrED4yOv/uY=
=cLId
-----END PGP SIGNATURE-----

--=-8z7srWFAmgfHfJoIysaV--
