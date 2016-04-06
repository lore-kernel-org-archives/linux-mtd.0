Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anfsO-0001Js-LQ
 for linux-mtd@lists.infradead.org; Wed, 06 Apr 2016 05:20:23 +0000
Subject: Re: [RESEND][PATCH] mtd: devices: m25p80: add support for mmap read
 request
To: Brian Norris <computersforpeace@gmail.com>
References: <1459230377-26847-1-git-send-email-vigneshr@ti.com>
 <20160405181427.GA5561@localhost>
CC: David Woodhouse <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <57049C31.7090505@ti.com>
Date: Wed, 6 Apr 2016 10:48:41 +0530
MIME-Version: 1.0
In-Reply-To: <20160405181427.GA5561@localhost>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 04/05/2016 11:44 PM, Brian Norris wrote:
> + Mark, Cyrille
> 
> On Tue, Mar 29, 2016 at 11:16:17AM +0530, Vignesh R wrote:
>> Certain SPI controllers may provide accelerated hardware interface to
>> read from m25p80 type flash devices in order to provide better read
>> performance. SPI core supports such devices with spi_flash_read() API.
>> Call spi_flash_read(), if supported, to make use of such interface.
>>
>> Signed-off-by: Vignesh R <vigneshr@ti.com>
>> ---
> 
> Applied, with a small diff.
> 
>> Resend v5:
>> Rebased on top of v4.6-rc1
>> v5: http://www.spinics.net/lists/devicetree/msg106696.html
>>
>>  drivers/mtd/devices/m25p80.c | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> index c9c3b7fa3051..7730e633d7d3 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -131,6 +131,26 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
>>  	/* convert the dummy cycles to the number of bytes */
>>  	dummy /= 8;
>>  
>> +	if (spi_flash_read_supported(spi)) {
>> +		struct spi_flash_read_message msg;
>> +		int ret;
>> +
> 
> I added a memset(&msg, 0, sizeof(msg)), since spi_flash_read() doesn't
> guarantee msg.retlen is zeroed for failures. 

Thanks!

> Do we want a
> spi_flash_read_message_init() function, to mirror spi_message_init()?
> 

Not sure, there is nothing much to initialize (apart from memset msg to
zero), all fields are expected to explicitly populated by MTD flash driver.

>> +		msg.buf = buf;
>> +		msg.from = from;
>> +		msg.len = len;
>> +		msg.read_opcode = nor->read_opcode;
>> +		msg.addr_width = nor->addr_width;
>> +		msg.dummy_bytes = dummy;
>> +		/* TODO: Support other combinations */
> 
> Speaking of "other combinations": does the TI QSPI controller support
> MMAP'ed read modes other than 1/1/{1,2,4}? It doesn't seem to implement
> support, and the SPI core doesn't handle this. So if we merge any of
> Cyrille's work on other modes, then this is going to break quickly.
> 

No, TI QSPI only supports 1/1/{1,2,4} mode in MMAP'ed mode or in normal
SPI mode. This is specified in DT as:
			spi-tx-bus-width = <1>;
inside m25p80 slave node. This indicates that cmd,addr are always on D0
line only.
AFAIK, Cyrille's series starts using 4-4-4/2-2-2/ etc only if the flash
 was  initially configured to be in that mode by bootloader/ROM code. If
flash's bit to enter 4-4-4 is not set, then there will be no change and
m25p80 continues to use 1-1-4 format for QUAD read. Therefore I don't
think those patches will break TI QSPI. I will try and test that series
on top of this patch sometime soon.

-- 
Regards
Vignesh
