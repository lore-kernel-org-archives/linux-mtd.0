Received: from mailout04.sul.t-online.com ([194.25.134.18])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cgnec-0006dF-O1
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 12:18:35 -0500
From: stephanwib@t-online.de (Stephan Wiebusch)
To: "'David Woodhouse'" <dwmw2@infradead.org>
Date: Tue, 21 Dec 2004 18:16:07 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1103647590.6111.107.camel@localhost.localdomain>
Message-ID: <1CgneJ-0tuyci0@fwd11.sul.t-online.com>
Cc: linux-mtd@lists.infradead.org
Subject: AW: DOC2000 bootloader
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



-----Urspr=FCngliche Nachricht-----
Von: David Woodhouse [mailto:dwmw2@infradead.org]=20
Gesendet: Dienstag, 21. Dezember 2004 17:47
An: Stephan Wiebusch
Cc: linux-mtd@lists.infradead.org
Betreff: Re: DOC2000 bootloader

On Tue, 2004-12-21 at 17:29 +0100, Stephan Wiebusch wrote:
>=20
> Lilo is able to boot the Kernel, but it ends with: "Kernel panic - not
> syncing. VFS: Unable to mount root on device "<NULL>" or
> unknown-block(254,0)"

You aren't giving a correct 'root=3D' argument to the kernel.

--=20
dwmw2


But my root device is /dev/nftla1, as configured in the lilo.conf.
I used the precompiled lilo from /patches in the MTD-tree. Is it =
possible
that this old version conflicts with the new kernel?
