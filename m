Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1demT2-0007DP-G1
 for linux-mtd@lists.infradead.org; Mon, 07 Aug 2017 18:09:29 +0000
Subject: Re: Regarding UBI/UBIFS corruptions during random power-cuts.
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, bhuvanchandra.dv@toradex.com
References: <c44fc096-c994-5b63-2647-1774e8406c0c@codeaurora.org>
 <1ad7c77f-98e3-5d70-aa62-b72431000415@nod.at>
 <cd3ca825-82b4-857d-b5bd-d9f8947a434a@codeaurora.org>
 <f832b55f-a914-efae-6292-431959edf414@nod.at>
From: Ritesh Harjani <riteshh@codeaurora.org>
Message-ID: <bc9517c3-b0c7-b971-75ab-0b17a2ce8af9@codeaurora.org>
Date: Mon, 7 Aug 2017 23:39:01 +0530
MIME-Version: 1.0
In-Reply-To: <f832b55f-a914-efae-6292-431959edf414@nod.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On 8/6/2017 2:35 PM, Richard Weinberger wrote:
> Ritesh,
> 
> Am 27.07.2017 um 16:11 schrieb Ritesh Harjani:
>>> The error you're facing is rather generic.
>>> In our case we can reproduce the issue very reliable when we enable the UBIFS /sys/kernel/debug/ubifs/chk_fs debugfs knob.
>>> Can you please also try? Please note that chk_fs will make mounting UBIFS very slow.
>>>
>>> I'm very interested in your results, maybe it helps tracking down the root cause.
>> Sure, I will give this a shot and let you know the outcome.
> 
> Have you been able to trigger it again on your target?
Yes, we tried reproducing with chk_fs enabled. But could not reproduce 
it yet (earlier we were trying without chk_fs enabled). We will continue 
to retry for more time. Is there anything specific scenario you think I 
should include in power on/off to reproduce this issue. The test(with 
chk_fs enabled) is still running since 6-7 hours.

> 
> Thanks,
> //richard
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
