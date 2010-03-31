Message-ID: <4BB33988.9070608@gmail.com>
Date: Wed, 31 Mar 2010 15:01:12 +0300
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
MIME-Version: 1.0
To: dwmw2@infradead.org
Subject: Re: [PATCH v2] MTD: Fix Orion NAND driver compilation with ARM OABI
References: <20100325152505.17612.40158.stgit@pauliusz>
	<alpine.LFD.2.00.1003251225500.694@xanadu.home>
In-Reply-To: <alpine.LFD.2.00.1003251225500.694@xanadu.home>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Nicolas Pitre <nico@fluxnic.net>, jamie@shareable.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	u.kleine-koenig@pengutronix.de, simon.kagstrom@netinsight.net,
	akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/25/2010 06:26 PM, Nicolas Pitre wrote:
> On Thu, 25 Mar 2010, Paulius Zaleckas wrote:
>
>> We must tell GCC to use even register for variable passed
>> to ldrd instruction. Without this patch GCC 4.2.1 puts this
>> variable to r2/r3 on EABI and r3/r4 on OABI, so force it to
>> r2/r3. This does not change anything when EABI and OABI
>> compilation works OK.
>>
>> Without this patch and with OABI I get:
>>    CC      drivers/mtd/nand/orion_nand.o
>> /tmp/ccMkwOCs.s: Assembler messages:
>> /tmp/ccMkwOCs.s:63: Error: first destination register must be even -- `ldrd r3,[ip]'
>> make[5]: *** [drivers/mtd/nand/orion_nand.o] Error 1
>>
>> Signed-off-by: Paulius Zaleckas<paulius.zaleckas@gmail.com>
>
> Acked-by: Nicolas Pitre<nico@fluxnic.net>

David,

Will you take this patch?
Or you are waiting till I will add all Cc as Jamie suggested?

>
>> ---
>>
>>   drivers/mtd/nand/orion_nand.c |    8 +++++++-
>>   1 files changed, 7 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
>> index f59c074..d60fc57 100644
>> --- a/drivers/mtd/nand/orion_nand.c
>> +++ b/drivers/mtd/nand/orion_nand.c
>> @@ -60,7 +60,13 @@ static void orion_nand_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
>>   	}
>>   	buf64 = (uint64_t *)buf;
>>   	while (i<  len/8) {
>> -		uint64_t x;
>> +		/*
>> +		 * Since GCC has no proper constraint (PR 43518)
>> +		 * force x variable to r2/r3 registers as ldrd instruction
>> +		 * requires first register to be even.
>> +		 */
>> +		register uint64_t x asm ("r2");
>> +
>>   		asm volatile ("ldrd\t%0, [%1]" : "=&r" (x) : "r" (io_base));
>>   		buf64[i++] = x;
>>   	}
>>
