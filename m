Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JpLod-0004Ph-7V
	for linux-mtd@lists.infradead.org; Fri, 25 Apr 2008 11:10:09 +0000
Received: from az33smr01.freescale.net (az33smr01.freescale.net [10.64.34.199])
	by az33egw02.freescale.net (8.12.11/az33egw02) with ESMTP id
	m3PBA2i1019584 for <linux-mtd@lists.infradead.org>;
	Fri, 25 Apr 2008 04:10:03 -0700 (MST)
Received: from zch01exm26.fsl.freescale.net (zch01exm26.ap.freescale.net
	[10.192.129.221])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id m3PBA0kB011693
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Apr 2008 06:10:01 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH] MTD: fix partition scan control logic in physmap_ofand
	fsl_elbc_nand
Date: Fri, 25 Apr 2008 19:09:59 +0800
Message-ID: <989B956029373F45A0B8AF029708189002007C8F@zch01exm26.fsl.freescale.net>
In-Reply-To: <1208890162.9212.646.camel@pmac.infradead.org>
References: <1204201051-13107-1-git-send-email-leoli@freescale.com>
	<1208890162.9212.646.camel@pmac.infradead.org>
From: "Li Yang" <LeoLi@freescale.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: linuxppc-dev@ozlabs.org, Stefan Roese <sr@denx.de>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]=20
> Sent: Wednesday, April 23, 2008 2:49 AM
> To: Li Yang
> Cc: linux-mtd@lists.infradead.org; Stefan Roese;=20
> linuxppc-dev@ozlabs.org
> Subject: Re: [PATCH] MTD: fix partition scan control logic in=20
> physmap_ofand fsl_elbc_nand
>=20
> On Thu, 2008-02-28 at 20:17 +0800, Li Yang wrote:
> > The generic rule for partition scan is to try all supported=20
> partition=20
> > types before an usable partition table is found.
> > However the original code returns unsuccessful when there=20
> is an error=20
> > in any of the partition types.
> >=20
> > Signed-off-by: Li Yang <leoli@freescale.com>
> > Cc: Stefan Roese <sr@denx.de>
> > Cc: Peter Korsgaard <jacmet@sunsite.dk>
> > ---
> > I later found that Stefan has proposed a similar patch for=20
> physmap_of=20
> > and Peter proposed another patch to fix cmdlinepart instead.
> > I'd say that even after cmdlinepart patch is applied the=20
> scan control=20
> > logic still needs to be fixed.
>=20
> I'm not convinced. I think the partition code should return=20
> an error if it hits a hard error, like a failure to read from=20
> the device. And return zero when it doesn't find anything.

The error can also be soft error like a typo in the cmdline or device
tree.  I could be better to try other ways to see if we can find a sane
partition table than just to fail.

- Leo
