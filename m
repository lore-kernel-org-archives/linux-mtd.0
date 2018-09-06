Received: from scopuli.esotechnik.de ([79.143.188.15] helo=mail.esotechnik.net)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fy1wV-0001ZJ-Lo
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2018 21:36:01 +0000
Subject: Re: [PATCH 0/3] Virtual MTD concat device driver
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-mtd@lists.infradead.org
References: <20180906161413.6335-1-kernel@nospam.obeliks.de>
 <20180906225949.48497cb5@bbrezillon> <20180906230314.4f7744a6@bbrezillon>
 <d8c4e901-ae96-965c-0d01-4fa012da41b8@nospam.obeliks.de>
 <20180906232341.0dd510e3@bbrezillon>
From: Bernhard Frauendienst <kernel@nospam.obeliks.de>
Message-ID: <3f81012f-cd7b-d733-f819-4d359e2415f9@nospam.obeliks.de>
Date: Thu, 6 Sep 2018 23:35:47 +0200
MIME-Version: 1.0
In-Reply-To: <20180906232341.0dd510e3@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 06/09/18 23:23, Boris Brezillon wrote:
> On Thu, 6 Sep 2018 23:16:01 +0200
> Bernhard Frauendienst <kernel@nospam.obeliks.de> wrote:
>
>> Hi Boris,
>>
>> On 06/09/18 23:03, Boris Brezillon wrote:
>>> On Thu, 6 Sep 2018 22:59:49 +0200
>>> Boris Brezillon <boris.brezillon@bootlin.com> wrote:
>>>   
>>>> Hi Bernhard,
>>>>
>>>> On Thu,  6 Sep 2018 18:14:10 +0200
>>>> Bernhard Frauendienst <kernel@nospam.obeliks.de> wrote:
>>>>   
>>>>> Hi everybody,
>>>>>
>>>>> when porting my router board from a mach-file based OpenWRT target to a
>>>>> device-tree based target, I found that there is no generic way to create
>>>>> a mtd_concat device from within the dts. The following patches attempt
>>>>> to provide that possibility.
>>>> There's a fundamental issue with this patch series: DT is supposed to
>>>> represent the hardware, not how you want to use it, and clearly, your
>>>> concatenated MTD dev is a virtual device, not a real one, so I doubt it
>>>> will pass DT maintainers' review.
>>> BTW, did you consider doing that through the command line?
>> Would you mind elaborating on that?
> Something like:
>
> mtdconcat=<virtdev1>=<realdev1>,<realdev2>;<virtdev2>=<realdev3>,<realdev4>
>
>> The biggest problem that I see is that I have to specify the fixed
>> partitions somewhere, and I would really like to keep that in the dts
>> file, where they would also be if it was only a single chip.
> Send a v2, add the DT maintainers+ML in Cc, and you'll see what
> happens.
I will do that. Thank you for your review and your input!
