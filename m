Message-ID: <4AB33F08.1040004@nokia.com>
Date: Fri, 18 Sep 2009 11:04:24 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "Korhonen Mika.2 (EXT-Ardites/Oulu)" <ext-mika.2.korhonen@nokia.com>
Subject: Re: [PATCH 2/2] MTD: OneNAND: multiblock erase support
References: <1251975273-12432-1-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1251975273-12432-2-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1251975273-12432-3-git-send-email-ext-mika.2.korhonen@nokia.com>
	<4AB1133B.4080905@nokia.com> <4AB314B2.8010003@nokia.com>
In-Reply-To: <4AB314B2.8010003@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "amul.saha@samsung.com" <amul.saha@samsung.com>,
	"dedekind@infradead.org" <dedekind@infradead.org>,
	"kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Korhonen Mika.2 (EXT-Ardites/Oulu) wrote:
> Hunter Adrian (Nokia-D/Helsinki) wrote:
>> Korhonen Mika.2 (EXT-Ardites/Oulu) wrote:
>>   
>>> Add support for multiblock erase command. OneNANDs (excluding Flex-OneNAND)
>>> are capable of simultaneous erase of up to 64 eraseblocks which is much
>>> faster.
>>> This changes the erase requests for regions covering multiple eraseblocks
>>> to be performed using multiblock erase.
>>>
>>> Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
>>> ---
>>>     
>> A few comments below.
>>
>>   
> [...]
>> +		switch (state) {
>> +		case FL_RESETING:
>> +			intr_flags |= ONENAND_INT_RESET;
>> +			break;
>> +		case FL_PREPARING_ERASE:
>> +			intr_flags |= ONENAND_INT_ERASE;
>> +			break;
>> +		case FL_VERIFYING_ERASE:
>> +			i = 51;
>>   
>>
>> I see 100us for this in some versions.  Perhaps Kyungmin can suggest
>> a value.
>>   
> With the chip I had the actual time for 64-eb verify read was in the 
> range of 20-30 us but you're right, there are chips for which the 
> maximum time is specified to be 100 us. Is ok to just raise this to that 
> value? Kyungmin?
> 
> [...]
>>> +
>>> +	/* loop over 64 eb batches */
>>> +	while (len) {
>>> +		struct erase_info verify_instr = *instr;
>>> +		verify_instr.addr = addr;
>>> +		verify_instr.len = 0;
>>> +
>>> +		eb_count = 0;
>>> +
>>> +		while (len > block_size &&
>>> +		       eb_count < (MB_ERASE_MAX_BLK_COUNT - 1)) {
>>>     
>> According to the manual I have you cannot do a multiblock erase
>> across a chip boundary, so you must exit this loop at the boundary too.
>>   
> 
> Ok, does this apply DDP chips only?

Yes, AFAIK. Kyungmin?
