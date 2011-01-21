From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: Vimal Singh <vimal.newwork@gmail.com>
Date: Fri, 21 Jan 2011 09:37:33 +0530
Subject: RE: [PATCH] omap3: nand: bch ecc support added
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B036A8DAF6C@dbde02.ent.ti.com>
References: <1295518680-8737-1-git-send-email-s-ghorai@ti.com>
	<AANLkTin3pRkqLkQ_J1iTtqr0M+iz5V25S9ZwJc9+T0VW@mail.gmail.com>
In-Reply-To: <AANLkTin3pRkqLkQ_J1iTtqr0M+iz5V25S9ZwJc9+T0VW@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Kamat, Nishant" <nskamat@ti.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Vimal Singh [mailto:vimal.newwork@gmail.com]
> Sent: Thursday, January 20, 2011 8:47 PM
> To: Ghorai, Sukumar
> Cc: linux-omap@vger.kernel.org; linux-mtd@lists.infradead.org; linux-arm-
> kernel@lists.infradead.org; Kamat, Nishant
> Subject: Re: [PATCH] omap3: nand: bch ecc support added
>
> Hi Ghorai,
>
> I am the initial author of this patch. And I guess this patch still
> uses most of my work.
[Ghorai] I know you are working on it,

But I think your code was in a shape for -
1. not for up-streamble shape
2. non functional,
So can you check this version matching with your original code?
In that case I can add your Signed-off.

>
>
> Thanks and Regards,
> Vimal
>
> On Thu, Jan 20, 2011 at 3:48 PM, Sukumar Ghorai <s-ghorai@ti.com> wrote:
> > bch error correction (t=3D4 and t=3D8) for 512 bytes support added.
> > Tested in omap-3630 es-1.1 silicon.
> >
> > Need to select the bch-ecc from board file. E.g.
> > arch/arm/mach-omap2/board-flash.c: board_nand_init()
> > board_nand_data.ecc_opt =3D OMAP_ECC_BCH4_CODE_HW
> >
> > This patch has dependency on -
> > http://www.mail-archive.com/linux-omap@vger.kernel.org/msg42658.html
> >
> > Signed-off-by: Sukumar Ghorai <s-ghorai@ti.com>
> > ---
> >  arch/arm/mach-omap2/gpmc.c             |  126 ++++++++---
> >  arch/arm/plat-omap/include/plat/gpmc.h |    6 +-
> >  drivers/mtd/nand/Makefile              |    1 +
> >  drivers/mtd/nand/omap2.c               |  119 ++++++++--
> >  drivers/mtd/nand/omap_bch_decoder.c    |  393
> ++++++++++++++++++++++++++++++++
> >  5 files changed, 583 insertions(+), 62 deletions(-)
> >  create mode 100644 drivers/mtd/nand/omap_bch_decoder.c
> >
> > diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-omap2/gpmc.c
> > index 29c9732..91cfdca 100644
> > --- a/arch/arm/mach-omap2/gpmc.c
> > +++ b/arch/arm/mach-omap2/gpmc.c
> > @@ -48,6 +48,7 @@
> >  #define GPMC_ECC_CONTROL       0x1f8
> >  #define GPMC_ECC_SIZE_CONFIG   0x1fc
> >  #define GPMC_ECC1_RESULT        0x200
> > +#define GPMC_ECC_BCH_RESULT_0  0x240
> >
> >  #define GPMC_CS0_OFFSET                0x60
> >  #define GPMC_CS_SIZE           0x30
> > @@ -94,7 +95,6 @@ static struct resource        gpmc_mem_root;
> >  static struct resource gpmc_cs_mem[GPMC_CS_NUM];
> >  static DEFINE_SPINLOCK(gpmc_mem_lock);
> >  static unsigned int gpmc_cs_map;       /* flag for cs which are
> initialized */
> > -static int gpmc_ecc_used =3D -EINVAL;    /* cs using ecc engine */
> >
> >  static void __iomem *gpmc_base;
> >
> > @@ -832,52 +832,77 @@ void omap3_gpmc_restore_context(void)
> >
> >  /**
> >  * gpmc_enable_hwecc - enable hardware ecc functionality
> > + * @ecc_type: ecc type e.g. Hamming, BCH
> >  * @cs: chip select number
> >  * @mode: read/write mode
> >  * @dev_width: device bus width(1 for x16, 0 for x8)
> >  * @ecc_size: bytes for which ECC will be generated
> >  */
> > -int gpmc_enable_hwecc(int cs, int mode, int dev_width, int ecc_size)
> > +int gpmc_enable_hwecc(int ecc_type, int cs, int mode,
> > +                       int dev_width, int ecc_size)
> >  {
> > -       unsigned int val;
> > -
> > -       /* check if ecc module is in used */
> > -       if (gpmc_ecc_used !=3D -EINVAL)
> > -               return -EINVAL;
> > -
> > -       gpmc_ecc_used =3D cs;
> > -
> > -       /* clear ecc and enable bits */
> > -       val =3D ((0x00000001<<8) | 0x00000001);
> > -       gpmc_write_reg(GPMC_ECC_CONTROL, val);
> > -
> > -       /* program ecc and result sizes */
> > -       val =3D ((((ecc_size >> 1) - 1) << 22) | (0x0000000F));
> > -       gpmc_write_reg(GPMC_ECC_SIZE_CONFIG, val);
> > +       unsigned int bch_mod =3D 0, bch_wrapmode =3D 0, eccsize1 =3D 0,
> eccsize0 =3D 0;
> > +       unsigned int ecc_conf_val =3D 0, ecc_size_conf_val =3D 0;
> >
> >        switch (mode) {
> >        case GPMC_ECC_READ:
> > -               gpmc_write_reg(GPMC_ECC_CONTROL, 0x101);
> > +               if (ecc_type =3D=3D OMAP_ECC_BCH4_CODE_HW) {
> > +                       eccsize1 =3D 0xD; eccsize0 =3D 0x48;
> > +                       bch_mod =3D 0;
> > +                       bch_wrapmode =3D 0x09;
> > +               } else if (ecc_type =3D=3D OMAP_ECC_BCH8_CODE_HW) {
> > +                       eccsize1 =3D 0x1A; eccsize0 =3D 0x18;
> > +                       bch_mod =3D 1;
> > +                       bch_wrapmode =3D 0x04;
> > +               } else
> > +                       eccsize1 =3D ((ecc_size >> 1) - 1) << 22;
> >                break;
> > +
> >        case GPMC_ECC_READSYN:
> > -                gpmc_write_reg(GPMC_ECC_CONTROL, 0x100);
> >                break;
> > +
> >        case GPMC_ECC_WRITE:
> > -               gpmc_write_reg(GPMC_ECC_CONTROL, 0x101);
> > +               if (ecc_type =3D=3D OMAP_ECC_BCH4_CODE_HW) {
> > +                       eccsize1 =3D 0x20; eccsize0 =3D 0x00;
> > +                       bch_mod =3D 0;
> > +                       bch_wrapmode =3D 0x06;
> > +               } else if (ecc_type =3D=3D OMAP_ECC_BCH8_CODE_HW) {
> > +                       eccsize1 =3D 0x20; eccsize0 =3D 0x00;
> > +                       bch_mod =3D 1;
> > +                       bch_wrapmode =3D 0x06;
> > +               } else
> > +                       eccsize1 =3D ((ecc_size >> 1) - 1) << 22;
> >                break;
> > +
> >        default:
> >                printk(KERN_INFO "Error: Unrecognized Mode[%d]!\n",
> mode);
> >                break;
> >        }
> >
> > -       /* (ECC 16 or 8 bit col) | ( CS  )  | ECC Enable */
> > -       val =3D (dev_width << 7) | (cs << 1) | (0x1);
> > -       gpmc_write_reg(GPMC_ECC_CONFIG, val);
> > +       /* clear ecc and enable bits */
> > +       if ((ecc_type =3D=3D OMAP_ECC_BCH4_CODE_HW) ||
> > +               (ecc_type =3D=3D OMAP_ECC_BCH8_CODE_HW)) {
> > +               gpmc_write_reg(GPMC_ECC_CONTROL, 0x00000001);
> > +               ecc_size_conf_val =3D (eccsize1 << 22) | (eccsize0 << 1=
2);
> > +               ecc_conf_val =3D ((0x01 << 16) | (bch_mod << 12)
> > +                       | (bch_wrapmode << 8) | (dev_width << 7)
> > +                       | (0x03 << 4) | (cs << 1) | (0x1));
> > +       } else {
> > +               gpmc_write_reg(GPMC_ECC_CONTROL, 0x00000101);
> > +               ecc_size_conf_val =3D (eccsize1 << 22) | 0x0000000F;
> > +               ecc_conf_val =3D (dev_width << 7) | (cs << 1) | (0x1);
> > +       }
> > +
> > +       gpmc_write_reg(GPMC_ECC_SIZE_CONFIG, ecc_size_conf_val);
> > +       gpmc_write_reg(GPMC_ECC_CONFIG, ecc_conf_val);
> > +       gpmc_write_reg(GPMC_ECC_CONTROL, 0x00000101);
> > +
> >        return 0;
> >  }
> >
> >  /**
> >  * gpmc_calculate_ecc - generate non-inverted ecc bytes
> > + * @ecc_type: ecc type e.g. Hamming, BCH
> >  * @cs: chip select number
> >  * @dat: data pointer over which ecc is computed
> >  * @ecc_code: ecc code buffer
> > @@ -888,20 +913,51 @@ int gpmc_enable_hwecc(int cs, int mode, int
> dev_width, int ecc_size)
> >  * an erased page will produce an ECC mismatch between generated and
> read
> >  * ECC bytes that has to be dealt with separately.
> >  */
> > -int gpmc_calculate_ecc(int cs, const u_char *dat, u_char *ecc_code)
> > +int gpmc_calculate_ecc(int ecc_type, int cs,
> > +                       const u_char *dat, u_char *ecc_code)
> >  {
> > -       unsigned int val =3D 0x0;
> > -
> > -       if (gpmc_ecc_used !=3D cs)
> > -               return -EINVAL;
> > +       unsigned int reg;
> > +       unsigned int val1 =3D 0x0, val2 =3D 0x0;
> > +       unsigned int val3 =3D 0x0, val4 =3D 0x0;
> > +       int i;
> >
> > -       /* read ecc result */
> > -       val =3D gpmc_read_reg(GPMC_ECC1_RESULT);
> > -       *ecc_code++ =3D val;          /* P128e, ..., P1e */
> > -       *ecc_code++ =3D val >> 16;    /* P128o, ..., P1o */
> > -       /* P2048o, P1024o, P512o, P256o, P2048e, P1024e, P512e, P256e *=
/
> > -       *ecc_code++ =3D ((val >> 8) & 0x0f) | ((val >> 20) & 0xf0);
> > +       if ((ecc_type =3D=3D OMAP_ECC_BCH4_CODE_HW) ||
> > +               (ecc_type =3D=3D OMAP_ECC_BCH8_CODE_HW)) {
> > +               for (i =3D 0; i < 4; i++) {
> > +                       /*
> > +                        * Reading HW ECC_BCH_Results
> > +                        * 0x240-0x24C, 0x250-0x25C, 0x260-0x26C, 0x270=
-
> 0x27C
> > +                        */
> > +                       reg =3D  GPMC_ECC_BCH_RESULT_0 + (0x10 * i);
> > +                       val1 =3D gpmc_read_reg(reg);
> > +                       val2 =3D gpmc_read_reg(reg + 4);
> > +                       if (ecc_type =3D=3D OMAP_ECC_BCH8_CODE_HW) {
> > +                               val3 =3D gpmc_read_reg(reg + 8);
> > +                               val4 =3D gpmc_read_reg(reg + 12);
> > +
> > +                               *ecc_code++ =3D (val4 & 0xFF);
> > +                               *ecc_code++ =3D ((val3 >> 24) & 0xFF);
> > +                               *ecc_code++ =3D ((val3 >> 16) & 0xFF);
> > +                               *ecc_code++ =3D ((val3 >> 8) & 0xFF);
> > +                               *ecc_code++ =3D (val3 & 0xFF);
> > +                               *ecc_code++ =3D ((val2 >> 24) & 0xFF);
> > +                       }
> > +                       *ecc_code++ =3D ((val2 >> 16) & 0xFF);
> > +                       *ecc_code++ =3D ((val2 >> 8) & 0xFF);
> > +                       *ecc_code++ =3D (val2 & 0xFF);
> > +                       *ecc_code++ =3D ((val1 >> 24) & 0xFF);
> > +                       *ecc_code++ =3D ((val1 >> 16) & 0xFF);
> > +                       *ecc_code++ =3D ((val1 >> 8) & 0xFF);
> > +                       *ecc_code++ =3D (val1 & 0xFF);
> > +               }
> > +       } else {
> > +               /* read ecc result */
> > +               val1 =3D gpmc_read_reg(GPMC_ECC1_RESULT);
> > +               *ecc_code++ =3D val1;          /* P128e, ..., P1e */
> > +               *ecc_code++ =3D val1 >> 16;    /* P128o, ..., P1o */
> > +               /* P2048o, P1024o, P512o, P256o, P2048e, P1024e, P512e,
> P256e */
> > +               *ecc_code++ =3D ((val1 >> 8) & 0x0f) | ((val1 >> 20) &
> 0xf0);
> > +       }
> >
> > -       gpmc_ecc_used =3D -EINVAL;
> >        return 0;
> >  }
> > diff --git a/arch/arm/plat-omap/include/plat/gpmc.h b/arch/arm/plat-
> omap/include/plat/gpmc.h
> > index 49aea09..838c185 100644
> > --- a/arch/arm/plat-omap/include/plat/gpmc.h
> > +++ b/arch/arm/plat-omap/include/plat/gpmc.h
> > @@ -92,6 +92,8 @@ enum omap_ecc {
> >        OMAP_ECC_HAMMING_CODE_HW, /* gpmc to detect the error */
> >                /* 1-bit ecc: stored at begining of spare area as romcod=
e
> */
> >        OMAP_ECC_HAMMING_CODE_HW_ROMCODE, /* gpmc method & romcode layou=
t
> */
> > +       OMAP_ECC_BCH4_CODE_HW, /* gpmc bch detection & s/w method
> correction */
> > +       OMAP_ECC_BCH8_CODE_HW, /* gpmc bch detection & s/w method
> correction */
> >  };
> >
> >  /*
> > @@ -156,6 +158,6 @@ extern int gpmc_cs_configure(int cs, int cmd, int
> wval);
> >  extern int gpmc_nand_read(int cs, int cmd);
> >  extern int gpmc_nand_write(int cs, int cmd, int wval);
> >
> > -int gpmc_enable_hwecc(int cs, int mode, int dev_width, int ecc_size);
> > -int gpmc_calculate_ecc(int cs, const u_char *dat, u_char *ecc_code);
> > +int gpmc_enable_hwecc(int ecc, int cs, int mode, int dev_width, int
> ecc_size);
> > +int gpmc_calculate_ecc(int ecc, int cs, const u_char *dat, u_char
> *ecc_code);
> >  #endif
> > diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> > index 8ad6fae..ae02711 100644
> > --- a/drivers/mtd/nand/Makefile
> > +++ b/drivers/mtd/nand/Makefile
> > @@ -29,6 +29,7 @@ obj-$(CONFIG_MTD_NAND_NDFC)           +=3D ndfc.o
> >  obj-$(CONFIG_MTD_NAND_ATMEL)           +=3D atmel_nand.o
> >  obj-$(CONFIG_MTD_NAND_GPIO)            +=3D gpio.o
> >  obj-$(CONFIG_MTD_NAND_OMAP2)           +=3D omap2.o
> > +obj-$(CONFIG_MTD_NAND_OMAP2)           +=3D omap_bch_decoder.o
> >  obj-$(CONFIG_MTD_NAND_CM_X270)         +=3D cmx270_nand.o
> >  obj-$(CONFIG_MTD_NAND_PXA3xx)          +=3D pxa3xx_nand.o
> >  obj-$(CONFIG_MTD_NAND_TMIO)            +=3D tmio_nand.o
> > diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> > index 4e33972..14c7dfe 100644
> > --- a/drivers/mtd/nand/omap2.c
> > +++ b/drivers/mtd/nand/omap2.c
> > @@ -98,6 +98,8 @@
> >  static const char *part_probes[] =3D { "cmdlinepart", NULL };
> >  #endif
> >
> > +int decode_bch(int select_4_8, unsigned char *ecc, unsigned int
> *err_loc);
> > +
> >  /* oob info generated runtime depending on ecc algorithm and layout
> selected */
> >  static struct nand_ecclayout omap_oobinfo;
> >  /* Define some generic bad / good block scan pattern which are used
> > @@ -130,7 +132,8 @@ struct omap_nand_info {
> >                OMAP_NAND_IO_WRITE,     /* write */
> >        } iomode;
> >        u_char                          *buf;
> > -       int                                     buf_len;
> > +       int                             buf_len;
> > +       int                             ecc_opt;
> >  };
> >
> >  /**
> > @@ -529,7 +532,6 @@ static void omap_read_buf_irq_pref(struct mtd_info
> *mtd, u_char *buf, int len)
> >        struct omap_nand_info *info =3D container_of(mtd,
> >                                                struct omap_nand_info,
> mtd);
> >        int ret =3D 0;
> > -
> >        if (len <=3D mtd->oobsize) {
> >                omap_read_buf_pref(mtd, buf, len);
> >                return;
> > @@ -803,6 +805,8 @@ static int omap_correct_data(struct mtd_info *mtd,
> u_char *dat,
> >        struct omap_nand_info *info =3D container_of(mtd, struct
> omap_nand_info,
> >                                                        mtd);
> >        int blockCnt =3D 0, i =3D 0, ret =3D 0;
> > +       int j, eccsize, eccflag, count;
> > +       unsigned int err_loc[8];
> >
> >        /* Ex NAND_ECC_HW12_2048 */
> >        if ((info->nand.ecc.mode =3D=3D NAND_ECC_HW) &&
> > @@ -811,16 +815,57 @@ static int omap_correct_data(struct mtd_info *mtd=
,
> u_char *dat,
> >        else
> >                blockCnt =3D 1;
> >
> > -       for (i =3D 0; i < blockCnt; i++) {
> > -               if (memcmp(read_ecc, calc_ecc, 3) !=3D 0) {
> > -                       ret =3D omap_compare_ecc(read_ecc, calc_ecc, da=
t);
> > -                       if (ret < 0)
> > -                               return ret;
> > +       switch (info->ecc_opt) {
> > +       case OMAP_ECC_HAMMING_CODE_HW:
> > +       case OMAP_ECC_HAMMING_CODE_HW_ROMCODE:
> > +               for (i =3D 0; i < blockCnt; i++) {
> > +                       if (memcmp(read_ecc, calc_ecc, 3) !=3D 0) {
> > +                               ret =3D omap_compare_ecc(read_ecc,
> calc_ecc, dat);
> > +                               if (ret < 0)
> > +                                       return ret;
> > +                       }
> > +                       read_ecc +=3D 3;
> > +                       calc_ecc +=3D 3;
> > +                       dat      +=3D 512;
> >                }
> > -               read_ecc +=3D 3;
> > -               calc_ecc +=3D 3;
> > -               dat      +=3D 512;
> > +               break;
> > +
> > +       case OMAP_ECC_BCH4_CODE_HW:
> > +               eccsize =3D 7;
> > +               gpmc_calculate_ecc(info->ecc_opt, info->gpmc_cs, dat,
> calc_ecc);
> > +               for (i =3D 0; i < blockCnt; i++) {
> > +                       /* check if any ecc error */
> > +                       eccflag =3D 0;
> > +                       for (j =3D 0; (j < eccsize) && (eccflag =3D=3D =
0);
> j++)
> > +                               if (calc_ecc[j] !=3D 0)
> > +                                       eccflag =3D 1;
> > +
> > +                       if (eccflag =3D=3D 1) {
> > +                               eccflag =3D 0;
> > +                               for (j =3D 0; (j < eccsize) &&
> > +                                               (eccflag =3D=3D 0); j++=
)
> > +                                       if (read_ecc[j] !=3D 0xFF)
> > +                                               eccflag =3D 1;
> > +                       }
> > +
> > +                       count =3D 0;
> > +                       if (eccflag =3D=3D 1)
> > +                               count =3D decode_bch(0, calc_ecc,
> err_loc);
> > +
> > +                       for (j =3D 0; j < count; j++) {
> > +                               if (err_loc[j] < 4096)
> > +                                       dat[err_loc[j] >> 3] ^=3D
> > +                                                       1 << (err_loc[j=
]
> & 7);
> > +                               /* else, not interested to correct ecc
> */
> > +                       }
> > +
> > +                       calc_ecc =3D calc_ecc + eccsize;
> > +                       read_ecc =3D read_ecc + eccsize;
> > +                       dat +=3D 512;
> > +               }
> > +               break;
> >        }
> > +
> >        return 0;
> >  }
> >
> > @@ -841,7 +886,7 @@ static int omap_calculate_ecc(struct mtd_info *mtd,
> const u_char *dat,
> >  {
> >        struct omap_nand_info *info =3D container_of(mtd, struct
> omap_nand_info,
> >                                                        mtd);
> > -       return gpmc_calculate_ecc(info->gpmc_cs, dat, ecc_code);
> > +       return gpmc_calculate_ecc(info->ecc_opt, info->gpmc_cs, dat,
> ecc_code);
> >  }
> >
> >  /**
> > @@ -856,7 +901,8 @@ static void omap_enable_hwecc(struct mtd_info *mtd,
> int mode)
> >        struct nand_chip *chip =3D mtd->priv;
> >        unsigned int dev_width =3D (chip->options & NAND_BUSWIDTH_16) ? =
1 :
> 0;
> >
> > -       gpmc_enable_hwecc(info->gpmc_cs, mode, dev_width, info-
> >nand.ecc.size);
> > +       gpmc_enable_hwecc(info->ecc_opt, info->gpmc_cs, mode,
> > +                               dev_width, info->nand.ecc.size);
> >  }
> >
> >  /**
> > @@ -953,6 +999,7 @@ static int __devinit omap_nand_probe(struct
> platform_device *pdev)
> >        info->mtd.priv          =3D &info->nand;
> >        info->mtd.name          =3D dev_name(&pdev->dev);
> >        info->mtd.owner         =3D THIS_MODULE;
> > +       info->ecc_opt           =3D pdata->ecc_opt;
> >
> >        info->nand.options      =3D pdata->devsize;
> >        info->nand.options      |=3D NAND_SKIP_BBTSCAN;
> > @@ -991,7 +1038,6 @@ static int __devinit omap_nand_probe(struct
> platform_device *pdev)
> >                info->nand.waitfunc =3D omap_wait;
> >                info->nand.chip_delay =3D 50;
> >        }
> > -
> >        switch (pdata->xfer_type) {
> >        case NAND_OMAP_PREFETCH_POLLED:
> >                info->nand.read_buf   =3D omap_read_buf_pref;
> > @@ -1052,10 +1098,17 @@ static int __devinit omap_nand_probe(struct
> platform_device *pdev)
> >        /* selsect the ecc type */
> >        if (pdata->ecc_opt =3D=3D OMAP_ECC_HAMMING_CODE_DEFAULT)
> >                info->nand.ecc.mode =3D NAND_ECC_SOFT;
> > -       else if ((pdata->ecc_opt =3D=3D OMAP_ECC_HAMMING_CODE_HW) ||
> > -               (pdata->ecc_opt =3D=3D OMAP_ECC_HAMMING_CODE_HW_ROMCODE=
)) {
> > -               info->nand.ecc.bytes            =3D 3;
> > -               info->nand.ecc.size             =3D 512;
> > +       else {
> > +               if (pdata->ecc_opt =3D=3D OMAP_ECC_BCH4_CODE_HW) {
> > +                       info->nand.ecc.bytes    =3D 4*7;
> > +                       info->nand.ecc.size     =3D 4*512;
> > +               } else if (pdata->ecc_opt =3D=3D OMAP_ECC_BCH8_CODE_HW)=
 {
> > +                       info->nand.ecc.bytes    =3D 13;
> > +                       info->nand.ecc.size     =3D 4*512;
> > +               } else {
> > +                       info->nand.ecc.bytes    =3D 3;
> > +                       info->nand.ecc.size     =3D 512;
> > +               }
> >                info->nand.ecc.calculate        =3D omap_calculate_ecc;
> >                info->nand.ecc.hwctl            =3D omap_enable_hwecc;
> >                info->nand.ecc.correct          =3D omap_correct_data;
> > @@ -1073,8 +1126,8 @@ static int __devinit omap_nand_probe(struct
> platform_device *pdev)
> >                }
> >        }
> >
> > -       /* rom code layout */
> > -       if (pdata->ecc_opt =3D=3D OMAP_ECC_HAMMING_CODE_HW_ROMCODE) {
> > +       /* select ecc lyout */
> > +       if (info->nand.ecc.mode !=3D NAND_ECC_SOFT) {
> >
> >                if (info->nand.options & NAND_BUSWIDTH_16)
> >                        offset =3D 2;
> > @@ -1082,15 +1135,31 @@ static int __devinit omap_nand_probe(struct
> platform_device *pdev)
> >                        offset =3D 1;
> >                        info->nand.badblock_pattern =3D
> &bb_descrip_flashbased;
> >                }
> > -               omap_oobinfo.eccbytes =3D 3 * (info->mtd.oobsize/16);
> > -               for (i =3D 0; i < omap_oobinfo.eccbytes; i++)
> > -                       omap_oobinfo.eccpos[i] =3D i+offset;
> >
> > -               omap_oobinfo.oobfree->offset =3D offset +
> omap_oobinfo.eccbytes;
> > -               omap_oobinfo.oobfree->length =3D info->mtd.oobsize -
> > -                                       (offset +
> omap_oobinfo.eccbytes);
> > +               if (info->mtd.oobsize =3D=3D 64)
> > +                       omap_oobinfo.eccbytes =3D info->nand.ecc.bytes =
*
> > +                                               2048/info-
> >nand.ecc.size;
> > +               else
> > +                       omap_oobinfo.eccbytes =3D info->nand.ecc.bytes;
> > +
> > +               if (pdata->ecc_opt =3D=3D OMAP_ECC_HAMMING_CODE_HW_ROMC=
ODE)
> {
> > +                       for (i =3D 0; i < omap_oobinfo.eccbytes; i++)
> > +                               omap_oobinfo.eccpos[i] =3D i + offset;
> > +                       omap_oobinfo.oobfree->offset =3D
> > +                                               offset +
> omap_oobinfo.eccbytes;
> > +                       omap_oobinfo.oobfree->length =3D info->mtd.oobs=
ize
> -
> > +                                               offset -
> omap_oobinfo.eccbytes;
> > +               } else {
> >
> > +                       omap_oobinfo.oobfree->offset =3D offset;
> > +                       omap_oobinfo.oobfree->length =3D info->mtd.oobs=
ize
> -
> > +                                               offset -
> omap_oobinfo.eccbytes;
> > +                       offset =3D info->mtd.oobsize -
> omap_oobinfo.eccbytes;
> > +                       for (i =3D 0; i < omap_oobinfo.eccbytes; i++)
> > +                               omap_oobinfo.eccpos[i] =3D i + offset;
> > +               }
> >                info->nand.ecc.layout =3D &omap_oobinfo;
> > +
> >        }
> >
> >  #ifdef CONFIG_MTD_PARTITIONS
> > diff --git a/drivers/mtd/nand/omap_bch_decoder.c
> b/drivers/mtd/nand/omap_bch_decoder.c
> > new file mode 100644
> > index 0000000..da42bda
> > --- /dev/null
> > +++ b/drivers/mtd/nand/omap_bch_decoder.c
> > @@ -0,0 +1,393 @@
> > +/*
> > + * drivers/mtd/nand/omap_omap_bch_decoder.c
> > + *
> > + * Whole BCH ECC Decoder (Post hardware generated syndrome decoding)
> > + *
> > + * Copyright (c) 2007 Texas Instruments
> > + *
> > + * Author: Sukumar Ghorai <s-ghorai@ti.com
> > + *                Michael Fillinger <m-fillinger@ti.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + */
> > +#undef DEBUG
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +
> > +#define mm             13
> > +#define kk_shorten     4096
> > +#define nn             8191    /* Length of codeword, n =3D 2**mm - 1 =
*/
> > +
> > +#define PPP    0x201B  /* Primary Polynomial : x^13 + x^4 + x^3 + x + =
1
> */
> > +#define P      0x001B  /* With omitted x^13 */
> > +#define POLY   12      /* degree of the primary Polynomial less one */
> > +
> > +/**
> > + * mpy_mod_gf - GALOIS field multiplier
> > + * Input  : A(x), B(x)
> > + * Output : A(x)*B(x) mod P(x)
> > + */
> > +static unsigned int mpy_mod_gf(unsigned int a, unsigned int b)
> > +{
> > +       unsigned int R =3D 0;
> > +       unsigned int R1 =3D 0;
> > +       unsigned int k =3D 0;
> > +
> > +       for (k =3D 0; k < mm; k++) {
> > +
> > +               R =3D (R << 1) & 0x1FFE;
> > +               if (R1 =3D=3D 1)
> > +                       R ^=3D P;
> > +
> > +               if (((a >> (POLY - k)) & 1) =3D=3D 1)
> > +                       R ^=3D b;
> > +
> > +               if (k < POLY)
> > +                       R1 =3D (R >> POLY) & 1;
> > +       }
> > +       return R;
> > +}
> > +
> > +/**
> > + * chien - CHIEN search
> > + *
> > + * @location - Error location vector pointer
> > + *
> > + * Inputs  : ELP(z)
> > + *          No. of found errors
> > + *          Size of input codeword
> > + * Outputs : Up to 8 locations
> > + *          No. of errors
> > + */
> > +static int chien(unsigned int select_4_8, int err_nums,
> > +                               unsigned int err[], unsigned int
> *location)
> > +{
> > +       int i, count; /* Number of dectected errors */
> > +       /* Contains accumulation of evaluation at x^i (i:1->8) */
> > +       unsigned int gammas[8] =3D {0};
> > +       unsigned int alpha;
> > +       unsigned int bit, ecc_bits;
> > +       unsigned int elp_sum;
> > +
> > +       ecc_bits =3D (select_4_8 =3D=3D 0) ? 52 : 104;
> > +
> > +       /* Start evaluation at Alpha**8192 and decreasing */
> > +       for (i =3D 0; i < 8; i++)
> > +               gammas[i] =3D err[i];
> > +
> > +       count =3D 0;
> > +       for (i =3D 1; (i <=3D nn) && (count < err_nums); i++) {
> > +
> > +               /* Result of evaluation at root */
> > +               elp_sum =3D 1 ^ gammas[0] ^ gammas[1] ^
> > +                               gammas[2] ^ gammas[3] ^
> > +                               gammas[4] ^ gammas[5] ^
> > +                               gammas[6] ^ gammas[7];
> > +
> > +               alpha =3D PPP >> 1;
> > +               gammas[0] =3D mpy_mod_gf(gammas[0], alpha);
> > +               alpha =3D mpy_mod_gf(alpha, (PPP >> 1));  /* x alphha^-=
2
> */
> > +               gammas[1] =3D mpy_mod_gf(gammas[1], alpha);
> > +               alpha =3D mpy_mod_gf(alpha, (PPP >> 1));  /* x alphha^-=
2
> */
> > +               gammas[2] =3D mpy_mod_gf(gammas[2], alpha);
> > +               alpha =3D mpy_mod_gf(alpha, (PPP >> 1));  /* x alphha^-=
3
> */
> > +               gammas[3] =3D mpy_mod_gf(gammas[3], alpha);
> > +               alpha =3D mpy_mod_gf(alpha, (PPP >> 1));  /* x alphha^-=
4
> */
> > +               gammas[4] =3D mpy_mod_gf(gammas[4], alpha);
> > +               alpha =3D mpy_mod_gf(alpha, (PPP >> 1));  /* x alphha^-=
5
> */
> > +               gammas[5] =3D mpy_mod_gf(gammas[5], alpha);
> > +               alpha =3D mpy_mod_gf(alpha, (PPP >> 1));  /* x alphha^-=
6
> */
> > +               gammas[6] =3D mpy_mod_gf(gammas[6], alpha);
> > +               alpha =3D mpy_mod_gf(alpha, (PPP >> 1));  /* x alphha^-=
7
> */
> > +               gammas[7] =3D mpy_mod_gf(gammas[7], alpha);
> > +
> > +               if (elp_sum =3D=3D 0) {
> > +                       /* calculate bit position in main data area */
> > +                       bit =3D ((i-1) & ~7)|(7-((i-1) & 7));
> > +                       if (i >=3D 2 * ecc_bits)
> > +                               location[count++] =3D
> > +                                       kk_shorten - (bit - 2 *
> ecc_bits) - 1;
> > +               }
> > +       }
> > +
> > +       /* Failure: No. of detected errors !=3D No. or corrected errors=
 */
> > +       if (count !=3D err_nums) {
> > +               count =3D -1;
> > +               printk(KERN_ERR "BCH decoding failed\n");
> > +       }
> > +       for (i =3D 0; i < count; i++)
> > +               pr_debug("%d ", location[i]);
> > +
> > +       return count;
> > +}
> > +
> > +/* synd : 16 Syndromes
> > + * return: gamaas - Coefficients to the error polynomial
> > + * return: : Number of detected errors
> > +*/
> > +static unsigned int berlekamp(unsigned int select_4_8,
> > +                       unsigned int synd[], unsigned int err[])
> > +{
> > +       int loop, iteration;
> > +       unsigned int LL =3D 0;            /* Detected errors */
> > +       unsigned int d =3D 0;     /* Distance between Syndromes and
> ELP[n](z) */
> > +       unsigned int invd =3D 0;          /* Inverse of d */
> > +       /* Intermediate ELP[n](z).
> > +        * Final ELP[n](z) is Error Location Polynomial
> > +        */
> > +       unsigned int gammas[16] =3D {0};
> > +       /* Intermediate normalized ELP[n](z) : D[n](z) */
> > +       unsigned int D[16] =3D {0};
> > +       /* Temporary value that holds an ELP[n](z) coefficient */
> > +       unsigned int next_gamma =3D 0;
> > +
> > +       int e =3D 0;
> > +       unsigned int sign =3D 0;
> > +       unsigned int u =3D 0;
> > +       unsigned int v =3D 0;
> > +       unsigned int C1 =3D 0, C2 =3D 0;
> > +       unsigned int ss =3D 0;
> > +       unsigned int tmp_v =3D 0, tmp_s =3D 0;
> > +       unsigned int tmp_poly;
> > +
> > +       /*-------------- Step 0 ------------------*/
> > +       for (loop =3D 0; loop < 16; loop++)
> > +               gammas[loop] =3D 0;
> > +       gammas[0] =3D 1;
> > +       D[1] =3D 1;
> > +
> > +       iteration =3D 0;
> > +       LL =3D 0;
> > +       while ((iteration < ((select_4_8+1)*2*4)) &&
> > +                       (LL <=3D ((select_4_8+1)*4))) {
> > +
> > +               pr_debug("\nIteration.............%d\n", iteration);
> > +               d =3D 0;
> > +               /* Step: 0 */
> > +               for (loop =3D 0; loop <=3D LL; loop++) {
> > +                       tmp_poly =3D mpy_mod_gf(
> > +                                       gammas[loop], synd[iteration -
> loop]);
> > +                       d ^=3D tmp_poly;
> > +                       pr_debug("%02d. s=3D0 LL=3D%x poly %x\n",
> > +                                       loop, LL, tmp_poly);
> > +               }
> > +
> > +               /* Step 1: 1 cycle only to perform inversion */
> > +               v =3D d << 1;
> > +               e =3D -1;
> > +               sign =3D 1;
> > +               ss =3D 0x2000;
> > +               invd =3D 0;
> > +               u =3D PPP;
> > +               for (loop =3D 0; (d !=3D 0) && (loop <=3D (2 * POLY)); =
loop++)
> {
> > +                       pr_debug("%02d. s=3D1 LL=3D%x poly NULL\n",
> > +                                               loop, LL);
> > +                       C1 =3D (v >> 13) & 1;
> > +                       C2 =3D C1 & sign;
> > +
> > +                       sign ^=3D C2 ^ (e =3D=3D 0);
> > +
> > +                       tmp_v =3D v;
> > +                       tmp_s =3D ss;
> > +
> > +                       if (C1 =3D=3D 1) {
> > +                               v ^=3D u;
> > +                               ss ^=3D invd;
> > +                       }
> > +                       v =3D (v << 1) & 0x3FFF;
> > +                       if (C2 =3D=3D 1) {
> > +                               u =3D tmp_v;
> > +                               invd =3D tmp_s;
> > +                               e =3D -e;
> > +                       }
> > +                       invd >>=3D 1;
> > +                       e--;
> > +               }
> > +
> > +               for (loop =3D 0; (d !=3D 0) && (loop <=3D (iteration + =
1));
> loop++) {
> > +                       /* Step 2
> > +                        * Interleaved with Step 3, if L<(n-k)
> > +                        * invd: Update of ELP[n](z) =3D ELP[n-1](z) -
> d.D[n-1](z)
> > +                        */
> > +
> > +                       /* Holds value of ELP coefficient until
> precedent
> > +                        * value does not have to be used anymore
> > +                        */
> > +                       tmp_poly =3D mpy_mod_gf(d, D[loop]);
> > +                       pr_debug("%02d. s=3D2 LL=3D%x poly %x\n",
> > +                                               loop, LL, tmp_poly);
> > +
> > +                       next_gamma =3D gammas[loop] ^ tmp_poly;
> > +                       if ((2 * LL) < (iteration + 1)) {
> > +                               /* Interleaving with Step 3
> > +                                * for parallelized update of ELP(z) an=
d
> D(z)
> > +                                */
> > +                       } else {
> > +                               /* Update of ELP(z) only -> stay in Ste=
p
> 2 */
> > +                               gammas[loop] =3D next_gamma;
> > +                               if (loop =3D=3D (iteration + 1)) {
> > +                                       /* to step 4 */
> > +                                       break;
> > +                               }
> > +                       }
> > +
> > +                       /* Step 3
> > +                        * Always interleaved with Step 2 (case when
> L<(n-k))
> > +                        * Update of D[n-1](z) =3D ELP[n-1](z)/d
> > +                        */
> > +                       D[loop] =3D mpy_mod_gf(gammas[loop], invd);
> > +                       pr_debug("%02d. s=3D3 LL=3D%x poly %x\n",
> > +                                       loop, LL, D[loop]);
> > +
> > +                       /* Can safely update ELP[n](z) */
> > +                       gammas[loop] =3D next_gamma;
> > +
> > +                       if (loop =3D=3D (iteration + 1)) {
> > +                               /* If update finished */
> > +                               LL =3D iteration - LL + 1;
> > +                               /* to step 4 */
> > +                               break;
> > +                       }
> > +                       /* Else, interleaving to step 2*/
> > +               }
> > +
> > +               /* Step 4: Update D(z): i:0->L */
> > +               /* Final update of D[n](z) =3D D[n](z).z*/
> > +               for (loop =3D 0; loop < 15; loop++) /* Left Shift */
> > +                       D[15 - loop] =3D D[14 - loop];
> > +
> > +               D[0] =3D 0;
> > +
> > +               iteration++;
> > +       } /* while */
> > +
> > +       /* Processing finished, copy ELP to final registers : 0->2t-1*/
> > +       for (loop =3D 0; loop < 8; loop++)
> > +               err[loop] =3D gammas[loop+1];
> > +
> > +       pr_debug("\n Err poly:");
> > +       for (loop =3D 0; loop < 8; loop++)
> > +               pr_debug("0x%x ", err[loop]);
> > +
> > +       return LL;
> > +}
> > +
> > +/*
> > + * syndrome - Generate syndrome components from hw generate syndrome
> > + * r(x) =3D c(x) + e(x)
> > + * s(x) =3D c(x) mod g(x) + e(x) mod g(x) =3D  e(x) mod g(x)
> > + * so receiver checks if the syndrome s(x) =3D r(x) mod g(x) is equal =
to
> zero.
> > + * unsigned int s[16]; - Syndromes
> > + */
> > +static void syndrome(unsigned int select_4_8,
> > +                                       unsigned char *ecc, unsigned in=
t
> syn[])
> > +{
> > +       unsigned int k, l, t;
> > +       unsigned int alpha_bit, R_bit;
> > +       int ecc_pos, ecc_min;
> > +
> > +       /* 2t-1 =3D 15 (for t=3D8) minimal polynomials of the first 15
> powers of a
> > +        * primitive elemmants of GF(m); Even powers minimal polynomial=
s
> are
> > +        * duplicate of odd powers' minimal polynomials.
> > +        * Odd powers of alpha (1 to 15)
> > +        */
> > +       unsigned int pow_alpha[8] =3D {0x0002, 0x0008, 0x0020, 0x0080,
> > +                                0x0200, 0x0800, 0x001B, 0x006C};
> > +
> > +       pr_debug("\n ECC[0..n]: ");
> > +       for (k =3D 0; k < 13; k++)
> > +               pr_debug("0x%x ", ecc[k]);
> > +
> > +       if (select_4_8 =3D=3D 0) {
> > +               t =3D 4;
> > +               ecc_pos =3D 55; /* bits(52-bits): 55->4 */
> > +               ecc_min =3D 4;
> > +       } else {
> > +               t =3D 8;
> > +               ecc_pos =3D 103; /* bits: 103->0 */
> > +               ecc_min =3D 0;
> > +       }
> > +
> > +       /* total numbber of syndrom to be used is 2t */
> > +       /* Step1: calculate the odd syndrome(s) */
> > +       R_bit =3D ((ecc[ecc_pos/8] >> (7 - ecc_pos%8)) & 1);
> > +       ecc_pos--;
> > +       for (k =3D 0; k < t; k++)
> > +               syn[2 * k] =3D R_bit;
> > +
> > +       while (ecc_pos >=3D ecc_min) {
> > +               R_bit =3D ((ecc[ecc_pos/8] >> (7 - ecc_pos%8)) & 1);
> > +               ecc_pos--;
> > +
> > +               for (k =3D 0; k < t; k++) {
> > +                       /* Accumulate value of x^i at alpha^(2k+1) */
> > +                       if (R_bit =3D=3D 1)
> > +                               syn[2*k] ^=3D pow_alpha[k];
> > +
> > +                       /* Compute a**(2k+1), using LSFR */
> > +                       for (l =3D 0; l < (2 * k + 1); l++) {
> > +                               alpha_bit =3D (pow_alpha[k] >> POLY) & =
1;
> > +                               pow_alpha[k] =3D (pow_alpha[k] << 1) &
> 0x1FFF;
> > +                               if (alpha_bit =3D=3D 1)
> > +                                       pow_alpha[k] ^=3D P;
> > +                       }
> > +               }
> > +       }
> > +
> > +       /* Step2: calculate the even syndrome(s)
> > +        * Compute S(a), where a is an even power of alpha
> > +        * Evenry even power of primitive element has the same minimal
> > +        * polynomial as some odd power of elemets.
> > +        * And based on S(a^2) =3D S^2(a)
> > +        */
> > +       for (k =3D 0; k < t; k++)
> > +               syn[2*k+1] =3D mpy_mod_gf(syn[k], syn[k]);
> > +
> > +       pr_debug("\n Syndromes: ");
> > +       for (k =3D 0; k < 16; k++)
> > +               pr_debug("0x%x ", syn[k]);
> > +}
> > +
> > +/**
> > + * decode_bch - BCH decoder for 4- and 8-bit error correction
> > + *
> > + * @ecc - ECC syndrome generated by hw BCH engine
> > + * @err_loc - pointer to error location array
> > + *
> > + * This function does post sydrome generation (hw generated) decoding
> > + * for:-
> > + * Dimension of Galoise Field: m =3D 13
> > + * Length of codeword: n =3D 2**m - 1
> > + * Number of errors that can be corrected: 4- or 8-bits
> > + * Length of information bit: kk =3D nn - rr
> > + */
> > +int decode_bch(int select_4_8, unsigned char *ecc, unsigned int
> *err_loc)
> > +{
> > +       int no_of_err;
> > +       unsigned int syn[16] =3D {0,};    /* 16 Syndromes */
> > +       unsigned int err_poly[8] =3D {0,};
> > +       /* Coefficients to the error polynomial
> > +        * ELP(x) =3D 1 + err0.x + err1.x^2 + ... + err7.x^8
> > +        */
> > +
> > +       /* Decoting involes three steps
> > +        * 1. Compute the syndrom from teh received codeword,
> > +        * 2. Find the error location polynomial from a set of equation=
s
> > +        *     derived from the syndrome,
> > +        * 3. Use the error location polynomial to identify errants bit=
s,
> > +        *
> > +        * And correcttion done by bit flips using error locaiton and
> expected
> > +        * to be outseide of this implementation.
> > +        */
> > +       syndrome(select_4_8, ecc, syn);
> > +       no_of_err =3D berlekamp(select_4_8, syn, err_poly);
> > +       if (no_of_err <=3D (4 << select_4_8))
> > +               no_of_err =3D chien(select_4_8, no_of_err, err_poly,
> err_loc);
> > +
> > +       return no_of_err;
> > +}
> > +EXPORT_SYMBOL(decode_bch);
> > +
> > --
> > 1.7.0.4
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-omap" i=
n
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
>
>
>
> --
> Regards,
> Vimal Singh
