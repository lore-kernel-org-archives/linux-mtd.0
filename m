From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v9 3/9] mtd: nand: omap: cleanup: replace local
 references with generic framework names
Date: Sat, 19 Oct 2013 05:10:51 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA28C91@DBDE04.ent.ti.com>
References: <1381816197-20477-1-git-send-email-pekon@ti.com>
 <1381816197-20477-4-git-send-email-pekon@ti.com>
 <20131016213024.GY23337@ld-irv-0074.broadcom.com>
In-Reply-To: <20131016213024.GY23337@ld-irv-0074.broadcom.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "Pawel.Moll@arm.com" <Pawel.Moll@arm.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "tony@atomide.com" <tony@atomide.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>, "robherring2@gmail.com" <robherring2@gmail.com>,
 "bcousson@baylibre.com" <bcousson@baylibre.com>,
 "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>,
 "olof@lixom.net" <olof@lixom.net>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> From: Brian Norris [mailto:computersforpeace@gmail.com]
> > On Tue, Oct 15, 2013 at 11:19:51AM +0530, Pekon Gupta wrote:
> > This patch updates following in omap_nand_probe() and
> omap_nand_remove()
> > - replaces "info->nand" with "nand_chip" (struct nand_chip *nand_chip)
> > - replaces "info->mtd" with "mtd" (struct mtd_info *mtd)
> > - white-space and formatting cleanup
> >
> > Signed-off-by: Pekon Gupta <pekon@ti.com>
>=20
> This patch looks good. Thanks for being consistent.
>=20

> > diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> > index 8d521aa..5596368 100644
> > --- a/drivers/mtd/nand/omap2.c
> > +++ b/drivers/mtd/nand/omap2.c
>=20
> ...
>=20
> > @@ -1846,17 +1848,16 @@ static int omap_nand_probe(struct
> > -
> > -	info->nand.options	=3D pdata->devsize;
> > -	info->nand.options	|=3D NAND_SKIP_BBTSCAN;
> > +	mtd			=3D &info->mtd;
> > +	mtd->priv		=3D &info->nand;
> > +	mtd->name		=3D dev_name(&pdev->dev);
> > +	mtd->owner		=3D THIS_MODULE;
> > +	nand_chip		=3D &info->nand;
> > +	nand_chip->options	=3D pdata->devsize;
>=20
> Trivial side comment: the 'devsize' field is not named very
> informatively. It is apparently just a way to specify nand_chip.options,
> and it is only actually used for setting a buswidth. (It is also badly
> named nand_type in other places.) Not sure if it's worth improving, or
> even dropping at some later point in time.
>=20
For now I'm keeping this name consistent for now, as this would require
touching GPMC driver also, where 'devsize' is used to configure
GPMC controller registers.

I'll keep this feedback as pending for independent patch where I probe
driver with "NAND_BUSWIDTH_AUTO".


with regards, pekon
