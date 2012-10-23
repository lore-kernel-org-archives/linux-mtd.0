From: "Philip, Avinash" <avinashphilip@ti.com>
To: Peter Korsgaard <jacmet@sunsite.dk>
Subject: RE: [PATCH 2/4] mtd: devices: elm: Add support for ELM error
 correction
Date: Tue, 23 Oct 2012 10:17:58 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3E9D29C3@DBDE01.ent.ti.com>
References: <1349274589-11389-1-git-send-email-avinashphilip@ti.com>
 <1349274589-11389-3-git-send-email-avinashphilip@ti.com>
 <87hapvv800.fsf@macbook.be.48ers.dk>
In-Reply-To: <87hapvv800.fsf@macbook.be.48ers.dk>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Mohammed, Afzal" <afzal@ti.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "tony@atomide.com" <tony@atomide.com>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <rob.herring@calxeda.com>,
 Grant Likely <grant.likely@secretlab.ca>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Rob Landley <rob@landley.net>,
 "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 16, 2012 at 01:10:47, Peter Korsgaard wrote:
> >>>>> Philip, Avinash <avinashphilip@ti.com> writes:
>=20
>  > Platforms containing the ELM module can be used to correct errors
>  > reported by BCH 4, 8 & 16 bit ECC scheme. For now only 4 & 8 bit
>  > support is added.
>=20
> This sounds odd to me. What about something like:
>=20
> The ELM hardware module can be used to speedup BCH 4/8/16 ECC scheme
> error correction.
>=20
> For now only 4 & 8 bit support is added.

Ok I will correct it.

>=20
>=20
>  > +++ b/drivers/mtd/devices/Makefile
>  > @@ -17,8 +17,10 @@ obj-$(CONFIG_MTD_LART)		+=3D lart.o
>  >  obj-$(CONFIG_MTD_BLOCK2MTD)	+=3D block2mtd.o
>  >  obj-$(CONFIG_MTD_DATAFLASH)	+=3D mtd_dataflash.o
>  >  obj-$(CONFIG_MTD_M25P80)	+=3D m25p80.o
>  > +obj-$(CONFIG_MTD_NAND_OMAP2)	+=3D elm.o
>=20
> You seem to only use it in 4/4 if CONFIG_MTD_NAND_OMAP_BCH is set, so it
> probably makes more sense to use that symbol to not needlessly include
> it if it won't be used.

Ok. This been good.

>=20
>=20
>  > +static void elm_write_reg(void *offset, u32 val)
>  > +{
>  > +	writel(val, offset);
>  > +}
>  > +
>  > +static u32 elm_read_reg(void *offset)
>  > +{
>  > +	return readl(offset);
>  > +}
>=20
> As written these read/write wrappers don't add anything. How about
> passing struct elm_info and offset as an integer so you can drop
> elm_base from all call sites, E.G.:
>=20
> static void elm_write_reg(struct elm_info *info, int offset, u32 val)
> {
>         writel(val, info->elm_base + offset);
> }
>

Ok, this helps to reduce some indentation levels also.
=20
>=20
>  > +void elm_decode_bch_error_page(struct device *dev, u8 *ecc_calc,
>  > +		struct elm_errorvec *err_vec)
>  > +{
>  > +	int i;
>  > +	u8 syndrome[BCH_MAX_ECC_BYTES_PER_SECTOR] =3D {0}, *syn_p;
>=20
>=20
> Why do you need to keep the entire syndrome around? You seem to only use
> it between elm_reverse_eccdata() and elm_load_syndrome(), so it could as
> well be BCH8_ECC_OOB_BYTES long (or rather a multiple of sizeof(u32).
>=20
> It would also be good to do the shuffeling directly in elm_load_syndrome
> so you don't need the extra copy.

I will check.

>=20
>=20
>  > + */
>  > +
>  > +#ifndef __ELM_H
>  > +#define __ELM_H
>  > +
>  > +enum bch_ecc {
>  > +	BCH4_ECC =3D 0,
>  > +	BCH8_ECC,
>  > +	BCH16_ECC,
>=20
> It probably makes more sense to not provide the enum value for BCH16 as
> you don't support it.
>=20

Ok I will remove.

>=20
>  > +};
>  > +

Thanks
Avinash
