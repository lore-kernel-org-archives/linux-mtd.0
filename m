Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSGI8-0004OK-WE
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 03:13:25 +0000
Message-ID: <55D5445D.2060406@cn.fujitsu.com>
Date: Thu, 20 Aug 2015 11:07:09 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <dedekind1@gmail.com>,
 <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>
Subject: Re: [RFC PATCH 00/27] Introduce ubifs_dump in ubifs-utils
References: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55D4EADA.70408@nod.at>
In-Reply-To: <55D4EADA.70408@nod.at>
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/20/2015 04:45 AM, Richard Weinberger wrote:
> Dongsheng,
>
> Am 19.08.2015 um 10:39 schrieb Dongsheng Yang:
>> Hi Atem, Richard and Brian,
>> 	This patchset introduce a userspace tool named ubifs_dump
>> to dump data from a ubi media.
>> 	It will dump the areas in ubifs, such as super block,
>> master, log, lpt and main.
>> 	That's helpful for us to see what exactly written in
>> media.
>> 	the [1/patch] is a RESEND patch, it restructures the mtd-utils.
>> Please Brian help to take a look at it. thanx a lot. :)
>>
>> NOTE:
>> 	This patch set depends on a patch I sent out [ubifs: correct the size of nnode in memset]
>> But you can get a full code at:
>> https://github.com/yangdongsheng/mtd-utils.git ubifs_dump_v1
>>
>> Please help to review or test it.
>
> thanks a lot for your patches, I'll happily test and review them.
> But I'll be on vacation till 14th of September.
> So, it has to wait a bit. :-)

That's okey, have a nice vacation :).

Yang
>
> Thanks,
> //richard
> .
>
