Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRbo0-0000cS-87
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2013 05:50:33 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>
Subject: RE: [PATCH] Staging: MTD: Micron SPINAND Driver support
Date: Thu, 3 Oct 2013 05:49:58 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA19568@DBDE04.ent.ti.com>
References: <1378128136-23699-1-git-send-email-kamlakant.patel@broadcom.com>
 <1380620038-25643-1-git-send-email-kamlakant.patel@broadcom.com>
 <20131002184547.GR23337@ld-irv-0074.broadcom.com>
In-Reply-To: <20131002184547.GR23337@ld-irv-0074.broadcom.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Kamlakant Patel <kamlakant.patel@broadcom.com>,
 "manonuevo@micron.com" <manonuevo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> From: linux-mtd  On Behalf Of Brian Norris
> > On Tue, Oct 01, 2013 at 03:03:58PM +0530, Kamlakant Patel wrote:
> > This patch adds support for Micron SPINAND via MTD.
> >
> > Signed-off-by: Mona Anonuevo <manonuevo@micron.com>
> > Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>
> > ---
> > This patch has to be merged via staging tree.
> >
> > This is a driver from Micron for MT29F1G01ZACH4 SPI based NAND chips.
> This driver had
> > been posted multiple times to the mtd list.
> > 1. http://lists.infradead.org/pipermail/linux-mtd/2010-May/031975.html
> > 2. http://lists.infradead.org/pipermail/linux-mtd/2010-April/029523.htm=
l
> > 3. patchwork.ozlabs.org/patch/258697/
> > This has not been merged into the main kernel yet.
> >
> > I have cleaned and updated it for current kernel. Since there are many
> users for
> > this driver, it may be useful to add it to the staging tree, where furt=
her fixes
> and
> > cleanups can be done. Once it reaches to the standard will be moved to =
the
> mtd.
> >
> > This driver has been tested with Micron SPINAND MT29F1G01ZACH4 chip
> on kernel 3.12 on
> > the Netlogic XLP platforms.
> >
> > Mona Anonuevo, I have retained your sign-offs from the original patch.
> >
I see that major portion (especially the generic framework) is ported from
http://lists.infradead.org/pipermail/linux-mtd/2010-May/031975.html
So shouldn't you just maintain the original authorship ?
And the original headers ?

>=20
> You can address these comments in follow up patches after it's included
> in staging, though. There's probably more review needed anyway
> eventually (I see that no one really has reviewed this on the MTD
> mailing list yet).
>=20
The original version of this patch in 2010 added *generic spinand*
framework. And support for m29f (Micron devices) should have been
added using that generic framework. But due to lack of response
generic framework never went in.
Therefore I think this patch series adds a customized driver just for
'm29f' (Micron serial NAND) devices, removing the generalization.

There was a refreshed version of original patch (with generic framework)
but no response on that too. I don't want to hold this patch, but it would
be good, if you can review generic framework also ..
https://lkml.org/lkml/2013/6/26/88


with regards, pekon
