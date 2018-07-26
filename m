Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fipRY-0001rb-MO
 for linux-mtd@lists.infradead.org; Thu, 26 Jul 2018 23:13:14 +0000
Date: Fri, 27 Jul 2018 01:12:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 2/2] mtd: rawnand: add hooks that may be called
 during nand_scan()
Message-ID: <20180727011257.0754d1fe@xps13>
In-Reply-To: <20180727004741.4a7db9a6@xps13>
References: <20180718231234.8534-1-miquel.raynal@bootlin.com>
 <20180718231234.8534-3-miquel.raynal@bootlin.com>
 <cf9e65608733ecf1d0e3728e42df1acc@agner.ch>
 <20180726201259.3dda70ec@bbrezillon>
 <4c4a20c8496b60ab051a0756f150ee7a@agner.ch>
 <20180727004032.5b42b62e@bbrezillon>
 <20180727004741.4a7db9a6@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel,

Miquel Raynal <miquel.raynal@bootlin.com> wrote on Fri, 27 Jul 2018
00:47:41 +0200:

> Hi Boris, Stefan,
>=20
> Boris Brezillon <boris.brezillon@bootlin.com> wrote on Fri, 27 Jul 2018
> 00:40:32 +0200:
>=20
> > On Fri, 27 Jul 2018 00:20:50 +0200
> > Stefan Agner <stefan@agner.ch> wrote:
> >  =20
> > > On 26.07.2018 20:12, Boris Brezillon wrote:   =20
> > > > On Thu, 26 Jul 2018 18:22:10 +0200
> > > > Stefan Agner <stefan@agner.ch> wrote:     =20
> > > >> > +/**
> > > >> > + * struct nand_controller_ops - Controller operations
> > > >> > + *
> > > >> > + * @attach_chip: Callback that will be called between nand_dete=
ct() and
> > > >> > + *		 nand_scan_tail() during nand_scan() (optional).
> > > >> > + * @detach_chip: Callback that will be called from nand_cleanup=
() or if
> > > >> > + *		 nand_scan_tail() fails (optional).     =20
> > > >>
> > > >> This documentation reads not very helpful to me.
> > > >>
> > > >> It would be useful if it is written more from the driver developers
> > > >> perspective, e.g. what those callbacks ideally are supposed to do.=
..
> > > >>     =20
> > > >=20
> > > > Indeed. How about:
> > > >=20
> > > > 	@attach_chip: this method is called between after the NAND     =20
> > >=20
> > > I guess just after.   =20
> >=20
> > Yep.
> >  =20
> > >    =20
> > > > 		      detection phase to let controller driver
> > > > 		      tweak/customize the configuration based on the
> > > > 		      NAND properties (page size, OOB size, ECC
> > > > 		      requirements, ...).     =20
> > >=20
> > > Maybe explicitly state that NAND flash parameters are available in th=
is
> > > call, e.g.
> > >=20
> > > 	@attach_chip: this method is called after the NAND detection=20
> > > 		      phase after flash ID and MTD fields such as
> > > 		      erase size, page size and OOB size have been
> > > 		      set up. ECC requirements are available if
> > > 		      provided by the NAND chip or device tree.
> > > 		      Typically used to chose the appropriate ECC   =20
> >=20
> > 					^ choose
> >  =20
> > > 		      config and allocate associated resources.
> > > 		      This hook is optional.
> > >    =20
> >=20
> > Sounds good.
> >  =20
> > >    =20
> > > > 	@detach_chip: free all resources allocated/claimed in
> > > > 		      nand_controller_ops->detach_chip().     =20
> > >=20
> > > That probably should read nand_controller_ops->attach_chip().   =20
> >=20
> > And yes, I meant attach_chip().
> >  =20
> > >    =20
> > > > 		      This hook is optional.     =20
>=20
> Maybe I've been a bit lazy on the documentation :)
>=20
> Thanks Stefan for pointing it, I'll fix when applying with the above
> proposal.

Actually I already applied that patch, but I decided to edit it to
change the kernel doc.

Thanks,
Miqu=C3=A8l
