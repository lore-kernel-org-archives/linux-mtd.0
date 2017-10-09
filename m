Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e1RPF-0003Vx-RP
 for linux-mtd@lists.infradead.org; Mon, 09 Oct 2017 06:19:16 +0000
Date: Mon, 9 Oct 2017 08:18:48 +0200
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Kalyan Kinthada <Kalyan.Kinthada@alliedtelesis.co.nz>
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "richard@nod.at"
 <richard@nod.at>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Packham
 <Chris.Packham@alliedtelesis.co.nz>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/1] mtd: nand: pxa3xx: Set FORCE_CSX bit to
 ARMADA370 variants.
Message-ID: <20171009081848.49681975@xps13>
In-Reply-To: <c6832720-7c58-4afe-2d1b-76bb9397299e@alliedtelesis.co.nz>
References: <20170928005756.3938-1-kalyan.kinthada@alliedtelesis.co.nz>
 <20170928005756.3938-2-kalyan.kinthada@alliedtelesis.co.nz>
 <20171005094138.11b73a0e@xps13>
 <c6832720-7c58-4afe-2d1b-76bb9397299e@alliedtelesis.co.nz>
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

Hello Kalyan,

On Mon, 9 Oct 2017 02:31:30 +0000
Kalyan Kinthada <Kalyan.Kinthada@alliedtelesis.co.nz> wrote:

> On 05/10/17 20:41, Miquel RAYNAL wrote:
> > Hello Kalyan,
> >
> > On Thu, 28 Sep 2017 13:57:56 +1300
> > Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz> wrote:
> > =20
> >> When the arbitration between NOR and NAND flash is enabled
> >> the <FORCE_CSX> field bit[21] in the Data Flash Control Register
> >> needs to be set to 1 according to guidleine GL-5830741 mentioned =20
> > Typo: guideline ^ =20
> I will correct this typo in the next patch version.
> >> in Marvell Errata document MV-S501377-00, Rev. D. =20
> > Thanks for that, I checked it.
> > =20
> >> This commit sets the FORCE_CSX bit to 1 for all
> >> ARMADA370 variants as the arbitration is always enabled by default.
> >> This change does not apply for pxa3xx variants because the
> >> FORCE_CSX bit does not exist/reserved on the NFCv1. =20
> > Sorry to bother you again but I am reworking the pxa3xx_nand driver
> > and so I would like to deeply understand why this is needed because
> > I will have to integrate it in my work too.
> >
> > So please tell me what is your setup, do you really use NAND/NOR
> > arbitration? Do you have not-Don't Care CS NAND chips? I have some
> > doubts because even if the spec precises in the NAND controller
> > chapter that arbitration is always enabled by default, the bit 27
> > (NfArbiterEn) in the SoC Device Multiplex Register at offset
> > 0x00018208 is actually at 0 by default (disabled). Did you enable
> > this bit manually ? I checked with devmem on my setup and this bit
> > was unset. =20
> Yes, my setup use NAND/NOR arbitration and use a Don't
> care CS Nand Chip. The bit 27 at offset 0x00018208 is set to 1
> by default in my case. I did not manually set the bit 27 to 1.

Actually if you use Don't Care CS NAND chips you should not need the
force CS bit, as it is mentioned in the guidelines you pointed, this
bit is only useful for *not* don't care CS NAND chips (and the name
"force CS" is pretty straight forward too!).

Otherwise what bootloader and kernel do you use to have this
bit set by default? You may also want to check if this bit is set by
your bootloader by stopping it before it loads Linux and check manually
the value of this bit with 'md' (on U-Boot).

Thank you,
Miqu=C3=A8l

>=20
> Please let me now if you have any other question or do you want me
> to send the updated patch version with the typo fixed.
>=20
> Thank You,
> Kalyan
>=20
> >
> > Thank you for your time,
> > Miqu=C3=A8l
> > =20
> >> The NDCR_ND_MODE conflicts with the new NDCR_FORCE_CSX but is
> >> unused so remove it along with NDCR_NAND_MODE.
> >>
> >> Signed-off-by: Kalyan Kinthada
> >> <kalyan.kinthada@alliedtelesis.co.nz> --- =20
> >
> > =20
> >>   drivers/mtd/nand/pxa3xx_nand.c | 9 +++++++--
> >>   1 file changed, 7 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/mtd/nand/pxa3xx_nand.c
> >> b/drivers/mtd/nand/pxa3xx_nand.c index 85cff68643e0..a6a7a5af7bed
> >> 100644 --- a/drivers/mtd/nand/pxa3xx_nand.c
> >> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> >> @@ -67,8 +67,7 @@
> >>   #define NDCR_DWIDTH_M		(0x1 << 26)
> >>   #define NDCR_PAGE_SZ		(0x1 << 24)
> >>   #define NDCR_NCSX		(0x1 << 23)
> >> -#define NDCR_ND_MODE		(0x3 << 21)
> >> -#define NDCR_NAND_MODE   	(0x0)
> >> +#define NDCR_FORCE_CSX		(0x1 << 21)
> >>   #define NDCR_CLR_PG_CNT		(0x1 << 20)
> >>   #define NFCV1_NDCR_ARB_CNTL	(0x1 << 19)
> >>   #define NFCV2_NDCR_STOP_ON_UNCOR	(0x1 << 19)
> >> @@ -1464,6 +1463,9 @@ static int pxa3xx_nand_config_ident(struct
> >> pxa3xx_nand_info *info) info->chunk_size =3D PAGE_CHUNK_SIZE;
> >>   	info->reg_ndcr =3D 0x0; /* enable all interrupts */
> >>   	info->reg_ndcr |=3D (pdata->enable_arbiter) ?
> >> NDCR_ND_ARB_EN : 0;
> >> +	/* Set FORCE_CSX bit for all ARMADA370 Variants. Ref#:
> >> GL-5830741 */
> >> +	if (info->variant =3D=3D PXA3XX_NAND_VARIANT_ARMADA370)
> >> +		info->reg_ndcr |=3D NDCR_FORCE_CSX;
> >>   	info->reg_ndcr |=3D NDCR_RD_ID_CNT(READ_ID_BYTES);
> >>   	info->reg_ndcr |=3D NDCR_SPARE_EN;
> >>  =20
> >> @@ -1498,6 +1500,9 @@ static void pxa3xx_nand_detect_config(struct
> >> pxa3xx_nand_info *info) info->reg_ndcr =3D ndcr &
> >>   		~(NDCR_INT_MASK | NDCR_ND_ARB_EN |
> >> NFCV1_NDCR_ARB_CNTL); info->reg_ndcr |=3D (pdata->enable_arbiter) ?
> >> NDCR_ND_ARB_EN : 0;
> >> +	/* Set FORCE_CSX bit for all ARMADA370 Variants. Ref#:
> >> GL-5830741 */
> >> +	if (info->variant =3D=3D PXA3XX_NAND_VARIANT_ARMADA370)
> >> +		info->reg_ndcr |=3D NDCR_FORCE_CSX;
> >>   	info->ndtr0cs0 =3D nand_readl(info, NDTR0CS0);
> >>   	info->ndtr1cs0 =3D nand_readl(info, NDTR1CS0);
> >>   } =20
> >
> > =20



--=20
Miquel Raynal, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
