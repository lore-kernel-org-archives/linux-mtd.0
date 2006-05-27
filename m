Received: from moutng.kundenserver.de ([212.227.126.183])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fk4Kx-0005gN-6H
	for linux-mtd@lists.infradead.org; Sat, 27 May 2006 15:20:42 -0400
From: Johannes Niess <linux@johannes-niess.de>
To: linux-mtd@lists.infradead.org
Date: Sat, 27 May 2006 21:20:11 +0200
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1565851.AX4l17nQIT";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200605272120.19348.linux@johannes-niess.de>
Subject: mtd2block should not expand sparse loopback files
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart1565851.AX4l17nQIT
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi list,

Thank you all for providing mtd and jffs2. I'm using it a little bit differ=
ent=20
than intended and it looks like the crash recovery feature is causing me=20
trouble. I'm trying to save disk space on my gentoo installation for an old=
=20
notebook. AFAIK jffs2 is  the only way to provide transparent read and writ=
e=20
access with compression. Other FS can be used with sparse loopback files an=
d=20
do not occupy disk space for unused blocks ("Over commiting disk space"=20
becomes feasible). I want to combine the features, e. g. to=20
store /usr/portage in a sparse loopback file formated with jffs2.

I tried this:

# make1G sparse loop file, taking 1M real disk space
dd if=3D/dev/null of=3Dsparse.jffs2 bs=3D1M count=3D1000 seek=3D1000
# mount it as loop device
losetup /dev/loop/0 sparse.jffs2
# make a jffs2 file system on it
mkfs.jffs2 -o /dev/loop/0 -d /emptydir
# convert it into a mtd
modprobe block2mtd block2mtd=3D/dev/loop/0
# mount the mtd device
mount -t jffs2 /dev/mtdblock0 /mnt/somewhere

The jffs2 is readable and writable as expected. BUT upon first mount a coup=
le=20
of pdflush (pseudo kernel) processes become active and completely expand th=
e=20
sparse loopback file. Only after that disk activity has settled, "ls" and=20
"du" give identical numbers of 1GB. Before mounting "ls" gives the maximum=
=20
size and "du" just counts occupied sectors, e. g. "ls" gives 1 GB and "du"=
=20
only 1 MB.

"od -h sparse.jffs2|less" gives a repeating pattern after mount:

*
617750000 1985 2003 000c 0000 b0b1 e41e ffff ffff
617750020 ffff ffff ffff ffff ffff ffff ffff ffff
*
617760000 1985 2003 000c 0000 b0b1 e41e ffff ffff
617760020 ffff ffff ffff ffff ffff ffff ffff ffff
*

I guess that the "fill with 1's" flash strategy is taking its toll together=
=20
with the "Clean" markers. Can I switch that off? Using
"mkfs.jffs2 --no-cleanmarkers"  does not help, as does  --eraseblock=3D0.

block2mtd should not touch unused blocks at all in this setup. They should=
=20
only be written to on first use for storing real data.

Please make transparent compression AND loop file expansion on demand=20
possible. Thank you very much for your work!

Johannes Nie=DF

--nextPart1565851.AX4l17nQIT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBEeKZzZ86b9aw2E+0RAkN5AKCtZ+1TKDPzyOIedVkwoKxjoXrOXwCfQk1Q
XeLHiGiOaU8PvIe98k0ZZEg=
=zU8l
-----END PGP SIGNATURE-----

--nextPart1565851.AX4l17nQIT--
