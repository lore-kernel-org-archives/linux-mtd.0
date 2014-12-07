Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XxWOs-0007Gg-PV
 for linux-mtd@lists.infradead.org; Sun, 07 Dec 2014 07:37:03 +0000
Message-ID: <54840385.5040305@codeaurora.org>
Date: Sun, 07 Dec 2014 09:36:37 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, dedekind1@gmail.com
Subject: Re: [PATCH 4/6] UBI: Fastmap: Fix races in ubi_wl_get_peb()
References: <1416835236-25185-1-git-send-email-richard@nod.at>
 <1416835236-25185-5-git-send-email-richard@nod.at>
 <5481AE79.1090900@codeaurora.org> <5481B120.5020409@nod.at>
 <5481E336.8090303@codeaurora.org> <54821EC3.3030107@nod.at>
In-Reply-To: <54821EC3.3030107@nod.at>
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

On 12/5/2014 11:08 PM, Richard Weinberger wrote:

>
>>>>>             spin_unlock(&ubi->wl_lock);
>>>>> +        if (retried) {
>>>>> +            ubi_err(ubi, "Unable to get a free PEB from user WL pool");
>>>>> +            ret = -ENOSPC;
>>>>> +            goto out;
>>>>> +        }
>>>>> +        retried = 1;
>>>>
>>>> Why did you decide to retry in this function? and why only 1 retry attempt? I'm not against it, trying to understand the logic.
>>>
>>> Because failing immediately with -ENOSPC is not nice.
>>
>> Why not? this is what was done before....
>
> The behavior from before was not good.
> If we return here a -ENOSPC it is not because we ran out of free PEBs, it is because the pool contains
> no free PEBs and needs refilling.
> As between refilling the pool and requesting a fresh PEB from it another thread could "steal" all PEBs
> we retry.
>
>> I think what I really bothers me in this case is that you don't sleep, you branch immediately to retry again, so the chances that there will be context switch and free pebs appear
>> aren't that high.
>> I'm used to functions using some sort of "retry" logic to sleep before retrying. Of course sleeping isn't a good idea here. That's why the "retry" bugs me a bit.
>
> You mean a cond_resched()?
> This retry-logic is common pattern in UBI. For exmaple see ubi_wl_put_peb().

you're right. didn't pay much attention to ubi_wl_put_peb() before. 
don't like it there either :)
perhaps we can rethink this later for both cases.

>
> Thanks,
> //richard
>


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
