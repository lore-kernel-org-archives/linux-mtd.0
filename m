Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZhHd-0005SS-NP
 for linux-mtd@lists.infradead.org; Thu, 02 Oct 2014 14:23:06 +0000
Message-ID: <542D5FB1.3090307@codeaurora.org>
Date: Thu, 02 Oct 2014 17:22:41 +0300
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>,
 "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
Subject: Re: [PATCH 4/4] UBI: Fastmap: Ensure that only one fastmap work is
 scheduled
References: <1412029248-22454-1-git-send-email-richard@nod.at>		
 <1412029248-22454-5-git-send-email-richard@nod.at>	
 <1412059523.3904.11.camel@sauron.fi.intel.com> <542A54E4.2060407@nod.at>
 <1412062762.2379.2.camel@sauron.fi.intel.com> <542A5F64.5000302@nod.at>
In-Reply-To: <542A5F64.5000302@nod.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/30/2014 10:44 AM, Richard Weinberger wrote:
> Am 30.09.2014 09:39, schrieb Bityutskiy, Artem:
>> On Tue, 2014-09-30 at 08:59 +0200, Richard Weinberger wrote:
>>> Am 30.09.2014 08:45, schrieb Bityutskiy, Artem:
>>>> On Tue, 2014-09-30 at 00:20 +0200, Richard Weinberger wrote:
>>>>> +       spin_lock(&ubi->wl_lock);
>>>>> +       ubi->fm_work_scheduled = 0;
>>>>> +       spin_unlock(&ubi->wl_lock);
>>>>
>>>> Andrew Morton once said me that if I am protecting an integer change
>>>> like this with a spinlock, I have a problem in my locking design. He was
>>>> right for my particular case.
>>>>
>>>> Integer is changes atomic. The only other thing spinlock adds are the
>>>> barriers.
>>>
>>> I've added the spinlock to have a barrier in any case.
>>
>> Examples of any?
>
> You mean a case where the compiler would reorder code and the barrier is needed?
> I don't have one, but I'm not that creative as a modern C compiler.
> If you say that no barrier is needed I'll trust you. :-)

we just implemented the same thing :) It's being tested....
Why not use atomic_t fm_work_scheduled and save the spin_lock?

>
> Thanks,
> //richard
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>


-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, 
hosted by The Linux Foundation
