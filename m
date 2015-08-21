From: Vikas MANOCHA <vikas.manocha@st.com>
To: Marek Vasut <marex@denx.de>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Graham
 Moore <grmoore@opensource.altera.com>, Alan Tull
 <atull@opensource.altera.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen
 <dinguyen@opensource.altera.com>, Yves Vandervennet
 <yvanderv@opensource.altera.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Date: Fri, 21 Aug 2015 09:09:13 +0200
Subject: Re: [PATCH V7 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
Message-ID: <66396623-E1BC-4DF7-BC19-E85BE2F347D9@st.com>
References: <1439522892-7524-1-git-send-email-marex@denx.de>
 <1439522892-7524-2-git-send-email-marex@denx.de> <55D299CD.2070809@st.com>
 <201508210604.30272.marex@denx.de>
In-Reply-To: <201508210604.30272.marex@denx.de>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,



> On Aug 20, 2015, at 10:20 PM, Marek Vasut <marex@denx.de> wrote:
>=20
>> On Tuesday, August 18, 2015 at 04:34:53 AM, vikas wrote:
>> Hi Marek,
>=20
> Hi,
>=20
> [...]
>=20
>>> +#define CQSPI_POLL_IDLE_RETRY                  3
>>> +
>>> +#define CQSPI_REG_SRAM_RESV_WORDS              2
>>> +#define CQSPI_REG_SRAM_PARTITION_WR            1
>>=20
>> remove unused macros.
>>=20
>>> +#define CQSPI_REG_SRAM_THRESHOLD_BYTES         50
>>=20
>> the macro is used only for write sram watermark, something like
>> ...WR_THRESH_BYTES would be better. Infact instead of magic number like
>> 50, it should be based on sram_depth similar to read watermark
>> configuration.
>=20
> I suppose if the fifo falls below 1/8, that might be a sensible time to
> trigger an underflow interrupt.
>=20
>>> +
>>> +/* Instruction type */
>>> +#define CQSPI_INST_TYPE_SINGLE                 0
>>> +#define CQSPI_INST_TYPE_DUAL                   1
>>> +#define CQSPI_INST_TYPE_QUAD                   2
>>> +
>>> +#define CQSPI_DUMMY_CLKS_MAX                   31
>>> +
>>> +#define CQSPI_STIG_DATA_LEN_MAX                        8
>>> +
>>> +/* Register map */
>>> +#define CQSPI_REG_CONFIG                       0x00
>>> +#define CQSPI_REG_CONFIG_ENABLE_MASK           BIT(0)
>>> +#define CQSPI_REG_CONFIG_DECODE_MASK           BIT(9)
>>> +#define CQSPI_REG_CONFIG_CHIPSELECT_LSB                10
>>> +#define CQSPI_REG_CONFIG_DMA_MASK              BIT(15)
>>> +#define CQSPI_REG_CONFIG_BAUD_LSB              19
>>> +#define CQSPI_REG_CONFIG_IDLE_LSB              31
>>=20
>> To be consistent, it would be good to use BIT(nr) for all bit positions.
>=20
> You don't use BIT() macro for bitfields and the above are bitfields.
> Thus, this is not applicable.
>=20
>>> +#define CQSPI_REG_CONFIG_CHIPSELECT_MASK       0xF
>>> +#define CQSPI_REG_CONFIG_BAUD_MASK             0xF
>=20
> [...]
>=20
>>> +#define CQSPI_REG_CMDADDRESS                   0x94
>>> +#define CQSPI_REG_CMDREADDATALOWER             0xA0
>>> +#define CQSPI_REG_CMDREADDATAUPPER             0xA4
>>> +#define CQSPI_REG_CMDWRITEDATALOWER            0xA8
>>> +#define CQSPI_REG_CMDWRITEDATAUPPER            0xAC
>>=20
>> I am not sure if there is any recommended way but instread of register
>> macros with offset, isn't it better to use something like struct cdns_qs=
pi
>> {
>>                    u32 config,
>>                    u32 rd_instn,
>>                    ....
>>                };
>> & then configuring the pointer to this structure to the peripheral's (qs=
pi
>> controller in this case) base address.
>=20
> U-Boot is slowly abolishing this practice as it turned out to be a horrib=
le
> mistake, which is annoying to deal with . No, I will not do this.
>=20
>> It helps in debugging also as you can have all registers under one
>> structure, easy/clean access of register like cdsn_qspi_ptr->config
>> instead of adding offset for every access & also clean picture of all
>> peripheral registers.
>=20
> Once you have three similar controllers with only one register mapped
> elsewhere, you'd need three such structures. This approach does look
> nice at first, but certainly does not scale.
>=20
>>> +
>>> +/* Interrupt status bits */
>>> +#define CQSPI_REG_IRQ_MODE_ERR                 BIT(0)
>>> +#define CQSPI_REG_IRQ_UNDERFLOW BIT(1)
>>> +#define CQSPI_REG_IRQ_IND_COMP                 BIT(2)
>>> +#define CQSPI_REG_IRQ_IND_RD_REJECT            BIT(3)
>>> +#define CQSPI_REG_IRQ_WR_PROTECTED_ERR         BIT(4)
>>> +#define CQSPI_REG_IRQ_ILLEGAL_AHB_ERR          BIT(5)
>>> +#define CQSPI_REG_IRQ_WATERMARK                        BIT(6)
>>> +#define CQSPI_REG_IRQ_IND_RD_OVERFLOW          BIT(12)
>=20
> [...]
>=20
>>> +
>>> +static unsigned int cqspi_check_timeout(const unsigned long timeout)
>>> +{
>>> +       return time_before(jiffies, timeout);
>>> +}
>>=20
>> try to replace using blocking jiffies check using kernel timeout functio=
n.
>=20
> What function do you refer to ?
>=20
> [...]
>=20
>>> +static int cqspi_indirect_read_execute(struct spi_nor *nor,
>>> +                                      u8 *rxbuf, const unsigned n_rx)
>>> +{
>>> +       struct cqspi_flash_pdata *f_pdata =3D nor->priv;
>>> +       struct cqspi_st *cqspi =3D f_pdata->cqspi;
>>> +       void __iomem *reg_base =3D cqspi->iobase;
>>> +       void __iomem *ahb_base =3D cqspi->ahb_base;
>>> +       unsigned int remaining =3D n_rx;
>>> +       unsigned int reg =3D 0;
>>> +       unsigned int bytes_to_read =3D 0;
>>> +       unsigned int timeout;
>>> +       int ret =3D 0;
>>> +
>>> +       writel(remaining, reg_base + CQSPI_REG_INDIRECTRDBYTES);
>>> +
>>> +       /* Clear all interrupts. */
>>> +       writel(CQSPI_IRQ_STATUS_MASK, reg_base + CQSPI_REG_IRQSTATUS);
>>> +
>>> +       cqspi->irq_mask =3D CQSPI_IRQ_MASK_RD;
>>> +       writel(cqspi->irq_mask, reg_base + CQSPI_REG_IRQMASK);
>>=20
>> here interrupt mask is being configured for every read, better would be =
to
>> move it in init.
>=20
> It certainly would not, it is configured differently for READ and WRITE.

And what is blocking to configure read and write mask together at one time =
in the register ?

>=20
>>> +
>>> +       reinit_completion(&cqspi->transfer_complete);
>>> +       writel(CQSPI_REG_INDIRECTRD_START_MASK,
>>> +              reg_base + CQSPI_REG_INDIRECTRD);
>>> +
>>> +       while (remaining > 0) {
>>> +               ret =3D
>=20
> [...]
>=20
>>> +static void cqspi_controller_init(struct cqspi_st *cqspi)
>>> +{
>>> +       cqspi_controller_disable(cqspi);
>>> +
>>> +       /* Configure the remap address register, no remap */
>>> +       writel(0, cqspi->iobase + CQSPI_REG_REMAP);
>>> +
>>> +       /* Disable all interrupts. */
>>> +       writel(0, cqspi->iobase + CQSPI_REG_IRQMASK);
>>> +
>>> +       /* Configure the SRAM split to 1:1 . */
>>> +       writel(cqspi->fifo_depth / 2, cqspi->iobase +
>>> CQSPI_REG_SRAMPARTITION); +
>>> +       /* Load indirect trigger address. */
>>=20
>> almost all comments of this function seems unnecessary.
>=20
> I disagree, having sensible comments in code makes my life easier after
> I have to revisit the code a few years later.

Yes for sensible comments , you are loading value in one register and comme=
nting it.

Cheers,
Vikas=20

>=20
>>> +       writel(cqspi->trigger_address,
>>> +              cqspi->iobase + CQSPI_REG_INDIRECTTRIGGER);
>>> +
>>> +       /* Program read and write watermark. */
>>> +       writel(cqspi->fifo_depth * cqspi->fifo_width / 2,
>>> +              cqspi->iobase + CQSPI_REG_INDIRECTRDWATERMARK);
>>> +       writel(CQSPI_REG_SRAM_THRESHOLD_BYTES,
>>> +              cqspi->iobase + CQSPI_REG_INDIRECTWRWATERMARK);
>=20
> [...]
>=20
> Best regards,
