Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KrpG8-0000lJ-50
	for linux-mtd@lists.infradead.org; Mon, 20 Oct 2008 07:33:00 +0000
Received: from az33smr01.freescale.net (az33smr01.freescale.net [10.64.34.199])
	by az33egw02.freescale.net (8.12.11/az33egw02) with ESMTP id
	m9K7WsWs010070 for <linux-mtd@lists.infradead.org>;
	Mon, 20 Oct 2008 00:32:56 -0700 (MST)
Received: from zch01exm21.fsl.freescale.net (zch01exm21.ap.freescale.net
	[10.192.129.205])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id m9K7Wqwo021250
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Oct 2008 02:32:53 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: goofy mtd m25p80 patches in GIT ...
Date: Mon, 20 Oct 2008 15:32:50 +0800
Message-ID: <C3C4D3116BA1F84989E53FCF1F505187166DAE@zch01exm21.fsl.freescale.net>
In-Reply-To: <200810191535.05617.david-b@pacbell.net>
References: <200810191535.05617.david-b@pacbell.net>
From: "Chen Gong-B11801" <G.Chen@freescale.com>
To: "David Brownell" <david-b@pacbell.net>,
	"David Woodhouse" <David.Woodhouse@intel.com>
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
> Second:
>=20
> =20
> http://git.kernel.org/?p=3Dlinux/kernel/git/dwmw2/mtd-2.6.git;a=3D
> commitdiff;h=3D75d0ee2202b5740e94e913d8a52f91c6557c4c81
>=20
> That's just plain wrong ... the original code is correct, but the
> patch changed it to be incorrect.  (DMA from the stack is never
> legal.)
>=20
> Just revert this one entirely.
>=20
>=20
I know spi_write_then_read is different from spi_write, but here n_rx & =
rxbuf are
both NULL, which means no real read operation are executed. Would you =
please
give me more explanation for potential hazard ?
