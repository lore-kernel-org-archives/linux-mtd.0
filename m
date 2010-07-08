Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OWiBn-0006wq-AW
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 03:54:20 +0000
From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: Tony Lindgren <tony@atomide.com>
Date: Thu, 8 Jul 2010 09:24:09 +0530
Subject: RE: [PATCH v5 1/3] omap3 gpmc: functionality enhancement
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B030E10C9CF@dbde02.ent.ti.com>
References: <s-ghorai@ti.com> <1275637205-489-1-git-send-email-s-ghorai@ti.com>
	<1275637205-489-2-git-send-email-s-ghorai@ti.com>
	<20100707101840.GF1920@atomide.com>
	<2A3DCF3DA181AD40BDE86A3150B27B6B030E10C786@dbde02.ent.ti.com>
	<20100707130138.GW1920@atomide.com>
In-Reply-To: <20100707130138.GW1920@atomide.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Tony Lindgren [mailto:tony@atomide.com]
> Sent: Wednesday, July 07, 2010 6:32 PM
> To: Ghorai, Sukumar
> Cc: linux-omap@vger.kernel.org; linux-mtd@lists.infradead.org;
> mike@compulab.co.il
> Subject: Re: [PATCH v5 1/3] omap3 gpmc: functionality enhancement
>=20
> * Ghorai, Sukumar <s-ghorai@ti.com> [100707 15:26]:
> > > From: Tony Lindgren [mailto:tony@atomide.com]
> > >
> > > You should just replace this function with simple functions like we
> > > already
> > > have in gpmc.c rather than trying to pack everything into one functio=
n.
> > > Just add various gpmc_xxx_get/set functions rather than pass int *rva=
l.
> >
> > [Ghorai] So I was having the same query very 1st time.
> > So we need to implement 15 separate functions to do the same as you
> suggested. And in my approach it's very easy to enhance the functionally
> in future, say to add new set/get. E.g. we need the similar cleanup for
> OneNAND code too.
> > So, would you please confirm once again with one is the best and should
> follow?
>=20
> In general, we should have separate read and write functions.
>=20
> Maybe you can group them a little bit? Some of them need the chip
> select, and some of them are generic. Then some of them are NAND
> specific.
[Ghorai] ok. And let me re-work this for next version.
>=20
> Regards,
>=20
> Tony
