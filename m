Received: from host.kingdommedia.net ([209.239.36.136] helo=host2.fw2.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173uKf-0006YU-00
	for <linux-mtd@lists.infradead.org>; Sat, 04 May 2002 08:51:53 +0100
Received: from localhost (CPE0080c8df51b7.cpe.net.cable.rogers.com [24.112.28.188])
	by host2.fw2.com (8.10.2/8.10.2) with ESMTP id g447ppT02331
	for <linux-mtd@lists.infradead.org>; Sat, 4 May 2002 03:51:51 -0400
Received: from [10.0.0.19] (helo=localhost.localdomain ident=slayne)
	by localhost with esmtp (Exim 3.12 #1 (Debian))
	id 173uKd-0006gU-00
	for <linux-mtd@lists.infradead.org>; Sat, 04 May 2002 03:51:51 -0400
Subject: Writing to flash problems
From: Chris AtLee <catlee@canada.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-I/22mR5gOxs90eegAKtY"
Date: 04 May 2002 03:51:50 -0400
Message-Id: <1020498711.12077.72.camel@geb>
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

--=-I/22mR5gOxs90eegAKtY
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hello again,

After figuring out how to unlock my flash partition, I've been
experimenting with writing to it.  Erasing the partition seems to work
perfectly.

I have a file which contains 2 characters:
12

First I erase the partition with eraseall /dev/mtd3

Then I write data to the partition with
mtd_debug write /dev/mtd3 0 2 data

I retrieve the data with
mtd_debug read /dev/mtd3 0 2 data.new

The contents of data.new is 2 characters:
11

Now, if I repeat the process (without erasing) with the data 22, the new
contents of data.new is 00.

So to me it looks like I have two problems: writing to the words
themselves is not functioning, and the only way to set bits to 1 is by
erasing ('0' =3D=3D '1' & '2').  In fact, this is in the documentation for
the flash: "If users attempt to program "1"s, the memory cell contents
do not change and no error occurs."

So it looks like I need to erase before writing to fix my second
problem.  I've tried putting in an erase command in do_write_oneword,
but I get timeout errors.

I'd really appreciate any pointers!

Thanks,
Chris





--=-I/22mR5gOxs90eegAKtY
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA805MWoOgacgDd/cQRAsZOAKCev9CNUfNKpj42JhbEe5wWhj4xqgCdFf98
E6SXCQ/eL97CnvqyPocDdWs=
=OiQO
-----END PGP SIGNATURE-----

--=-I/22mR5gOxs90eegAKtY--
