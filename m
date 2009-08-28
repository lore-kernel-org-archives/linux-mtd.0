Received: from devils.ext.ti.com ([198.47.26.153])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mgyaj-0007QY-Gh
	for linux-mtd@lists.infradead.org; Fri, 28 Aug 2009 10:22:01 +0000
From: "Paulraj, Sandeep" <s-paulraj@ti.com>
To: David Brownell <david-b@pacbell.net>, Troy Kisky
	<troy.kisky@boundarydevices.com>
Date: Fri, 28 Aug 2009 05:21:16 -0500
Subject: RE: [patch 3/3] mtd-nand: DaVinci: Add 4-bit ECC support for large
	page NAND chips
Message-ID: <0554BEF07D437848AF01B9C9B5F0BC5D91E07BD2@dlee01.ent.ti.com>
References: <200908071824.n77IONlo008375@imap1.linux-foundation.org>
	<4A7C865C.9050905@boundarydevices.com>,
	<200908271908.15309.david-b@pacbell.net>
In-Reply-To: <200908271908.15309.david-b@pacbell.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>, "Narnakaje,
	Snehaprabha" <nsnehaprabha@ti.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dave,

I've already sent the patch to U-Boot and it has been accepted. Its in the =
nand next branch. For things to become fully functional i'll need a syncs b=
etween the various branches of U-Boot. I'll have to enable stuff in the DM3=
55 and Dm365 configs

since you ask about the U-Boot NAND driver, its based on old TI releases. A=
nd i'll tell you the reason why i decided that. The current DaVinci NAND dr=
iver in the kernel seems to have issues. 4 BIT ECC correction does not take=
 place in DM365. But random delays in the from of printks seem to help. We =
are debugging and once that is done i can send an updated U-Boot NAND drive=
r based on your NAND kernel driver

Thanks,
Sandeep
________________________________________
From: David Brownell [david-b@pacbell.net]
Sent: Thursday, August 27, 2009 10:08 PM
To: Troy Kisky
Cc: akpm@linux-foundation.org; dwmw2@infradead.org; linux-mtd@lists.infrade=
ad.org; Narnakaje, Snehaprabha; Paulraj, Sandeep; tglx@linutronix.de
Subject: Re: [patch 3/3] mtd-nand: DaVinci: Add 4-bit ECC support for large=
 page NAND chips

On Friday 07 August 2009, Troy Kisky wrote:
> > +static struct nand_ecclayout hwecc4_2048 __initconst =3D {
> > +     ...
> > +     .oobfree =3D {
> > +             /* 1 byte at offset 0 holds manufacturer badblock marker =
*/
> > +             {.offset =3D 1, .length =3D 23, },
>
> I thought Sneha Narnakaje was going to change offset =3D 2, length =3D 22=
 ?

Not clear why; this is only for 8-bit NAND, which (right?)
only uses single byte manufacturer badblock markers ...

Will a TI person be updating U-Boot?   Please?  :)
During the U-Boot v2009.10 window, which opens up
in a couple days...

- Dave
