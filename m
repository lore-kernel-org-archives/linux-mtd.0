Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XxWh6-0004o3-VA
 for linux-mtd@lists.infradead.org; Sun, 07 Dec 2014 07:55:53 +0000
Message-ID: <548407F0.90209@codeaurora.org>
Date: Sun, 07 Dec 2014 09:55:28 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, dedekind1@gmail.com
Subject: Re: [PATCH 6/6] UBI: Fastmap: Make ubi_refill_pools() fair
References: <1416835236-25185-1-git-send-email-richard@nod.at>
 <1416835236-25185-7-git-send-email-richard@nod.at>
 <5481F1A1.50609@codeaurora.org> <54821BF6.8010000@nod.at>
In-Reply-To: <54821BF6.8010000@nod.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard

On 12/5/2014 10:56 PM, Richard Weinberger wrote:
>>> -/**
>>> - * refill_wl_user_pool - refills all the fastmap pool used by ubi_wl_get_peb.
>>> - * @ubi: UBI device description object
>>> - */
>>> -static void refill_wl_user_pool(struct ubi_device *ubi)
>>> -{
>>> -    struct ubi_fm_pool *pool = &ubi->fm_pool;
>>> +            pool->pebs[pool->size] = e->pnum;
>>> +            pool->size++;
>>> +        } else
>>> +            enough++;
>>>
>>> -    return_unused_pool_pebs(ubi, pool);
>>> +        if (wl_pool->size < wl_pool->max_size) {
>>> +            if (!ubi->free.rb_node ||
>>> +               (ubi->free_count - ubi->beb_rsvd_pebs < 5))
>>> +                break;
>>>
>>> -    for (pool->size = 0; pool->size < pool->max_size; pool->size++) {
>>> -        pool->pebs[pool->size] = __wl_get_peb(ubi);
>>> -        if (pool->pebs[pool->size] < 0)
>>> +            e = find_wl_entry(ubi, &ubi->free, WL_FREE_MAX_DIFF);
>>> +            self_check_in_wl_tree(ubi, e, &ubi->free);
>>> +            rb_erase(&e->u.rb, &ubi->free);
>>> +            ubi->free_count--;
>>
>> why don't you use wl_get_peb() here?
>
> Because wl_get_peb() is not equivalent to the above code.
> We want a PEB to be used for wear-leveling not for "end users" like UBIFS.

sorry, my mistake. I meant wl_get_wle() (the new function). the only 
diff between wl_get_wle() and the above is that you use find_wl_entry() 
and wl_get_wle() uses find_mean_wl_entry() and takes the anchor into 
consideration. So I;m trying to understand why wl_get_wle() isn't good here?

>
> Thanks,
> //richard
>


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
