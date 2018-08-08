Received: from galois.linutronix.de ([2a01:7a0:2:106d:700::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fnOGz-0001dL-Vz
 for linux-mtd@lists.infradead.org; Wed, 08 Aug 2018 13:13:11 +0000
Date: Wed, 8 Aug 2018 15:12:51 +0200
From: Kurt Kanzenbach <kurt.kanzenbach@linutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Jane Wan <Jane.Wan@nokia.com>, Jagdish Gediya <jagdish.gediya@nxp.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: nand: fsl-ifc: fixup SRAM init for newer ctrl
 versions
Message-ID: <20180808131250.kmw2r6rco3huxeig@linutronix.de>
References: <20180806092137.9287-1-kurt@linutronix.de>
 <20180806092137.9287-3-kurt@linutronix.de>
 <20180808114832.61d31c29@xps13>
 <20180808100909.anfi3qlfjnzb74p2@linutronix.de>
 <20180808143352.2f5b999c@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180808143352.2f5b999c@xps13>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel,

On Wed, Aug 08, 2018 at 02:33:52PM +0200, Miquel Raynal wrote:
> Hi Kurt,
>
>
> > > > +		u32 ncfgr, status;
> > > > +		int ret;
> > > > +
> > > > +		/* Trigger auto initialization */
> > > > +		ncfgr = ifc_in32(&ifc_runtime->ifc_nand.ncfgr);
> > > > +		ifc_out32(ncfgr | IFC_NAND_NCFGR_SRAM_INIT_EN, &ifc_runtime->ifc_nand.ncfgr);
> > > > +
> > > > +		/* Wait until done */
> > > > +		ret = readx_poll_timeout(ifc_in32, &ifc_runtime->ifc_nand.ncfgr,
> > > > +					 status, !(status & IFC_NAND_NCFGR_SRAM_INIT_EN),
> > > > +					 10, 1000);
> > >
> > > Nit: I always prefer when delays/timeouts are defined (and may be
> > > reused).
> >
> > Me too. I've missed that there is already a timeout constant
> > IFC_TIMEOUT_MSECS (500). As it's huge, I'll add a second one.
>
> Well, I'm not bothered with huge timeouts, it's in the error path so we
> don't really care.

okay. I'll send a v2 next week addressing your comments.

Thanks,
Kurt
