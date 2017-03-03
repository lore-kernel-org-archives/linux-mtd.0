Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cji8G-0001O8-Nz
 for linux-mtd@lists.infradead.org; Fri, 03 Mar 2017 08:00:10 +0000
Subject: Re: [PATCH] ubi/upd: always flush after prepared for an update
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <20170222161521.4foobhoyelnrad7h@linutronix.de>
 <a0902bd5-b4d9-5b2d-c909-115c4523c370@nod.at>
 <20170301095145.47n6kyjrjmok5sk2@linutronix.de>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <35903792-1dec-0882-4c66-aed14932b71d@nod.at>
Date: Fri, 3 Mar 2017 08:59:45 +0100
MIME-Version: 1.0
In-Reply-To: <20170301095145.47n6kyjrjmok5sk2@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sebastian,

Am 01.03.2017 um 10:51 schrieb Sebastian Andrzej Siewior:
> On 2017-02-28 22:02:14 [+0100], Richard Weinberger wrote:
>> Sebastian,
> Hi Richard,
> 
>>> diff --git a/drivers/mtd/ubi/upd.c b/drivers/mtd/ubi/upd.c
>>> index 0134ba32a057..39712560b4c1 100644
>>> --- a/drivers/mtd/ubi/upd.c
>>> +++ b/drivers/mtd/ubi/upd.c
>>> @@ -148,11 +148,11 @@ int ubi_start_update(struct ubi_device *ubi, struct ubi_volume *vol,
>>>  			return err;
>>>  	}
>>>  
>>> -	if (bytes == 0) {
>>> -		err = ubi_wl_flush(ubi, UBI_ALL, UBI_ALL);
>>> -		if (err)
>>> -			return err;
>>> +	err = ubi_wl_flush(ubi, UBI_ALL, UBI_ALL);
>>> +	if (err)
>>> +		return err;
>>
>> Unconditionally calling ubi_wl_flush() will slow down ubiupdatevol.
>> Wouldn't it make sense to flush only if bytes is 0 or differs from the old value?
> 
> Do you think it will slow down the whole process as such? Usually you
> don't have a lot of empty PEBs around so at some point you will force
> one worker to get an empty PEB. And even if you could write everything
> without the need to complete the erase process then
> ubi_more_update_data() will also invoke ubi_wl_flush() before
> clear_update_marker() which completes the process.

Agreed, that makes sense. So the only change is that we block now
on a different location.

Thanks,
//richard
