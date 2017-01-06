Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cPRh6-0001et-0f
 for linux-mtd@lists.infradead.org; Fri, 06 Jan 2017 10:24:22 +0000
Date: Fri, 6 Jan 2017 11:23:57 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Mark Rutland
 <mark.rutland@arm.com>, devicetree@vger.kernel.org, Richard Weinberger
 <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v4 1/4] mtd: spi-nor: add memory controllers for the
 Aspeed AST2500 SoC
Message-ID: <20170106112357.1cd79af1@bbrezillon>
In-Reply-To: <5017c983-e619-b3db-404c-8eab45bdd1f8@kaod.org>
References: <1481557252-13656-1-git-send-email-clg@kaod.org>
 <1481557252-13656-2-git-send-email-clg@kaod.org>
 <5566c62d-cc72-f207-e1dd-5a59e6947c24@wedev4u.fr>
 <a7cb781c-a4a8-f0f7-e7db-5cd9f19da0aa@kaod.org>
 <2bec1e91-a196-b894-fb66-590b8f4f35c3@atmel.com>
 <645db8c4-7f3c-f8bf-ddd9-3f513ce2ed14@kaod.org>
 <4c5cf674-06f9-ad6b-05bf-a1d39aaa7ed5@atmel.com>
 <20170104185005.7fcafd2d@bbrezillon>
 <4c0b4498-12c7-303d-c8f8-4f27a02d6c12@kaod.org>
 <20170106094930.0f579dca@bbrezillon>
 <5017c983-e619-b3db-404c-8eab45bdd1f8@kaod.org>
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

On Fri, 6 Jan 2017 11:04:12 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Hello Boris,
>=20
> On 01/06/2017 09:49 AM, Boris Brezillon wrote:
> > Hi C=C3=A9dric,
> >=20
> > On Thu, 5 Jan 2017 14:39:14 +0100
> > C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >  =20
> >> Hello Cyrille, Boris=20
> >>
> >> On 01/04/2017 06:50 PM, Boris Brezillon wrote: =20
> >>> Cyrille, C=C3=A9dric,
> >>>
> >>> On Wed, 4 Jan 2017 15:52:07 +0100
> >>> Cyrille Pitchen <cyrille.pitchen@atmel.com> wrote:
> >>>    =20
> >>>>>      =20
> >>>>>> Anyway, since the review is done now, on my side I won't ask you t=
o remove
> >>>>>> or split the support of the 'Command' mode in a separated patch.
> >>>>>> I let you do as you want, if it help you to introduce some part of=
 the
> >>>>>> support of this 'Command' mode now even if not completed yet, no p=
roblem on
> >>>>>> my side :)
> >>>>>>
> >>>>>> I was just giving you some pieces of advice for the next time if y=
ou want
> >>>>>> to speed up the review of another patch introducing new features.
> >>>>>>
> >>>>>> However, I will just ask you one more version handling the dummy c=
ycles
> >>>>>> properly as it would help us for the global maintenance of the spi=
-nor
> >>>>>> subsystem. This is the only mandatory modification I ask you, afte=
r that I
> >>>>>> think it would be ok for me and since Marek has already reviewed y=
our
> >>>>>> driver, it would be ready to be merged into the spi-nor tree.     =
=20
> >>>>>
> >>>>> Sending a v5 which should address your comments.=20
> >>>>>
> >>>>> I have removed the label property and will start a new thread in th=
e=20
> >>>>> topic. Any hints on which binding we could add this label prop ? =20
> >>>>>     =20
> >>>>
> >>>> Here I will provide just few thoughts about this new DT property. I =
don't
> >>>> pretend this is what should be done. I still think other mtd maintai=
ners
> >>>> should be involved to discuss this topic.
> >>>>
> >>>> First the DT property name "label" sounds good to me: it is consiste=
nt with
> >>>> "label" DT property used to name mtd partitions. However, I don't th=
ink it
> >>>> should be documented in jedec,spi-nor.txt but *maybe* in partition.t=
xt as
> >>>> the purpose of this new DT property seems very close to the "label"
> >>>> property of partition nodes: let's think about some hard-disk device
> >>>> (/dev/sda) and its partition devices (/dev/sdaX).   =20
> >>
> >> yes this is very similar. I first looked at introducing a name to=20
> >> an overall containing partition but the partition binding is not=20
> >> designed for that. There are constraints on the start address and
> >> the size which does not fit the purpose.
> >> =20
> >>> Hm, partition.txt may not be appropriate here. We're not documenting
> >>> the MTD partition binding, but the MTD device one. Maybe we should
> >>> create mtd.txt and put all generic MTD dev properties here.   =20
> >>>>
> >>>> Besides, the concept of this memory label is not limited to SPI NOR =
but
> >>>> could also apply to NAND memories or any other MTD handled memories.=
   =20
> >>>
> >>> Definitely. Actually I think I'll need that for the Atmel NAND
> >>> controller driver rework I'm currently working on, to keep mtdparts
> >>> parser happy even after changing the NAND device naming scheme.
> >>>    =20
> >>>> Hence the DT property might be handled by drivers/mtd/ofpart.c inste=
ad of
> >>>> being handled by spi-nor.c or by each SPI NOR memory controller driv=
er.   =20
> >>>
> >>> Actually, that could be done at the mtdcore level in
> >>> mtd_set_dev_defaults() [1].   =20
> >>
> >> that would be perfect.
> >> =20
> >>>> Finally, I guess we should take time to discuss and all agree what s=
hould
> >>>> be done precisely before introducing a new DT property because one g=
eneral
> >>>> rule with DTB files is that users should be able to update their ker=
nel
> >>>> image (zImage, uImage, ...) without changing their DTB: device trees=
 should
> >>>> be backward compatible. Hence if we make a wrong choice today, we are
> >>>> likely to have to live with it and keep supporting that bad choice. =
  =20
> >>>
> >>> Rob already acked the patch, so, if all MTD maintainers agree that th=
is
> >>> new property is acceptable, we should be fine ;-).   =20
> >>
> >> yes but we would need to move the binding property to another file.=20
> >> What I sent applied to "jedec,spi-nor" and we want to generalize the=20
> >> property to other devices. =20
> >=20
> > We could create an new file under
> > Documentation/devicetree/bindings/mtd/, or we could rename
> > partition.txt into something else (generic.txt or common.txt) and
> > document more than the partition binding. =20
>=20
> OK.=20
>=20
> I guess that creating a new file for a single property is a little=20
> overkill or do we expect more common properties at the device level ?

Not that I can think of, but we never know.

> In that case, may be we could keep the partition.txt file and add =20
> a common.txt file. If not, common.txt seems to be a good name.=20
> Waiting a little for others to chime in.  =20
>=20
>=20
> > Can you take care of that (in a separate patch series of course)? =20
>=20
> sure, and will you send :=20
>=20
> 	http://code.bulix.org/p019ah-107877
>=20
> in a separate patch ?=20

No, you should make it part of your series ;-).
