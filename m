Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm2xN-0007jk-Jj
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 15:57:14 +0000
Message-ID: <545A48BD.9010904@nod.at>
Date: Wed, 05 Nov 2014 16:56:45 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 03/35] UBI: Fastmap: Add self check to detect absent PEBs
References: <1414586758-9972-1-git-send-email-richard@nod.at>	
 <1414586758-9972-4-git-send-email-richard@nod.at>
 <1415201029.958.118.camel@sauron.fi.intel.com>
In-Reply-To: <1415201029.958.118.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 tlinder@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 05.11.2014 um 16:23 schrieb Artem Bityutskiy:
> On Wed, 2014-10-29 at 13:45 +0100, Richard Weinberger wrote:
>> This self check allows Fastmap to detect absent PEBs while
>> writing a new fastmap to the MTD device.
>> It will help to find implementation issues in Fastmap.
>>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> ---
>>  drivers/mtd/ubi/fastmap.c | 86 +++++++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 84 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
>> index cfd5b5e..adccc1f 100644
>> --- a/drivers/mtd/ubi/fastmap.c
>> +++ b/drivers/mtd/ubi/fastmap.c
>> @@ -1,5 +1,6 @@
>>  /*
>>   * Copyright (c) 2012 Linutronix GmbH
>> + * Copyright (c) 2014 sigma star gmbh
>>   * Author: Richard Weinberger <richard@nod.at>
>>   *
>>   * This program is free software; you can redistribute it and/or modify
>> @@ -17,6 +18,69 @@
>>  #include "ubi.h"
>>  
>>  /**
>> + * init_seen - allocate the seen logic integer array
> 
> How about
> 
> init_seen - allocate memory for used for debugging.
> 
> 
> And I think there should be a dot at the end of the title comment. Not
> that it is very important, but I tried to follow this rule everywhere.
> 
>> +/**
>> + * free_seen - free the seen logic integer array
>> + * @seen: integer array of @ubi->peb_count size
>> + */
>> +static inline void free_seen(int *seen)
>> +{
>> +	kfree(seen);
>> +}
> 
> Just do not introduce a function for this. And the commentary does not
> make it any more clear. Or if you are going to add more stuff to this
> function later - rephrase the comment please.

Why? I did that to have alloc and free balanced.
I.e. to not have a naked kfree(). Always when I see a kfree() somewhere
I'd like to see the k*alloc().

>> +/**
>> + * set_seen - mark a PEB as seen
>> + * @ubi: UBI device description object
>> + * @pnum: the to be marked PEB
>> + * @seen: integer array of @ubi->peb_count size
>> + */
> 
> The dot at the end of the title line. And the return code could be
> documented too.

I need a script for this. ;-)

> "The to be marked PEB" is understandable, but not well-said :-)
> 
> Not sure if this adds much value, but I am trying to be consistent.
> 
>> +/**
>> + * self_check_seen - check whether all PEB have been seen by fastmap
>> + * @ubi: UBI device description object
>> + * @seen: integer array of @ubi->peb_count size
>> + */
> 
> Similar nit-picks.
> 
>> +static int self_check_seen(struct ubi_device *ubi, int *seen)
>> +{
>> +	int pnum, ret = 0;
>> +
>> +	if (!ubi_dbg_chk_fastmap(ubi) || !seen)
>> +		return 0;
>> +
>> +	for (pnum = 0; pnum < ubi->peb_count; pnum++) {
>> +		if (!seen[pnum] && ubi->lookuptbl[pnum]) {
>> +			ubi_err("self-check failed for PEB %d, fastmap didn't see it", pnum);
> 
> Didn't Tanya add the 'ubi' parameter in the printing functions?

At the time I wrote this patch Tanya's work was not mainline...

>>  	int scrub_peb_count, erase_peb_count;
>> +	int *seen_pebs = NULL;
> 
> Is the initialization really needed?
> 

Correct, we can drop it.

Thanks,
//richard
