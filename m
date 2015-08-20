Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSGHN-0004E7-MV
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 03:12:38 +0000
Message-ID: <55D54430.8030506@cn.fujitsu.com>
Date: Thu, 20 Aug 2015 11:06:24 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
CC: <richard@nod.at>, <dedekind1@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] ubifs: correct the size of nnode in memset
References: <1439972932-12116-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <20150819162947.GW60523@google.com>
In-Reply-To: <20150819162947.GW60523@google.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/20/2015 12:29 AM, Brian Norris wrote:
> On Wed, Aug 19, 2015 at 04:28:52PM +0800, Dongsheng Yang wrote:
>> There is a typo in lpt to memset nnode by the
>> size in sizeof(stuct ubifs_pnode).
>>
>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>
> Pushed to mtd-utils.git, as it's obvious. Good catch!
>
> I'll take a look at your restructuring patches eventually. But I'll
> usually just defer UBIFS stuff to Richard/Artem/others.

Great, thanx a lot, Brian.
>
>> ---
>>   mkfs.ubifs/lpt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/mkfs.ubifs/lpt.c b/mkfs.ubifs/lpt.c
>> index f6d4352..6aa0b88 100644
>> --- a/mkfs.ubifs/lpt.c
>> +++ b/mkfs.ubifs/lpt.c
>> @@ -384,7 +384,7 @@ int create_lpt(struct ubifs_info *c)
>>   		goto out;
>>   	}
>>   	memset(pnode, 0 , sizeof(struct ubifs_pnode));
>> -	memset(nnode, 0 , sizeof(struct ubifs_pnode));
>> +	memset(nnode, 0 , sizeof(struct ubifs_nnode));
>
> FWIW, struct ubifs_pnode and struct ubifs_nnode look like they would be
> the same size when using 32-bit pointers, but a bit different (see the
> third field in structs ubifs_nbranch and ubifs_lprops) with 64-bit.

Yes, but in the latest ubifs.h in kernel, they are more different. And
when I updated the ubifs.h, I found the bug.

Thanx
Yang
>
>>
>>   	c->lscan_lnum = c->main_first;
>>
>> --
>> 1.8.4.2
>
> Brian
> .
>
