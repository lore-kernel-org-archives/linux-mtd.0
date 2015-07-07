Received: from mail-by2on0114.outbound.protection.outlook.com
 ([207.46.100.114] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCJBb-0005yQ-Hv
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2015 03:04:44 +0000
From: Wang Haikun <Haikun.Wang@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Xu Han
 <han.xu@freescale.com>
Subject: Re: [PATCH 2/3 v3] mtd: spi-nor: fsl-quadspi: Enable support big
 endian registers
Date: Tue, 7 Jul 2015 03:04:19 +0000
Message-ID: <BN1PR0301MB0612F83C7126AFBACE5FAC49F8920@BN1PR0301MB0612.namprd03.prod.outlook.com>
References: <1434617948-12889-1-git-send-email-haikun.wang@freescale.com>
 <20150706224318.GE18370@brian-ubuntu>
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

On 7/7/2015 6:43 AM, Brian Norris wrote:=0A=
> Hi Haikun,=0A=
>=0A=
> On Thu, Jun 18, 2015 at 04:59:08PM +0800, Haikun Wang wrote:=0A=
>> QSPI registers are big endian on LS1021A.=0A=
>> This patch check endianness before accessing register and=0A=
>> swap the data if QSPI register is big endian.=0A=
>>=0A=
>> Signed-off-by: Haikun Wang <haikun.wang@freescale.com>=0A=
>> ---=0A=
>> Changes in v3:=0A=
>> - Rebase with l2-mtd.git=0A=
>=0A=
> Unfortunately, this still doesn't apply. One of Han Xu's patches=0A=
> conflicts.=0A=
OK, I will re-submit all of my patches.=0A=
>=0A=
>> Changes in v2:=0A=
>> - Fix compile issue=0A=
>>=0A=
>>   drivers/mtd/spi-nor/fsl-quadspi.c | 139 ++++++++++++++++++++++--------=
--------=0A=
>>   1 file changed, 81 insertions(+), 58 deletions(-)=0A=
>>=0A=
>> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl=
-quadspi.c=0A=
>> index 6cd14e4..dc157f9 100644=0A=
>> --- a/drivers/mtd/spi-nor/fsl-quadspi.c=0A=
>> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c=0A=
>> @@ -191,6 +191,8 @@=0A=
>>   #define SEQID_EN4B		10=0A=
>>   #define SEQID_BRWR		11=0A=
>>=0A=
>> +#define FSL_QSPI_FLAG_REGMAP_BE	(1 << 0)=0A=
>> +=0A=
>>   enum fsl_qspi_devtype {=0A=
>>   	FSL_QUADSPI_VYBRID,=0A=
>>   	FSL_QUADSPI_IMX6SX,=0A=
>> @@ -202,6 +204,7 @@ struct fsl_qspi_devtype_data {=0A=
>>   	int rxfifo;=0A=
>>   	int txfifo;=0A=
>>   	int ahb_buf_size;=0A=
>> +	u32 flags;=0A=
>>   };=0A=
>>=0A=
>>   static struct fsl_qspi_devtype_data vybrid_data =3D {=0A=
>> @@ -222,7 +225,8 @@ static struct fsl_qspi_devtype_data ls1_data =3D {=
=0A=
>>   	.devtype =3D FSL_QUADSPI_LS1,=0A=
>>   	.rxfifo =3D 128,=0A=
>>   	.txfifo =3D 64,=0A=
>> -	.ahb_buf_size =3D 1024=0A=
>> +	.ahb_buf_size =3D 1024,=0A=
>> +	.flags =3D FSL_QSPI_FLAG_REGMAP_BE=0A=
>>   };=0A=
>>=0A=
>>   #define FSL_QSPI_MAX_CHIP	4=0A=
>> @@ -253,6 +257,18 @@ static inline int is_imx6sx_qspi(struct fsl_qspi *q=
)=0A=
>>   	return q->devtype_data->devtype =3D=3D FSL_QUADSPI_IMX6SX;=0A=
>>   }=0A=
>>=0A=
>> +static void qspi_writel(struct fsl_qspi *q, u32 val, void __iomem *addr=
)=0A=
>> +{=0A=
>> +	q->devtype_data->flags & FSL_QSPI_FLAG_REGMAP_BE ?=0A=
>> +		writel(cpu_to_be32(val), addr) : writel(val, addr);=0A=
>> +}=0A=
>> +=0A=
>> +static u32 qspi_readl(struct fsl_qspi *q, void __iomem *addr)=0A=
>> +{=0A=
>> +	return q->devtype_data->flags & FSL_QSPI_FLAG_REGMAP_BE ?=0A=
>> +			cpu_to_be32(readl(addr)) : readl(addr);=0A=
>> +}=0A=
>> +=0A=
>>   /*=0A=
>>    * An IC bug makes us to re-arrange the 32-bit data.=0A=
>>    * The following chips, such as IMX6SLX, have fixed this bug.=0A=
>> @@ -264,14 +280,14 @@ static inline u32 fsl_qspi_endian_xchg(struct fsl_=
qspi *q, u32 a)=0A=
>>=0A=
>>   static inline void fsl_qspi_unlock_lut(struct fsl_qspi *q)=0A=
>>   {=0A=
>> -	writel(QUADSPI_LUTKEY_VALUE, q->iobase + QUADSPI_LUTKEY);=0A=
>> -	writel(QUADSPI_LCKER_UNLOCK, q->iobase + QUADSPI_LCKCR);=0A=
>> +	qspi_writel(q, QUADSPI_LUTKEY_VALUE, q->iobase + QUADSPI_LUTKEY);=0A=
>> +	qspi_writel(q, QUADSPI_LCKER_UNLOCK, q->iobase + QUADSPI_LCKCR);=0A=
>>   }=0A=
>>=0A=
>>   static inline void fsl_qspi_lock_lut(struct fsl_qspi *q)=0A=
>>   {=0A=
>> -	writel(QUADSPI_LUTKEY_VALUE, q->iobase + QUADSPI_LUTKEY);=0A=
>> -	writel(QUADSPI_LCKER_LOCK, q->iobase + QUADSPI_LCKCR);=0A=
>> +	qspi_writel(q, QUADSPI_LUTKEY_VALUE, q->iobase + QUADSPI_LUTKEY);=0A=
>> +	qspi_writel(q, QUADSPI_LCKER_LOCK, q->iobase + QUADSPI_LCKCR);=0A=
>>   }=0A=
>>=0A=
>>   static irqreturn_t fsl_qspi_irq_handler(int irq, void *dev_id)=0A=
>> @@ -280,8 +296,8 @@ static irqreturn_t fsl_qspi_irq_handler(int irq, voi=
d *dev_id)=0A=
>>   	u32 reg;=0A=
>>=0A=
>>   	/* clear interrupt */=0A=
>> -	reg =3D readl(q->iobase + QUADSPI_FR);=0A=
>> -	writel(reg, q->iobase + QUADSPI_FR);=0A=
>> +	reg =3D qspi_readl(q, q->iobase + QUADSPI_FR);=0A=
>> +	qspi_writel(q, reg, q->iobase + QUADSPI_FR);=0A=
>>=0A=
>>   	if (reg & QUADSPI_FR_TFF_MASK)=0A=
>>   		complete(&q->c);=0A=
>> @@ -302,7 +318,7 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)=0A=
>>=0A=
>>   	/* Clear all the LUT table */=0A=
>>   	for (i =3D 0; i < QUADSPI_LUT_NUM; i++)=0A=
>> -		writel(0, base + QUADSPI_LUT_BASE + i * 4);=0A=
>> +		qspi_writel(q, 0, base + QUADSPI_LUT_BASE + i * 4);=0A=
>>=0A=
>>   	/* Quad Read */=0A=
>>   	lut_base =3D SEQID_QUAD_READ * 4;=0A=
>> @@ -318,14 +334,15 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)=
=0A=
>>   		dummy =3D 8;=0A=
>>   	}=0A=
>>=0A=
>> -	writel(LUT0(CMD, PAD1, cmd) | LUT1(ADDR, PAD1, addrlen),=0A=
>> +	qspi_writel(q, LUT0(CMD, PAD1, cmd) | LUT1(ADDR, PAD1, addrlen),=0A=
>>   			base + QUADSPI_LUT(lut_base));=0A=
>> -	writel(LUT0(DUMMY, PAD1, dummy) | LUT1(READ, PAD4, rxfifo),=0A=
>> +	qspi_writel(q, LUT0(DUMMY, PAD1, dummy) | LUT1(READ, PAD4, rxfifo),=0A=
>>   			base + QUADSPI_LUT(lut_base + 1));=0A=
>>=0A=
>>   	/* Write enable */=0A=
>>   	lut_base =3D SEQID_WREN * 4;=0A=
>> -	writel(LUT0(CMD, PAD1, SPINOR_OP_WREN), base + QUADSPI_LUT(lut_base));=
=0A=
>> +	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_WREN),=0A=
>> +		    base + QUADSPI_LUT(lut_base));=0A=
>>=0A=
>>   	/* Page Program */=0A=
>>   	lut_base =3D SEQID_PP * 4;=0A=
>> @@ -339,13 +356,13 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)=
=0A=
>>   		addrlen =3D ADDR32BIT;=0A=
>>   	}=0A=
>>=0A=
>> -	writel(LUT0(CMD, PAD1, cmd) | LUT1(ADDR, PAD1, addrlen),=0A=
>> +	qspi_writel(q, LUT0(CMD, PAD1, cmd) | LUT1(ADDR, PAD1, addrlen),=0A=
>>   			base + QUADSPI_LUT(lut_base));=0A=
>> -	writel(LUT0(WRITE, PAD1, 0), base + QUADSPI_LUT(lut_base + 1));=0A=
>> +	qspi_writel(q, LUT0(WRITE, PAD1, 0), base + QUADSPI_LUT(lut_base + 1))=
;=0A=
>>=0A=
>>   	/* Read Status */=0A=
>>   	lut_base =3D SEQID_RDSR * 4;=0A=
>> -	writel(LUT0(CMD, PAD1, SPINOR_OP_RDSR) | LUT1(READ, PAD1, 0x1),=0A=
>> +	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_RDSR) | LUT1(READ, PAD1, 0x1)=
,=0A=
>>   			base + QUADSPI_LUT(lut_base));=0A=
>>=0A=
>>   	/* Erase a sector */=0A=
>> @@ -360,40 +377,43 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)=
=0A=
>>   		addrlen =3D ADDR32BIT;=0A=
>>   	}=0A=
>>=0A=
>> -	writel(LUT0(CMD, PAD1, cmd) | LUT1(ADDR, PAD1, addrlen),=0A=
>> +	qspi_writel(q, LUT0(CMD, PAD1, cmd) | LUT1(ADDR, PAD1, addrlen),=0A=
>>   			base + QUADSPI_LUT(lut_base));=0A=
>>=0A=
>>   	/* Erase the whole chip */=0A=
>>   	lut_base =3D SEQID_CHIP_ERASE * 4;=0A=
>> -	writel(LUT0(CMD, PAD1, SPINOR_OP_CHIP_ERASE),=0A=
>> +	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_CHIP_ERASE),=0A=
>>   			base + QUADSPI_LUT(lut_base));=0A=
>>=0A=
>>   	/* READ ID */=0A=
>>   	lut_base =3D SEQID_RDID * 4;=0A=
>> -	writel(LUT0(CMD, PAD1, SPINOR_OP_RDID) | LUT1(READ, PAD1, 0x8),=0A=
>> +	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_RDID) | LUT1(READ, PAD1, 0x8)=
,=0A=
>>   			base + QUADSPI_LUT(lut_base));=0A=
>>=0A=
>>   	/* Write Register */=0A=
>>   	lut_base =3D SEQID_WRSR * 4;=0A=
>> -	writel(LUT0(CMD, PAD1, SPINOR_OP_WRSR) | LUT1(WRITE, PAD1, 0x2),=0A=
>> +	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_WRSR) | LUT1(WRITE, PAD1, 0x2=
),=0A=
>>   			base + QUADSPI_LUT(lut_base));=0A=
>>=0A=
>>   	/* Read Configuration Register */=0A=
>>   	lut_base =3D SEQID_RDCR * 4;=0A=
>> -	writel(LUT0(CMD, PAD1, SPINOR_OP_RDCR) | LUT1(READ, PAD1, 0x1),=0A=
>> +	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_RDCR) | LUT1(READ, PAD1, 0x1)=
,=0A=
>>   			base + QUADSPI_LUT(lut_base));=0A=
>>=0A=
>>   	/* Write disable */=0A=
>>   	lut_base =3D SEQID_WRDI * 4;=0A=
>> -	writel(LUT0(CMD, PAD1, SPINOR_OP_WRDI), base + QUADSPI_LUT(lut_base));=
=0A=
>> +	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_WRDI),=0A=
>> +		    base + QUADSPI_LUT(lut_base));=0A=
>>=0A=
>>   	/* Enter 4 Byte Mode (Micron) */=0A=
>>   	lut_base =3D SEQID_EN4B * 4;=0A=
>> -	writel(LUT0(CMD, PAD1, SPINOR_OP_EN4B), base + QUADSPI_LUT(lut_base));=
=0A=
>> +	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_EN4B),=0A=
>> +		    base + QUADSPI_LUT(lut_base));=0A=
>>=0A=
>>   	/* Enter 4 Byte Mode (Spansion) */=0A=
>>   	lut_base =3D SEQID_BRWR * 4;=0A=
>> -	writel(LUT0(CMD, PAD1, SPINOR_OP_BRWR), base + QUADSPI_LUT(lut_base));=
=0A=
>> +	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_BRWR),=0A=
>> +		    base + QUADSPI_LUT(lut_base));=0A=
>>=0A=
>>   	fsl_qspi_lock_lut(q);=0A=
>>   }=0A=
>> @@ -446,15 +466,16 @@ fsl_qspi_runcmd(struct fsl_qspi *q, u8 cmd, unsign=
ed int addr, int len)=0A=
>>   			q->chip_base_addr, addr, len, cmd);=0A=
>>=0A=
>>   	/* save the reg */=0A=
>> -	reg =3D readl(base + QUADSPI_MCR);=0A=
>> +	reg =3D qspi_readl(q, base + QUADSPI_MCR);=0A=
>>=0A=
>> -	writel(q->memmap_phy + q->chip_base_addr + addr, base + QUADSPI_SFAR);=
=0A=
>> -	writel(QUADSPI_RBCT_WMRK_MASK | QUADSPI_RBCT_RXBRD_USEIPS,=0A=
>> +	qspi_writel(q, q->memmap_phy + q->chip_base_addr + addr,=0A=
>> +		    base + QUADSPI_SFAR);=0A=
>> +	qspi_writel(q, QUADSPI_RBCT_WMRK_MASK | QUADSPI_RBCT_RXBRD_USEIPS,=0A=
>>   			base + QUADSPI_RBCT);=0A=
>> -	writel(reg | QUADSPI_MCR_CLR_RXF_MASK, base + QUADSPI_MCR);=0A=
>> +	qspi_writel(q, reg | QUADSPI_MCR_CLR_RXF_MASK, base + QUADSPI_MCR);=0A=
>>=0A=
>>   	do {=0A=
>> -		reg2 =3D readl(base + QUADSPI_SR);=0A=
>> +		reg2 =3D qspi_readl(q, base + QUADSPI_SR);=0A=
>>   		if (reg2 & (QUADSPI_SR_IP_ACC_MASK | QUADSPI_SR_AHB_ACC_MASK)) {=0A=
>>   			udelay(1);=0A=
>>   			dev_dbg(q->dev, "The controller is busy, 0x%x\n", reg2);=0A=
>> @@ -465,21 +486,22 @@ fsl_qspi_runcmd(struct fsl_qspi *q, u8 cmd, unsign=
ed int addr, int len)=0A=
>>=0A=
>>   	/* trigger the LUT now */=0A=
>>   	seqid =3D fsl_qspi_get_seqid(q, cmd);=0A=
>> -	writel((seqid << QUADSPI_IPCR_SEQID_SHIFT) | len, base + QUADSPI_IPCR)=
;=0A=
>> +	qspi_writel(q, (seqid << QUADSPI_IPCR_SEQID_SHIFT) | len,=0A=
>> +		    base + QUADSPI_IPCR);=0A=
>>=0A=
>>   	/* Wait for the interrupt. */=0A=
>>   	if (!wait_for_completion_timeout(&q->c, msecs_to_jiffies(1000))) {=0A=
>>   		dev_err(q->dev,=0A=
>>   			"cmd 0x%.2x timeout, addr@%.8x, FR:0x%.8x, SR:0x%.8x\n",=0A=
>> -			cmd, addr, readl(base + QUADSPI_FR),=0A=
>> -			readl(base + QUADSPI_SR));=0A=
>> +			cmd, addr, qspi_readl(q, base + QUADSPI_FR),=0A=
>> +			qspi_readl(q, base + QUADSPI_SR));=0A=
>>   		err =3D -ETIMEDOUT;=0A=
>>   	} else {=0A=
>>   		err =3D 0;=0A=
>>   	}=0A=
>>=0A=
>>   	/* restore the MCR */=0A=
>> -	writel(reg, base + QUADSPI_MCR);=0A=
>> +	qspi_writel(q, reg, base + QUADSPI_MCR);=0A=
>>=0A=
>>   	return err;=0A=
>>   }=0A=
>> @@ -491,7 +513,7 @@ static void fsl_qspi_read_data(struct fsl_qspi *q, i=
nt len, u8 *rxbuf)=0A=
>>   	int i =3D 0;=0A=
>>=0A=
>>   	while (len > 0) {=0A=
>> -		tmp =3D readl(q->iobase + QUADSPI_RBDR + i * 4);=0A=
>> +		tmp =3D qspi_readl(q, q->iobase + QUADSPI_RBDR + i * 4);=0A=
>>   		tmp =3D fsl_qspi_endian_xchg(q, tmp);=0A=
>>   		dev_dbg(q->dev, "chip addr:0x%.8x, rcv:0x%.8x\n",=0A=
>>   				q->chip_base_addr, tmp);=0A=
>> @@ -519,9 +541,9 @@ static inline void fsl_qspi_invalid(struct fsl_qspi =
*q)=0A=
>>   {=0A=
>>   	u32 reg;=0A=
>>=0A=
>> -	reg =3D readl(q->iobase + QUADSPI_MCR);=0A=
>> +	reg =3D qspi_readl(q, q->iobase + QUADSPI_MCR);=0A=
>>   	reg |=3D QUADSPI_MCR_SWRSTHD_MASK | QUADSPI_MCR_SWRSTSD_MASK;=0A=
>> -	writel(reg, q->iobase + QUADSPI_MCR);=0A=
>> +	qspi_writel(q, reg, q->iobase + QUADSPI_MCR);=0A=
>>=0A=
>>   	/*=0A=
>>   	 * The minimum delay : 1 AHB + 2 SFCK clocks.=0A=
>> @@ -530,7 +552,7 @@ static inline void fsl_qspi_invalid(struct fsl_qspi =
*q)=0A=
>>   	udelay(1);=0A=
>>=0A=
>>   	reg &=3D ~(QUADSPI_MCR_SWRSTHD_MASK | QUADSPI_MCR_SWRSTSD_MASK);=0A=
>> -	writel(reg, q->iobase + QUADSPI_MCR);=0A=
>> +	qspi_writel(q, reg, q->iobase + QUADSPI_MCR);=0A=
>>   }=0A=
>>=0A=
>>   static int fsl_qspi_nor_write(struct fsl_qspi *q, struct spi_nor *nor,=
=0A=
>> @@ -544,13 +566,13 @@ static int fsl_qspi_nor_write(struct fsl_qspi *q, =
struct spi_nor *nor,=0A=
>>   		q->chip_base_addr, to, count);=0A=
>>=0A=
>>   	/* clear the TX FIFO. */=0A=
>> -	tmp =3D readl(q->iobase + QUADSPI_MCR);=0A=
>> -	writel(tmp | QUADSPI_MCR_CLR_RXF_MASK, q->iobase + QUADSPI_MCR);=0A=
>> +	tmp =3D qspi_readl(q, q->iobase + QUADSPI_MCR);=0A=
>> +	qspi_writel(q, tmp | QUADSPI_MCR_CLR_RXF_MASK, q->iobase + QUADSPI_MCR=
);=0A=
>>=0A=
>>   	/* fill the TX data to the FIFO */=0A=
>>   	for (j =3D 0, i =3D ((count + 3) / 4); j < i; j++) {=0A=
>>   		tmp =3D fsl_qspi_endian_xchg(q, *txbuf);=0A=
>> -		writel(tmp, q->iobase + QUADSPI_TBDR);=0A=
>> +		qspi_writel(q, tmp, q->iobase + QUADSPI_TBDR);=0A=
>>   		txbuf++;=0A=
>>   	}=0A=
>>=0A=
>> @@ -568,10 +590,10 @@ static void fsl_qspi_set_map_addr(struct fsl_qspi =
*q)=0A=
>>   	int nor_size =3D q->nor_size;=0A=
>>   	void __iomem *base =3D q->iobase;=0A=
>>=0A=
>> -	writel(nor_size + q->memmap_phy, base + QUADSPI_SFA1AD);=0A=
>> -	writel(nor_size * 2 + q->memmap_phy, base + QUADSPI_SFA2AD);=0A=
>> -	writel(nor_size * 3 + q->memmap_phy, base + QUADSPI_SFB1AD);=0A=
>> -	writel(nor_size * 4 + q->memmap_phy, base + QUADSPI_SFB2AD);=0A=
>> +	qspi_writel(q, nor_size + q->memmap_phy, base + QUADSPI_SFA1AD);=0A=
>> +	qspi_writel(q, nor_size * 2 + q->memmap_phy, base + QUADSPI_SFA2AD);=
=0A=
>> +	qspi_writel(q, nor_size * 3 + q->memmap_phy, base + QUADSPI_SFB1AD);=
=0A=
>> +	qspi_writel(q, nor_size * 4 + q->memmap_phy, base + QUADSPI_SFB2AD);=
=0A=
>>   }=0A=
>>=0A=
>>   /*=0A=
>> @@ -593,24 +615,25 @@ static void fsl_qspi_init_abh_read(struct fsl_qspi=
 *q)=0A=
>>   	int seqid;=0A=
>>=0A=
>>   	/* AHB configuration for access buffer 0/1/2 .*/=0A=
>> -	writel(QUADSPI_BUFXCR_INVALID_MSTRID, base + QUADSPI_BUF0CR);=0A=
>> -	writel(QUADSPI_BUFXCR_INVALID_MSTRID, base + QUADSPI_BUF1CR);=0A=
>> -	writel(QUADSPI_BUFXCR_INVALID_MSTRID, base + QUADSPI_BUF2CR);=0A=
>> +	qspi_writel(q, QUADSPI_BUFXCR_INVALID_MSTRID, base + QUADSPI_BUF0CR);=
=0A=
>> +	qspi_writel(q, QUADSPI_BUFXCR_INVALID_MSTRID, base + QUADSPI_BUF1CR);=
=0A=
>> +	qspi_writel(q, QUADSPI_BUFXCR_INVALID_MSTRID, base + QUADSPI_BUF2CR);=
=0A=
>>   	/*=0A=
>>   	 * Set ADATSZ with the maximum AHB buffer size to improve the=0A=
>>   	 * read performance.=0A=
>>   	 */=0A=
>> -	writel(QUADSPI_BUF3CR_ALLMST_MASK | ((q->devtype_data->ahb_buf_size / =
8)=0A=
>> -			<< QUADSPI_BUF3CR_ADATSZ_SHIFT), base + QUADSPI_BUF3CR);=0A=
>> +	qspi_writel(q, QUADSPI_BUF3CR_ALLMST_MASK |=0A=
>> +		    ((q->devtype_data->ahb_buf_size / 8)=0A=
>> +		    << QUADSPI_BUF3CR_ADATSZ_SHIFT), base + QUADSPI_BUF3CR);=0A=
>>=0A=
>>   	/* We only use the buffer3 */=0A=
>> -	writel(0, base + QUADSPI_BUF0IND);=0A=
>> -	writel(0, base + QUADSPI_BUF1IND);=0A=
>> -	writel(0, base + QUADSPI_BUF2IND);=0A=
>> +	qspi_writel(q, 0, base + QUADSPI_BUF0IND);=0A=
>> +	qspi_writel(q, 0, base + QUADSPI_BUF1IND);=0A=
>> +	qspi_writel(q, 0, base + QUADSPI_BUF2IND);=0A=
>>=0A=
>>   	/* Set the default lut sequence for AHB Read. */=0A=
>>   	seqid =3D fsl_qspi_get_seqid(q, q->nor[0].read_opcode);=0A=
>> -	writel(seqid << QUADSPI_BFGENCR_SEQID_SHIFT,=0A=
>> +	qspi_writel(q, seqid << QUADSPI_BFGENCR_SEQID_SHIFT,=0A=
>>   		q->iobase + QUADSPI_BFGENCR);=0A=
>>   }=0A=
>>=0A=
>> @@ -630,21 +653,21 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)=
=0A=
>>   	fsl_qspi_init_lut(q);=0A=
>>=0A=
>>   	/* Disable the module */=0A=
>> -	writel(QUADSPI_MCR_MDIS_MASK | QUADSPI_MCR_RESERVED_MASK,=0A=
>> +	qspi_writel(q, QUADSPI_MCR_MDIS_MASK | QUADSPI_MCR_RESERVED_MASK,=0A=
>>   			base + QUADSPI_MCR);=0A=
>>=0A=
>> -	reg =3D readl(base + QUADSPI_SMPR);=0A=
>> -	writel(reg & ~(QUADSPI_SMPR_FSDLY_MASK=0A=
>> +	reg =3D qspi_readl(q, base + QUADSPI_SMPR);=0A=
>> +	qspi_writel(q, reg & ~(QUADSPI_SMPR_FSDLY_MASK=0A=
>>   			| QUADSPI_SMPR_FSPHS_MASK=0A=
>>   			| QUADSPI_SMPR_HSENA_MASK=0A=
>>   			| QUADSPI_SMPR_DDRSMP_MASK), base + QUADSPI_SMPR);=0A=
>>=0A=
>>   	/* Enable the module */=0A=
>> -	writel(QUADSPI_MCR_RESERVED_MASK | QUADSPI_MCR_END_CFG_MASK,=0A=
>> +	qspi_writel(q, QUADSPI_MCR_RESERVED_MASK | QUADSPI_MCR_END_CFG_MASK,=
=0A=
>>   			base + QUADSPI_MCR);=0A=
>>=0A=
>>   	/* enable the interrupt */=0A=
>> -	writel(QUADSPI_RSER_TFIE, q->iobase + QUADSPI_RSER);=0A=
>> +	qspi_writel(q, QUADSPI_RSER_TFIE, q->iobase + QUADSPI_RSER);=0A=
>>=0A=
>>   	return 0;=0A=
>>   }=0A=
>> @@ -979,8 +1002,8 @@ static int fsl_qspi_remove(struct platform_device *=
pdev)=0A=
>>   	}=0A=
>>=0A=
>>   	/* disable the hardware */=0A=
>> -	writel(QUADSPI_MCR_MDIS_MASK, q->iobase + QUADSPI_MCR);=0A=
>> -	writel(0x0, q->iobase + QUADSPI_RSER);=0A=
>> +	qspi_writel(q, QUADSPI_MCR_MDIS_MASK, q->iobase + QUADSPI_MCR);=0A=
>> +	qspi_writel(q, 0x0, q->iobase + QUADSPI_RSER);=0A=
>>=0A=
>>   	clk_unprepare(q->clk);=0A=
>>   	clk_unprepare(q->clk_en);=0A=
>=0A=
> ^^ I think the problem is somewhere in here.=0A=
>=0A=
> Brian=0A=
>=0A=
=0A=
