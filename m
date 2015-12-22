Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aBBSM-0004IK-1j
 for linux-mtd@lists.infradead.org; Tue, 22 Dec 2015 01:09:38 +0000
Message-ID: <5678A0E8.60503@cn.fujitsu.com>
Date: Tue, 22 Dec 2015 09:01:28 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <richard@nod.at>, <david@sigma-star.at>
Subject: Re: [PATCH] UBIFS: add a comment in key.h for unused parameter
References: <1450581920-21780-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1450698397.2276.3.camel@gmail.com>
In-Reply-To: <1450698397.2276.3.camel@gmail.com>
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

On 12/21/2015 07:46 PM, Artem Bityutskiy wrote:
> On Sun, 2015-12-20 at 11:25 +0800, Dongsheng Yang wrote:
>> Add a comment in key.h to explain why we keep an unused
>> parameter in key helpers.
>>
>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>> ---
>>   fs/ubifs/key.h | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/fs/ubifs/key.h b/fs/ubifs/key.h
>> index 92a8491..dce72c4 100644
>> --- a/fs/ubifs/key.h
>> +++ b/fs/ubifs/key.h
>> @@ -34,6 +34,12 @@
>>    * node. We use "r5" hash borrowed from reiserfs.
>>    */
>>
>> +/*
>> + * Lot's of the key helpers require a struct ubifs_info *c as the
>> first parameter.
>> + * But we are not using it at all currently. That's designed for
>> scalability for
>> + * different c->key_format. But right now, there is only one key
>> type, UBIFS_SIMPLE_KEY_FMT.
>> + */
>
> I think word "scalability" is not a perfect fit here. Just say for
> future extensions, or something like this. Scalability is a bit
> confusing.

It makes sense. Okey, I would update it with
"That's designed for future extensions of different c->key_format"

Thanx
Yang
>
>
>
