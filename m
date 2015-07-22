Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHifK-0006km-Ag
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2015 01:17:46 +0000
Message-ID: <55AEEDDE.6030407@cn.fujitsu.com>
Date: Wed, 22 Jul 2015 09:11:58 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <dedekind1@gmail.com>, <jack@suse.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [RFC PATCH 00/25] Add quota supporting in ubifs
References: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55AEB0A3.4030106@nod.at>
In-Reply-To: <55AEB0A3.4030106@nod.at>
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

On 07/22/2015 04:50 AM, Richard Weinberger wrote:
> Am 21.07.2015 um 10:37 schrieb Dongsheng Yang:
>> Hi Atem, Richard and others,
>> 	This is a patchset to add quota supporting in ubifs.
>> [1/25] - [7/25] are working to make quotactl to support filesystems
>> which are running on char device.
>>
>> Others are about making ubifs to support quota
>> Please help to review or test it. Any comment is welcome :).
>
> How did you test this new feature? xfstests? Also wrt. powercuts?

I did not try powercuts, and I did not try some more full testing so
far. That's why I marked it as RFC :). I want to get the opinions as
early as possible. Then will do some more testing later.
> Please also don't forget to add quota support to integchk.

Thanx for your reminding. :)

Yang
>
> Thanks,
> //richard
> .
>
