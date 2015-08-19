Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRyoU-0005JK-Aq
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 08:33:39 +0000
Message-ID: <55D43E01.1070702@cn.fujitsu.com>
Date: Wed, 19 Aug 2015 16:27:45 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v5] ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs
References: <1439872825-4988-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1439887462.31419.111.camel@gmail.com>
In-Reply-To: <1439887462.31419.111.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/18/2015 04:44 PM, Artem Bityutskiy wrote:
> On Tue, 2015-08-18 at 12:40 +0800, Dongsheng Yang wrote:
>> To make ubifs support atime flexily, this commit introduces
>> a Kconfig option named as UBIFS_ATIME_SUPPORT.
>>
>> With UBIFS_ATIME_SUPPORT=n:
>> 	ubifs keeps the full compatibility to no_atime from
>> the start of ubifs.
>> =================UBIFS_ATIME_SUPPORT=n=======================
>> -o - no atime
>> -o atime - no atime
>> -o noatime - no atime
>> -o relatime - no atime
>> -o strictatime - no atime
>> -o lazyatime - no atime
>
> And please, do include fsdevel when sending this patch.

Sorry again. will cc it in next verison. :(
>
> Artem.
> .
>
