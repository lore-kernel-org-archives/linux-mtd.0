Received: from devils.ext.ti.com ([198.47.26.153])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1ODrqt-000781-RB
	for linux-mtd@lists.infradead.org; Mon, 17 May 2010 04:22:54 +0000
From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: Vimal Singh <vimal.newwork@gmail.com>
Date: Mon, 17 May 2010 09:52:40 +0530
Subject: RE: [PATCH v2 1/2] omap3 nand: cleanup for not to use GPMC virtual
	address
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B030D8FB75B@dbde02.ent.ti.com>
References: <s-ghorai@ti.com>
	<1273850591-19040-1-git-send-email-s-ghorai@ti.com>
	<1273850591-19040-2-git-send-email-s-ghorai@ti.com>
	<AANLkTinGirx4-PPkpPhYEutbnN_uIPoYbA7BlUPCPnaK@mail.gmail.com>
In-Reply-To: <AANLkTinGirx4-PPkpPhYEutbnN_uIPoYbA7BlUPCPnaK@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "tony@atomide.com" <tony@atomide.com>,
	"Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"sakoman@gmail.com" <sakoman@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vimal,

> -----Original Message-----
> From: Vimal Singh [mailto:vimal.newwork@gmail.com]
> Sent: 2010-05-14 23:33
> To: Ghorai, Sukumar
> Cc: linux-omap@vger.kernel.org; Artem.Bityutskiy@nokia.com;
> tony@atomide.com; sakoman@gmail.com; linux-mtd@lists.infradead.org
> Subject: Re: [PATCH v2 1/2] omap3 nand: cleanup for not to use GPMC
> virtual address
>
> On Fri, May 14, 2010 at 8:53 PM, Sukumar Ghorai <s-ghorai@ti.com> wrote:
> [...]
>
> > diff --git a/arch/arm/mach-omap2/gpmc-onenand.c b/arch/arm/mach-
> omap2/gpmc-onenand.c
> > index 7bb6922..5d66817
> > --- a/arch/arm/mach-omap2/gpmc-onenand.c
> > +++ b/arch/arm/mach-omap2/gpmc-onenand.c
> > @@ -301,7 +301,7 @@ static int omap2_onenand_set_sync_mode(struct
> omap_onenand_platform_data *cfg,
> >                                (GPMC_CONFIG1_WAIT_READ_MON |
> >                                 GPMC_CONFIG1_WAIT_PIN_SEL(0))) |
> >                          GPMC_CONFIG1_DEVICESIZE_16 |
> > -                         GPMC_CONFIG1_DEVICETYPE_NOR |
> > +                         GPMC_CONFIG1_DEVICETYPE(GPMC_DEVICETYPE_NOR) =
|
> >                          GPMC_CONFIG1_MUXADDDATA);
>
> Please do not dp OneNAND changes in NAND patch.
[Ghorai] I agree.
>
> > diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-omap2/gpmc.c
> > index 5bc3ca0..a3fd1ed
> > --- a/arch/arm/mach-omap2/gpmc.c
> > +++ b/arch/arm/mach-omap2/gpmc.c
> > @@ -29,27 +29,27 @@
> >  #include <plat/sdrc.h>
> >
> >  /* GPMC register offsets */
> > -#define GPMC_REVISION          0x00
> > -#define GPMC_SYSCONFIG         0x10
> > -#define GPMC_SYSSTATUS         0x14
> > -#define GPMC_IRQSTATUS         0x18
> > -#define GPMC_IRQENABLE         0x1c
> > -#define GPMC_TIMEOUT_CONTROL   0x40
> > -#define GPMC_ERR_ADDRESS       0x44
> > -#define GPMC_ERR_TYPE          0x48
> > -#define GPMC_CONFIG            0x50
> > -#define GPMC_STATUS            0x54
> > -#define GPMC_PREFETCH_CONFIG1  0x1e0
> > -#define GPMC_PREFETCH_CONFIG2  0x1e4
> > -#define GPMC_PREFETCH_CONTROL  0x1ec
> > -#define GPMC_PREFETCH_STATUS   0x1f0
> > -#define GPMC_ECC_CONFIG                0x1f4
> > -#define GPMC_ECC_CONTROL       0x1f8
> > -#define GPMC_ECC_SIZE_CONFIG   0x1fc
> > -
> > -#define GPMC_CS0               0x60
> > -#define GPMC_CS_SIZE           0x30
> > -
> > +#define GPMC_REVISION           0x00
> > +#define GPMC_SYSCONFIG          0x10
> > +#define GPMC_SYSSTATUS          0x14
> > +#define GPMC_IRQSTATUS          0x18
> > +#define GPMC_IRQENABLE          0x1c
> > +#define GPMC_TIMEOUT_CONTROL    0x40
> > +#define GPMC_ERR_ADDRESS        0x44
> > +#define GPMC_ERR_TYPE           0x48
> > +#define GPMC_CONFIG             0x50
> > +#define GPMC_STATUS             0x54
> > +#define GPMC_PREFETCH_CONFIG1   0x1e0
> > +#define GPMC_PREFETCH_CONFIG2   0x1e4
> > +#define GPMC_PREFETCH_CONTROL   0x1ec
> > +#define GPMC_PREFETCH_STATUS    0x1f0
> > +#define GPMC_ECC_CONFIG         0x1f4
> > +#define GPMC_ECC_CONTROL        0x1f8
> > +#define GPMC_ECC_SIZE_CONFIG    0x1fc
> > +#define GPMC_ECC1_RESULT        0x200
> > +
> > +#define GPMC_CS0_BASE          0x60
> > +#define GPMC_CS_SIZE            0x30
> >  #define GPMC_MEM_START         0x00000000
> >  #define GPMC_MEM_END           0x3FFFFFFF
> >  #define BOOT_ROM_SPACE         0x100000        /* 1MB */
> > @@ -108,11 +108,27 @@ static u32 gpmc_read_reg(int idx)
> >        return __raw_readl(gpmc_base + idx);
> >  }
> >
> > +static void gpmc_cs_write_byte(int cs, int idx, u8 val)
> > +{
> > +       void __iomem *reg_addr;
> > +
> > +       reg_addr =3D gpmc_base + GPMC_CS0_BASE + (cs * GPMC_CS_SIZE) +
> idx;
> > +       __raw_writeb(val, reg_addr);
> > +}
> > +
> > +static u8 gpmc_cs_read_byte(int cs, int idx)
> > +{
> > +       void __iomem *reg_addr;
> > +
> > +       reg_addr =3D gpmc_base + GPMC_CS0_BASE + (cs * GPMC_CS_SIZE) +
> idx;
> > +       return __raw_readb(reg_addr);
> > +}
> > +
>
> I do not think we need these functions.
[Ghorai] This is used in gpmc_hwcontrol() and to get the nand status from o=
map2.c.

>
> >  void gpmc_cs_write_reg(int cs, int idx, u32 val)
> >  {
> >        void __iomem *reg_addr;
> >
> > -       reg_addr =3D gpmc_base + GPMC_CS0 + (cs * GPMC_CS_SIZE) + idx;
> > +       reg_addr =3D gpmc_base + GPMC_CS0_BASE + (cs * GPMC_CS_SIZE) +
> idx;
> >        __raw_writel(val, reg_addr);
> >  }
> >
> > @@ -120,7 +136,7 @@ u32 gpmc_cs_read_reg(int cs, int idx)
> >  {
> >        void __iomem *reg_addr;
> >
> > -       reg_addr =3D gpmc_base + GPMC_CS0 + (cs * GPMC_CS_SIZE) + idx;
> > +       reg_addr =3D gpmc_base + GPMC_CS0_BASE + (cs * GPMC_CS_SIZE) +
> idx;
> >        return __raw_readl(reg_addr);
> >  }
> >
> > @@ -419,6 +435,96 @@ void gpmc_cs_free(int cs)
> >  EXPORT_SYMBOL(gpmc_cs_free);
> >
> >  /**
> > + * gpmc_hwcontrol - hardware specific access (read/ write) to control
> > + * @write: need 1 for configure; 0 for reading the complete register
> > + * @cs: chip select number
> > + * @cmd: Command type
> > + * @wval: value/information to write
> > + * @rval: pointer to get the value back
> > + */
> > +int gpmc_hwcontrol(int write, int cs, int cmd, int wval, int *rval)
> > +{
> > +       u32 reg =3D 0;
> > +       u32 regval =3D 0;
> > +
> > +       switch (cmd) {
> > +
> > +       case GPMC_GET_SET_STATUS:
> > +               reg =3D GPMC_STATUS;
> > +               if (write)
> > +                       gpmc_write_reg(GPMC_STATUS, regval);
> > +               break;
> > +
> > +       case GPMC_GET_SET_IRQ_STATUS:
> > +               reg =3D GPMC_IRQSTATUS;
> > +               if (write)
> > +                       gpmc_write_reg(GPMC_IRQSTATUS, regval);
> > +               break;
> > +
> > +       case GPMC_GET_PREF_STATUS:
> > +               reg =3D GPMC_PREFETCH_STATUS;
> > +               break;
> > +
> > +       case GPMC_CONFIG_WP:
> > +               reg =3D GPMC_CONFIG;
> > +               regval =3D gpmc_read_reg(GPMC_CONFIG);
> > +           if (wval)
> > +                       regval &=3D ~GPMC_CONFIG_WRITEPROTECT; /* WP is=
 ON
> */
> > +               else
> > +                       regval |=3D GPMC_CONFIG_WRITEPROTECT;  /* WP is
> OFF */
> > +               gpmc_write_reg(reg, regval);
> > +               break;
> > +
> > +       case GPMC_CONFIG_RDY_BSY:
> > +               #define WR_RD_PIN_MONITORING    0x00600000
> > +               regval  =3D gpmc_cs_read_reg(cs, GPMC_CS_CONFIG1);
> > +               regval |=3D WR_RD_PIN_MONITORING;
> > +               gpmc_cs_write_reg(cs, GPMC_CS_CONFIG1, regval);
> > +               break;
> > +
> > +       case GPMC_CONFIG_DEV_SIZE:
> > +               regval  =3D gpmc_cs_read_reg(cs, GPMC_CS_CONFIG1);
> > +               regval |=3D GPMC_CONFIG1_DEVICESIZE(wval);
> > +               gpmc_cs_write_reg(cs, GPMC_CS_CONFIG1, regval);
> > +               break;
> > +
> > +       case GPMC_CONFIG_DEV_TYPE:
> > +               regval  =3D gpmc_cs_read_reg(cs, GPMC_CS_CONFIG1);
> > +               regval |=3D GPMC_CONFIG1_DEVICETYPE(wval);
> > +               if (wval =3D=3D GPMC_DEVICETYPE_NOR)
> > +                       regval |=3D GPMC_CONFIG1_MUXADDDATA;
> > +               gpmc_cs_write_reg(cs, GPMC_CS_CONFIG1, regval);
> > +               break;
> > +
> > +       case GPMC_NAND_COMMAND:
> > +               gpmc_cs_write_byte(cs, GPMC_CS_NAND_COMMAND, wval);
> > +               break;
> > +
> > +       case GPMC_NAND_ADDRESS:
> > +               gpmc_cs_write_byte(cs, GPMC_CS_NAND_ADDRESS, wval);
> > +               break;
> > +
> > +       case GPMC_NAND_DATA:
> > +               if (write)
> > +                       gpmc_cs_write_byte(cs, GPMC_CS_NAND_DATA, wval)=
;
> > +               else
> > +                       *rval =3D gpmc_cs_read_byte(cs,
> GPMC_CS_NAND_DATA);
> > +               break;
> > +
> > +       default:
> > +               dump_stack();
> > +               printk(KERN_ERR "not supported\n");
> > +               return -1;
> > +       }
> > +
> > +       if (!write && reg)
> > +               *rval =3D gpmc_read_reg(reg);
> > +
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL(gpmc_hwcontrol);
> > +
> > +/**
> >  * gpmc_prefetch_enable - configures and starts prefetch transfer
> >  * @cs: nand cs (chip select) number
> >  * @dma_mode: dma mode enable (1) or disable (0)
> > @@ -466,15 +572,6 @@ void gpmc_prefetch_reset(void)
> >  }
> >  EXPORT_SYMBOL(gpmc_prefetch_reset);
> >
> > -/**
> > - * gpmc_prefetch_status - reads prefetch status of engine
> > - */
> > -int  gpmc_prefetch_status(void)
> > -{
> > -       return gpmc_read_reg(GPMC_PREFETCH_STATUS);
> > -}
> > -EXPORT_SYMBOL(gpmc_prefetch_status);
> > -
> >  static void __init gpmc_mem_init(void)
> >  {
> >        int cs;
> > @@ -615,3 +712,86 @@ void omap3_gpmc_restore_context(void)
> >        }
> >  }
> >  #endif /* CONFIG_ARCH_OMAP3 */
> > +
> > +/**
> > + * gmpc_ecc_init - Initialize the HW ECC for NAND flash in GPMC
> controller
> > + * @cs: Chip select number
> > + * @ecc_size: bytes for which ECC will be generated
> > + */
> > +void gpmc_ecc_init(int cs, int ecc_size)
> > +{
> > +       unsigned int val =3D 0x0;
> > +
> > +       /* Read from ECC Control Register */
> > +       val =3D gpmc_read_reg(GPMC_ECC_CONTROL);
> > +
> > +       /* Clear all ECC | Enable Reg1 */
> > +       val =3D ((0x00000001<<8) | 0x00000001);
> > +       gpmc_write_reg(GPMC_ECC_CONTROL, val);
> > +
> > +       /* Read from ECC Size Config Register */
> > +       val =3D gpmc_read_reg(GPMC_ECC_SIZE_CONFIG);
> > +       /* ECCSIZE1=3D512 | Select eccResultsize[0-3] */
> > +       val =3D ((((ecc_size >> 1) - 1) << 22) | (0x0000000F));
> > +       gpmc_write_reg(GPMC_ECC_SIZE_CONFIG, val);
> > +}
> > +
> > +/**
> > + * gpmc_calcuate_ecc - Generate non-inverted ECC bytes.
> > + * @cs: Chip select number
> > + * @dat: The pointer to data on which ecc is computed
> > + * @ecc_code: The ecc_code buffer
> > + *
> > + * Using noninverted ECC can be considered ugly since writing a blank
> > + * page ie. padding will clear the ECC bytes. This is no problem as
> long
> > + * nobody is trying to write data on the seemingly unused page. Readin=
g
> > + * an erased page will produce an ECC mismatch between generated and
> read
> > + * ECC bytes that has to be dealt with separately.
> > + */
> > +int gpmc_calculate_ecc(int cs, const u_char *dat, u_char *ecc_code)
> > +{
> > +       unsigned int val =3D 0x0;
> > +
> > +       /* Start Reading from HW ECC1_Result =3D 0x200 */
> > +       val =3D gpmc_read_reg(GPMC_ECC1_RESULT);
> > +       *ecc_code++ =3D val;          /* P128e, ..., P1e */
> > +       *ecc_code++ =3D val >> 16;    /* P128o, ..., P1o */
> > +       /* P2048o, P1024o, P512o, P256o, P2048e, P1024e, P512e, P256e *=
/
> > +       *ecc_code++ =3D ((val >> 8) & 0x0f) | ((val >> 20) & 0xf0);
> > +
> > +       return 0;
> > +}
> > +
> > +/**
> > + * gpmc_enable_hwecc - This function enables the hardware ecc
> functionality
> > + * @cs: Chip select number
> > + * @mode: Read/Write mode
> > + * @dev_width: device bus width
> > + */
> > +void gpmc_enable_hwecc(int cs, int mode, int dev_width)
> > +{
> > +       unsigned int val =3D gpmc_read_reg(GPMC_ECC_CONFIG);
> > +
> > +       switch (mode) {
> > +       case GPMC_ECC_READ:
> > +               gpmc_write_reg(GPMC_ECC_CONTROL, 0x101);
> > +               /* (ECC 16 or 8 bit col) | ( CS  )  | ECC Enable */
> > +               val =3D (dev_width << 7) | (cs << 1) | (0x1);
> > +               break;
> > +       case GPMC_ECC_READSYN:
> > +                gpmc_write_reg(GPMC_ECC_CONTROL, 0x100);
> > +               /* (ECC 16 or 8 bit col) | ( CS  )  | ECC Enable */
> > +               val =3D (dev_width << 7) | (cs << 1) | (0x1);
> > +               break;
> > +       case GPMC_ECC_WRITE:
> > +               gpmc_write_reg(GPMC_ECC_CONTROL, 0x101);
> > +               /* (ECC 16 or 8 bit col) | ( CS  )  | ECC Enable */
> > +               val =3D (dev_width << 7) | (cs << 1) | (0x1);
> > +               break;
> > +       default:
> > +               printk(KERN_INFO "Error: Unrecognized Mode[%d]!\n",
> mode);
> > +               break;
> > +       }
> > +
> > +       gpmc_write_reg(GPMC_ECC_CONFIG, val);
> > +}
> > diff --git a/arch/arm/plat-omap/include/plat/gpmc.h b/arch/arm/plat-
> omap/include/plat/gpmc.h
> > index 145838a..56e1407
> > --- a/arch/arm/plat-omap/include/plat/gpmc.h
> > +++ b/arch/arm/plat-omap/include/plat/gpmc.h
> > @@ -25,10 +25,22 @@
> >  #define GPMC_CS_NAND_ADDRESS   0x20
> >  #define GPMC_CS_NAND_DATA      0x24
> >
> > -#define GPMC_CONFIG            0x50
> > -#define GPMC_STATUS            0x54
> > -#define GPMC_CS0_BASE          0x60
> > -#define GPMC_CS_SIZE           0x30
> > +/* Control Commands */
> > +#define GPMC_GET_SET_STATUS    0x00000001
> > +#define GPMC_CONFIG_WP         0x00000002
> > +#define GPMC_CONFIG_RDY_BSY    0x00000003
> > +#define GPMC_CONFIG_DEV_SIZE   0x00000004
> > +#define GPMC_CONFIG_DEV_TYPE    0x00000005
> > +#define GPMC_NAND_COMMAND      0x00000006
> > +#define GPMC_NAND_ADDRESS      0x00000007
> > +#define GPMC_NAND_DATA         0x00000008
> > +#define GPMC_GET_PREF_STATUS   0x00000009
> > +#define GPMC_GET_SET_IRQ_STATUS        0x0000000a
> > +
> > +/* ECC commands */
> > +#define GPMC_ECC_READ          0 /* Reset Hardware ECC for read */
> > +#define GPMC_ECC_WRITE         1 /* Reset Hardware ECC for write */
> > +#define GPMC_ECC_READSYN       2 /* Reset before syndrom is read back
> */
> >
> >  #define GPMC_CONFIG1_WRAPBURST_SUPP     (1 << 31)
> >  #define GPMC_CONFIG1_READMULTIPLE_SUPP  (1 << 30)
> > @@ -44,10 +56,7 @@
> >  #define GPMC_CONFIG1_WAIT_MON_IIME(val) ((val & 3) << 18)
> >  #define GPMC_CONFIG1_WAIT_PIN_SEL(val)  ((val & 3) << 16)
> >  #define GPMC_CONFIG1_DEVICESIZE(val)    ((val & 3) << 12)
> > -#define GPMC_CONFIG1_DEVICESIZE_16      GPMC_CONFIG1_DEVICESIZE(1)
> >  #define GPMC_CONFIG1_DEVICETYPE(val)    ((val & 3) << 10)
> > -#define GPMC_CONFIG1_DEVICETYPE_NOR     GPMC_CONFIG1_DEVICETYPE(0)
> > -#define GPMC_CONFIG1_DEVICETYPE_NAND    GPMC_CONFIG1_DEVICETYPE(2)
> >  #define GPMC_CONFIG1_MUXADDDATA         (1 << 9)
> >  #define GPMC_CONFIG1_TIME_PARA_GRAN     (1 << 4)
> >  #define GPMC_CONFIG1_FCLK_DIV(val)      (val & 3)
> > @@ -56,6 +65,12 @@
> >  #define GPMC_CONFIG1_FCLK_DIV4          (GPMC_CONFIG1_FCLK_DIV(3))
> >  #define GPMC_CONFIG7_CSVALID           (1 << 6)
> >
> > +#define GPMC_DEVICETYPE_NOR    0
> > +#define GPMC_DEVICETYPE_NAND   2
> > +#define GPMC_CONFIG_WRITEPROTECT       0x00000010
> > +#define GPMC_CONFIG1_DEVICESIZE_16     GPMC_CONFIG1_DEVICESIZE(1)
> > +
> > +
> >  /*
> >  * Note that all values in this struct are in nanoseconds, while
> >  * the register values are in gpmc_fck cycles.
> > @@ -109,9 +124,14 @@ extern int gpmc_cs_reserved(int cs);
> >  extern int gpmc_prefetch_enable(int cs, int dma_mode,
> >                                        unsigned int u32_count, int
> is_write);
> >  extern void gpmc_prefetch_reset(void);
> > -extern int gpmc_prefetch_status(void);
> >  extern void omap3_gpmc_save_context(void);
> >  extern void omap3_gpmc_restore_context(void);
> >  extern void gpmc_init(void);
> > +extern int gpmc_hwcontrol(int write, int cs, int cmd, int wval, int
> *rval);
> > +
> > +void gpmc_ecc_init(int cs, int ecc_size);
> > +void gpmc_enable_hwecc(int cs, int mode, int dev_width);
> > +int gpmc_calculate_ecc(int cs, const u_char *dat, u_char *ecc_code);
> > +
> >
> >  #endif
> > diff --git a/arch/arm/plat-omap/include/plat/nand.h b/arch/arm/plat-
> omap/include/plat/nand.h
> > index f8efd54..6562cd0
> > --- a/arch/arm/plat-omap/include/plat/nand.h
> > +++ b/arch/arm/plat-omap/include/plat/nand.h
> > @@ -21,13 +21,11 @@ struct omap_nand_platform_data {
> >        int                     (*dev_ready)(struct
> omap_nand_platform_data *);
> >        int                     dma_channel;
> >        unsigned long           phys_base;
> > -       void __iomem            *gpmc_cs_baseaddr;
> > -       void __iomem            *gpmc_baseaddr;
> >        int                     devsize;
> >  };
> >
> > -/* size (4 KiB) for IO mapping */
> > -#define        NAND_IO_SIZE    SZ_4K
> > +/* minimum size for IO mapping */
> > +#define        NAND_IO_SIZE    4
> >
> >  #if defined(CONFIG_MTD_NAND_OMAP2) ||
> defined(CONFIG_MTD_NAND_OMAP2_MODULE)
> >  extern int gpmc_nand_init(struct omap_nand_platform_data *d);
> > diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> > index 7545568..1858c42
> > --- a/drivers/mtd/nand/omap2.c
> > +++ b/drivers/mtd/nand/omap2.c
> > @@ -23,12 +23,6 @@
> >  #include <plat/gpmc.h>
> >  #include <plat/nand.h>
> >
> > -#define GPMC_IRQ_STATUS                0x18
> > -#define GPMC_ECC_CONFIG                0x1F4
> > -#define GPMC_ECC_CONTROL       0x1F8
> > -#define GPMC_ECC_SIZE_CONFIG   0x1FC
> > -#define GPMC_ECC1_RESULT       0x200
> > -
> >  #define        DRIVER_NAME     "omap2-nand"
> >
> >  #define        NAND_WP_OFF     0
> > @@ -37,6 +31,7 @@
> >  #define        GPMC_BUF_FULL   0x00000001
> >  #define        GPMC_BUF_EMPTY  0x00000000
> >
> > +#ifdef CONFIG_MTD_NAND_OMAP_HWECC
> >  #define NAND_Ecc_P1e           (1 << 0)
> >  #define NAND_Ecc_P2e           (1 << 1)
> >  #define NAND_Ecc_P4e           (1 << 2)
> > @@ -103,6 +98,7 @@
> >
> >  #define P4e_s(a)       (TF(a & NAND_Ecc_P4e)           << 0)
> >  #define P4o_s(a)       (TF(a & NAND_Ecc_P4o)           << 1)
> > +#endif /* CONFIG_MTD_NAND_OMAP_HWECC */
>
> Why this ifdef macro?
>
> >
> >  #ifdef CONFIG_MTD_PARTITIONS
> >  static const char *part_probes[] =3D { "cmdlinepart", NULL };
> > @@ -139,34 +135,11 @@ struct omap_nand_info {
> >
> >        int                             gpmc_cs;
> >        unsigned long                   phys_base;
> > -       void __iomem                    *gpmc_cs_baseaddr;
> > -       void __iomem                    *gpmc_baseaddr;
> > -       void __iomem                    *nand_pref_fifo_add;
> >        struct completion               comp;
> >        int                             dma_ch;
> >  };
> >
> >  /**
> > - * omap_nand_wp - This function enable or disable the Write Protect
> feature
> > - * @mtd: MTD device structure
> > - * @mode: WP ON/OFF
> > - */
> > -static void omap_nand_wp(struct mtd_info *mtd, int mode)
> > -{
> > -       struct omap_nand_info *info =3D container_of(mtd,
> > -                                               struct omap_nand_info,
> mtd);
> > -
> > -       unsigned long config =3D __raw_readl(info->gpmc_baseaddr +
> GPMC_CONFIG);
> > -
> > -       if (mode)
> > -               config &=3D ~(NAND_WP_BIT);       /* WP is ON */
> > -       else
> > -               config |=3D (NAND_WP_BIT);        /* WP is OFF */
> > -
> > -       __raw_writel(config, (info->gpmc_baseaddr + GPMC_CONFIG));
> > -}
> > -
> > -/**
> >  * omap_hwcontrol - hardware specific access to control-lines
> >  * @mtd: MTD device structure
> >  * @cmd: command to device
> > @@ -181,31 +154,20 @@ static void omap_hwcontrol(struct mtd_info *mtd,
> int cmd, unsigned int ctrl)
> >  {
> >        struct omap_nand_info *info =3D container_of(mtd,
> >                                        struct omap_nand_info, mtd);
> > -       switch (ctrl) {
> > -       case NAND_CTRL_CHANGE | NAND_CTRL_CLE:
> > -               info->nand.IO_ADDR_W =3D info->gpmc_cs_baseaddr +
> > -                                               GPMC_CS_NAND_COMMAND;
> > -               info->nand.IO_ADDR_R =3D info->gpmc_cs_baseaddr +
> > -                                               GPMC_CS_NAND_DATA;
> > -               break;
> > -
> > -       case NAND_CTRL_CHANGE | NAND_CTRL_ALE:
> > -               info->nand.IO_ADDR_W =3D info->gpmc_cs_baseaddr +
> > -                                               GPMC_CS_NAND_ADDRESS;
> > -               info->nand.IO_ADDR_R =3D info->gpmc_cs_baseaddr +
> > -                                               GPMC_CS_NAND_DATA;
> > -               break;
> > -
> > -       case NAND_CTRL_CHANGE | NAND_NCE:
> > -               info->nand.IO_ADDR_W =3D info->gpmc_cs_baseaddr +
> > -                                               GPMC_CS_NAND_DATA;
> > -               info->nand.IO_ADDR_R =3D info->gpmc_cs_baseaddr +
> > -                                               GPMC_CS_NAND_DATA;
> > -               break;
> > -       }
> >
> > -       if (cmd !=3D NAND_CMD_NONE)
> > -               __raw_writeb(cmd, info->nand.IO_ADDR_W);
> > +       if (cmd !=3D NAND_CMD_NONE) {
> > +               if (ctrl & NAND_CLE) {
> > +                       gpmc_hwcontrol(1, info->gpmc_cs,
> > +                                       GPMC_NAND_COMMAND, cmd, NULL);
> > +
> > +               } else if (ctrl & NAND_ALE) {
> > +                       gpmc_hwcontrol(1, info->gpmc_cs,
> > +                                       GPMC_NAND_ADDRESS, cmd, NULL);
> > +
> > +               } else /* NAND_NCE */
> > +                       gpmc_hwcontrol(1, info->gpmc_cs,
> > +                                       GPMC_NAND_DATA, cmd, NULL);
> > +       }
> >  }
> >
> >  /**
> > @@ -229,14 +191,15 @@ static void omap_read_buf8(struct mtd_info *mtd,
> u_char *buf, int len)
> >  */
> >  static void omap_write_buf8(struct mtd_info *mtd, const u_char *buf,
> int len)
> >  {
> > -       struct omap_nand_info *info =3D container_of(mtd,
> > -                                               struct omap_nand_info,
> mtd);
> > +       u32     status;
> > +       struct nand_chip *nand =3D mtd->priv;
> >        u_char *p =3D (u_char *)buf;
> >
> >        while (len--) {
> > -               iowrite8(*p++, info->nand.IO_ADDR_W);
> > -               while (GPMC_BUF_EMPTY =3D=3D (readl(info->gpmc_baseaddr=
 +
> > -                                               GPMC_STATUS) &
> GPMC_BUF_FULL));
> > +               iowrite8(*p++, nand->IO_ADDR_W);
> > +               gpmc_hwcontrol(0, 0, GPMC_GET_SET_STATUS, 0, &status);
> If I am not mistaking, 2nd argument is 'cs', correct? And then, why
> are you hard coding this?
> Different boards will have NAND chip present at different 'cs'.
> Please have a look at uses of 'gpmc_hwcontrol' elsewhere as well for this=
.
[Ghorai] I agree.
>
> Again, say, you got '(status & GPMC_BUF_FULL) !=3D GPMC_BUF_EMPTY', then:
>
> > +               while (GPMC_BUF_EMPTY =3D=3D (status & GPMC_BUF_FULL))
> > +                       ;
>
> You got in an infinite loop here?
[Ghorai] if you see carefully this is same as existing code. Let me check i=
f any better solution.
>
> >        }
> >  }
> >
> > @@ -261,18 +224,17 @@ static void omap_read_buf16(struct mtd_info *mtd,
> u_char *buf, int len)
> >  */
> >  static void omap_write_buf16(struct mtd_info *mtd, const u_char * buf,
> int len)
> >  {
> > -       struct omap_nand_info *info =3D container_of(mtd,
> > -                                               struct omap_nand_info,
> mtd);
> > +       u32     status;
> > +       struct nand_chip *nand =3D mtd->priv;
> >        u16 *p =3D (u16 *) buf;
> >
> >        /* FIXME try bursts of writesw() or DMA ... */
> >        len >>=3D 1;
> >
> >        while (len--) {
> > -               iowrite16(*p++, info->nand.IO_ADDR_W);
> > -
> > -               while (GPMC_BUF_EMPTY =3D=3D (readl(info->gpmc_baseaddr=
 +
> > -                                               GPMC_STATUS) &
> GPMC_BUF_FULL))
> > +               iowrite16(*p++, nand->IO_ADDR_W);
> > +               gpmc_hwcontrol(0, 0, GPMC_GET_SET_STATUS, 0, &status);
> > +               while (GPMC_BUF_EMPTY =3D=3D (status & GPMC_BUF_FULL))
>
> same as above.
[Ghorai] if you see carefully this is same as existing code. Let me check i=
f any better solution.
>
>
> --
> Regards,
> Vimal Singh
