Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePSNY-00071g-BD
 for linux-mtd@lists.infradead.org; Thu, 14 Dec 2017 12:12:47 +0000
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: add support for is25lq040b
To: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Cc: linux-mtd@lists.infradead.org, marek.vasut@gmail.com
References: <20171213113530.6857-1-sean.nyekjaer@prevas.dk>
 <e85d724e-a8c8-8afb-0552-e2d5fef0208f@prevas.dk>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <a24b94d2-3781-e91e-04f0-e26675450a88@wedev4u.fr>
Date: Thu, 14 Dec 2017 13:12:11 +0100
MIME-Version: 1.0
In-Reply-To: <e85d724e-a8c8-8afb-0552-e2d5fef0208f@prevas.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sean,

Le 14/12/2017 à 11:21, Sean Nyekjær a écrit :
> Hi Cyrille
> 
> On 2017-12-13 12:35, Sean Nyekjaer wrote:
>> Signed-off-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
>> ---
>> v2:
>>   - removed SECT_4K as the chip are supporting 32K and bulk erase
>>
>>   drivers/mtd/spi-nor/spi-nor.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 9178139a39d0..cc4328dff89a 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1048,6 +1048,7 @@ static const struct flash_info spi_nor_ids[] = {
>>       { "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
>>       { "is25lp128", INFO(0x9d6018, 0, 64 * 1024, 256,
>>               SECT_4K | SPI_NOR_DUAL_READ) },
>> +    { "is25lq040b", INFO(0x9d4013, 0, 64 * 1024,  64, 0) },
> Doh, my bad, there is only 8 blocks on the device (4Mbit not 4MB)
> 
> The device have the possibility to erase 4, 32, 64 Kbyte, or Chip Erase.
> Is the SECT_4K preferred in the kernel or should i leave it off?

If 4K erase is uniformly supported by the memory, then please add the
SECT_4K flag.

I'm looking at the datasheet [1]:
- Uniform 4 Kbyte Sectors or 32/64 Kbyte Blocks: please add the SECT_4K flag
- FAST READ QUAD OUTPUT (FRQO, 6Bh): Fast Read 1-1-4 supported, then please
  add the SPI_NOR_QUAD_READ flag too
- FAST READ DUAL OUTPUT (FRDO, 3Bh): Fast Read 1-1-2 supported, also add the
  SPI_NOR_DUAL_READ flag.

Besides, setting at least one the the SPI_NOR_{DUAL,QUAD}_READ flags will
enable parsing of the SFDP tables, which are also supported by this memory:

"Supports Serial Flash Discoverable Parameters (SFDP)"

So you should set the 3 flags:
SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ


Best regards,

Cyrille

[1] http://www.issi.com/WW/pdf/25LQ025B-512B-010B-020B-040B.pdf

>>         /* Macronix */
>>       { "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
> /Sean
> 
