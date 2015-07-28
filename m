Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK60a-0004BJ-M4
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 14:37:34 +0000
Received: by wibxm9 with SMTP id xm9so163935793wib.1
 for <linux-mtd@lists.infradead.org>; Tue, 28 Jul 2015 07:37:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201507281633.19407.marex@denx.de>
References: <cover.1438073915.git.hramrach@gmail.com>
 <cb552b89554df49d1e6a24ce45b48c9e203f3b37.1438073915.git.hramrach@gmail.com>
 <201507281633.19407.marex@denx.de>
From: Michal Suchanek <hramrach@gmail.com>
Date: Tue, 28 Jul 2015 16:36:29 +0200
Message-ID: <CAOMqctRJ1qOn3raR1e3qw6aoqWcGLPRdkMU3xQKbL-gMKZthOg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Add GD25LQ32C 1.8V SPI NOR flash ID
To: Marek Vasut <marex@denx.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Huang Shijie <shijie.huang@intel.com>, Ben Hutchings <ben@decadent.org.uk>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 28 July 2015 at 16:33, Marek Vasut <marex@denx.de> wrote:
> On Tuesday, July 28, 2015 at 11:07:57 AM, Michal Suchanek wrote:
>> This 1.8V SPI NOR flash is found on ARM Chromebook XE303C and reads
>> something like 25LQ32VIG in the middle.
>>
>> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index d78831b..cba3bd0 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -559,6 +559,7 @@ static const struct spi_device_id spi_nor_ids[] = {
>>
>>       /* GigaDevice */
>>       { "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
>> +     { "gd25lq32c", INFO(0xc86016, 0, 64 * 1024,  64, SECT_4K) },
>>       { "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128, SECT_4K) },
>>       { "gd25q128", INFO(0xc84018, 0, 64 * 1024, 256, SECT_4K) },
>
> Don't we have DT bindings, so we can use jedec,spi-nor prop for all
> new SPI NORs without growing this table ?

When jedec,spi-nor compatible is used an attempt is made to identify
the chip using this table.

When the ID is not in the table (or is misread due to transfer error)
spi-nor probe fails.

Thanks

Michal
