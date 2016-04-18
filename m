Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1as9Xy-0002kP-Jl
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2016 13:49:03 +0000
Subject: Re: [PATCH for-next] spi: bcm53xx: add spi_flash_read callback for
 MMIO-based reads
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Mark Brown
 <broonie@kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
References: <1460977843-9426-1-git-send-email-zajec5@gmail.com>
 <20160418112457.GU3217@sirena.org.uk>
 <CACna6rzQfX7SxDoL-CTQp3_Ms5_K54pEa8uaUAiTPjR-un=VOg@mail.gmail.com>
CC: "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <5714E5B0.2020700@ti.com>
Date: Mon, 18 Apr 2016 19:18:32 +0530
MIME-Version: 1.0
In-Reply-To: <CACna6rzQfX7SxDoL-CTQp3_Ms5_K54pEa8uaUAiTPjR-un=VOg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 04/18/2016 05:08 PM, Rafał Miłecki wrote:
> On 18 April 2016 at 13:24, Mark Brown <broonie@kernel.org> wrote:
>> On Mon, Apr 18, 2016 at 01:10:43PM +0200, Rafał Miłecki wrote:
>>
>>> +static int bcm53xxspi_flash_read(struct spi_device *spi,
>>> +                              struct spi_flash_read_message *msg)
>>> +{
>>> +     struct bcm53xxspi *b53spi = spi_master_get_devdata(spi->master);
>>> +     int ret = 0;
>>> +
>>> +     bcm53xxspi_enable_bspi(b53spi);
>>> +     memcpy_fromio(msg->buf, b53spi->mmio_base + msg->from, msg->len);
>>> +     msg->retlen = msg->len;
>>
>> There's no bounds check here but...
> 
> That's true, I was looking at ti_qspi_spi_flash_read and somehow
> incorrectly (!) assumed there is a check above. Of course there isn't
> one and there can't be, I'll simply fix this code. I guess we should
> fix ti_qspi_spi_flash_read in ti-qspi driver as well.

My assumption was controller will provide ability to map entire flash
under memory mapped region either in oneshot or in parts. It would be
odd to have some parts of flash accessible under memory mapped mode and
some only under SPI mode. Therefore there is no bound check in case of
ti-qspi(but I see is no harm in adding one. I will fix it up).

> 
> I also realized there wasn't any fallback introduced in:
> mtd: devices: m25p80: add support for mmap read request
> http://git.infradead.org/l2-mtd.git/commitdiff/08922f644878c9163ada8df3ef9def89be1d5e90
> 
> What shall we do if spi_flash_read fails? Should we always fallback to
> the standard SPI flash read? Or should we standarize error codes
> returned by spi_flash_read and fallback on some particular error code
> only?
> 

spi_flash_read() can return error for incorrect protocol format
(opcode/data/address_nbits), this will fail anyways for normal SPI mode
as well. Else, its the error code returned by master->spi_flash_read()
callback (individual driver dependent). Not sure what can be
standardized here.
I think fallback would be to try SPI mode when ret!=-EINVAL.




-- 
Regards
Vignesh
