Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHiBc-00031X-6V
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2015 00:47:04 +0000
Message-ID: <55AEE6BF.2010302@cn.fujitsu.com>
Date: Wed, 22 Jul 2015 08:41:35 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <dedekind1@gmail.com>, <jack@suse.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 12/25] ubifs: introduce quota related mount options
References: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1437467876-22106-13-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55AEADF1.2050500@nod.at>
In-Reply-To: <55AEADF1.2050500@nod.at>
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

On 07/22/2015 04:39 AM, Richard Weinberger wrote:
> Am 21.07.2015 um 10:37 schrieb Dongsheng Yang:
>> This commit introduce mount options of quota, noquota,
>> usrquota and grpquota. These options are used to make
>> ubifs support quota. But with this commit, quota will
>> not working on ubifs actually. We just introduce options
>> here and will make ubifs support quota later.
>
> Is there a reason why you didn't implement project quotas too?

I planed to put it in the next cycle.
>
> Thanks,
> //richard
> .
>
