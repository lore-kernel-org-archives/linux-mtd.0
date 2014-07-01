Received: from p02c11o142.mxlogic.net ([208.65.144.75])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1zR8-0003HC-Mb
 for linux-mtd@lists.infradead.org; Tue, 01 Jul 2014 14:53:35 +0000
Message-ID: <53B2C9BA.2090507@lutron.com>
Date: Tue, 1 Jul 2014 10:46:18 -0400
From: Akshay Bhat <abhat@lutron.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: UBIFS Panic
References: <53AC825F.7040602@lutron.com> <53ACD890.4030805@huawei.com>
 <53B15F8E.3030309@lutron.com>
 <CAFLxGvzQpaLvLda8dXdVzvc00EYc9TpsLjJhsCjEBy28RsL=_w@mail.gmail.com>
 <53B19D09.2000007@lutron.com> <53B20A42.6020008@huawei.com>
 <53B267E6.7060708@nod.at> <53B2C321.4050407@lutron.com>
 <53B2C682.7080605@nod.at>
In-Reply-To: <53B2C682.7080605@nod.at>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 hujianyang <hujianyang@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Tue 01 Jul 2014 10:32:34 AM EDT, Richard Weinberger wrote:
> Am 01.07.2014 16:18, schrieb Akshay Bhat:
>>
>>
>> On Tue 01 Jul 2014 03:48:54 AM EDT, Richard Weinberger wrote:
>>> Am 01.07.2014 03:09, schrieb hujianyang:
>>>>>
>>>>> Is enabling UBI_FASTMAP the cause for the panic? If so I can disabled the
>>>>> feature and re-test. Do you see any compatibility issue going from:
>>>>> Current config -> New config -> Failsafe config
>>>>>
>>>>
>>>> I don't know. But I found func ubi_wl_get_peb() in drivers/mtd/ubi/wl.c
>>>> will return an error ENOSPC without any error messages. And this func
>>>> seems related with fastmap feature.
>>>
>>> I have sort of an idea what could going on.
>>> Akshay, can you please confirm that you face the issue only with UBI_FASTMAP=y?
>>
>> I have not been able to recreate the issue with UBI_FASTMAP=n
>
> Okay, you test case basically fills the filesystem over and over?
> And after some time you face the said issue.
> Is this correct?

Yes. From testing, the "some time" is typically after crossing the WL 
threshold.

> Thanks,
> //richard
