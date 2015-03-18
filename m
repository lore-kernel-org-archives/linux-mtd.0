Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYCq9-0001rg-9m
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2015 12:12:50 +0000
Message-ID: <55096BA6.1030708@codeaurora.org>
Date: Wed, 18 Mar 2015 14:12:22 +0200
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, ricard.wanderlof@axis.com
Subject: Re: [PATCH 2/2] ubi-utils: ubinize: Add fastmap suport to image
 creation
References: <1426668763-6463-1-git-send-email-tlinder@codeaurora.org>
 <550951C9.2040509@nod.at> <550956D7.9030309@codeaurora.org>
 <55095E45.8030401@nod.at>
In-Reply-To: <55095E45.8030401@nod.at>
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

On 3/18/2015 1:15 PM, Richard Weinberger wrote:
> Hi Tanya,
>
> Am 18.03.2015 um 11:43 schrieb Tanya Brokhman:
>> Hi Richard,
>>
>> Sorry for this taking so long. Had some legal issues to overcome.
>
> No problem. :-)
>
>> On 3/18/2015 12:22 PM, Richard Weinberger wrote:
>>> Hi!
>>>
>>> Am 18.03.2015 um 09:52 schrieb Tanya Brokhman:
>>>> While generating ubi image with ubinize, all UBI data required for
>>>> Fastmap is present. If we generate the Fastmap data as part of the
>>>> image, the first boot after flash won't require full scan of the UBI
>>>> device.
>>>> In order to be able to generate the Fastmap data number of device
>>>> PEBs is required. If this input parameter was not provided - Fastmap
>>>> will not be generated.
>>>>
>>>> Note: In order for this to work properly change is required in flasher
>>>> as well:
>>>> If while flashing the image bad blocks were discovered, Fastmap
>>>> should be invalidated in the flashed image. Fastmap superblock
>>>> (if present) will be in PEB#2 in the image.
>>>
>>> I didn't look at the implementation in detail as I'm still recovering from a flu.
>>>
>>> NAND is allowed to have bad blocks, therefore a lot of freshly flashed
>>> UBI images won't be able to use fastmap.
>>
>> Yes, that's why I added the disclaimer that this patch can only be used if the flasher code is updated as well. This is how I did it for our products. We have a proprietary flasher.
>>
>>> What also puzzles me is that it will just work with a non-fastmap aware flasher.
>>> But boards with bad blocks will blow up at (much) later and Joe random user will curse UBI. :)
>>
>> That is correct. Note that if we don't provide the "-c" parameter to ubinize, all works as before and fastmap data wont be generated. "-c" is not a must. So users that don't update
>> their flashers (don't make them fastmap aware) will just continue generating images without -c and fastmap wont be generated. It is backward compatible. (and they will have to look
>> for other reasons to curse UBI :) )
>
> We should still add a big and fat warning.

In ubinize? yes, you're probably right. Will do. But if it's ok with 
you, I'll wait to get some inputs on the code before uploading another 
version.

>
>>> Maybe it would make sense to but the whole fastmap creation logic into the flasher.
>>
>> But then you will delay the flashing process and this time is valuable. We're always looking for ways to decrease flashing of the images and the first boot duration.
>
> But if your flasher will invalidate fastmap if it faces a bad block a certain amount of board will still boot slowly. Can you deal with that?
> As I said NAND is allowed to be shipped with bad blocks.

If my flasher finds bad blocks and invalidates fastmap - then the boot 
time will be as it was before, without this enhancement. The flashing 
time will be delayed by T_erase + T_write_header for one PEB -> can be 
neglected. If We implement the whole fastmap generation in flasher then 
the  flashing time will increase significantly.

>
>> Also, if you move this logic inside the flasher, perhaps we can skip ubinize at all since it feels like the logic will be just duplicated.
>
> It is not uncommon to skip ubinize.
>
>>> We could create a libfastmap (LGPLv2) such that everyone is allowed to use it in his custom
>>> flasher.
>>
>> Perhaps. It wont work for us though, so unfortunately I wont be able to help out with that if this is the solution you prefer.
>
> Why would this not work for your? Don't you have the sources of your flasher?
> Of course we'd have to write libfastmap in a way such that one can use it on non-Linux systems like a bootloader.

I do have the source (just updated it). I meant that implementing 
libfastmap and integrating it into our flasher will be too much work and 
it's just not justified in our case, so I wont be able to do it. Sorry....

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
