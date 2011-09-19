Received: from arroyo.ext.ti.com ([192.94.94.40])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R5c7c-00020i-2E
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2011 11:34:50 +0000
From: "Saxena, Parth" <parth.saxena@ti.com>
To: "'dedekind1@gmail.com'" <dedekind1@gmail.com>
Date: Mon, 19 Sep 2011 17:04:40 +0530
Subject: RE: [PATCH] ti816x: add support for nand on ti8168 evm
Message-ID: <19F8576C6E063C45BE387C64729E739404EC3121B9@dbde02.ent.ti.com>
References: <parth.saxena@ti.com>
	<1315486982-30109-1-git-send-email-parth.saxena@ti.com>
	<1316408187.24366.52.camel@sauron>
In-Reply-To: <1316408187.24366.52.camel@sauron>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Basheer, Mansoor Ahamed" <mansoor.ahamed@ti.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
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
> From: Artem Bityutskiy [mailto:dedekind1@gmail.com]
> Sent: Monday, September 19, 2011 10:26 AM
> To: Saxena, Parth
> Cc: linux-mtd@lists.infradead.org; Basheer, Mansoor Ahamed; linux-
> omap@vger.kernel.org
> Subject: Re: [PATCH] ti816x: add support for nand on ti8168 evm
>=20
> On Thu, 2011-09-08 at 18:33 +0530, Saxena, Parth wrote:
> > Add partition table for NAND device on TI8168 EVM
> > and initialise the NAND module.
> >
> > Signed-off-by: Saxena, Parth <parth.saxena@ti.com>
> > Signed-off-by: Basheer, Mansoor Ahamed <mansoor.ahamed@ti.com>
> > ---
> >
> > This patch is tested on top of linux-omap/master and
> > Hemant's patches submitted recently.
> >
> > http://www.mail-archive.com/linux-omap@vger.kernel.org/msg53457.html
> > http://www.mail-archive.com/linux-omap@vger.kernel.org/msg54296.html
> >
> >  arch/arm/mach-omap2/board-ti8168evm.c |   39
> +++++++++++++++++++++++++++++++++
> >  1 files changed, 39 insertions(+), 0 deletions(-)
>=20
> Please, send this patch to Tony, I think it should go in via the omap
> tree, not via the MTD tree.

[Saxena, Parth]=20
Artem,
I will re-post this patch to linux-omap list and Tony. Can I add your name =
in the 'Acked-by' section?
>=20
> --
> Best Regards,
> Artem Bityutskiy
