Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHiRx-0000eC-So
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2015 01:03:58 +0000
Message-ID: <55AEEAA2.8050509@cn.fujitsu.com>
Date: Wed, 22 Jul 2015 08:58:10 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>, <jack@suse.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [RFC PATCH 00/25] Add quota supporting in ubifs
References: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55AEB317.2060809@nod.at>
In-Reply-To: <55AEB317.2060809@nod.at>
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

On 07/22/2015 05:01 AM, Richard Weinberger wrote:
> Am 21.07.2015 um 10:37 schrieb Dongsheng Yang:
>> Hi Atem, Richard and others,
>> 	This is a patchset to add quota supporting in ubifs.
>> [1/25] - [7/25] are working to make quotactl to support filesystems
>> which are running on char device.
>>
>> Others are about making ubifs to support quota
>> Please help to review or test it. Any comment is welcome :).
>>
>> Hi Jan Kara,
>> 	I am not sure I am using the quota APIs correctly, please
>> help to correct me if I am wrong.
>>
>> Also you can get the code from:
>> https://github.com/yangdongsheng/linux.git  ubifs_quota_v1
>
> This branch contains also your atime series. Is this desired?

Indeed, will remove it later.

Thanx for your reminder. :)
>
> Thanks,
> //richard
> .
>
