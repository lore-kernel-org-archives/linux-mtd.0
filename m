Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eyfPp-000430-RT
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2018 15:12:40 +0000
Reply-To: thor.thayer@linux.intel.com
Subject: Re: [PATCH] mtd: spi-nor: Fix Cadence QSPI page fault kernel panic
To: Marek Vasut <marek.vasut@gmail.com>, cyrille.pitchen@wedev4u.fr,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1521485124-24882-1-git-send-email-thor.thayer@linux.intel.com>
 <cfadfbab-70bd-cb1c-c9a6-446cefd87e9e@gmail.com>
From: Thor Thayer <thor.thayer@linux.intel.com>
Message-ID: <f95ed3e9-00cb-3d7a-f25b-7915ac607ee1@linux.intel.com>
Date: Wed, 21 Mar 2018 10:15:14 -0500
MIME-Version: 1.0
In-Reply-To: <cfadfbab-70bd-cb1c-c9a6-446cefd87e9e@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

On 03/19/2018 05:33 PM, Marek Vasut wrote:
> On 03/19/2018 07:45 PM, thor.thayer@linux.intel.com wrote:
>> From: Thor Thayer <thor.thayer@linux.intel.com>
>>
>> The current Cadence QSPI driver caused a kernel panic when loading
>> a Root Filesystem from QSPI. The problem was caused by reading more
>> bytes than needed because the QSPI operated on 4 bytes at a time.
>> <snip>
>> [    7.947754] spi_nor_read[1048]:from 0x037cad74, len 1 [bfe07fff]
>> [    7.956247] cqspi_read[910]:offset 0x58502516, buffer=bfe07fff
>> [    7.956247]
>> [    7.966046] Unable to handle kernel paging request at virtual
>> address bfe08002
>> [    7.973239] pgd = eebfc000
>> [    7.975931] [bfe08002] *pgd=2fffb811, *pte=00000000, *ppte=00000000
>> </snip>
>> Notice above how only 1 byte needed to be read but by reading 4 bytes
>> into the end of a mapped page, a unrecoverable page fault occurred.
>>
>> This patch uses a temporary buffer to hold the 4 bytes read and then
>> copies only the bytes required into the buffer. A min() function is
>> used to limit the length to prevent buffer overflows.
>>
>> Similar changes were made for the write routine.
>>
>> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
>> ---
>>   drivers/mtd/spi-nor/cadence-quadspi.c | 39 ++++++++++++++++++++++++++++-------
>>   1 file changed, 31 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
>> index 4b8e9183489a..b22ed982f896 100644
>> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
>> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
>> @@ -501,7 +501,8 @@ static int cqspi_indirect_read_execute(struct spi_nor *nor, u8 *rxbuf,
>>   	void __iomem *reg_base = cqspi->iobase;
>>   	void __iomem *ahb_base = cqspi->ahb_base;
>>   	unsigned int remaining = n_rx;
>> -	unsigned int bytes_to_read = 0;
>> +	unsigned int mod_bytes, words_to_read, bytes_to_read = 0;
>> +	u8 *rxbuf_end = rxbuf + n_rx;
>>   	int ret = 0;
>>   
>>   	writel(from_addr, reg_base + CQSPI_REG_INDIRECTRDSTARTADDR);
>> @@ -533,9 +534,21 @@ static int cqspi_indirect_read_execute(struct spi_nor *nor, u8 *rxbuf,
>>   			bytes_to_read *= cqspi->fifo_width;
>>   			bytes_to_read = bytes_to_read > remaining ?
>>   					remaining : bytes_to_read;
>> -			ioread32_rep(ahb_base, rxbuf,
>> -				     DIV_ROUND_UP(bytes_to_read, 4));
>> -			rxbuf += bytes_to_read;
>> +			/* Read 4 byte chunks before using single byte mode */
>> +			words_to_read = bytes_to_read / 4;
>> +			mod_bytes = bytes_to_read % 4;
>> +			if (words_to_read) {
>> +				ioread32_rep(ahb_base, rxbuf, words_to_read);
>> +				rxbuf += (words_to_read * 4);
>> +			}
>> +			if (mod_bytes) {
>> +				unsigned int temp = ioread32(ahb_base);
>> +
>> +				memcpy(rxbuf, &temp, min((unsigned int)
>> +							 (rxbuf_end - rxbuf),
>> +							 mod_bytes));
>> +				rxbuf += mod_bytes;
>> +			}
> 
> Wouldn't it make more sense to read in 4 byte increments all the time
> except for the one last read instead ? This code above where you always
> check for trailing bytes can make the next read cycle do ioreaad32 into
> unaligned memory address and thus cause slowdown. (consider the example
> where the controller first reports it has 5 bytes ready, then reports it
> has 7 bytes ready. If you read 4 bytes in the first cycle, wait a bit
> and then check how much data the controller has in the next cycle, it
> will be 8 bytes, all nicely aligned).
> 
> Does it make sense ?
> 
Ahh yes, Thanks for the example - I see your point. I'll look into that 
change. Thanks.
