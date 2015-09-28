Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgOw1-0003f1-Ic
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2015 03:17:02 +0000
Message-ID: <5608AF8D.4060402@cn.fujitsu.com>
Date: Mon, 28 Sep 2015 11:10:05 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-fsdevel@vger.kernel.org>, <dedekind1@gmail.com>
Subject: Re: [PATCH] UBIFS: Add freeze support in ubifs
References: <1443321561-20581-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <5607A387.9050703@nod.at>
In-Reply-To: <5607A387.9050703@nod.at>
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

On 09/27/2015 04:06 PM, Richard Weinberger wrote:
> Yang,
>
> Am 27.09.2015 um 04:39 schrieb Dongsheng Yang:
>> We need to do nothing in ubifs, as all is already done in vfs.
>
> Please more details. :-)

Oh, this patch is really an incorrect one. At least I have to add
sb_start/end_intwrite and sb_start/end_pagefault in ubifs at
first. And I have to add more details about what I am doing and
why. Will send v2 later.

I think I was out of my mind yesterday, this patch is really not ready
to go in my local box. :(

Sorry for the noisy.

Yang
> The current changelog reads like every filesystem should implement
> it as nop. Which is obviously not the case.
>
> fs/super.c checks whether ->freeze_fs() is implemented, so
> a nop-implementation does not make sense here.
>
> I bet you hit this in fs/ioctl.c:
>          /* If filesystem doesn't support freeze feature, return. */
>          if (sb->s_op->freeze_fs == NULL && sb->s_op->freeze_super == NULL)
>                  return -EOPNOTSUPP;
>
> Correct?
>
> And the most important detail is missing, why is UBIFS allowed
> to have a nop-implementation?
>
> Thanks,
> //richard
> .
>
