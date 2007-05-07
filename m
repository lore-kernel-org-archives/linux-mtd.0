Received: from arroyo.ext.ti.com ([192.94.94.40])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hl1u9-0000sY-Rw
	for linux-mtd@lists.infradead.org; Mon, 07 May 2007 08:01:27 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: How to implement JFFS2 filesystem on NAND
Date: Mon, 7 May 2007 07:01:10 -0500
Message-ID: <3B6D69C3A9EBCA4BA5DA60D913027429EAA69D@dlee13.ent.ti.com>
In-Reply-To: <42E999AD7A0E4647BF159F467EE4FBCB017B50DF@BLR-SGM-MSG01.wipro.com>
References: <42E999AD7A0E4647BF159F467EE4FBCB017B50DF@BLR-SGM-MSG01.wipro.com>
From: "Woodruff, Richard" <r-woodruff2@ti.com>
To: <sathish.madhava@wipro.com>, <linux-omap-open-source@linux.omap.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>=20
> VFS: Mounted root (jffs2 filesystem).
>=20
> Freeing init memory: 124K
>=20
> Warning: unable to open an initial console.
>=20
> /sbin/init exit code: -2
>=20
> /etc/init exit code: -2
>=20
> /bin/init exit code: -2
>=20
> /bin/sh exit code: -2
>=20
> Kernel panic - not syncing: No init found.  Try passing init=3D option
to
> kernel.

Looks like your file system has no device nodes in /dev.

For older kernels devfs would allow this to work.  On newer ones you
need all your nodes, or a properly configured udev, and some hotplug
support.

Regards,
Richard W.
