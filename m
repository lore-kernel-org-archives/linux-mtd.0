Received: from forward100p.mail.yandex.net ([2a02:6b8:0:1472:2741:0:8b7:100])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat
 Linux)) id 1g7Gkj-0003rf-1P
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2018 09:14:25 +0000
Message-ID: <5BB336BF.1030401@ircoc.vrn.ru>
Date: Tue, 02 Oct 2018 12:13:35 +0300
From: =?UTF-8?B?ItCc0Y/RgdC+0LXQtNC+0LIg0JAu0K4uIg==?=
 <myasoedovau@ircoc.vrn.ru>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
CC: linux-mtd@lists.infradead.org
Subject: Re: How to organize UBI volumes and power crash
References: <5BB32167.1040902@ircoc.vrn.ru>
 <CAFLxGvzDTi+tU6LT7r4QpxvM=f+mg5j8VOfyV5gZihu5-UWreg@mail.gmail.com>
 <5BB331EC.60204@ircoc.vrn.ru> <10059393.qm9dNCvvdv@blindfold>
In-Reply-To: <10059393.qm9dNCvvdv@blindfold>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If so, the UBI/UBIFS is very good and reliable system.
It would be beautiful if linux-mtd.infradead.org will correct they 
documentation. So I can tell my chief about FLASH partitions 
organisation in my device.

Thank you, Richard

Andrey


> Am Dienstag, 2. Oktober 2018, 10:53:00 CEST schrieb Мясоедов А.Ю.:
>> Thank ypu, Richard.
>>
>>>   Both UBI and UBIFS must not corrupt upon a powercut, if you face such an
>> issue, please report. This could be a bug or a hardware problem.
>>
>> But http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits
>> says about such possible problems (unstable bits).
> This problem is highly theoretical and so far I have never seen it.
> So far anyone that claimed to suffer from that was wrong and it turned out that
> it was some other issue.
>
> It is time to remove that paragraph from the website since it confuses user
> over and over.
> David, can you please file and merge a patch?
>
>>   >   The general recommendation is having the MTD partition and therefore
>> the UBI device as large as possible such that the wear leveling large.
>> 02.10.2018 11:41, Richard Weinberger написал:
>>
>> Do you mean one MTD partition for first UBI volume, and second MTD
>> partition for another one?
> No, just one UBI device on one MTD partition with multiple UBI volumes.
>
> Thanks,
> //richard
>
>
>
