From: "Govindarajan, Sriramakrishnan" <srk@ti.com>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Date: Fri, 13 Nov 2009 16:34:10 +0530
Subject: RE: NAND: failure reported with mtd_oobtest(read delay violated)
Message-ID: <FCCFB4CDC6E5564B9182F639FC35608702FA5CC42B@dbde02.ent.ti.com>
References: <FCCFB4CDC6E5564B9182F639FC35608702FA5CC012@dbde02.ent.ti.com>
	<20091112205910.GB11304@n2100.arm.linux.org.uk>
In-Reply-To: <20091112205910.GB11304@n2100.arm.linux.org.uk>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>,
	"'linux-arm-kernel@lists.infradead.org'"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: Russell King - ARM Linux [mailto:linux@arm.linux.org.uk]
> Sent: Friday, November 13, 2009 2:29 AM
> To: Govindarajan, Sriramakrishnan
> Cc: 'linux-mtd@lists.infradead.org'; 'linux-arm-
> kernel@lists.infradead.org'
> Subject: Re: NAND: failure reported with mtd_oobtest(read delay violated)
>=20
> On Thu, Nov 12, 2009 at 09:28:58PM +0530, Govindarajan, Sriramakrishnan
> wrote:
> > OMAP3EVM implementation relies on command delay(chip_delay set to 50ms)
> > and doesn't use wait pin monitoring. By adding a data memory barrier
> > dmb() instruction right after the command phase the issue seems to be
> > resolved.
>=20
> Clearly adding ARM specific calls into generic code is the wrong thing
> to do...  Why can't this dmb() go into whatever NAND driver OMAP is using=
?

Russell, thanks for the comments. But I posed this question
assuming that this a more generic problem that may show up on other
rchitectures/platforms where the NAND driver is using delay loop
instead of wait pin monitoring. Is there a more generic alternative?

Also, the time delay is implemented in the nand(nand_base.c) core file itse=
lf - there aren't platform specific hooks for us to override/customize for =
OMAP specifically. I am also looking at the other alternative of using wait=
 pin monitoring instead

Regards
Sriram
