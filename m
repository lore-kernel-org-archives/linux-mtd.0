Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cb21f-0007Yt-GV
 for linux-mtd@lists.infradead.org; Tue, 07 Feb 2017 09:25:29 +0000
Subject: Re: [PATCH] ubifs: return ENOSPC if running out of inode number
To: Sheng Yong <shengyong1@huawei.com>, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
References: <20170207072808.17816-1-shengyong1@huawei.com>
 <59847b44-37b8-a2f4-b993-dc48710036fe@nod.at> <5899831D.2070005@huawei.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <4e5ef150-a766-c9a9-5503-a30fd16a295d@nod.at>
Date: Tue, 7 Feb 2017 10:25:03 +0100
MIME-Version: 1.0
In-Reply-To: <5899831D.2070005@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sheng Yong,

Am 07.02.2017 um 09:19 schrieb Sheng Yong:
>> Can you please explain *why* this has to be changed to -ENOSPC?
> Hi, Richard,
> 
> This is a trivial change. I think if there is not enough inode number available,
> it means the filesystem has no room for the new file. So ENOSPC may be appropriate,
> and some others filesystems returns ENOSPC in such scenario :)

It is less trivial than you might think.
UBIFS cannot reuse inode numbers, as soon you reach INUM_WATERMARK
the filesystem is more or less dead. -ENOSPC indicates that the user
can produce free space by deleting files, which will *not* help.
That's why we use -EINVAL in terms of "we are in bad state". :)

Unless you can show me an actual breakage because of -EINVAL instead
of -ENOSPC I'd keep it as-is.
Did you hit that code path? It is more likely to wear out the flash
long before you hit that limit.

Thanks,
//richard
