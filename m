Received: from mail.2d3d.co.za ([196.14.185.200])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15AuAk-0005rI-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Jun 2001 15:02:03 +0100
Date: Fri, 15 Jun 2001 16:08:05 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: latest jffs2 troubles
Message-ID: <20010615160805.A5977@crystal.2d3d.co.za>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline
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

--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I've booted up with jffs2 once or twice without any problems. Now I'm
suddenly getting:

------------< snip <------< snip <------< snip <------------
NetWinder Floating Point Emulator V0.95 (c) 1998-1999 Rebel.com
jffs2_scan_dirent_node(): Name CRC failed on node at 0x001c093c: Read
0x49ccf4da, calculated 0x2
77fb134
jffs2_scan_dirent_node(): Name CRC failed on node at 0x001c0ae8: Read
0x2d13ab07, calculated 0x8
a10a00e
jffs2_scan_dirent_node(): Name CRC failed on node at 0x001c0b70: Read

<snip - you get the idea>

jffs2_scan_dirent_node(): Name CRC failed on node at 0x001ff124: Read
0x7b8205c6, calculated 0x2
49aa88f
jffs2_scan_dirent_node(): Name CRC failed on node at 0x001ff1ac: Read
0x37b02647, calculated 0x3
541df4d
VFS: Mounted root (jffs2 filesystem) readonly.
------------< snip <------< snip <------< snip <------------

and then I get the following in one of my libs:

------------< snip <------< snip <------< snip <------------
updating /etc/ld.so.*: ld.so.conf ld.so.preloadldconfig:
/lib/libnss_files.so.2 is not an ELF fi
le - it has the wrong magic bytes at the start.

ldconfig: /lib/libnss_files.so is not an ELF file - it has the wrong magic
bytes at the start.

ldconfig: /lib/libnss_files.so.2 is not a symbolic link

ldconfig: /usr/lib/libnss_files.so.2 is not an ELF file - it has the wrong
magic bytes at the st
art.

ldconfig: /usr/lib/libnss_files.so is not an ELF file - it has the wrong
magic bytes at the star
t.

ldconfig: /usr/lib/libnss_files.so.2 is not a symbolic link
------------< snip <------< snip <------< snip <------------

I've tried rewriting the image, change a few things here or there - same
thing. Any ideas why this happens or what exactly it's complaining about?

--=20

Regards
 Abraham

I guess it was all a DREAM ... or an episode of HAWAII FIVE-O ...

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7KhbFzNXhP0RCUqMRAl58AJ9EH1RoSr0UU9QKxIsWybqfeZHUaACgiB/9
TCYrdy+1BJOafrXJtKcPcQY=
=wwrD
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
