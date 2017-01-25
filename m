Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cWQnJ-0002ZR-OP
 for linux-mtd@lists.infradead.org; Wed, 25 Jan 2017 16:51:39 +0000
Date: Wed, 25 Jan 2017 17:51:05 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/3] mtd: name the mtd device with an optional label
 property
Message-ID: <20170125175105.67c335e7@bbrezillon>
In-Reply-To: <7bdf47c3-d3b7-92a2-47c1-99e4bd6b4f44@kaod.org>
References: <1484573225-19095-1-git-send-email-clg@kaod.org>
 <1484573225-19095-2-git-send-email-clg@kaod.org>
 <20170124151353.5bbffae0@bbrezillon>
 <7bdf47c3-d3b7-92a2-47c1-99e4bd6b4f44@kaod.org>
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

On Wed, 25 Jan 2017 17:47:13 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 01/24/2017 03:13 PM, Boris Brezillon wrote:
> > Hi C=C3=A9dric,
> >=20
> > On Mon, 16 Jan 2017 14:27:03 +0100
> > C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >  =20
> >> This can be used to easily identify a specific chip on a system with
> >> multiple chips.
> >>
> >> Suggested-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> >> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >> ---
> >>  drivers/mtd/mtdcore.c | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> >> index 052772f7caef..bf61557b599d 100644
> >> --- a/drivers/mtd/mtdcore.c
> >> +++ b/drivers/mtd/mtdcore.c
> >> @@ -654,6 +654,13 @@ static int mtd_add_device_partitions(struct mtd_i=
nfo *mtd,
> >>   */
> >>  static void mtd_set_dev_defaults(struct mtd_info *mtd)
> >>  {
> >> +	/*
> >> +	 * If DT support is enabled and we have a valid of_node pointer, try=
 to
> >> +	 * extract the MTD name from the label property.
> >> +	 */
> >> +	if (IS_ENABLED(CONFIG_OF) && mtd->dev.of_node)
> >> +		of_property_read_string(mtd->dev.of_node, "label", &mtd->name);
> >> + =20
> >=20
> > I realize this kind of thing would be better placed in mtd_set_of_node()
> > (see the patch below). Modifying the mtd->name pointer in the back of
> > MTD drivers is not such a good idea (suppose the driver allocated the
> > memory with a regular kmalloc() and tries to free mtd->name in the remo=
ve
> > path).
> >=20
> > If we move that to mtd_set_of_node(), drivers that wants to support this
> > label property just have to check if mtd->name is NULL (after calling
> > mtd_set_of_node() or nand_set_flash_node()) before assigning a default
> > name.
> > For unmodified drivers we keep the existing behavior: they'll just
> > unconditionally override mtd->name with their own value (which might or
> > might not be dynamically allocated). =20
>=20
> ok. So the expected behavior looks correct to me, but adding a call to=20
> of_property_read_string() in the inline below feels a little hacky.=20
> Doesn't it ?=20
>=20
> May be we need an extra check on IS_ENABLED(CONFIG_OF) also ?=20

This is all safe, because the of.h header defines stubs if CONFIG_OF is
not set. That just means the name will be unchanged, but you shouldn't
have any problem (neither as compilation time nor at runtime).
