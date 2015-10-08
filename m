Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZjymB-0002hj-I9
 for linux-mtd@lists.infradead.org; Thu, 08 Oct 2015 00:09:40 +0000
Message-ID: <5615B2A0.1010803@cn.fujitsu.com>
Date: Thu, 8 Oct 2015 08:02:40 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <dedekind1@gmail.com>,
 <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 10/27] ubifs: introduce list.h
References: <1439973572-12489-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1439973572-12489-11-git-send-email-yangds.fnst@cn.fujitsu.com>
 <5615838E.5090908@nod.at>
In-Reply-To: <5615838E.5090908@nod.at>
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

On 10/08/2015 04:41 AM, Richard Weinberger wrote:
> Am 19.08.2015 um 10:39 schrieb Dongsheng Yang:
>> Copy the list.h from kernel to ubifs-utils/
>>
>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>> ---
>>   ubifs-utils/include/list.h | 484 +++++++++++++++++++++++++++++++++++++++++++++
>
> This belongs to common mtd-utils code as it is not UBIFS specific.

Yes, It's in my TODO, but I did not put it at this time, because
there is a list implementation in jffs2 part, IIRC. So I am planing
to do it later to move all common code into higher level.
> And why didn't you copy the whole list.h file?

Hmmmm.....I only implemented what I required in this patchset. The 
commit message is confusing, It's not a *copy* from kernel. Maybe
it's better that "Implement list structure in ubifs-utils like kernel."

> I'm missing
> list_last_entry() for example.

If you want something more, I think it's okey to add them into list.h

Thanx
Yang

>
> Thanks,
> //richard
>
