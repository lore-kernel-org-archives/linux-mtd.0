Received: from xes-mad.com ([216.165.139.220] helo=mail.xes-mad.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEFJK-0003nu-SK
 for linux-mtd@lists.infradead.org; Thu, 03 May 2018 14:34:29 +0000
Date: Thu, 3 May 2018 09:34:08 -0500 (CDT)
From: Aaron Sierra <asierra@xes-inc.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <533541496.68002.1525358048223.JavaMail.zimbra@xes-inc.com>
In-Reply-To: <20180503113158.56ce5798@bbrezillon>
References: <286315039.117511.1525106089951.JavaMail.zimbra@xes-inc.com>
 <20180503113158.56ce5798@bbrezillon>
Subject: Re: [PATCH v2 1/2] mtd: cfi: Support early CFI fixups
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey Boris,

----- Original Message -----
> From: "Boris Brezillon" <boris.brezillon@bootlin.com>
> To: "Aaron Sierra" <asierra@xes-inc.com>
> Sent: Thursday, May 3, 2018 4:31:58 AM
> Subject: Re: [PATCH v2 1/2] mtd: cfi: Support early CFI fixups

> Hi Aaron,
> 
> On Mon, 30 Apr 2018 11:34:49 -0500 (CDT)
> Aaron Sierra <asierra@xes-inc.com> wrote:
> 
>> Some CFI devices need fixups that affect the number of chips detected,
>> but the current fixup infrastructure (struct cfi_fixup and cfi_fixup())
>> does not cover this situation.
>> 
>> Introduce struct cfi_early_fixup and cfi_early_fixup() to fill the void.
>> 
>> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
> 
> This version looks good to me, just a few minor things which I can fix
> when applying if you agree with the changes I suggest.

Thanks, all of your suggested changes seem reasonable to me.

> 
>> ---
>> 
>>  v2 - Split into two patches. One adding infrastructure and one adding
>>       the first early fixup.
>>     - Define struct cfi_early_fixup and cfi_early_fixup() in cfi_probe.c
>> 
>>  drivers/mtd/chips/cfi_probe.c | 29 +++++++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>> 
>> diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
>> index e8d0164..c05deac 100644
>> --- a/drivers/mtd/chips/cfi_probe.c
>> +++ b/drivers/mtd/chips/cfi_probe.c
>> @@ -63,6 +63,29 @@ do { \
>>  
>>  #endif
>>  
>> +/*
>> + * This fixup occurs immediately after reading the CFI structure and can affect
>> + * the number of chips detected, unlike cfi_fixup, which occurs after an
>> + * mtd_info structure has been created for the chip.
>> + */
>> +struct cfi_early_fixup {
>> +	uint16_t mfr;
>> +	uint16_t id;
>> +	void (*fixup)(struct cfi_private *cfi);
>> +};
>> +
>> +void cfi_early_fixup(struct cfi_private *cfi, struct cfi_early_fixup *fixups)
>> +{
>> +	struct cfi_early_fixup *f;
> 
>	const struct cfi_early_fixup *f;
> 
>> +
>> +	for (f = fixups; f->fixup; f++) {
>> +		if (((f->mfr == CFI_MFR_ANY) || (f->mfr == cfi->mfr)) &&
>> +		    ((f->id == CFI_ID_ANY) || (f->id == cfi->id))) {
>> +			f->fixup(cfi);
>> +		}
>> +	}
>> +}
>> +
>>  /* check for QRY.
>>     in: interleave,type,mode
>>     ret: table index, <0 for error
>> @@ -151,6 +174,10 @@ static int __xipram cfi_probe_chip(struct map_info *map,
>> __u32 base,
>>  	return 1;
>>  }
>>  
>> +static struct cfi_early_fixup cfi_early_fixup_table[] = {
> 
> static const ...
> 
>> +	{ 0, 0, NULL },
> 
> No need to fill all the fields, just do
> 
>	{ },
> 
> and the compiler will initialize everything to zero.

OK, I'm familiar with that mechanism. I just latched onto the style used for
tables in cfi_cmdset_0001.c and cfi_cmdset_0002.c.

-Aaron

> 
>> +};
>> +
>>  static int __xipram cfi_chip_setup(struct map_info *map,
>>  				   struct cfi_private *cfi)
>>  {
>> @@ -235,6 +262,8 @@ static int __xipram cfi_chip_setup(struct map_info *map,
>>  	cfi_qry_mode_off(base, map, cfi);
>>  	xip_allowed(base, map);
>>  
>> +	cfi_early_fixup(cfi, cfi_early_fixup_table);
>> +
>>  	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank. Manufacturer
>>  	ID %#08x Chip ID %#08x\n",
>>  	       map->name, cfi->interleave, cfi->device_type*8, base,
>>  	       map->bankwidth*8, cfi->mfr, cfi->id);
> 
> Thanks,
> 
> Boris
