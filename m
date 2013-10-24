Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZDj8-0005eF-Hh
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 05:44:59 +0000
Message-ID: <5268B3B8.4090807@ti.com>
Date: Thu, 24 Oct 2013 11:14:24 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCHv3 2/3] drivers: mtd: devices: Add quad read support.
References: <1381332284-21822-1-git-send-email-sourav.poddar@ti.com>
 <1381332284-21822-3-git-send-email-sourav.poddar@ti.com>
 <20131024010619.GA23337@ld-irv-0074.broadcom.com>
In-Reply-To: <20131024010619.GA23337@ld-irv-0074.broadcom.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagannadh.teki@gmail.com>,
 balbi@ti.com, Huang Shijie <b32955@freescale.com>, broonie@kernel.org,
 linux-mtd@lists.infradead.org, spi-devel-general@lists.sourceforge.net,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Thanks for the review, my reply inlined.
On Thursday 24 October 2013 06:36 AM, Brian Norris wrote:
> + others
>
> On Wed, Oct 09, 2013 at 08:54:43PM +0530, Sourav Poddar wrote:
>> Some flash also support quad read mode.
>> Adding support for adding quad mode in m25p80
>> for spansion and macronix flash.
>>
>> Signed-off-by: Sourav Poddar<sourav.poddar@ti.com>
>> ---
>> v2->v3:
>> Add macronix flash support
>>   drivers/mtd/devices/m25p80.c |  184 ++++++++++++++++++++++++++++++++++++++++--
>>   1 files changed, 176 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> index 26b14f9..dc9bcbf 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -41,6 +41,7 @@
>>   #define	OPCODE_WRSR		0x01	/* Write status register 1 byte */
>>   #define	OPCODE_NORM_READ	0x03	/* Read data bytes (low frequency) */
>>   #define	OPCODE_FAST_READ	0x0b	/* Read data bytes (high frequency) */
>> +#define	OPCODE_QUAD_READ        0x6b    /* QUAD READ */
>>   #define	OPCODE_PP		0x02	/* Page program (up to 256 bytes) */
>>   #define	OPCODE_BE_4K		0x20	/* Erase 4KiB block */
>>   #define	OPCODE_BE_4K_PMC	0xd7	/* Erase 4KiB block on PMC chips */
>> @@ -48,6 +49,7 @@
>>   #define	OPCODE_CHIP_ERASE	0xc7	/* Erase whole flash chip */
>>   #define	OPCODE_SE		0xd8	/* Sector erase (usually 64KiB) */
>>   #define	OPCODE_RDID		0x9f	/* Read JEDEC ID */
>> +#define	OPCODE_RDCR		0x35    /* Read configuration register */
>>
>>   /* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
>>   #define	OPCODE_NORM_READ_4B	0x13	/* Read data bytes (low frequency) */
>> @@ -76,6 +78,10 @@
>>   #define	SR_BP2			0x10	/* Block protect 2 */
>>   #define	SR_SRWD			0x80	/* SR write protect */
>>
>> +/* Configuration Register bits. */
>> +#define SPAN_QUAD_CR_EN		0x2	/* Spansion Quad I/O */
>> +#define MACR_QUAD_SR_EN		0x40	/* Macronix Quad I/O */
> Perhaps CR_ can be the prefix, like the status register SR_ macros? So:
>
>    CR_QUAD_EN_SPAN
>    CR_QUAD_EN_MACR
Yes, CR/SR can come as a prefix for Spansion. But, to enable quad mode in
macronix, we need to write to status register. So, things should be like..
   CR_QUAD_EN_SPAN
   SR_QUAD_EN_MACR


>> +
>>   /* Define max times to check status register before we give up. */
>>   #define	MAX_READY_WAIT_JIFFIES	(40 * HZ)	/* M25P16 specs 40s max chip erase */
>>   #define	MAX_CMD_SIZE		5
>> @@ -95,6 +101,7 @@ struct m25p {
>>   	u8			program_opcode;
>>   	u8			*command;
>>   	bool			fast_read;
>> +	bool			quad_read;
>>   };
>>
>>   static inline struct m25p *mtd_to_m25p(struct mtd_info *mtd)
>> @@ -163,6 +170,25 @@ static inline int write_disable(struct m25p *flash)
>>   	return spi_write_then_read(flash->spi,&code, 1, NULL, 0);
>>   }
>>
>> +/* Read the configuration register, returning its value in the location
>> + * Return the configuration register value.
>> + * Returns negative if error occurred.
>> +*/
>> +static int read_cr(struct m25p *flash)
>> +{
>> +	u8 code = OPCODE_RDCR;
>> +	int ret;
>> +	u8 val;
>> +
>> +	ret = spi_write_then_read(flash->spi,&code, 1,&val, 1);
>> +	if (ret<  0) {
>> +		dev_err(&flash->spi->dev, "error %d reading CR\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	return val;
>> +}
>> +
>>   /*
>>    * Enable/disable 4-byte addressing mode.
>>    */
>> @@ -336,6 +362,122 @@ static int m25p80_erase(struct mtd_info *mtd, struct erase_info *instr)
>>   	return 0;
>>   }
>>
>> +/* Write status register and configuration register with 2 bytes
>> +* The first byte will be written to the status register, while the second byte
>> +* will be written to the configuration register.
>> +* Returns negative if error occurred.
>> +*/
> Not quite the correct multi-line comment style.
>
> /*
>   * It should be something like this. Note the asterisk alignment. You
>   * also could wrap the right edge neatly to nearly 80 characters.
>   */
>
Ok. I will fix this in next version.
>> +static int write_sr_cr(struct m25p *flash, u16 val)
>> +{
>> +	flash->command[0] = OPCODE_WRSR;
>> +	flash->command[1] = val&  0xff;
>> +	flash->command[2] = (val>>  8);
>> +
>> +	return spi_write(flash->spi, flash->command, 3);
>> +}
>> +
>> +static int macronix_quad_enable(struct m25p *flash)
>> +{
>> +	int ret, val;
>> +	u8 cmd[2];
>> +	cmd[0] = OPCODE_WRSR;
>> +
>> +	val = read_sr(flash);
>> +	cmd[1] = val | MACR_QUAD_SR_EN;
>> +	write_enable(flash);
>> +
>> +	spi_write(flash->spi,&cmd, 2);
>> +
>> +	if (wait_till_ready(flash))
>> +		return 1;
>> +
>> +	ret = read_sr(flash);
>> +	if (!(ret>  0&&  (ret&  MACR_QUAD_SR_EN))) {
>> +		dev_err(&flash->spi->dev,
>> +			"Macronix Quad bit not set");
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int spansion_quad_enable(struct m25p *flash)
>> +{
>> +	int ret;
>> +	int quad_en = SPAN_QUAD_CR_EN<<  8;
>> +
>> +	write_enable(flash);
>> +
>> +	ret = write_sr_cr(flash, quad_en);
>> +	if (ret<  0) {
>> +		dev_err(&flash->spi->dev,
>> +			"error while writing configuration register");
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* read back and check it */
>> +	ret = read_cr(flash);
>> +	if (!(ret>  0&&  (ret&  SPAN_QUAD_CR_EN))) {
>> +		dev_err(&flash->spi->dev,
>> +			"Spansion Quad bit not set");
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int m25p80_quad_read(struct mtd_info *mtd, loff_t from, size_t len,
>> +	size_t *retlen, u_char *buf)
>> +{
> This function only has 2 meaningful lines difference from m25p80_read(),
> no? I'd consider combining them. You only need a simple bool/flag to
> tell whether we're in quad mode + you can re-use the 'read_opcode' field
> of struct m25p.
>
Yes, my only motto of keeping a seperate API was that quad supports
different sort of commands, with different dummy cycle requirements.
So, I thought it might get a bit clumsy to handle, if someone later want 
to add a
particular command along with its dummy cycle requirements.

But, yes, you are true, as of now, it can be club into one.

>> +	struct m25p *flash = mtd_to_m25p(mtd);
>> +	struct spi_transfer t[2];
>> +	struct spi_message m;
>> +	uint8_t opcode;
>> +
>> +	pr_debug("%s: %s from 0x%08x, len %zd\n", dev_name(&flash->spi->dev),
>> +			__func__, (u32)from, len);
>> +
>> +	spi_message_init(&m);
>> +	memset(t, 0, (sizeof(t)));
>> +
>> +	t[0].tx_buf = flash->command;
>> +	t[0].len = m25p_cmdsz(flash) + (flash->quad_read ? 1 : 0);
> This is the first of 2 lines that are different from m25p80_read(). It
> can easily be combined with the existing read implementation.
>
>> +	spi_message_add_tail(&t[0],&m);
>> +
>> +	t[1].rx_buf = buf;
>> +	t[1].len = len;
>> +	t[1].rx_nbits = SPI_NBITS_QUAD;
> This is the second of 2 different lines. You can change m25p80_read() to
> have something like this:
>
> 	t[1].rx_nbits = flash->quad_read ? SPI_NBITS_QUAD : 1;
>   
    True, t[0] len can be written as..

     t[0].len = m25p_cmdsz(flash) + (flash->quad_read ? 1 : 
(flash->fast_read ? 1 : 0));
>> +	spi_message_add_tail(&t[1],&m);
>> +
>> +	mutex_lock(&flash->lock);
>> +
>> +	/* Wait till previous write/erase is done. */
>> +	if (wait_till_ready(flash)) {
>> +		/* REVISIT status return?? */
>> +		mutex_unlock(&flash->lock);
>> +		return 1;
>> +	}
>> +
>> +	/* FIXME switch to OPCODE_QUAD_READ.  It's required for higher
>> +	 * clocks; and at this writing, every chip this driver handles
>> +	 * supports that opcode.
>> +	*/
> What? It seems you blindly copied/edited the already-out-of-date comment
> from m25p80_read().
>
Sorry for this, my bad. I will update this in next version.
>> +
>> +	/* Set up the write data buffer. */
>> +	opcode = flash->read_opcode;
>> +	flash->command[0] = opcode;
>> +	m25p_addr2cmd(flash, from, flash->command);
>> +
>> +	spi_sync(flash->spi,&m);
>> +
>> +	*retlen = m.actual_length - m25p_cmdsz(flash) -
>> +			(flash->quad_read ? 1 : 0);
>> +
>> +	mutex_unlock(&flash->lock);
>> +
>> +	return 0;
>> +}
>> +
>>   /*
>>    * Read an address range from the flash chip.  The address range
>>    * may be any size provided it is within the physical boundaries.
>> @@ -928,6 +1070,7 @@ static int m25p_probe(struct spi_device *spi)
>>   	unsigned			i;
>>   	struct mtd_part_parser_data	ppdata;
>>   	struct device_node __maybe_unused *np = spi->dev.of_node;
>> +	int ret;
>>
>>   #ifdef CONFIG_MTD_OF_PARTS
>>   	if (!of_device_is_available(np))
>> @@ -979,15 +1122,9 @@ static int m25p_probe(struct spi_device *spi)
>>   		}
>>   	}
>>
>> -	flash = kzalloc(sizeof *flash, GFP_KERNEL);
>> +	flash = devm_kzalloc(&spi->dev, sizeof(*flash), GFP_KERNEL);
>>   	if (!flash)
>>   		return -ENOMEM;
>> -	flash->command = kmalloc(MAX_CMD_SIZE + (flash->fast_read ? 1 : 0),
>> -					GFP_KERNEL);
>> -	if (!flash->command) {
>> -		kfree(flash);
>> -		return -ENOMEM;
>> -	}
> You're combining a bug fix with your feature addition. The size may be
> off-by-one (which is insignificant in this case, I think, but still...)
> so the kmalloc() does needs to move down, but it should be done before
> this feature patch. (Sorry, I've had a patch queued up but didn't send
> it out for a while. I think somebody sorta tried to fix this a while ago
> but didn't send a proper patch.)
>
Yes, true. I can break this patch into two with first patch as the bug 
fix and
second as the feature. Is it ok?
>>
>>   	flash->spi = spi;
>>   	mutex_init(&flash->lock);
>> @@ -1015,7 +1152,6 @@ static int m25p_probe(struct spi_device *spi)
>>   	flash->mtd.flags = MTD_CAP_NORFLASH;
>>   	flash->mtd.size = info->sector_size * info->n_sectors;
>>   	flash->mtd._erase = m25p80_erase;
>> -	flash->mtd._read = m25p80_read;
>>
>>   	/* flash protection support for STmicro chips */
>>   	if (JEDEC_MFR(info->jedec_id) == CFI_MFR_ST) {
>> @@ -1067,6 +1203,38 @@ static int m25p_probe(struct spi_device *spi)
>>
>>   	flash->program_opcode = OPCODE_PP;
>>
>> +	flash->quad_read = false;
>> +	if (spi->mode&&  SPI_RX_QUAD)
> You're looking for bitwise '&', not logical'&&'.
>
>> +		flash->quad_read = true;
> But you can just replace the previous 3 lines with:
>
> 	flash->quad_read = spi->mode&  SPI_RX_QUAD;
>
> or this, if you really want be careful about the bit position:
>
> 	flash->quad_read = !!(spi->mode&  SPI_RX_QUAD);
>
True, will fix.
>> +
>> +	flash->command = kmalloc(MAX_CMD_SIZE + (flash->fast_read ? 1 :
>> +				(flash->quad_read ? 1 : 0)), GFP_KERNEL);
> That's an ugly conditional. Maybe we just want to increase MAX_CMD_SIZE
> and be done with it? Saving an extra byte is not helping anyone (and I
> think pretty much everyone always has fast_read==true anyway).
Yes, this can be done. But, I was not sure about increasing the macro just
on coding perspective. If it sounds Ok, I will increase the macro and make
the corresponding cleanups.
>> +	if (!flash->command) {
>> +		kfree(flash);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	if (flash->quad_read) {
>> +		if (of_property_read_bool(np, "macronix,quad_enable")) {
> As Jagan mentioned, I think we want this to be discoverable from within
> m25p80.c. I don't think we should require it to be in DT. (We could
> still support a DT binding just in case, but I think the majority
> use-case should be easier to have a flag in the ID table; and if we ever
> support SFDP, that could complement the flag approach nicely.)
>
> Also, be sure to add a documentation patch for the DT binding if you
> really need the binding.
>
>> +			ret = macronix_quad_enable(flash);
>> +			if (ret) {
>> +				dev_err(&spi->dev,
>> +					"error enabling quad");
>> +				return -EINVAL;
>> +			}
>> +		} else if (of_property_read_bool(np, "spansion,quad_enable")) {
> Ditto on the binding. I don't think it's necessary, and I would prefer
> we go with the ID table flag or SFDP. But if you need it, document it.
>
>> +			ret = spansion_quad_enable(flash);
>> +			if (ret) {
>> +				dev_err(&spi->dev,
>> +					"error enabling quad");
>> +				return -EINVAL;
>> +			}
>> +		} else
>> +			dev_dbg(&spi->dev, "quad enable not supported");
> ...and if quad enable is not supported, we just blaze on to use quad
> mode anyway?? No, I think this needs to be rewritten so that we only set
> flash->quad_read = true when all of the following are true:
>
> (1) the SPI controller supports quad I/O
> (2) the flash supports it (i.e., after we see that the device supports
>      it in the ID table/DT/SFDP) and
> (3) we have successfully run one of the quad-enable commands
I got your idea here and to sum up, my below diff can be done to
better clean up the code.

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index f180ffd..6e32f6a 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -851,7 +851,7 @@ static const struct spi_device_id m25p_ids[] = {
         { "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
         { "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
         { "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
-       { "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, 0) },
+       { "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, MX_QUAD_EN) },

         /* Micron */
         { "n25q064",  INFO(0x20ba17, 0, 64 * 1024, 128, 0) },
@@ -870,7 +870,7 @@ static const struct spi_device_id m25p_ids[] = {
         { "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, 0) },
         { "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, 0) },
         { "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
-       { "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, 0) },
+       { "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, 
SP_QUAD_EN) },
         { "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, 0) },
         { "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
         { "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
@@ -1094,6 +1094,25 @@ static int m25p_probe(struct spi_device *spi)
         flash->mtd.size = info->sector_size * info->n_sectors;
         flash->mtd._erase = m25p80_erase;

+       if (spi->mode & SPI_RX_QUAD) {
+               if (info->flags & SP_QUAD_EN) {
+                       ret = spansion_quad_enable(flash);
+                       if (ret) {
+                               dev_err(&spi->dev, "error enabling quad");
+                               return -EINVAL;
+                       }
+                       flash->quad_read = true;
+               } else if (info->flags & MX_QUAD_EN) {
+                       ret = spansion_quad_enable(flash);
+                       if (ret) {
+                               dev_err(&spi->dev, "error enabling quad");
+                               return -EINVAL;
+                       }
+                       flash->quad_read = true;
+               } else
+                       dev_dbg(&spi->dev, "quad enable not supported");
+       }
+

> Then if you follow my advice on unifying m25p80_quad_read() and
> m25p80_read(), you'll never have a mismatch between flash->quad_read,
> the state of the flash, and the assigned flash->mtd._read callback
> function. We will trivially fall back to single-I/O read if anything
> fails, too.
>
>> +		flash->mtd._read = m25p80_quad_read;
>> +	} else
>> +		flash->mtd._read = m25p80_read;
> This mtd._read callback assignment should not need to be touched.
Ok, with your above suggestion on clubbing quad with original read 
support, this
will automatically go.
>> +
>>   	if (info->addr_width)
>>   		flash->addr_width = info->addr_width;
>>   	else if (flash->mtd.size>  0x1000000) {
> Brian
