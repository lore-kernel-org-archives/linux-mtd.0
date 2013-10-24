Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZGXy-0001gU-QQ
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 08:45:40 +0000
Message-ID: <5268DE0B.7040208@ti.com>
Date: Thu, 24 Oct 2013 14:14:59 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCHv3 2/3] drivers: mtd: devices: Add quad read support.
References: <1381332284-21822-1-git-send-email-sourav.poddar@ti.com>
 <1381332284-21822-3-git-send-email-sourav.poddar@ti.com>
 <20131024010619.GA23337@ld-irv-0074.broadcom.com> <5268B3B8.4090807@ti.com>
 <20131024073400.GA9863@norris.computersforpeace.net>
In-Reply-To: <20131024073400.GA9863@norris.computersforpeace.net>
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
On Thursday 24 October 2013 01:04 PM, Brian Norris wrote:
> On Thu, Oct 24, 2013 at 11:14:24AM +0530, Sourav Poddar wrote:
>> On Thursday 24 October 2013 06:36 AM, Brian Norris wrote:
>>> On Wed, Oct 09, 2013 at 08:54:43PM +0530, Sourav Poddar wrote:
>>>> --- a/drivers/mtd/devices/m25p80.c
>>>> +++ b/drivers/mtd/devices/m25p80.c
>>>> @@ -76,6 +78,10 @@
>>>>   #define	SR_BP2			0x10	/* Block protect 2 */
>>>>   #define	SR_SRWD			0x80	/* SR write protect */
>>>>
>>>> +/* Configuration Register bits. */
>>>> +#define SPAN_QUAD_CR_EN		0x2	/* Spansion Quad I/O */
>>>> +#define MACR_QUAD_SR_EN		0x40	/* Macronix Quad I/O */
>>> Perhaps CR_ can be the prefix, like the status register SR_ macros? So:
>>>
>>>    CR_QUAD_EN_SPAN
>>>    CR_QUAD_EN_MACR
>> Yes, CR/SR can come as a prefix for Spansion. But, to enable quad mode in
>> macronix, we need to write to status register. So, things should be like..
>>    CR_QUAD_EN_SPAN
>>    SR_QUAD_EN_MACR
> Yes, I missed the CR vs. SR. My bad.
>
>>>> +
>>>>   /* Define max times to check status register before we give up. */
>>>>   #define	MAX_READY_WAIT_JIFFIES	(40 * HZ)	/* M25P16 specs 40s max chip erase */
>>>>   #define	MAX_CMD_SIZE		5
>>>> @@ -95,6 +101,7 @@ struct m25p {
>>>> @@ -163,6 +170,25 @@ static inline int write_disable(struct m25p *flash)
> ...
>
>>>> +static int m25p80_quad_read(struct mtd_info *mtd, loff_t from, size_t len,
>>>> +	size_t *retlen, u_char *buf)
>>>> +{
>>> This function only has 2 meaningful lines difference from m25p80_read(),
>>> no? I'd consider combining them. You only need a simple bool/flag to
>>> tell whether we're in quad mode + you can re-use the 'read_opcode' field
>>> of struct m25p.
>>>
>> Yes, my only motto of keeping a seperate API was that quad supports
>> different sort of commands, with different dummy cycle requirements.
>> So, I thought it might get a bit clumsy to handle, if someone later
>> want to add a
>> particular command along with its dummy cycle requirements.
>>
>> But, yes, you are true, as of now, it can be club into one.
>>
>>>> +	struct m25p *flash = mtd_to_m25p(mtd);
>>>> +	struct spi_transfer t[2];
>>>> +	struct spi_message m;
>>>> +	uint8_t opcode;
>>>> +
>>>> +	pr_debug("%s: %s from 0x%08x, len %zd\n", dev_name(&flash->spi->dev),
>>>> +			__func__, (u32)from, len);
>>>> +
>>>> +	spi_message_init(&m);
>>>> +	memset(t, 0, (sizeof(t)));
>>>> +
>>>> +	t[0].tx_buf = flash->command;
>>>> +	t[0].len = m25p_cmdsz(flash) + (flash->quad_read ? 1 : 0);
>>> This is the first of 2 lines that are different from m25p80_read(). It
>>> can easily be combined with the existing read implementation.
>>>
>>>> +	spi_message_add_tail(&t[0],&m);
>>>> +
>>>> +	t[1].rx_buf = buf;
>>>> +	t[1].len = len;
>>>> +	t[1].rx_nbits = SPI_NBITS_QUAD;
>>> This is the second of 2 different lines. You can change m25p80_read() to
>>> have something like this:
>>>
>>> 	t[1].rx_nbits = flash->quad_read ? SPI_NBITS_QUAD : 1;
>>     True, t[0] len can be written as..
>>
>>      t[0].len = m25p_cmdsz(flash) + (flash->quad_read ? 1 :
>> (flash->fast_read ? 1 : 0));
> Yikes. I'd go easy with the embedded '?:' operators.
>
> If you're going for really fun ways to shorten things, though, you can
> do:
>
>          t[0].len = m25p_cmdsz(flash) + !!(flash->quad_read || flash->fast_read);
>
> But seriously, I think it may be better to be more verbose to make it
> clearer. Like:
>
> 	t[0].len = m25p_cmdsz(flash);
> 	/* Dummy cycle */
> 	if (flash->quad_read || flash->fast_read)
> 		t[0].len++;
>
> If you're really looking at making dummy cycles more modular, though,
> you can add an extra function like this:
>
> static inline int m25p80_dummy_cycles_read(struct m25p *flash)
> {
> 	if (flash->quad_read || flash->fast_read)
> 		return 1;
> 	return 0;
> }
>
> Then it's:
>
> 	t[0].len = m25p_cmdsz(flash) + m25p80_dummy_cycles_read(flash);
>
> Then you can convert this to represent the # of bits of dummy cycle if
> you ever do more exotic commands and implement a proper SPI dummy cycle
> API.
>
> But please, don't just embed a bunch of '?:'.
>
The above suggestion looks quite clean and verbose. I will go this way in my
next version.
>>>> +	spi_message_add_tail(&t[1],&m);
>>>> +
>>>> +	mutex_lock(&flash->lock);
>>>> +
>>>> +	/* Wait till previous write/erase is done. */
>>>> +	if (wait_till_ready(flash)) {
>>>> +		/* REVISIT status return?? */
>>>> +		mutex_unlock(&flash->lock);
>>>> +		return 1;
>>>> +	}
>>>> +
>>>> +	/* FIXME switch to OPCODE_QUAD_READ.  It's required for higher
>>>> +	 * clocks; and at this writing, every chip this driver handles
>>>> +	 * supports that opcode.
>>>> +	*/
>>> What? It seems you blindly copied/edited the already-out-of-date comment
>> >from m25p80_read().
>> Sorry for this, my bad. I will update this in next version.
>>>> +
>>>> +	/* Set up the write data buffer. */
>>>> +	opcode = flash->read_opcode;
>>>> +	flash->command[0] = opcode;
>>>> +	m25p_addr2cmd(flash, from, flash->command);
>>>> +
>>>> +	spi_sync(flash->spi,&m);
>>>> +
>>>> +	*retlen = m.actual_length - m25p_cmdsz(flash) -
>>>> +			(flash->quad_read ? 1 : 0);
>>>> +
>>>> +	mutex_unlock(&flash->lock);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>   /*
>>>>    * Read an address range from the flash chip.  The address range
>>>>    * may be any size provided it is within the physical boundaries.
>>>> @@ -979,15 +1122,9 @@ static int m25p_probe(struct spi_device *spi)
>>>>   		}
>>>>   	}
>>>>
>>>> -	flash = kzalloc(sizeof *flash, GFP_KERNEL);
>>>> +	flash = devm_kzalloc(&spi->dev, sizeof(*flash), GFP_KERNEL);
>>>>   	if (!flash)
>>>>   		return -ENOMEM;
>>>> -	flash->command = kmalloc(MAX_CMD_SIZE + (flash->fast_read ? 1 : 0),
>>>> -					GFP_KERNEL);
>>>> -	if (!flash->command) {
>>>> -		kfree(flash);
>>>> -		return -ENOMEM;
>>>> -	}
>>> You're combining a bug fix with your feature addition. The size may be
>>> off-by-one (which is insignificant in this case, I think, but still...)
>>> so the kmalloc() does needs to move down, but it should be done before
>>> this feature patch. (Sorry, I've had a patch queued up but didn't send
>>> it out for a while. I think somebody sorta tried to fix this a while ago
>>> but didn't send a proper patch.)
>>>
>> Yes, true. I can break this patch into two with first patch as the
>> bug fix and
>> second as the feature. Is it ok?
> I just submitted my cleanups which (among other things) fixes this bug.
> I believe I CC'd you. Go ahead and review it, and if it works to your
> liking, please just base your work on top of it. I'll apply some or all
> of that series if no one objects.
>
Ok.
>>>>   	flash->spi = spi;
>>>>   	mutex_init(&flash->lock);
>>>> @@ -1067,6 +1203,38 @@ static int m25p_probe(struct spi_device *spi)
>>>>
>>>>   	flash->program_opcode = OPCODE_PP;
>>>>
>>>> +	flash->quad_read = false;
>>>> +	if (spi->mode&&   SPI_RX_QUAD)
>>> You're looking for bitwise '&', not logical'&&'.
>>>
>>>> +		flash->quad_read = true;
>>> But you can just replace the previous 3 lines with:
>>>
>>> 	flash->quad_read = spi->mode&   SPI_RX_QUAD;
>>>
>>> or this, if you really want be careful about the bit position:
>>>
>>> 	flash->quad_read = !!(spi->mode&   SPI_RX_QUAD);
>>>
>> True, will fix.
>>>> +
>>>> +	flash->command = kmalloc(MAX_CMD_SIZE + (flash->fast_read ? 1 :
>>>> +				(flash->quad_read ? 1 : 0)), GFP_KERNEL);
>>> That's an ugly conditional. Maybe we just want to increase MAX_CMD_SIZE
>>> and be done with it? Saving an extra byte is not helping anyone (and I
>>> think pretty much everyone always has fast_read==true anyway).
>> Yes, this can be done. But, I was not sure about increasing the macro just
>> on coding perspective. If it sounds Ok, I will increase the macro and make
>> the corresponding cleanups.
> Just take a look at my patch for this issue, please.
>
Ok.
>>>> +		if (of_property_read_bool(np, "macronix,quad_enable")) {
> ...
>>>> +		} else if (of_property_read_bool(np, "spansion,quad_enable")) {
> ...
>>>> +		} else
>>>> +			dev_dbg(&spi->dev, "quad enable not supported");
>>> ...and if quad enable is not supported, we just blaze on to use quad
>>> mode anyway?? No, I think this needs to be rewritten so that we only set
>>> flash->quad_read = true when all of the following are true:
>>>
>>> (1) the SPI controller supports quad I/O
>>> (2) the flash supports it (i.e., after we see that the device supports
>>>      it in the ID table/DT/SFDP) and
>>> (3) we have successfully run one of the quad-enable commands
>> I got your idea here and to sum up, my below diff can be done to
>> better clean up the code.
> Looks a little better. A few comments on it below.
>
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> index f180ffd..6e32f6a 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -851,7 +851,7 @@ static const struct spi_device_id m25p_ids[] = {
>>          { "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>>          { "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
>>          { "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
>> -       { "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, 0) },
>> +       { "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, MX_QUAD_EN) },
> I don't think we need a separate Macronix and Spansion quad flag; I
> think we can get by with just a M25P_QUAD flag (or some other name like
> that). We can differentiate MXIC and Spansion via just the manufacturer
> by it's ID, right? (See the similarity to set_4byte().)
>
Yes, I believe this can be done on similar lines to set_4byte. I will try
this out in my next version.


> Do all parts that support quad read also support all the other quad
> opcodes (like quad program)?
>
I have Spansion and Macronix flash with me.

For spansion,
supported quad commands are:
QOR(0x6b) which is what I am using.
QIOR(0xeb)
DDR QIOR(0xed)

For macronix,
QOR(0x6b) which is what I am using.
QIOR(0xeb)

>>          /* Micron */
>>          { "n25q064",  INFO(0x20ba17, 0, 64 * 1024, 128, 0) },
>> @@ -870,7 +870,7 @@ static const struct spi_device_id m25p_ids[] = {
>>          { "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, 0) },
>>          { "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, 0) },
>>          { "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
>> -       { "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, 0) },
>> +       { "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512,
>> SP_QUAD_EN) },
>>          { "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, 0) },
>>          { "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
>>          { "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
>> @@ -1094,6 +1094,25 @@ static int m25p_probe(struct spi_device *spi)
>>          flash->mtd.size = info->sector_size * info->n_sectors;
>>          flash->mtd._erase = m25p80_erase;
>>
>> +       if (spi->mode&  SPI_RX_QUAD) {
>> +               if (info->flags&  SP_QUAD_EN) {
>> +                       ret = spansion_quad_enable(flash);
>> +                       if (ret) {
>> +                               dev_err(&spi->dev, "error enabling quad");
>> +                               return -EINVAL;
>> +                       }
>> +                       flash->quad_read = true;
>> +               } else if (info->flags&  MX_QUAD_EN) {
>> +                       ret = spansion_quad_enable(flash);
>> +                       if (ret) {
>> +                               dev_err(&spi->dev, "error enabling quad");
>> +                               return -EINVAL;
>> +                       }
>> +                       flash->quad_read = true;
>> +               } else
>> +                       dev_dbg(&spi->dev, "quad enable not supported");
>> +       }
>> +
> I think we'll want a separate function set_quad_mode(), so we can just do:
>
> 	if (spi->mode&  SPI_RX_QUAD&&  info->flags&  M25P_QUAD) {
> 		ret = set_quad_mode(flash, info->jedec_id, 1);
> 		if (ret) {
> 			dev_err(...);
> 			return ret;
> 		}
> 		flash->quad_read = true;
> 	}
>
> Then the set_quad_mode() function can do things very similarly to
> set_4byte(), based on the manufacturer JEDEC ID.
Make sense, I will implement this.
> Do you plan on supporting Quad Page Program?
Currently, I am planning to add Quad output read(8 dummy cycle) only.
>   How about the dedicated
> 4-byte addressing variants of these Quad commands?
>
Hmm, seems like I missed this. I will add this.
> Are there any other important side effects when enabling quad mode? I'm
> reading some things about changes in WP# and HOLD# behavior, but I'm not
> quite sure right now if that has ramifications on the rest of the
> driver.
>
Nope, I have not faced any. WP# and HOLD# are the IO2 and IO3 lines
respectively in quad mode.
> Brian
