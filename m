Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSK9s-00079j-Ad
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 07:21:08 +0000
Message-ID: <55D57E6A.5040605@cn.fujitsu.com>
Date: Thu, 20 Aug 2015 15:14:50 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <dedekind1@gmail.com>
Subject: Re: [PATCH 2/2] ubifs: Allow O_DIRECT
References: <1440016553-26481-1-git-send-email-richard@nod.at>
 <1440016553-26481-2-git-send-email-richard@nod.at>
 <55D542C5.6040500@cn.fujitsu.com> <55D576BE.5040207@nod.at>
In-Reply-To: <55D576BE.5040207@nod.at>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/20/2015 02:42 PM, Richard Weinberger wrote:
> Yang, (Sorry if I've used your last name lately)

Haha, that's fine. My friends in China all call me Dongsheng. :)
>
> Am 20.08.2015 um 05:00 schrieb Dongsheng Yang:
>> On 08/20/2015 04:35 AM, Richard Weinberger wrote:
>>> Currently UBIFS does not support direct IO, but some applications
>>> blindly use the O_DIRECT flag.
>>> Instead of failing upon open() we can do better and fall back
>>> to buffered IO.
>>
>> Hmmmm, to be honest, I am not sure we have to do it as Dave
>> suggested. I think that's just a work-around for current fstests.
>>
>> IMHO, perform a buffered IO when user request direct IO without
>> any warning sounds not a good idea. Maybe adding a warning would
>> make it better.
>
> Well, how would you inform the user?
> A printk() to dmesg is useless are the vast majority of open()
> callers do not check dmesg... :)
>
> Major filesystems implement ->direct_IO these days and having
> a "return 0"-stub seems to be legit.
> For example exofs does too. So, I really don't consider it a work around.

Hmmm, then I am okey with this idea now.
>
>> I think we need more discussion about AIO&DIO in ubifs, and actually
>> I have a plan for it. But I have not listed the all cons and pros of
>> it so far.
>
> Sure, having a real ->direct_IO would be be best solution.
> My patch won't block this.

Yes, agree. So let's return 0 currently.

Yang
>
> Thanks,
> //richard
> .
>
