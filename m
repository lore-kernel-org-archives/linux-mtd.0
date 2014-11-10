Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XnoTt-0000P0-Ft
 for linux-mtd@lists.infradead.org; Mon, 10 Nov 2014 12:54:06 +0000
Message-ID: <5460B553.5060401@codeaurora.org>
Date: Mon, 10 Nov 2014 14:53:39 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] UBI: Extend UBI layer debug/messaging capabilities -
 cosmetics
References: <1415531185-2343-1-git-send-email-tlinder@codeaurora.org>
 <1415621918.22887.80.camel@sauron.fi.intel.com>
In-Reply-To: <1415621918.22887.80.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 hujianyang@huawei.com, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/10/2014 2:18 PM, Artem Bityutskiy wrote:
> On Sun, 2014-11-09 at 13:06 +0200, Tanya Brokhman wrote:
>>
>>   /* Normal UBI messages */
>>   #define ubi_msg(ubi, fmt, ...) pr_notice("UBI-%d: %s:" fmt "\n", \
>> -                                        ubi->ubi_num, __func__, ##__VA_ARGS__)
>> +                               (ubi ? ubi->ubi_num : UBI_MAX_DEVICES), \
>> +                               __func__, ##__VA_ARGS__)
>>   /* UBI warning messages */
>>   #define ubi_warn(ubi, fmt, ...) pr_warn("UBI-%d warning: %s: " fmt "\n", \
>> -                                       ubi->ubi_num, __func__, ##__VA_ARGS__)
>> +                               (ubi ? ubi->ubi_num : UBI_MAX_DEVICES), \
>> +                               __func__, ##__VA_ARGS__)
>>   /* UBI error messages */
>>   #define ubi_err(ubi, fmt, ...) pr_err("UBI-%d error: %s: " fmt "\n", \
>> -                                     ubi->ubi_num, __func__, ##__VA_ARGS__)
>> +                               (ubi ? ubi->ubi_num : UBI_MAX_DEVICES), \
>> +                               __func__, ##__VA_ARGS__)
>
> Why did you make these changes? It is preferable to not add another 'if'
> statement to this macro to handle one or 2 cases - much bloat, little
> gain.
>
> Could we please avoid this?

I just wanted to be on the safe side and prevent this macro being called 
with ubi=NULL that may crash the system. If you still prefer the "if" 
removed will do.

>
>>
>> -       if (!ubi->free.rb_node || (ubi->free_count - ubi->beb_rsvd_pebs < 1)) {
>> -               ubi_warn(ubi, "Can't get peb for fastmap:anchor=%d, free_cnt=%d, reserved=%d",
>> -                        anchor, ubi->free_count, ubi->beb_rsvd_pebs);
>> +       if (!ubi->free.rb_node || (ubi->free_count - ubi->beb_rsvd_pebs < 1))
>>                  goto out;
>
> The warning looks pretty poor, so I do not mind to remove it, but I
> thought your patch is about adding a parameter, but you mix different
> kinds of things there. Please, be stricter to the similar UBIFS patch
> which you was going to send.

Now I'm confused. I added this msg as part of the patch you already 
pushed to your branch but later you requested NOT to add additional msgs 
and if required add it in a different patch. So this was added by me and 
now removed by me - as per your request.

>
>
>> -               if (kthread_should_stop()) {
>> -                       ubi_msg(ubi, "background thread \"%s\" should stop, PID %d",
>> -                               ubi->bgt_name, task_pid_nr(current));
>> +               if (kthread_should_stop())
>>                          break;
>> -               }
>
> How about just turning this into a debug message, not removing?

Same here. Removing this because *you* requested it.
Quoting you from V5:
"Yes, please, remove these messages or turn them into debugging messages.
And yes, these should have been added in a separate patch."

>
> Artem.
>


Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
