Received: from da1vs01.rockwellcollins.com ([205.175.227.27])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0rFs-0001TF-Qp
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 15:10:55 +0000
Received: by mail-io0-f197.google.com with SMTP id l196so17168227ioe.19
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 08:10:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADFuHZ6oRRKFnbvJqQDywaLO=P=WR+q33AAve=y5AmdVkeUKPQ@mail.gmail.com>
References: <CADFuHZ6xb=M_zRkktnq2b8QBOhq-WDsqgzViPHU1g8Gj9M3E-g@mail.gmail.com>
 <CAFLxGvx6S8V7c8YYR2-G7+hDDcRi-0Cnk+EWeWWN9i2oy-DVvQ@mail.gmail.com>
 <CADFuHZ54cG32S1-3PA5q_5P1od1rBa5=3YeB1jLhB+Jzm2f0Ng@mail.gmail.com>
 <c9b139cc-7bf0-836d-69cf-4889a6c35ec2@nod.at>
 <CADFuHZ6oRRKFnbvJqQDywaLO=P=WR+q33AAve=y5AmdVkeUKPQ@mail.gmail.com>
From: Ronak Desai <ronak.desai@rockwellcollins.com>
Date: Wed, 19 Apr 2017 10:10:19 -0500
Message-ID: <CADFuHZ7PC8AOeS6ojiPZD_6OCteCF32igpjTzYdpWff56LofeQ@mail.gmail.com>
Subject: Re: Regarding UBI fastmap data CRC failure
To: Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Best Regards,
Ronak Desai



On Tue, Mar 28, 2017 at 8:58 AM, Ronak Desai
<ronak.desai@rockwellcollins.com> wrote:
> On Wed, Mar 22, 2017 at 5:49 PM, Richard Weinberger <richard@nod.at> wrote:
>> Ronak Desai,
>>
>> Am 21.03.2017 um 17:31 schrieb Ronak Desai:
>>> On Mon, Mar 20, 2017 at 5:56 PM, Richard Weinberger
>>> <richard.weinberger@gmail.com> wrote:
>>>> On Mon, Mar 20, 2017 at 10:47 PM, Ronak Desai
>>>> <ronak.desai@rockwellcollins.com> wrote:
>>>>> Hi All,
>>>>>
>>>>> In one of the products with MLC NAND flash, we are using UBI
>>>>> filesystem with kernel 3.12.
>>>>
>>>> MLC NAND is currently not supported.
>>>
>>> First of all, thanks for your response and your truly amazing
>>> contribution in UBI.
>>
>> Thanks. :-)
>>
>>> I know that UBIFS requires a whole lot of changes to handle "program
>>> disturb", "read distrurb" and "paired pages" problem on MLC NANDs.
>>> But, apart from this, we have makesure that we use 256 wear-leveling
>>> threshold.
>>
>> How do you handle paired pages?
>> A powercut can still damage UBI and UBIFS.
>>
> We received patch-sets from Micron for paired page issue.
>> [...]
>>
>>> That is true that our kernel is old but at this point and time it's
>>> not a viable options for us to upgrade the kernel version. And agree
>>> with your point about MLC but in months of use, we have seen this
>>> continuous fastmap failure issue only once and apart from that UBIFS
>>> works without any other issues.
>>>
>>> I see your changes on base fastmap implementation, which I am planning
>>> to backport but it will be really difficult to backport the whole UBI
>>> subsystem. So, if you can point to specific patches/changes to avoid
>>> "fastmap data CRC failure" issue then it will be a great help.
>>
>> I fear it is not that easy. Fastmap saw many fixes and improvements
>> other the time. The first version was rather buggy.
>> And we made a stupid mistake at the beginning, we did not mark fixes
>> for stable processing since Fastmap was considered
>> as experimental. That's why you can't just backport all patches that
>> have a stable tag.
>> On the other hand, backporting the whole UBI subsystem is not that
>> complicated. It has very few dependencies.
>> U-Boot folks do this on a regular basis.
>>
> So, I found out a way to reproduce and fix it. If I powercycle around
> the time when UBI performs recovery then it ends up with the CRC
> failure issue and it can not recover from it. This behavior is with
> 3.12 kernel. Then I started patching UBI with the fixes related to
> fastmap and fastmap WL, and got a state where UBI encounters the same
> problem but on subsequent boot it recovers from it.
>
> I need to perform more testing to finalize the changes though. I
> appreciate your time for answering my questions.

So, I confirm that after doing a regression with back-ported UBI
subsystem I don't see this issue anymore on kernel 3.12.

Also, I wanted to test whether the wear leveling is working correctly
or not. Is there any tests/utility which I can cross compile and run
to test these algorithms ?

>
> Thanks,
> Ronak
>
>> HTH,
>> //richard
