Received: from ch3vs01.rockwellcollins.com ([205.175.226.27])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqMh9-0004PM-Ka
 for linux-mtd@lists.infradead.org; Tue, 21 Mar 2017 16:31:41 +0000
Received: by mail-it0-f72.google.com with SMTP id 187so16422366itk.2
 for <linux-mtd@lists.infradead.org>; Tue, 21 Mar 2017 09:31:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvx6S8V7c8YYR2-G7+hDDcRi-0Cnk+EWeWWN9i2oy-DVvQ@mail.gmail.com>
References: <CADFuHZ6xb=M_zRkktnq2b8QBOhq-WDsqgzViPHU1g8Gj9M3E-g@mail.gmail.com>
 <CAFLxGvx6S8V7c8YYR2-G7+hDDcRi-0Cnk+EWeWWN9i2oy-DVvQ@mail.gmail.com>
From: Ronak Desai <ronak.desai@rockwellcollins.com>
Date: Tue, 21 Mar 2017 11:31:15 -0500
Message-ID: <CADFuHZ54cG32S1-3PA5q_5P1od1rBa5=3YeB1jLhB+Jzm2f0Ng@mail.gmail.com>
Subject: Re: Regarding UBI fastmap data CRC failure
To: Richard Weinberger <richard.weinberger@gmail.com>
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

On Mon, Mar 20, 2017 at 5:56 PM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> On Mon, Mar 20, 2017 at 10:47 PM, Ronak Desai
> <ronak.desai@rockwellcollins.com> wrote:
>> Hi All,
>>
>> In one of the products with MLC NAND flash, we are using UBI
>> filesystem with kernel 3.12.
>
> MLC NAND is currently not supported.

First of all, thanks for your response and your truly amazing
contribution in UBI.

I know that UBIFS requires a whole lot of changes to handle "program
disturb", "read distrurb" and "paired pages" problem on MLC NANDs.
But, apart from this, we have makesure that we use 256 wear-leveling
threshold.

>
>> Fastmap is enabled to reduce the attach time and it works as expected.
>> We performed number of powercycles on the unit and never seen a
>> continuous failure of attached by fastmap. But, at one occurrence I
>> observed that there was a  "fastmap data CRC failure". UBI was
>> complaining about not find anchor node error when performing detach
>> (that's why was not able to write new fastmap data). It was a
>> permanent failure until I reformatted that NAND partition.
>>
>> I understand that UBI stores fastmap data in initial few KBs of that
>> NAND device and it was not able to find spare block in that region to
>> store fastmap data. But, I am not able to understand that why UBI end
>> up with this situation when it already manages the erasure of the bad
>> fastmap blocks?
>>
>> I would like to know that how I can avoid this situation or get a
>> workaround of it. Any advice will be appreciated.
>
> Maybe the error you're facing is due to the lack of MLC support.
>
> Another point is your kernel version, Fastmap saw tons of fixes
> and updates in recent kernel. Please make sure that you have
> all these fixes. Ideally backport the whole UBI subsystem.
>

That is true that our kernel is old but at this point and time it's
not a viable options for us to upgrade the kernel version. And agree
with your point about MLC but in months of use, we have seen this
continuous fastmap failure issue only once and apart from that UBIFS
works without any other issues.

I see your changes on base fastmap implementation, which I am planning
to backport but it will be really difficult to backport the whole UBI
subsystem. So, if you can point to specific patches/changes to avoid
"fastmap data CRC failure" issue then it will be a great help.


> --
> Thanks,
> //richard
