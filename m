Received: from smtp34.i.mail.ru ([94.100.177.94])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9kMj-0000tD-HB
 for linux-mtd@lists.infradead.org; Thu, 24 Nov 2016 03:06:28 +0000
Subject: Re: [PATCH v2] mtd: spi-nor: add Macronix mx25u25635f to list of
 known devices.
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
References: <20161118235149.21275-1-ash.benz@bk.ru>
 <f31e0599-9586-7118-82cb-4d4318146dc1@atmel.com>
From: "A. Benz" <ash.benz@bk.ru>
Message-ID: <7687a7bd-64cb-1fac-3c9e-304fbbe1b029@bk.ru>
Date: Thu, 24 Nov 2016 11:05:52 +0800
MIME-Version: 1.0
In-Reply-To: <f31e0599-9586-7118-82cb-4d4318146dc1@atmel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks!

Regards,
A. Benz

On 11/23/16 22:18, Cyrille Pitchen wrote:
> Le 19/11/2016 à 00:51, Ash Benz a écrit :
>> Signed-off-by: Ash Benz <ash.benz@bk.ru>
>
> Applied to git://github.com/spi-nor/linux.git
>
> Thanks!
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index d0fc165..4fd3ac8 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -872,6 +872,7 @@ static const struct flash_info spi_nor_ids[] = {
>>  	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
>>  	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>>  	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
>> +	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K) },
>>  	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
>>  	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
>>  	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
>>
>
