Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XxsHq-0001Bp-LE
 for linux-mtd@lists.infradead.org; Mon, 08 Dec 2014 06:59:15 +0000
Message-ID: <54854C28.4050107@codeaurora.org>
Date: Mon, 08 Dec 2014 08:58:48 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, dedekind1@gmail.com
Subject: Re: [PATCH 3/6] UBI: Fastmap: Notify user in case of an
 ubi_update_fastmap() failure
References: <1417347340-6872-1-git-send-email-richard@nod.at>
 <1417347340-6872-4-git-send-email-richard@nod.at>
 <54845D53.1070903@codeaurora.org> <548462A8.2010107@nod.at>
In-Reply-To: <548462A8.2010107@nod.at>
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

On 12/7/2014 4:22 PM, Richard Weinberger wrote:
> Am 07.12.2014 um 14:59 schrieb Tanya Brokhman:
>> Hi Richard,
>>
>> On 11/30/2014 1:35 PM, Richard Weinberger wrote:
>>> If ubi_update_fastmap() fails notify the user.
>>> This is not a hard error as ubi_update_fastmap() makes sure that upon failure
>>> the current on-flash fastmap will no be used upon next UBI attach.
>>>
>>> Signed-off-by: Richard Weinberger <richard@nod.at>
>>> ---
>>>    drivers/mtd/ubi/wl.c | 6 +++++-
>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
>>> index 523d8a4..7821342 100644
>>> --- a/drivers/mtd/ubi/wl.c
>>> +++ b/drivers/mtd/ubi/wl.c
>>> @@ -657,7 +657,11 @@ again:
>>>         * refill the WL pool synchronous. */
>>>        if (pool->used == pool->size || wl_pool->used == wl_pool->size) {
>>>            spin_unlock(&ubi->wl_lock);
>>> -        ubi_update_fastmap(ubi);
>>> +        ret = ubi_update_fastmap(ubi);
>>> +        if (ret) {
>>> +            ubi_msg(ubi, "Unable to write a new fastmap: %i", ret);
>>> +            return -ENOSPC;
>>
>> Why do you fail the whole function (ubi_wl_get_peb) if fastmap update failed? Its possible that the fm_pools were refilled correctly, and the actual fastmap_write failed, so there
>> is nothing preventing the user to get peb allocated and continue working. You invalidate the fastmap, so if powercut occurs a full scan will be performed. So its possible to
>> allocate from fm_pools (although fastmap is not valid on disc) and try writing fastmap again when the pools filled up.
>> I'm for the ubi_msg but against "return -ENOSPC;"
>
> Maybe the case you've described is powercut safe, but there can be other unsafe cases.
> Let's stay on the safe side and be paranoid, it does not hurt.
> If fastmap has proven stable we can start with tricky optimizations.

I'm sorry that I'm being petty here but the commit msg states that you 
"notify the user in case of update fastamap failure". It says nothing 
about you failing ubi_wl_get_peb as well. And this is a major change. At 
least divide this into 2 patches (so I can disagree to the function 
failing and agree to the msg to user :) )


> Thanks,
> //richard
>


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
