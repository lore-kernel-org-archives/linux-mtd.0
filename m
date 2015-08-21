Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSfSV-00020R-GW
 for linux-mtd@lists.infradead.org; Fri, 21 Aug 2015 06:05:47 +0000
Message-ID: <55D6BE42.6090507@cn.fujitsu.com>
Date: Fri, 21 Aug 2015 13:59:30 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <viro@ZenIV.linux.org.uk>,
 <jack@suse.cz>, <dedekind1@gmail.com>, <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH v2 14/35] ubifs: extend budget for blocks
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-15-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55BFD56B.3070904@nod.at>
In-Reply-To: <55BFD56B.3070904@nod.at>
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

On 08/04/2015 04:56 AM, Richard Weinberger wrote:
> Am 30.07.2015 um 07:48 schrieb Dongsheng Yang:
>> Currently, budget subsystem in ubifs are working on budgeting

[...]
>>   #endif
>> +	unsigned int new_block_num;
>> +	unsigned int dirtied_block_num;
>
> Why are these not under UBIFS_DEBUG?
> I like the overflow checks.

Sorry for the late reply.

I did not find the overflow checks in my reading.
Could you help to explain what kind of the check
is it? and why we define in different way with
UBIFS_DEBUG defined or not.

And, Where did we define the UBIFS_DEBUG? I did not
get the design of this macro. :(

Yang
>
> Thanks,
> //richard
> .
>
