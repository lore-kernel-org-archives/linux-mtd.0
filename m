Received: from phoenix.infradead.org ([195.224.96.167])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 186rZh-0000Vw-00
	for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2002 12:03:53 +0000
Received: from dsl-205-210-52-188.kingston.net ([205.210.52.188] helo=linux.interlinx.bc.ca)
	by phoenix.infradead.org with esmtp (Exim 4.10)
	id 186AL0-0003rM-00
	for linux-mtd@lists.infradead.org; Mon, 28 Oct 2002 13:53:51 +0000
Date: Mon, 28 Oct 2002 08:48:32 -0500
To: linux-mtd@lists.infradead.org
Subject: MTD Config.in items not escaped by bus availability
Message-ID: <20021028134832.GQ27880@pc.ilinx>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b6Y3a1uK/7FdRsLm"
Content-Disposition: inline
From: "Brian J. Murrell" <cc718ee62b87e84e665d57aa27e6bf39@interlinx.bc.ca>
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

--b6Y3a1uK/7FdRsLm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I have noticed that the whole MTD kernel configuration subsystem
(drivers/mtd/Config.in) in the 2.4.19 kernel is not escaped by any bus
configuration items.  That is, even on a kernel that I configure with
no busses (i.e. UML), I am still asked about MTD devices.  Should ths
really be so?  How can I have any MTD devices with no bus to connect
them to?

If this is the case, can I ask, somebody who knows better than I do,
can you please modify the Config.in for MTD and wrap the whole thing
with a test for the presence of configuration items for the various
different busses that MTD supports?  Something like:


mainmenu_option next_comment
comment 'Memory Technology Devices (MTD)'

if [ "$CONFIG_PCMCIA" =3D "y" -o "$CONFIG_PCMCIA" =3D "m" -o
     "$CONFIG_USB" =3D "y" -o "$CONFIG_USB" =3D "m" ]; then
    tristate 'Memory Technology Device (MTD) support' CONFIG_MTD
    ...
fi

endmenu

Thanx,
b.

--=20
Brian J. Murrell

--b6Y3a1uK/7FdRsLm
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9vUAwl3EQlGLyuXARAq8sAKDggM0r6NYMdRUO7UVdEIRUQiq4IwCeKUxB
Nuccyz6RDGUAPavxD4D0ZLQ=
=7MBR
-----END PGP SIGNATURE-----

--b6Y3a1uK/7FdRsLm--
