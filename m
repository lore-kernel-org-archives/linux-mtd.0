Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cb2g2-0007yQ-Lp
 for linux-mtd@lists.infradead.org; Tue, 07 Feb 2017 10:07:17 +0000
Message-ID: <58999BF7.1040708@huawei.com>
Date: Tue, 7 Feb 2017 18:05:43 +0800
From: Sheng Yong <shengyong1@huawei.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <dedekind1@gmail.com>
Subject: Re: [PATCH] ubifs: return ENOSPC if running out of inode number
References: <20170207072808.17816-1-shengyong1@huawei.com>
 <59847b44-37b8-a2f4-b993-dc48710036fe@nod.at> <5899831D.2070005@huawei.com>
 <4e5ef150-a766-c9a9-5503-a30fd16a295d@nod.at>
In-Reply-To: <4e5ef150-a766-c9a9-5503-a30fd16a295d@nod.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 2/7/2017 5:25 PM, Richard Weinberger wrote:
> Sheng Yong,
> 
> Am 07.02.2017 um 09:19 schrieb Sheng Yong:
>>> Can you please explain *why* this has to be changed to -ENOSPC?
>> Hi, Richard,
>>
>> This is a trivial change. I think if there is not enough inode number available,
>> it means the filesystem has no room for the new file. So ENOSPC may be appropriate,
>> and some others filesystems returns ENOSPC in such scenario :)
> 
> It is less trivial than you might think.
> UBIFS cannot reuse inode numbers, as soon you reach INUM_WATERMARK
> the filesystem is more or less dead. -ENOSPC indicates that the user
> can produce free space by deleting files, which will *not* help.
> That's why we use -EINVAL in terms of "we are in bad state". :)
Right. This makes sense :)
> 
> Unless you can show me an actual breakage because of -EINVAL instead
> of -ENOSPC I'd keep it as-is.
> Did you hit that code path? It is more likely to wear out the flash
> long before you hit that limit.
No I didn't hit this. The watermark is large enough.

thanks,
Sheng
> 
> Thanks,
> //richard
> 
> .
> 
