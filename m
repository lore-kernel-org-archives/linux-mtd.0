Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fL52L-0000sN-8W
 for linux-mtd@lists.infradead.org; Tue, 22 May 2018 11:01:07 +0000
Subject: Re: Selabel/selinux support in mtd-utils for ubifs
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, david.oberhollenzer@sigma-star.at
References: <d1fc48d2-ee16-2405-bf4d-a75ea8cd5f46@codeaurora.org>
 <1707195.VuFK1zXW7D@blindfold>
From: Ritesh Harjani <riteshh@codeaurora.org>
Message-ID: <48fb4c58-ddf4-30fe-7e2b-48d8be32ddc3@codeaurora.org>
Date: Tue, 22 May 2018 16:30:42 +0530
MIME-Version: 1.0
In-Reply-To: <1707195.VuFK1zXW7D@blindfold>
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



On 5/22/2018 2:56 AM, Richard Weinberger wrote:
> Ritesh,
> 
> Am Montag, 21. Mai 2018, 13:47:53 CEST schrieb Ritesh Harjani:
>> Hello all,
>>
>> Could anyone please help whether selinux support is fully present on
>> ubifs or not?
>>
>> Below are my observations:-
>> 1. Selinux support was added in ubifs kernel via below patch
>> "UBIFS: Add security.* XATTR support for the UBIFS"
>>
>> 2. Extended attribute support was added in mtd-utils via below patch.
>> "mkfs.ubifs: Add extended attribute support"
>>
>> With above I think that selinux could be enabled but only at the boot
>> time using selinux tools.
> 
> Yes.
> 
>> But I could not see any support to add selinux labels/context
>> information while creating ubifs.img in mtd-utils. I do see below link
>> where something like above was tried but never made upstream. Could
>> anyone please give pointers on whether this support is added/ or bring
>> worked upon?
>>
>> http://lists.infradead.org/pipermail/linux-mtd/2014-February/052136.html
>>
>> Also Whether selinux labeling support can be added in the mkfs.ubifs or
>> not? Do we see any issues with this?
> 
> No, just revive the patches.
> In 2014 the maintainer situation was different and sadly we forgot about some
> patches.
>   
>> I would like to work upon adding selinux support in mtd-utils.
> 
> This would be wonderful!
> 
>> I would appreciate if I could get some pointers on above queries and if
>> anyone has any pointers/suggestions for this.
> 
> Just go ahead. :-)
Sure, thanks Richard.
I will work on this and will post the patches.


> 
> Thanks,
> //richard
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, 
Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project.
