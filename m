Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYDHs-0000ak-1N
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2015 12:41:28 +0000
Message-ID: <5509725F.6050606@codeaurora.org>
Date: Wed, 18 Mar 2015 14:41:03 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, ricard.wanderlof@axis.com
Subject: Re: [PATCH 2/2] ubi-utils: ubinize: Add fastmap suport to image
 creation
References: <1426668763-6463-1-git-send-email-tlinder@codeaurora.org>
 <550951C9.2040509@nod.at> <550956D7.9030309@codeaurora.org>
 <55095E45.8030401@nod.at> <55096BA6.1030708@codeaurora.org>
 <55096D6D.5000707@nod.at>
In-Reply-To: <55096D6D.5000707@nod.at>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/18/2015 2:19 PM, Richard Weinberger wrote:
> Am 18.03.2015 um 13:12 schrieb Tanya Brokhman:
>>> We should still add a big and fat warning.
>>
>> In ubinize? yes, you're probably right. Will do. But if it's ok with you, I'll wait to get some inputs on the code before uploading another version.
>
> In ubinize. Yes, there no need to hurry. :-)
>
>>>
>>>>> Maybe it would make sense to but the whole fastmap creation logic into the flasher.
>>>>
>>>> But then you will delay the flashing process and this time is valuable. We're always looking for ways to decrease flashing of the images and the first boot duration.
>>>
>>> But if your flasher will invalidate fastmap if it faces a bad block a certain amount of board will still boot slowly. Can you deal with that?
>>> As I said NAND is allowed to be shipped with bad blocks.
>>
>> If my flasher finds bad blocks and invalidates fastmap - then the boot time will be as it was before, without this enhancement. The flashing time will be delayed by T_erase +
>> T_write_header for one PEB -> can be neglected. If We implement the whole fastmap generation in flasher then the  flashing time will increase significantly.
>
> I'm sure I miss something, how log does the fastmap creation take?
> If you update the image in memory it should be extremely fast.
> I.e. scan the NAND for bad blocks, amend the image and flash it.

(thinking out-loud, trying not to reveal our flasher details)
UBI aware flasher has to:
1. scan partition and collect ec values
2. for each PEB of the image: update the ec_header, erase PEB and flash 
the image
3. for remaining empty PEBs erase and write ec_heaser

For generating FM in flasher we need to update #2 and while flashing the 
image construct the FM data in memory. (what PEB, for what volume etc). 
this is O(1)

When we have the layout in memory we need to construct the actual FM 
data => go over all lists => O(number of dev PEBs) => probably can be 
neglected as well.

Ok, I take it back: run time wont be effected. What will be effected is 
memory consumption.

If I remember correctly, when we discussed this whole idea a while back 
you mentioned that a lot of users use their own proprietary flasher. So 
from your experience: you think users will prefer to have a libfastmap 
and not ubinize enhancement?
Maybe implementing libfastmap to be added to any flasher isn't such a 
bad idea. Then the whole "ubi awareness" can be implemented there.
I wasn't aware of the fact that ubinize is skipped. Is this common?

Thanks,
Tanya Brokhman
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
