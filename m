Received: from smtp28.mail.ru ([94.100.181.183])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7szv-00032G-LC
 for linux-mtd@lists.infradead.org; Fri, 18 Nov 2016 23:55:12 +0000
Subject: Re: [PATCH] mtd: spi-nor: add Macronix mx25u25635f to list of known
 devices.
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
References: <20161118101203.18992-1-ash.benz@bk.ru>
 <CACna6rxYHGpm7y6kKFYA0nC-K6thwuAehFNX+3bDY2phr61BvA@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: "A. Benz" <ash.benz@bk.ru>
Message-ID: <ac4b00d4-5453-3d60-f823-0a8e86f0ddd2@bk.ru>
Date: Sat, 19 Nov 2016 07:54:36 +0800
MIME-Version: 1.0
In-Reply-To: <CACna6rxYHGpm7y6kKFYA0nC-K6thwuAehFNX+3bDY2phr61BvA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Rafał,

I sent a v2 with 4k sect.
Regarding sort, the list is already unsorted, it seems models that are 
very similar are put next to each other.

Regards,
A. Benz

On 11/18/16 19:03, Rafał Miłecki wrote:
> On 18 November 2016 at 11:12, Ash Benz <ash.benz@bk.ru> wrote:
>> Signed-off-by: Ash Benz <ash.benz@bk.ru>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index d0fc165..171adb3 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -872,6 +872,7 @@ static const struct flash_info spi_nor_ids[] = {
>>         { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
>>         { "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>>         { "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
>> +       { "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, 0) },
>>         { "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
>>         { "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
>>         { "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
>
> Please keep this list sorted.
>
> Are you sure this chip doesn't support 4 k sections? Datasheets says:
> "Equal Sectors with 4K byte each, or Equal Blocks with 32K byte each
> or Equal Blocks with 64K byte each "
>
