Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeqnT-0002OW-Ji
 for linux-mtd@lists.infradead.org; Fri, 08 Nov 2013 18:28:44 +0000
Message-ID: <527D2D3F.8050900@ti.com>
Date: Fri, 8 Nov 2013 23:58:15 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/2] drivers: mtd: m25p80: convert "bool" read check into
 an enum
References: <1383748535-20462-1-git-send-email-sourav.poddar@ti.com>
 <1383748535-20462-2-git-send-email-sourav.poddar@ti.com>
 <20131108180630.GB20061@ld-irv-0074.broadcom.com>
In-Reply-To: <20131108180630.GB20061@ld-irv-0074.broadcom.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: marex@denx.de, linux-mtd@lists.infradead.org, balbi@ti.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 08 November 2013 11:36 PM, Brian Norris wrote:
> On Wed, Nov 06, 2013 at 08:05:34PM +0530, Sourav Poddar wrote:
>> This is a cleanup prior to adding quad read support. This will fecilitate
>> easy addition of more read commands check under an enum rather that defining a
>> seperate bool for it.
>>
>> Signed-off-by: Sourav Poddar<sourav.poddar@ti.com>
>> Suggested-by: Brian Norris<computersforpeace@gmail.com>
>> ---
>>   drivers/mtd/devices/m25p80.c |   71 +++++++++++++++++++++++++++++++++--------
>>   1 files changed, 57 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> index 7eda71d..cfafdce 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -84,6 +84,11 @@
>>
>>   /****************************************************************************/
>>
>> +enum read_type {
>> +	M25P80_NORMAL = 0,
>> +	M25P80_FAST,
>> +};
>> +
>>   struct m25p {
>>   	struct spi_device	*spi;
>>   	struct mutex		lock;
>> @@ -94,7 +99,7 @@ struct m25p {
>>   	u8			read_opcode;
>>   	u8			program_opcode;
>>   	u8			*command;
>> -	bool			fast_read;
>> +	enum read_type		flash_read;
>>   };
>>
>>   static inline struct m25p *mtd_to_m25p(struct mtd_info *mtd)
>> @@ -350,6 +355,24 @@ static int m25p80_erase(struct mtd_info *mtd, struct erase_info *instr)
>>   }
>>
>>   /*
>> + * Dummy Cycle calculation for different type of read.
>> + * It can be used to support more commands with
>> + * different dummy cycle requirement.
> I changed:
>
> s/requirement/requirements/
>
>> + */
>> +static inline int m25p80_dummy_cycles_read(struct m25p *flash)
>> +{
>> +	switch (flash->flash_read) {
>> +	case M25P80_FAST:
>> +		return 1;
>> +	case M25P80_NORMAL:
>> +		return 0;
>> +	default:
>> +		dev_err(&flash->spi->dev, "No valid read type supported");
> Added '\n' to the dev_err() strings (in multiple places).
>
>> +		return -1;
>> +	}
>> +}
>> +
>> +/*
>>    * Read an address range from the flash chip.  The address range
>>    * may be any size provided it is within the physical boundaries.
>>    */
> ...
>
> And pushed to l2-mtd.git. Thanks!
>
> Brian
Thanks Brian!
Just curious, is 2nd patch of this series not pushed for purpose? Its
reviewed by Marek and you said in one of your reply that its look good
to you too.
