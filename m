Received: from exprod6og115.obsmtp.com ([64.18.1.35])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LWZRS-0004GD-W5
	for linux-mtd@lists.infradead.org; Mon, 09 Feb 2009 16:57:10 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH] [MTD] NAND: add ts7xxx driver
Date: Mon, 9 Feb 2009 11:56:25 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090120BF36@mi8nycmail19.Mi8.com>
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
>address and parititoning schemes) have been moved into
> platform specific files whilst the driver it's self can
> be used as a complete replacement for the ts7250 NAND driver.
>
> [1] http://www.embeddedarm.com/products/arm-sbc.php
>
> Signed-off-by: Alexander Clouter <alex@digriz.org.uk>

With a little work the generic plat_nand driver could probably be used
instead of this new driver or the original ts7250 driver.

The only thing special about the original ts7250 driver appears to be
the fall-back partitioning scheme that uses the size of the device to
figure out what static mtd_partition table to use.

This driver uses a similar approach but passes a callback to the
platform driver to use instead.  It also adds some conditional ecc
support.

It might be more useful to create a generic patch for plat_nand that
adds this functionality and then obsolete the old ts7250 driver.

I have been using the plat_nand driver on a custom ep93xx based board
for quite a while with no problems.

Regards,
Hartley
