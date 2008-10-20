Received: from az33egw01.freescale.net ([192.88.158.102])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KrqGn-0005Et-5p
	for linux-mtd@lists.infradead.org; Mon, 20 Oct 2008 08:37:45 +0000
Received: from az33smr02.freescale.net (az33smr02.freescale.net [10.64.34.200])
	by az33egw01.freescale.net (8.12.11/az33egw01) with ESMTP id
	m9K8bfEH005900 for <linux-mtd@lists.infradead.org>;
	Mon, 20 Oct 2008 01:37:41 -0700 (MST)
Received: from zch01exm21.fsl.freescale.net (zch01exm21.ap.freescale.net
	[10.192.129.205])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id m9K8bd7U018328
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Oct 2008 03:37:40 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: RE: goofy mtd m25p80 patches in GIT ...
Date: Mon, 20 Oct 2008 16:37:37 +0800
Message-ID: <C3C4D3116BA1F84989E53FCF1F505187166DE9@zch01exm21.fsl.freescale.net>
In-Reply-To: <200810200130.50054.david-b@pacbell.net>
References: <200810191535.05617.david-b@pacbell.net>
	<1224489768.6770.1527.camel@macbook.infradead.org>
	<C3C4D3116BA1F84989E53FCF1F505187166DE0@zch01exm21.fsl.freescale.net>
	<200810200130.50054.david-b@pacbell.net>
From: "Chen Gong-B11801" <G.Chen@freescale.com>
To: "David Brownell" <david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=20

> -----Original Message-----
> From: David Brownell [mailto:david-b@pacbell.net]=20
> Sent: 2008?10?20? 16:31
> To: Chen Gong-B11801
> Cc: David Woodhouse; linux-mtd@lists.infradead.org
> Subject: Re: goofy mtd m25p80 patches in GIT ...
>=20
> On Monday 20 October 2008, Chen Gong-B11801 wrote:
> > I prefer to the first opinion -- renaming 'erase_block' to=20
> 'erase_chip',
> > it looks more straightforward
>=20
> *AND* fixing the name of the operation.
>=20
> The pre-existing erase operations were:
>=20
>  #define OPCODE_BE_4K            0x20    /* Erase 4KiB block */
>  #define OPCODE_BE_32K           0x52    /* Erase 32KiB block */
>  #define OPCODE_SE               0xd8    /* Sector erase=20
> (usually 64KiB) */
>=20
> So I'm quite puzzled why you would call the chip erase
> opcode a "block erase" opcode ... it's not a 4K block,
> not a 32K block, not a sector (of, usually, 64K).

ah, simple, because I'v gotten it from its datasheet (BE means Bulk
Erase, not block erase here) :-)

>=20
> It's more typically something like multiple MBytes.
>=20
> Having read or skimmed several dozen SPI flash specs,
> none of them called chip erase a "block erase" operation.
>=20
>=20
