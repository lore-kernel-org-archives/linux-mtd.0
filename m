Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJh6b-00045p-EU
 for linux-mtd@lists.infradead.org; Wed, 21 Dec 2016 13:38:54 +0000
Subject: Re: [PATCH V2 2/3] mtd: spi-nor: add support for macronix mx25u3235f
To: John Crispin <john@phrozen.org>, Marek Vasut <marek.vasut@gmail.com>
References: <1482304990-23942-1-git-send-email-john@phrozen.org>
 <1482304990-23942-3-git-send-email-john@phrozen.org>
 <91bb0b9c-93c0-755c-047b-2e86f099af02@atmel.com>
 <f7185437-a479-9376-a2c0-ee39a1f491f4@phrozen.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Andr=c3=a9_Valentin?= <avalentin@marcant.net>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <6b7f2b8b-482a-9704-7183-f76b24eae756@atmel.com>
Date: Wed, 21 Dec 2016 14:38:29 +0100
MIME-Version: 1.0
In-Reply-To: <f7185437-a479-9376-a2c0-ee39a1f491f4@phrozen.org>
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

Le 21/12/2016 à 14:16, John Crispin a écrit :
> 
> 
> On 21/12/2016 11:27, Cyrille Pitchen wrote:
>> Hi all,
>>
>> Le 21/12/2016 à 08:23, John Crispin a écrit :
>>> From: André Valentin <avalentin@marcant.net>
>>>
>>> This patch adds support for a new macronix spi flash chip. We have had this
>>> patch inside our tree for a while and people are actively using routers
>>> with this chip.
>>>
>>> Signed-off-by: John Crispin <john@phrozen.org>
>>> Signed-off-by: André Valentin <avalentin@marcant.net>
>>> ---
>>> Changes in V2
>>> * add description
>>> * add SECT_4K
>>> * fix indenting
>>>
>>>  drivers/mtd/spi-nor/spi-nor.c |    1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>> index 171adb3..bfff159 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -868,6 +868,7 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>>>  	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
>>>  	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
>>>  	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
>>> +	{ "mx25u3235f",	 INFO(0xc22536, 0, 64 * 1024,  64, SECT_4K) },
>>
>> According to its datasheet, the Macronix MX25U3235F also supports Fast Read
>> 1-1-2 (3Bh) and Fast Read 1-1-4 (EBh) hence the SPI_NOR_DUAL_READ
>> and SPI_NOR_QUAD_READ flags should be set as well.
>>
>> Best regards,
>>
>> Cyrille
> 
> Hi Cyrille,
> 
> thanks for the help, I'll update the patches and get the original
> submitters to test them before resending the series
> 
> 	John
>

If they could test easily it's always a good thing. For 4K erase it should
be pretty straight forward but for dual and quad fast reads it depends on
the SPI controller hardware capabilities, whether the IO2 and IO3 lines are
physically connected to the relevant memory pins... So if it is too
difficult to find a proper board to do the tests, just tell us :)

Anyway, with Macronix memories, we don't take that much risk setting the
dual/quad flags referring only to the datasheet. For instance, we already
know that the Fast Read 1-y-4 commands work with Macronix mx25l25673g, so
it's very likely to work the same with mx25u*35f parts.

Still reading the datasheet, I've already checked the number of dummy
cycles needed with the factory settings: 8 dummy clock cycles (mode cycles
included) for both Fast Read 1-1-4 and Fast Read 1-1-2.

Best regards,

Cyrille


>>
>>>  	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
>>>  	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
>>>  	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
>>>
>>
> 
