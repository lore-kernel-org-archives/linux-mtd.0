Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKxtr-0000tx-Sy
 for linux-mtd@lists.infradead.org; Fri, 31 Jul 2015 00:10:12 +0000
Message-ID: <55BABB80.9080406@cn.fujitsu.com>
Date: Fri, 31 Jul 2015 08:04:16 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <dedekind1@gmail.com>
CC: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] ubifs: make ubifs_[get|set]xattr atomic
References: <1438234650-21289-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55B9DAD2.4060803@nod.at>
In-Reply-To: <55B9DAD2.4060803@nod.at>
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

On 07/30/2015 04:05 PM, Richard Weinberger wrote:
> Am 30.07.2015 um 07:37 schrieb Dongsheng Yang:
>> This commit make the ubifs_[get|set]xattr protected by ui_mutex,
>> making xfstests/generic/037 passed.
>
> Making a test pass is not a good patch description.
> Please describe what needs protection and why. :-)

Agreed, sorry for my lazy :)

Will send a V2 with more description.

Thanx
Yang
>
> Thanks,
> //richard
>
