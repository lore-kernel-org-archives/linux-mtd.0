Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMnUq-0000aI-Nj
 for linux-mtd@lists.infradead.org; Wed, 05 Aug 2015 01:27:57 +0000
Message-ID: <55C1652F.9040201@cn.fujitsu.com>
Date: Wed, 5 Aug 2015 09:21:51 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <viro@ZenIV.linux.org.uk>,
 <jack@suse.cz>, <dedekind1@gmail.com>, <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH v2 20/35] ubifs: implement IO functions for quota files
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-21-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55BFE142.1030008@nod.at>
In-Reply-To: <55BFE142.1030008@nod.at>
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

On 08/04/2015 05:46 AM, Richard Weinberger wrote:
> Am 30.07.2015 um 07:48 schrieb Dongsheng Yang:
>> We have to implement 3 functions to support quota in ubifs:
>> ubifs_quota_read(), ubifs_quota_write() and ubifs_get_quotas()
>>
[...]
>
> I'll review your other patches these days.
> For now I'm too sleepy.

Thank you so much, Richard. :)

I will reply all the comments from you and Jan
when you finish the review.

Thanx
Yang
>
> Thanks,
> //richard
> .
>
