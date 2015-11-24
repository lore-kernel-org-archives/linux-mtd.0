Received: from galois.linutronix.de ([2001:470:1f0b:db:abcd:42:0:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a18wE-0003hk-9h
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2015 08:27:00 +0000
Subject: Re: [RFC PATCH 2/2] mtd: ubi: wl: avoid erasing a PEB which is empty
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <1448302147-19272-1-git-send-email-bigeasy@linutronix.de>
 <1448302147-19272-3-git-send-email-bigeasy@linutronix.de>
 <56538568.2040800@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, tglx@linutronix.de,
 Peter Zijlstra <peterz@infradead.org>
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Message-ID: <56541F3B.3070009@linutronix.de>
Date: Tue, 24 Nov 2015 09:26:35 +0100
MIME-Version: 1.0
In-Reply-To: <56538568.2040800@nod.at>
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

On 11/23/2015 10:30 PM, Richard Weinberger wrote:
>> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
>> index eb4489f9082f..709ca27e103c 100644
>> --- a/drivers/mtd/ubi/wl.c
>> +++ b/drivers/mtd/ubi/wl.c
>> @@ -652,6 +653,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
>>  #endif
>>  	struct ubi_wl_entry *e1, *e2;
>>  	struct ubi_vid_hdr *vid_hdr;
>> +	int to_leb_clean = 0;
> 
> Can we please rename this variable?
> I know it means "the `to` LEB is clean". But for everybody else this reads as "I'm going to clean a LEB". ;)

such a shame that you can't make files RO. Any suggestions? dst_clean ?

>>  	kfree(wrk);
>>  	if (shutdown)
>> @@ -900,15 +906,26 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
>>  		wl_tree_add(e1, &ubi->scrub);
>>  	else
>>  		wl_tree_add(e1, &ubi->used);
>> +	if (to_leb_clean) {
>> +		wl_tree_add(e2, &ubi->free);
>> +		ubi->free_count++;
>> +	}
>> +
>>  	ubi_assert(!ubi->move_to_put);
>>  	ubi->move_from = ubi->move_to = NULL;
>>  	ubi->wl_scheduled = 0;
>>  	spin_unlock(&ubi->wl_lock);
>>  
>>  	ubi_free_vid_hdr(ubi, vid_hdr);
>> -	err = do_sync_erase(ubi, e2, vol_id, lnum, torture);
>> -	if (err)
>> -		goto out_ro;
>> +	if (to_leb_clean) {
>> +		ensure_wear_leveling(ubi, 0);
> 
> Why are you rescheduling wear leveling?

Because we had it pending and we didn't do anything. If I don't
schedule it would be deferred until another LEB is going to be deleted.
Before the change it happens after do_sync_erase() work job completes
but now we add it back to the free list.

> And the nested variable has to be set to no-zero as you're calling it from a UBI worker.
Ah, okay. I've been looking at it and got wrong then. As I said in my
cover mail, this was forwarded ported.

> 
>> +	} else {
>> +		err = do_sync_erase(ubi, e2, vol_id, lnum, torture);
>> +		if (err) {
>> +			wl_entry_destroy(ubi, e2);
> 
> Why that? The erase_worker will free e2 if it encounters
> a fatal error and gives up this PEB. You're introducing a double free.

Hmmm. That is real bad error handling you have there. So you invoke
do_sync_erase(), the kmalloc() fails and how exactly you free e2 here?
You don't so I did what I did. But then if this succeeds but
erase_worker() fails then we have a double free here. Indeed.

> I think you have copy&pasted from:
>         err = do_sync_erase(ubi, e1, vol_id, lnum, 0);
>         if (err) {
>                 if (e2)
>                         wl_entry_destroy(ubi, e2);
>                 goto out_ro;
>         }
> 
> ...which looks wrong too. I'll double check tomorrow with a fresh brain.
> 
> Thanks,
> //richard

Sebastian
