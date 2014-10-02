Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZgaQ-00030j-5K
 for linux-mtd@lists.infradead.org; Thu, 02 Oct 2014 13:38:26 +0000
Received: from [10.18.168.100] (unknown [185.23.60.4])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: tlinder@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5251D1400AB
 for <linux-mtd@lists.infradead.org>; Thu,  2 Oct 2014 13:38:04 +0000 (UTC)
Message-ID: <542D553A.8060208@codeaurora.org>
Date: Thu, 02 Oct 2014 16:38:02 +0300
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/4] UBI: Ensure that all fastmap work is done upon WL
 shutdown
References: <1412029248-22454-1-git-send-email-richard@nod.at>
 <1412029248-22454-2-git-send-email-richard@nod.at>
 <542D4D95.6000503@codeaurora.org> <542D50A0.1080802@nod.at>
In-Reply-To: <542D50A0.1080802@nod.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/2/2014 4:18 PM, Richard Weinberger wrote:
> Am 02.10.2014 15:05, schrieb Tanya Brokhman:
>>> +#ifdef CONFIG_MTD_UBI_FASTMAP
>>> +    flush_work(&ubi->fm_work);
>>
>> flush_work returns bool. It might be useful to print that value for debugging.
>
> Why would this be useful?
> The sole purpose of this flush is having a barrier.
> If flush_work() had to wait (returns true) for a pending work, fine.
> If where was no work (returns false) to wait for, also fine. :)

That's the thing - when debugging FS corruptions that occur on next 
boot, it's very useful to know exactly what happened on last power down. 
(Painful experience with other filesystems...)

We don't flush the fm on each write operation. We never flush on reads 
(and we will, as part of the read-disturb implementation. working on 
it), so it will be useful to know if fm was flashed at this point or wasn't.

>
> Thanks,
> //richard
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>

Thanks
Tanya Brokhman
-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, 
hosted by The Linux Foundation
