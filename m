Received: from host.kingdommedia.net ([209.239.36.136] helo=host2.fw2.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17PQfD-00046l-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Jul 2002 17:38:03 +0100
Subject: Re: Problems unlinking files
From: Chris AtLee <catlee@canada.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
In-Reply-To: <26464.1024529622@redhat.com>
References: <1024499619.9366.25.camel@geb>   <26464.1024529622@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-3UXxFVlvl6mptagEYQBE"
Date: 02 Jul 2002 12:37:38 -0400
Message-Id: <1025627858.919.28.camel@geb>
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

--=-3UXxFVlvl6mptagEYQBE
Content-Type: multipart/mixed; boundary="=-m+P3uQTgXV/rA0CqhRDk"


--=-m+P3uQTgXV/rA0CqhRDk
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Sorry for the delay, I was on vacation last week.  Attached is a log of
what I get with CONFIG_JFFS2_FS_DEBUG=3D1 and /proc/sys/kernel/printk =3D 9

In addition, I notice that if I keep unlinking the file, the link count
goes from 0 to 65535 then 65534, 65533, ...

I've put up a tarball with my 2.2.18 changes at:
http://atlee.ca/jffs2-2.2.18.tar.gz

Cheers,
Chris

On Wed, 2002-06-19 at 19:33, David Woodhouse wrote:
>=20
> catlee@canada.com said:
> > I've noticed some problems with unlinking files with JFFS2 in my linux
> > 2.2.18 port.  After unlinking a file, it doesn't appear in the
> > directory listing, but if I do an 'ls' on the unlinked file, I can
> > still get information on the file.  I can still read and write to the
> > file, but it refuses to show up in the directory listing. After I
> > unmount the JFFS2 partition and remount it the file isn't there at
> > all.
>=20
> Can you run with CONFIG_JFFS2_FS_DEBUG=3D1 and show the output while you=20
> unlink the file, then open it again?
>=20
> Preferably using a serial console, and they'll be KERN_DEBUG messages so=20
> you'll need to echo 9 > /proc/sys/kernel/printk to make them get printed.
>=20
> > Any ideas?  I'm sure I must have deleted something important getting
> > everything working with linux 2.2.18.
>=20
> Show me your jffs2_unlink() and jffs2_do_unlink() -- and indeed the rest =
of=20
> it :)
>=20
> --
> dwmw2
>=20
>=20
>=20


--=-m+P3uQTgXV/rA0CqhRDk
Content-Disposition: attachment; filename=minicom.cap
Content-Type: text/plain; name=minicom.cap; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: quoted-printable

# touch test2
jffs2_readdir() for dir_i #1
Dirent 0: ".", ino #1
Dirent 1: "..", ino #1
jffs2_readdir() for dir_i #1
jffs2_readdir() for dir_i #1
Dirent 0: ".", ino #1
Dirent 1: "..", ino #1
jffs2_readdir() for dir_i #1
jffs2_lookup()
jffs2_create()
jffs2_new_inode(): dir_i 1, mode 0x81a4
Allocated inocache at c05181d0
jffs2_do_new_inode(): Assigned ino# 29
jffs2_reserve_space(): Requested 0x44 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xf3a0 bytes at 0x1d0c60
jffs2_do_create(): reserved 0xf3a0 bytes
jffs2_add_physical_node_ref(): Node at 0x1d0c60, size 0x44
jffs2_write_dnode wrote node at 0x001d0c60 with dsize 0x0, csize 0x0, node_=
crc 0xe0303e57, data_crc 0x00000000, totlen 0x00000044
jffs2_do_create created file with mode 0x81a4
jffs2_write_dirent(ino #1, name at *0xc04fa304 "test2"->ino #29, name_crc 0=
xd5997a45)
jffs2_add_physical_node_ref(): Node at 0x1d0ca4, size 0x30
jffs2_add_fd_to_list( c01f4e60, c0535b4c (->c01f4f20))
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 41, nr_erasing_blocks 0, dirty_size 0x=
1fcfc (mod 0x1fcfc
): no
jffs2_create: Created ino #29 with mode 100644, nlink 1(1)
# ls -l test2
jffs2_readdir() for dir_i #1
Dirent 0: ".", ino #1
Dirent 1: "..", ino #1
jffs2_readdir() for dir_i #1
jffs2_readdir() for dir_i #1
Dirent 0: ".", ino #1
Dirent 1: "..", ino #1
jffs2_readdir() for dir_i #1
jffs2_readdir() for dir_i #1
Dirent 0: ".", ino #1
Dirent 1: "..", ino #1
-rw-r--r--    1 root     root            0 Jan  1 00:04 test2
# rm test2
jffs2_readdir() for dir_i #1
Dirent 0: ".", ino #1
Dirent 1: "..", ino #1
jffs2_readdir() for dir_i #1
jffs2_readdir() for dir_i #1
Dirent 0: ".", ino #1
Dirent 1: "..", ino #1
jffs2_reserve_space(): Requested 0x30 bytes
jffs2_reserve_space(): alloc sem got
jffs2_do_reserve_space(): Giving 0xf32c bytes at 0x1d0cd4
jffs2_write_dirent(ino #1, name at *0xc04fa304 "test2"->ino #0, name_crc 0x=
d5997a45)
jffs2_add_physical_node_ref(): Node at 0x1d0cd4, size 0x30
jffs2_add_fd_to_list( c01f4920, c0535b4c (->c01f4f20))
Marking old dirent node (ino #29) obsolete
obliterating obsoleted node at 0x001d0ca4
jffs2_complete_reservation()
thread_should_wake(): nr_free_blocks 41, nr_erasing_blocks 0, dirty_size 0x=
1fd2c (mod 0x1fd2c
): no
# ls -l test2
jffs2_readdir() for dir_i #1
Dirent 0: ".", ino #1
Dirent 1: "..", ino #1
jffs2_readdir() for dir_i #1
jffs2_readdir() for dir_i #1
Dirent 0: ".", ino #1
Dirent 1: "..", ino #1
jffs2_readdir() for dir_i #1
jffs2_readdir() for dir_i #1
Dirent 0: ".", ino #1
Dirent 1: "..", ino #1
jffs2_readdir() for dir_i #1
-rw-r--r--    0 root     root            0 Jan  1 00:04 test2
#=20

--=-m+P3uQTgXV/rA0CqhRDk--

--=-3UXxFVlvl6mptagEYQBE
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9IdbSoOgacgDd/cQRAh1gAKCM6GASNZLJCgew+F/5RKZy9BEQGgCePYH+
TQUfRj0LOTqei6zO8Nh5FO8=
=9voV
-----END PGP SIGNATURE-----

--=-3UXxFVlvl6mptagEYQBE--
