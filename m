Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZM7kl-0006iY-8h
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 04:53:35 +0000
Message-ID: <55BEF268.8020404@cn.fujitsu.com>
Date: Mon, 3 Aug 2015 12:47:36 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Dave Chinner <david@fromorbit.com>
CC: <eguan@redhat.com>, <fstests@vger.kernel.org>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/5] xfstest: add ubifs support
References: <1438236417-24612-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438236417-24612-2-git-send-email-yangds.fnst@cn.fujitsu.com>
 <20150803041229.GQ3902@dastard> <55BEF1A3.9060103@cn.fujitsu.com>
In-Reply-To: <55BEF1A3.9060103@cn.fujitsu.com>
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

Sorry, I click "send" to early. :(

On 08/03/2015 12:44 PM, Dongsheng Yang wrote:
> On 08/03/2015 12:12 PM, Dave Chinner wrote:
>> On Thu, Jul 30, 2015 at 02:06:53PM +0800, Dongsheng Yang wrote:
>>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>>> ---
>>>   check         | 2 ++
>>>   common/config | 9 +++++----
[...]
>>>       # no way to check consistency for tmpfs
>>>       ;;
>>> +    ubifs)
>>> +    ;;
>>
>> There is no fsck.ubifs? How do you validate the filesystem is
>> consistent?

Yes, currently, we have no fsck.ubifs, but I am planing to add it.
>>
>> Keep in minds that the people you are asking to review/commit this
>> code have no idea what UBIFS is or how it works, so you need to
>> explain why xfstests requires non-standard configuration and
>> bypassing of the config sanity testing...

There is a document for ubifs, the main reason for this patchset is
ubifs is running on ubi volume which is not a block device.

http://www.linux-mtd.infradead.org/doc/ubifs.html

Thanx
Yang
>>
>> Cheers,
>>
>> Dave.
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe fstests" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> .
>
