Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZgf2-0006sv-Ne
 for linux-mtd@lists.infradead.org; Thu, 02 Oct 2014 13:43:13 +0000
Message-ID: <542D5657.3060208@codeaurora.org>
Date: Thu, 02 Oct 2014 16:42:47 +0300
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, dedeking1@gmail.com
Subject: Re: [RFC/PATCH 1/5] mtd: ubi: Read disturb infrastructure
References: <1411886220-8208-1-git-send-email-tlinder@codeaurora.org>
 <5427C45C.2080506@nod.at> <5427CB6E.7010007@codeaurora.org>
 <5427CCD8.2090605@nod.at> <5427E6FE.3090906@codeaurora.org>
 <5427E8CA.8000904@nod.at> <542D49FD.7040204@codeaurora.org>
 <542D5203.2080601@nod.at>
In-Reply-To: <542D5203.2080601@nod.at>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
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

On 10/2/2014 4:24 PM, Richard Weinberger wrote:
> Am 02.10.2014 14:50, schrieb Tanya Brokhman:
>>> Consider the case where you have a board with a fastmap enabled bootloader and a Linux OS.
>>> The bootloader does a fastmap attach and boots the kernel from UBI and the kernel it self has the rootfs
>>> on UBI too. If you install a new kernel with your changes applied it will write the fastmap in a different
>>> format and the bootloader will fail badly. In worst case the board bricks, in best case the bootloader can fall back
>>> to scanning mode but it will be slow and the customer unhappy.
>>>
>>
>> Ok, I understand the problem now. I wanted to discuss a possible solution before implementing it:
>> We have a "fastmap version" in fm_sb. At the moment UBI_FM_FMT_VERSION = 1 and any other is not supported. We can use that; Add another fm version (UBI_FM_FMT_VERSION_RD = 2) and
>> then decide according to it. Meaning, if during attach process we find fm superblock we check it's version, if it's != UBI_FM_FMT_VERSION_RD, we fall back to full scan. The next
>> fastmap will be written with the new layout (and new version number) so second boot will attach from fastmap without any issues.
>
> Yes, if we change the fastmap on-disk layout we need to change UBI_FM_FMT_VERSION.
> Then other fastmap implementations will notice the change and can hopefully recover.
> Implementations which do not evaluate UBI_FM_FMT_VERSION deserve breaking. ;-)

good. will work on the fix and upload a new set when ready&tested.

>
> That said, I'll not block a layout change but we have to be sure that it is *really* needed.

In order to support read-disturb, I think its really needed. There is no 
other way to save read counter per PEB but in fastmap.

> I'm currently heavily working on fastmap and my local queue with fastmap fixes keeps growing.
> If I find a horror bug which needs a fastmap layout change I want to change the layout only once,
> not twice.
>

How do you test all of your fastmap fixes? Some of them are not easy to 
reproduce (the pq saving for example). Besides heavy stability testing, 
I was testing my changes manually by a lot of dbg prints in the code and 
analyzing the logs manually. Not the optimal way....

> Thanks,
> //richard
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>

Thanks,
Tanya Brokhman
-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, 
hosted by The Linux Foundation
