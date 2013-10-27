Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VaV2z-0003Ry-9E
 for linux-mtd@lists.infradead.org; Sun, 27 Oct 2013 18:26:46 +0000
Message-ID: <526D5AC8.2020703@ti.com>
Date: Sun, 27 Oct 2013 23:56:16 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drivers: mtd: m25p80: Add quad read support.
References: <1382693145-15750-1-git-send-email-sourav.poddar@ti.com>
 <201310271745.17152.marex@denx.de>
In-Reply-To: <201310271745.17152.marex@denx.de>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org, balbi@ti.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Marek,
On Sunday 27 October 2013 10:15 PM, Marek Vasut wrote:
> Dear Sourav Poddar,
>
> [...]
>
>> +static int macronix_quad_enable(struct m25p *flash)
>> +{
>> +	int ret, val;
>> +	u8 cmd[2];
>> +	cmd[0] = OPCODE_WRSR;
>> +
>> +	val = read_sr(flash);
>> +	cmd[1] = val | SR_QUAD_EN_MX;
>> +	write_enable(flash);
>> +
>> +	spi_write(flash->spi,&cmd, 2);
>> +
>> +	if (wait_till_ready(flash))
>> +		return 1;
>> +
>> +	ret = read_sr(flash);
> Maybe read_sr() and read_cr() shall be fixed to return retval only and the val
> shall be passed to them as an argument pointer? Aka. ret = read_sr(flash,&val);
>
> That way, this dangerous construct below could become:
>
> if (!(val&  SR_....)) {
> 	dev_err();
> 	ret = -EINVAL;
> }
>
> return ret;
>
> It will also let us prevent mixing of error codes and register values, which is
> pretty ugly practice.
>
ok. Will change.
>> +	if (!(ret>  0&&  (ret&  SR_QUAD_EN_MX))) {
>> +		dev_err(&flash->spi->dev,
>> +			"Macronix Quad bit not set");
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
> [...]
>
>> +static inline int set_quad_mode(struct m25p *flash, u32 jedec_id)
>> +{
>> +	int status;
>> +
>> +	switch (JEDEC_MFR(jedec_id)) {
>> +	case CFI_MFR_MACRONIX:
>> +		status = macronix_quad_enable(flash);
>> +		if (status) {
>> +			dev_err(&flash->spi->dev,
>> +				"Macronix quad not enable");
> "Macronix quad-read not enabled" would be more sensible, DTTO below.
>
Ok. Will change.
>> +			return -EINVAL;
>> +		}
>> +		return status;
>> +	default:
>> +		status = spansion_quad_enable(flash);
>> +		if (status) {
>> +			dev_err(&flash->spi->dev,
>> +				"Spansion quad not enable");
>> +			return -EINVAL;
>> +		}
>> +		return status;
>> +	}
>> +}
> [...]
>
>> @@ -774,7 +906,7 @@ static const struct spi_device_id m25p_ids[] = {
>>   	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>>   	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
>>   	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
>> -	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, 0) },
>> +	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, M25P80_QUAD_READ) },
> I'm not convinced enabling 4-bit mode should be hard-coded in the MTD driver.
> There might be a board which uses this chip in 1-bit mode.
>
> We have a setup with Spansion chip here which uses 1-bit addressing in U-Boot,
> but uses 4-bit addressing in Linux. We use a DT property to configure the SPI
> bus width for that and I think that's a way to go. Note that there also are
> chips which use 2-bit wide SPI communication.
>
Yes, but if you trace down the patch below, you will see its not hard coded.
Enabling quad read mode depends on the following:

1. Whether flash chip supports it.
         This information comes from the flash which we are setting above.

2. Whether SPI controller supports it.
             This information is the check down below in the 
patch(spi->mode & SPI_RX_QUAD).
             spi->mode is set to "SINGLE/DUAL/QUAD" in the SPI framework 
based on the
            dt property "spi-tx/rx-bus-width".
So, unless you set spi->mode to SPI_RX_QUAD by setting 
"spi-rx-bus-width" to 4 in dt, default
will be 1 bit mode only.
> [...]
>
