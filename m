Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0z0S-0003Dy-MR
 for linux-mtd@lists.infradead.org; Mon, 23 Nov 2015 21:50:41 +0000
Subject: Re: [RFC PATCH 2/2] mtd: ubi: wl: avoid erasing a PEB which is empty
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-mtd@lists.infradead.org
References: <1448302147-19272-1-git-send-email-bigeasy@linutronix.de>
 <1448302147-19272-3-git-send-email-bigeasy@linutronix.de>
 <56538568.2040800@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, tglx@linutronix.de,
 Peter Zijlstra <peterz@infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56538A16.3070200@nod.at>
Date: Mon, 23 Nov 2015 22:50:14 +0100
MIME-Version: 1.0
In-Reply-To: <56538568.2040800@nod.at>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 23.11.2015 um 22:30 schrieb Richard Weinberger:
> Sebastian,
> 
> Am 23.11.2015 um 19:09 schrieb Sebastian Andrzej Siewior:
>> wear_leveling_worker() currently unconditionally puts a PEB on erase in
>> the error case even it just been taken from the free_list and never
>> used.
>> In case the PEB was never used it can be put back on the free list
>> saving an erase cycle.
> 
> Makes sense, thanks for pointing out this optimization!
> 
>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>> ---
>>  drivers/mtd/ubi/wl.c | 23 ++++++++++++++++++++---
>>  1 file changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
>> index eb4489f9082f..709ca27e103c 100644
>> --- a/drivers/mtd/ubi/wl.c
>> +++ b/drivers/mtd/ubi/wl.c
>> @@ -631,6 +631,7 @@ static int do_sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
>>  	return erase_worker(ubi, wl_wrk, 0);
>>  }
>>  
>> +static int ensure_wear_leveling(struct ubi_device *ubi, int nested);
>>  /**
>>   * wear_leveling_worker - wear-leveling worker function.
>>   * @ubi: UBI device description object
>> @@ -652,6 +653,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
>>  #endif
>>  	struct ubi_wl_entry *e1, *e2;
>>  	struct ubi_vid_hdr *vid_hdr;
>> +	int to_leb_clean = 0;
> 
> Can we please rename this variable?
> I know it means "the `to` LEB is clean". But for everybody else this reads as "I'm going to clean a LEB". ;)
> 
>>  	kfree(wrk);
>>  	if (shutdown)
>> @@ -756,6 +758,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
>>  
>>  	err = ubi_io_read_vid_hdr(ubi, e1->pnum, vid_hdr, 0);
>>  	if (err && err != UBI_IO_BITFLIPS) {
>> +		to_leb_clean = 1;
>>  		if (err == UBI_IO_FF) {
>>  			/*
>>  			 * We are trying to move PEB without a VID header. UBI
>> @@ -801,10 +804,12 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
>>  			 * protection queue.
>>  			 */
>>  			protect = 1;
>> +			to_leb_clean = 1;
>>  			goto out_not_moved;
>>  		}
>>  		if (err == MOVE_RETRY) {
>>  			scrubbing = 1;
>> +			to_leb_clean = 1;
>>  			goto out_not_moved;
>>  		}
>>  		if (err == MOVE_TARGET_BITFLIPS || err == MOVE_TARGET_WR_ERR ||
>> @@ -830,6 +835,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
>>  					ubi->erroneous_peb_count);
>>  				goto out_error;
>>  			}
>> +			to_leb_clean = 1;
>>  			erroneous = 1;
>>  			goto out_not_moved;
>>  		}
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
> And the nested variable has to be set to no-zero as you're calling it from a UBI worker.
> 
>> +	} else {
>> +		err = do_sync_erase(ubi, e2, vol_id, lnum, torture);
>> +		if (err) {
>> +			wl_entry_destroy(ubi, e2);
> 
> Why that? The erase_worker will free e2 if it encounters
> a fatal error and gives up this PEB. You're introducing a double free.
> 
> I think you have copy&pasted from:
>         err = do_sync_erase(ubi, e1, vol_id, lnum, 0);
>         if (err) {
>                 if (e2)
>                         wl_entry_destroy(ubi, e2);
>                 goto out_ro;
>         }
> 
> ...which looks wrong too. I'll double check tomorrow with a fresh brain.

Okay. That one is fine, as we switch to ro mode anyway...

Thanks,
//richard
