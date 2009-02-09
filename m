Received: from exprod6og110.obsmtp.com ([64.18.1.25])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LWbNf-0004D5-T4
	for linux-mtd@lists.infradead.org; Mon, 09 Feb 2009 19:01:22 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH] [MTD] NAND: add ts7xxx driver
Date: Mon, 9 Feb 2009 14:00:48 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090120BFB5@mi8nycmail19.Mi8.com>
In-Reply-To: <20090208085919.GD11872@woodchuck>
References: <20090208085919.GD11872@woodchuck>
From: "hartleys" <hartleys@visionengravers.com>
To: "Alexander Clouter" <alex@digriz.org.uk>, <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sunday, February 08, 2009 1:59 AM, Alexander Clouter wrote:
> This patch adds support for the NAND found in Technologic
> Systems ARM boards[1].  The platform specific parts (IO=20
> address and parititoning schemes) have been moved into
> platform specific files whilst the driver it's self can=20
> be used as a complete replacement for the ts7250 NAND
> driver.
>
> [1] http://www.embeddedarm.com/products/arm-sbc.php
>
> Signed-off-by: Alexander Clouter <alex@digriz.org.uk>

I think the TS-7800 series is Marvell 88F5182 based but the TS-7200
series is Cirrus ep93xx based.

There is are already a nand driver for each of these, orion_nand.c and
ts7250.c.  Both appear to be just variations of the plat_nand.c driver.

Hartley
