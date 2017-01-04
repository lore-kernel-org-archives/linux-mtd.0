Received: from mail.free-electrons.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cOphi-0006jC-5k
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2017 17:50:29 +0000
Date: Wed, 4 Jan 2017 18:50:05 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, <linux-mtd@lists.infradead.org>, Mark Rutland
 <mark.rutland@arm.com>, <devicetree@vger.kernel.org>, "Richard Weinberger"
 <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v4 1/4] mtd: spi-nor: add memory controllers for the
 Aspeed AST2500 SoC
Message-ID: <20170104185005.7fcafd2d@bbrezillon>
In-Reply-To: <4c5cf674-06f9-ad6b-05bf-a1d39aaa7ed5@atmel.com>
References: <1481557252-13656-1-git-send-email-clg@kaod.org>
 <1481557252-13656-2-git-send-email-clg@kaod.org>
 <5566c62d-cc72-f207-e1dd-5a59e6947c24@wedev4u.fr>
 <a7cb781c-a4a8-f0f7-e7db-5cd9f19da0aa@kaod.org>
 <2bec1e91-a196-b894-fb66-590b8f4f35c3@atmel.com>
 <645db8c4-7f3c-f8bf-ddd9-3f513ce2ed14@kaod.org>
 <4c5cf674-06f9-ad6b-05bf-a1d39aaa7ed5@atmel.com>
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

Cyrille, C=C3=A9dric,

On Wed, 4 Jan 2017 15:52:07 +0100
Cyrille Pitchen <cyrille.pitchen@atmel.com> wrote:

> >  =20
> >> Anyway, since the review is done now, on my side I won't ask you to re=
move
> >> or split the support of the 'Command' mode in a separated patch.
> >> I let you do as you want, if it help you to introduce some part of the
> >> support of this 'Command' mode now even if not completed yet, no probl=
em on
> >> my side :)
> >>
> >> I was just giving you some pieces of advice for the next time if you w=
ant
> >> to speed up the review of another patch introducing new features.
> >>
> >> However, I will just ask you one more version handling the dummy cycles
> >> properly as it would help us for the global maintenance of the spi-nor
> >> subsystem. This is the only mandatory modification I ask you, after th=
at I
> >> think it would be ok for me and since Marek has already reviewed your
> >> driver, it would be ready to be merged into the spi-nor tree. =20
> >=20
> > Sending a v5 which should address your comments.=20
> >=20
> > I have removed the label property and will start a new thread in the=20
> > topic. Any hints on which binding we could add this label prop ? =20
> > =20
>=20
> Here I will provide just few thoughts about this new DT property. I don't
> pretend this is what should be done. I still think other mtd maintainers
> should be involved to discuss this topic.
>=20
> First the DT property name "label" sounds good to me: it is consistent wi=
th
> "label" DT property used to name mtd partitions. However, I don't think it
> should be documented in jedec,spi-nor.txt but *maybe* in partition.txt as
> the purpose of this new DT property seems very close to the "label"
> property of partition nodes: let's think about some hard-disk device
> (/dev/sda) and its partition devices (/dev/sdaX).

Hm, partition.txt may not be appropriate here. We're not documenting
the MTD partition binding, but the MTD device one. Maybe we should
create mtd.txt and put all generic MTD dev properties here.

>=20
> Besides, the concept of this memory label is not limited to SPI NOR but
> could also apply to NAND memories or any other MTD handled memories.

Definitely. Actually I think I'll need that for the Atmel NAND
controller driver rework I'm currently working on, to keep mtdparts
parser happy even after changing the NAND device naming scheme.

> Hence the DT property might be handled by drivers/mtd/ofpart.c instead of
> being handled by spi-nor.c or by each SPI NOR memory controller driver.

Actually, that could be done at the mtdcore level in
mtd_set_dev_defaults() [1].

>=20
> Finally, I guess we should take time to discuss and all agree what should
> be done precisely before introducing a new DT property because one general
> rule with DTB files is that users should be able to update their kernel
> image (zImage, uImage, ...) without changing their DTB: device trees shou=
ld
> be backward compatible. Hence if we make a wrong choice today, we are
> likely to have to live with it and keep supporting that bad choice.

Rob already acked the patch, so, if all MTD maintainers agree that this
new property is acceptable, we should be fine ;-).

>=20
> Anyway, maybe you could describe a little bit your use case; what you
> intend to do with this label from you userspace application.

Here is mine: I want the mtdparts parser to work correctly with
existing bootloaders even after changing the NAND device naming scheme
to allow one NAND controller to expose multiple devices.

Current naming scheme: NAND device name is always atmel_nand
New naming sheme: atmel-nand.%d where %d is replaced by the CS line
number the NAND device is connected too.

Also note that it's easier to refer to a flash device by it's purpose
(like System-firmware in Cedric's example) rather than the controller
CS line this device is connected to.

Regards,

Boris

[1]http://code.bulix.org/p019ah-107877
