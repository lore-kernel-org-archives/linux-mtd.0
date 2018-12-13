Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXQ9q-0008IL-Dg
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 12:32:03 +0000
Received: by mail-oi1-x22d.google.com with SMTP id v6so1486099oif.2
 for <linux-mtd@lists.infradead.org>; Thu, 13 Dec 2018 04:31:52 -0800 (PST)
Subject: Re: Fwd: ubifs: fix page_count in ->ubifs_migrate_page()
To: Richard Weinberger <richard@nod.at>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Christoph Hellwig <hch@lst.de>, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <1544624037-3436-1-git-send-email-openzhangj@gmail.com>
 <3016163.RH3ZIBrMym@blindfold>
 <c4f70535-63ba-4c4b-9e79-3ec48a406f52@gmail.com>
 <7521140.D8HW8ZckG7@blindfold>
From: zhangjun <openzhangj@gmail.com>
Message-ID: <b0c16c62-57a2-8e47-6003-a4a088fd07f5@gmail.com>
Date: Thu, 13 Dec 2018 20:31:45 +0800
MIME-Version: 1.0
In-Reply-To: <7521140.D8HW8ZckG7@blindfold>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 2018/12/13 下午8:22, Richard Weinberger wrote:
> Am Donnerstag, 13. Dezember 2018, 13:10:19 CET schrieb zhangjun:
>> On 2018/12/13 下午4:30, Richard Weinberger wrote:
>>> Am Donnerstag, 13. Dezember 2018, 03:59:50 CET schrieb zhangjun:
>>>> hello
>>>>        I test several kernel version from your commit
>>>> 4ac1c17b2044a1b4b2fbed74451947e905fc2992,
>>>> there is a bug when migrateing,the following fix i test ok and require
>>>> your confirmation.
>>> Please keep the CC list intact and give us at least some time to review
>>> your patch.
>>> Also explain what kind of problem you're facing.
>>> In other words, is this a theoretical fix or not?
>>>
>>> Thanks,
>>> //richard
>> This's my first time to patch upstream,thank you very much for your
>> suggestion.
>> My problem is my driver to call alloc_cma(),it fail.
>> But i find that memory and cma maxchunk is enougth.
>> So i building environmentto find what the reason is,test and verify my
>> guess.
>> i think it not just a theoretical fix but i actually tested it.
> Why are you sending this mail now for the third time?
>
> Thanks,
> //richard
>
>

I was rejected by linux-mtd@lists.infradead.org,stable@vger.kernel.org,
I thought you didn't receive it.

Thanks,
//zhangjun
