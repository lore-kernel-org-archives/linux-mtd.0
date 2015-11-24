Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a199A-0000H2-RZ
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2015 08:40:22 +0000
Subject: Re: [RFC PATCH 2/2] mtd: ubi: wl: avoid erasing a PEB which is empty
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-mtd@lists.infradead.org
References: <1448302147-19272-1-git-send-email-bigeasy@linutronix.de>
 <1448302147-19272-3-git-send-email-bigeasy@linutronix.de>
 <56538568.2040800@nod.at> <56541F3B.3070009@linutronix.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, tglx@linutronix.de,
 Peter Zijlstra <peterz@infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5654225A.9070702@nod.at>
Date: Tue, 24 Nov 2015 09:39:54 +0100
MIME-Version: 1.0
In-Reply-To: <56541F3B.3070009@linutronix.de>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 24.11.2015 um 09:26 schrieb Sebastian Andrzej Siewior:
> On 11/23/2015 10:30 PM, Richard Weinberger wrote:
>>> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
>>> index eb4489f9082f..709ca27e103c 100644
>>> --- a/drivers/mtd/ubi/wl.c
>>> +++ b/drivers/mtd/ubi/wl.c
>>> @@ -652,6 +653,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
>>>  #endif
>>>  	struct ubi_wl_entry *e1, *e2;
>>>  	struct ubi_vid_hdr *vid_hdr;
>>> +	int to_leb_clean = 0;
>>
>> Can we please rename this variable?
>> I know it means "the `to` LEB is clean". But for everybody else this reads as "I'm going to clean a LEB". ;)
> 
> such a shame that you can't make files RO. Any suggestions? dst_clean ?

Files RO? I don't get it.

dst_clean is good. :-)

> 
>>>  	kfree(wrk);
>>>  	if (shutdown)
>>> @@ -900,15 +906,26 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
>>>  		wl_tree_add(e1, &ubi->scrub);
>>>  	else
>>>  		wl_tree_add(e1, &ubi->used);
>>> +	if (to_leb_clean) {
>>> +		wl_tree_add(e2, &ubi->free);
>>> +		ubi->free_count++;
>>> +	}
>>> +
>>>  	ubi_assert(!ubi->move_to_put);
>>>  	ubi->move_from = ubi->move_to = NULL;
>>>  	ubi->wl_scheduled = 0;
>>>  	spin_unlock(&ubi->wl_lock);
>>>  
>>>  	ubi_free_vid_hdr(ubi, vid_hdr);
>>> -	err = do_sync_erase(ubi, e2, vol_id, lnum, torture);
>>> -	if (err)
>>> -		goto out_ro;
>>> +	if (to_leb_clean) {
>>> +		ensure_wear_leveling(ubi, 0);
>>
>> Why are you rescheduling wear leveling?
> 
> Because we had it pending and we didn't do anything. If I don't
> schedule it would be deferred until another LEB is going to be deleted.
> Before the change it happens after do_sync_erase() work job completes
> but now we add it back to the free list.

Makes sense.

>> And the nested variable has to be set to no-zero as you're calling it from a UBI worker.
> Ah, okay. I've been looking at it and got wrong then. As I said in my
> cover mail, this was forwarded ported.
> 
>>
>>> +	} else {
>>> +		err = do_sync_erase(ubi, e2, vol_id, lnum, torture);
>>> +		if (err) {
>>> +			wl_entry_destroy(ubi, e2);
>>
>> Why that? The erase_worker will free e2 if it encounters
>> a fatal error and gives up this PEB. You're introducing a double free.
> 
> Hmmm. That is real bad error handling you have there. So you invoke
> do_sync_erase(), the kmalloc() fails and how exactly you free e2 here?

Why do you want to free e2? We free an erase entry only if we give
it up. wear leveling entries are allocated at init time and destroyed
when you detach UBI.

Thanks,
//richard
