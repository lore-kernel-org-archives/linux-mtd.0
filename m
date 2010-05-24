MIME-Version: 1.0
In-Reply-To: <4BFA2A91.1080406@compulab.co.il>
References: <AANLkTikUkMDK80ay16KPiftNpszGKtiZVDC42zI08gxv@mail.gmail.com>
	<4BFA2A91.1080406@compulab.co.il>
Date: Mon, 24 May 2010 16:36:13 +0800
Message-ID: <AANLkTim4mc0kYwhpMagfbPhAElZUCWkixMeoDiNQwSpw@mail.gmail.com>
Subject: Re: [PATCH 07/20] mtd: pxa3xx_nand: mtd scan id process could be
	defined by driver itself
From: Lei Wen <adrian.wenl@gmail.com>
To: Mike Rapoport <mike@compulab.co.il>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <david.woodhouse@intel.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 24, 2010 at 3:28 PM, Mike Rapoport <mike@compulab.co.il> wrote:
> Haojian Zhuang wrote:
>>
>> From f2010885a9d5cebfd3cca63b59fff941502f78b3 Mon Sep 17 00:00:00 2001
>> From: Lei Wen <leiwen@marvell.com>
>> Date: Thu, 6 May 2010 09:48:30 +0800
>> Subject: [PATCH] mtd: pxa3xx_nand: mtd scan id process could be
>> defined by driver itself
>>
>> Different NAND driver may require its unique detection. For pxa3xx_nand,
>> it use its self id database to get the necessary info.
>>
>> Signed-off-by: Lei Wen <leiwen@marvell.com>
>> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
>> ---
>> =C2=A0drivers/mtd/nand/pxa3xx_nand.c | =C2=A0257
>> +++++++++++++++++++++++++++++-----------
>> =C2=A01 files changed, 185 insertions(+), 72 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c
>> b/drivers/mtd/nand/pxa3xx_nand.c
>> index 854adad..7a8ff38 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -255,6 +255,8 @@ static struct pxa3xx_nand_flash __devinitdata
>> builtin_flash_types[] =3D {
>> =C2=A0{ 0xba20, 64, 2048, 16, 16, 2048, { 10, 35, 15, 25, 15, 25, 25000,
>> 60, 10, }, },
>> =C2=A0};
>>
>> +static const char *mtd_names[] =3D {"pxa3xx_nand-0", NULL};
>> +
>> =C2=A0#define NDTR0_tCH(c) =C2=A0 (min((c), 7) << 19)
>> =C2=A0#define NDTR0_tCS(c) =C2=A0 (min((c), 7) << 16)
>> =C2=A0#define NDTR0_tWH(c) =C2=A0 (min((c), 7) << 11)
>> @@ -893,37 +895,6 @@ static int pxa3xx_nand_detect_config(struct
>> pxa3xx_nand_info *info)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> =C2=A0}
>>
>> -static int pxa3xx_nand_detect_flash(struct pxa3xx_nand_info *info,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_p=
latform_data
>> *pdata)
>> -{
>> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_flash *f;
>> - =C2=A0 =C2=A0 =C2=A0 uint32_t id =3D -1;
>> - =C2=A0 =C2=A0 =C2=A0 int i;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 if (pdata->keep_config)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pxa3xx_nand_detec=
t_config(info) =3D=3D 0)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return 0;
>
> NAK. You're breaking platforms that rely on this feature.
>
>> - =C2=A0 =C2=A0 =C2=A0 f =3D &builtin_flash_types[0];
>> - =C2=A0 =C2=A0 =C2=A0 pxa3xx_nand_config_flash(info, f);
>> - =C2=A0 =C2=A0 =C2=A0 pxa3xx_nand_cmdfunc(info->mtd, NAND_CMD_READID, 0=
, 0);
>> - =C2=A0 =C2=A0 =C2=A0 id =3D *((uint16_t *)(info->data_buff));
>> -
>> - =C2=A0 =C2=A0 =C2=A0 for (i =3D 1; i < ARRAY_SIZE(builtin_flash_types)=
; i++) {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D &builtin_flash_=
types[i];
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (f->chip_id =3D=3D=
 id) {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 dev_info(&info->pdev->dev, "detect chip id:
>> 0x%x\n", id);
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 pxa3xx_nand_config_flash(info, f);
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return 0;
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> - =C2=A0 =C2=A0 =C2=A0 }
>> -
>> - =C2=A0 =C2=A0 =C2=A0 dev_warn(&info->pdev->dev,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 "failed to detect configured nand flash; found
>> %04x instead of\n",
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0id);
>> - =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
>> -}
>> -
>> =C2=A0/* the maximum possible buffer size for large page with OOB data
>> =C2=A0* is: 2048 + 64 =3D 2112 bytes, allocate a page here for both the
>> =C2=A0* data buffer and the DMA descriptor
>> @@ -980,41 +951,174 @@ static struct nand_ecclayout hw_largepage_ecclayo=
ut
>> =3D {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.oobfree =3D { {2, 38} }
>> =C2=A0};
>>
>> -static void pxa3xx_nand_init_mtd(struct mtd_info *mtd,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pxa3xx_nand_info *info)
>
> why are you removing the pxa3xx_nand_init_mtd? moving it's entire content=
s
> into alloc_nand_resource would make the latter overgrown....
>
>> +static int pxa3xx_nand_read_page_hwecc(struct mtd_info *mtd,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nand_chip *chi=
p, uint8_t *buf, int page)
>> +{
>> + =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_info *info =3D mtd->priv;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 chip->read_buf(mtd, buf, mtd->writesize);
>> + =C2=A0 =C2=A0 =C2=A0 chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
>> +
>> + =C2=A0 =C2=A0 =C2=A0 if (info->retcode =3D=3D ERR_SBERR) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (info->use_ecc=
) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 case 1:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mtd->ecc_stats.corrected ++;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 case 0:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 default:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 =C2=A0 else if (info->retcode =3D=3D ERR_DBERR) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int buf_blank;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf_blank =3D is_buf_=
blank(buf, mtd->writesize);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!buf_blank)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mtd->ecc_stats.failed++;
>> + =C2=A0 =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 =C2=A0 return 0;
>> +}
>> +
>> +static void pxa3xx_nand_write_page_hwecc(struct mtd_info *mtd,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nand_chip *chi=
p, const uint8_t *buf)
>> +{
>> + =C2=A0 =C2=A0 =C2=A0 chip->write_buf(mtd, buf, mtd->writesize);
>> + =C2=A0 =C2=A0 =C2=A0 chip->write_buf(mtd, chip->oob_poi, mtd->oobsize)=
;
>> +}
>> +
>> +static void pxa3xx_nand_erase_cmd(struct mtd_info *mtd, int page)
>> =C2=A0{
>> - =C2=A0 =C2=A0 =C2=A0 struct nand_chip *this =3D &info->nand_chip;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 this->options =3D (info->reg_ndcr & NDCR_DWIDTH_C=
) ?
>> NAND_BUSWIDTH_16: 0;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 this->waitfunc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D pxa3xx_nand_waitfunc;
>> - =C2=A0 =C2=A0 =C2=A0 this->select_chip =C2=A0 =C2=A0 =C2=A0 =3D pxa3xx=
_nand_select_chip;
>> - =C2=A0 =C2=A0 =C2=A0 this->dev_ready =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D p=
xa3xx_nand_dev_ready;
>> - =C2=A0 =C2=A0 =C2=A0 this->cmdfunc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D pxa3xx_nand_cmdfunc;
>> - =C2=A0 =C2=A0 =C2=A0 this->read_word =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D p=
xa3xx_nand_read_word;
>> - =C2=A0 =C2=A0 =C2=A0 this->read_byte =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D p=
xa3xx_nand_read_byte;
>> - =C2=A0 =C2=A0 =C2=A0 this->read_buf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D pxa3xx_nand_read_buf;
>> - =C2=A0 =C2=A0 =C2=A0 this->write_buf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D p=
xa3xx_nand_write_buf;
>> - =C2=A0 =C2=A0 =C2=A0 this->verify_buf =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D p=
xa3xx_nand_verify_buf;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 this->ecc.mode =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D NAND_ECC_HW;
>> - =C2=A0 =C2=A0 =C2=A0 this->ecc.hwctl =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D p=
xa3xx_nand_ecc_hwctl;
>> - =C2=A0 =C2=A0 =C2=A0 this->ecc.calculate =C2=A0 =C2=A0 =3D pxa3xx_nand=
_ecc_calculate;
>> - =C2=A0 =C2=A0 =C2=A0 this->ecc.correct =C2=A0 =C2=A0 =C2=A0 =3D pxa3xx=
_nand_ecc_correct;
>> - =C2=A0 =C2=A0 =C2=A0 this->ecc.size =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D info->page_size;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 if (info->page_size =3D=3D 2048)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this->ecc.layout =3D =
&hw_largepage_ecclayout;
>> + =C2=A0 =C2=A0 =C2=A0 struct nand_chip *chip =3D mtd->priv;
>> + =C2=A0 =C2=A0 =C2=A0 /* Send commands to erase a block */
>> + =C2=A0 =C2=A0 =C2=A0 chip->cmdfunc(mtd, NAND_CMD_ERASE1, -1, page);
>> +}
>> +
>> +static int pxa3xx_nand_sensing(struct pxa3xx_nand_info *info)
>> +{
>> + =C2=A0 =C2=A0 =C2=A0 struct mtd_info *mtd =3D info->mtd;
>> + =C2=A0 =C2=A0 =C2=A0 struct nand_chip *chip =3D mtd->priv;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 /* use the common timing to make a try */
>> + =C2=A0 =C2=A0 =C2=A0 pxa3xx_nand_config_flash(info, &builtin_flash_typ=
es[0]);
>> + =C2=A0 =C2=A0 =C2=A0 chip->cmdfunc(mtd, NAND_CMD_RESET, 0, 0);
>> + =C2=A0 =C2=A0 =C2=A0 if (info->state & STATE_READY)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0else
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this->ecc.layout =3D =
&hw_smallpage_ecclayout;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>> +}
>> +
>> +static int pxa3xx_nand_scan(struct mtd_info *mtd)
>> +{
>> + =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_info *info =3D mtd->priv;
>> + =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_flash *f;
>> + =C2=A0 =C2=A0 =C2=A0 struct nand_chip *chip =3D mtd->priv;
>> + =C2=A0 =C2=A0 =C2=A0 uint32_t id =3D -1;
>> + =C2=A0 =C2=A0 =C2=A0 int i, ret;
>>
>> - =C2=A0 =C2=A0 =C2=A0 this->chip_delay =3D 25;
>> + =C2=A0 =C2=A0 =C2=A0 ret =3D pxa3xx_nand_sensing(info);
>> + =C2=A0 =C2=A0 =C2=A0 if (!ret) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(mtd);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info->mtd =3D NULL;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_INFO "The=
re is no nand chip on cs 0!\n");
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>> + =C2=A0 =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 =C2=A0 chip->cmdfunc(mtd, NAND_CMD_READID, 0, 0);
>> + =C2=A0 =C2=A0 =C2=A0 id =3D *((uint16_t *)(info->data_buff));
>> + =C2=A0 =C2=A0 =C2=A0 if (id !=3D 0)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_INFO "Det=
ect a flash id %x\n", id);
>> + =C2=A0 =C2=A0 =C2=A0 else {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(mtd);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info->mtd =3D NULL;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_WARNING "=
Read out ID 0, potential timing set
>> wrong!!\n");
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>> + =C2=A0 =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 1; i < ARRAY_SIZE(builtin_flash_types)=
; i++) {
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D &builtin_flash_=
types[i];
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* find the chip in d=
efault list */
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (f->chip_id =3D=3D=
 id) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 pxa3xx_nand_config_flash(info, f);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 chip->cellinfo =3D info->data_buff[2];
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mtd->writesize =3D f->page_size;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mtd->writesize_shift =3D ffs(mtd->writesize) - 1;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mtd->writesize_mask =3D (1 << mtd->writesize_shift)
>> - 1;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mtd->oobsize =3D mtd->writesize / 32;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mtd->erasesize =3D f->page_size * f->page_per_block;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mtd->erasesize_shift =3D ffs(mtd->erasesize) - 1;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mtd->erasesize_mask =3D (1 << mtd->erasesize_shift)
>> - 1;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mtd->name =3D mtd_names[0];
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 break;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 =C2=A0 if (i =3D=3D ARRAY_SIZE(builtin_flash_types)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(mtd);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info->mtd =3D NULL;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "ERRO=
R!! flash not defined!!!\n");
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>> + =C2=A0 =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 =C2=A0 chip->ecc.mode =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D NAND_ECC_HW;
>> + =C2=A0 =C2=A0 =C2=A0 chip->ecc.size =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D f->page_size;
>> + =C2=A0 =C2=A0 =C2=A0 if (f->page_size =3D=3D 2048)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chip->ecc.layout =3D =
&hw_largepage_ecclayout;
>> + =C2=A0 =C2=A0 =C2=A0 else
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chip->ecc.layout =3D =
&hw_smallpage_ecclayout;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 chip->chipsize =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D (uint64_t)f->num_blocks =C2=A0 =C2=A0 =C2=A0 * \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f->page_per_block =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 * \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f->page_size;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 chip->chip_shift =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D f=
fs(chip->chipsize) - 1;
>> + =C2=A0 =C2=A0 =C2=A0 mtd->size =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D chip->chipsize;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 /* Calculate the address shift from the page size=
 */
>> + =C2=A0 =C2=A0 =C2=A0 chip->page_shift =3D ffs(mtd->writesize) - 1;
>> + =C2=A0 =C2=A0 =C2=A0 chip->pagemask =3D mtd_div_by_ws(chip->chipsize, =
mtd) - 1;
>> + =C2=A0 =C2=A0 =C2=A0 chip->numchips =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D 1;
>> + =C2=A0 =C2=A0 =C2=A0 chip->chip_delay =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 2=
5;
>> + =C2=A0 =C2=A0 =C2=A0 chip->bbt_erase_shift =3D chip->phys_erase_shift =
=3D
>> ffs(mtd->erasesize) - 1;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 /* Set the bad block position */
>> + =C2=A0 =C2=A0 =C2=A0 chip->badblockpos =3D mtd->writesize > 512 ?
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NAND_LARGE_BADBLOCK_P=
OS : NAND_SMALL_BADBLOCK_POS;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 chip->options =3D (f->flash_width =3D=3D 16) ? NA=
ND_BUSWIDTH_16: 0;
>> + =C2=A0 =C2=A0 =C2=A0 chip->options |=3D NAND_NO_AUTOINCR;
>> + =C2=A0 =C2=A0 =C2=A0 chip->options |=3D NAND_NO_READRDY;
>> + =C2=A0 =C2=A0 =C2=A0 chip->options |=3D NAND_USE_FLASH_BBT;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 return nand_scan_tail(mtd);
>> +}
>> +
>> +static int pxa3xx_nand_default_block_markbad(struct mtd_info *mtd, loff=
_t
>> ofs)
>> +{
>> + =C2=A0 =C2=A0 =C2=A0 struct nand_chip *chip =3D mtd->priv;
>> + =C2=A0 =C2=A0 =C2=A0 int block;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 block =3D (int)(ofs >> chip->bbt_erase_shift);
>> + =C2=A0 =C2=A0 =C2=A0 chip->bbt[block >> 2] |=3D 0x01 << ((block & 0x03=
) << 1);
>> + =C2=A0 =C2=A0 =C2=A0 return nand_update_bbt(mtd, ofs);
>> +}
>> +
>> +static int pxa3xx_nand_block_bad(struct mtd_info *mtd, loff_t ofs, int
>> getchip)
>> +{
>> + =C2=A0 =C2=A0 =C2=A0 return 0;
>> =C2=A0}
>>
>> =C2=A0static int alloc_nand_resource(struct platform_device *pdev)
>> =C2=A0{
>> - =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_platform_data *pdata =3D pdev-=
>dev.platform_data;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pxa3xx_nand_info *info;
>> + =C2=A0 =C2=A0 =C2=A0 struct nand_chip *chip;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mtd_info *mtd;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *r;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret, irq;
>> @@ -1027,12 +1131,31 @@ static int alloc_nand_resource(struct
>> platform_device *pdev)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info =3D (struct pxa3xx_nand_info *)(&mtd[1])=
;
>> + =C2=A0 =C2=A0 =C2=A0 chip =3D (struct nand_chip *)(&mtd[1]);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->pdev =3D pdev;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 mtd->priv =3D info;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->mtd =3D mtd;
>> + =C2=A0 =C2=A0 =C2=A0 mtd->priv =3D info;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0mtd->owner =3D THIS_MODULE;
>>
>> + =C2=A0 =C2=A0 =C2=A0 chip->ecc.read_page =C2=A0 =C2=A0 =3D pxa3xx_nand=
_read_page_hwecc;
>> + =C2=A0 =C2=A0 =C2=A0 chip->ecc.write_page =C2=A0 =C2=A0=3D pxa3xx_nand=
_write_page_hwecc;
>> + =C2=A0 =C2=A0 =C2=A0 chip->ecc.hwctl =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D p=
xa3xx_nand_ecc_hwctl;
>> + =C2=A0 =C2=A0 =C2=A0 chip->ecc.calculate =C2=A0 =C2=A0 =3D pxa3xx_nand=
_ecc_calculate;
>> + =C2=A0 =C2=A0 =C2=A0 chip->ecc.correct =C2=A0 =C2=A0 =C2=A0 =3D pxa3xx=
_nand_ecc_correct;
>> + =C2=A0 =C2=A0 =C2=A0 chip->waitfunc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D pxa3xx_nand_waitfunc;
>> + =C2=A0 =C2=A0 =C2=A0 chip->select_chip =C2=A0 =C2=A0 =C2=A0 =3D pxa3xx=
_nand_select_chip;
>> + =C2=A0 =C2=A0 =C2=A0 chip->dev_ready =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D p=
xa3xx_nand_dev_ready;
>> + =C2=A0 =C2=A0 =C2=A0 chip->cmdfunc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D pxa3xx_nand_cmdfunc;
>> + =C2=A0 =C2=A0 =C2=A0 chip->read_word =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D p=
xa3xx_nand_read_word;
>> + =C2=A0 =C2=A0 =C2=A0 chip->read_byte =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D p=
xa3xx_nand_read_byte;
>> + =C2=A0 =C2=A0 =C2=A0 chip->read_buf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D pxa3xx_nand_read_buf;
>> + =C2=A0 =C2=A0 =C2=A0 chip->write_buf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D p=
xa3xx_nand_write_buf;
>> + =C2=A0 =C2=A0 =C2=A0 chip->verify_buf =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D p=
xa3xx_nand_verify_buf;
>> + =C2=A0 =C2=A0 =C2=A0 chip->block_markbad =C2=A0 =C2=A0 =3D pxa3xx_nand=
_default_block_markbad;
>> + =C2=A0 =C2=A0 =C2=A0 chip->block_bad =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D p=
xa3xx_nand_block_bad;
>> + =C2=A0 =C2=A0 =C2=A0 chip->scan_bbt =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D nand_default_bbt;
>> + =C2=A0 =C2=A0 =C2=A0 chip->erase_cmd =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D p=
xa3xx_nand_erase_cmd;
>> +
>
> this definitely has nothing to do with resource allocation.
>
This patch is just a code clean. In theory, alloc_nand_resource would
not overgrow for from whole code aspect, the most complex part is in
command handling.
Also we need know the status of nand chip in two chip select. Only by
this, than we can alloc proper resource.

Thanks,
Lei
