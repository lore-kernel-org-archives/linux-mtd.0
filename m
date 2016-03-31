Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alYMd-0000rY-9s
 for linux-mtd@lists.infradead.org; Thu, 31 Mar 2016 08:54:04 +0000
Subject: Re: Question: background GC on UBIFS
To: Wang Fangpeng <wangfangpeng1@huawei.com>, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
References: <56FCC2E6.5020206@huawei.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56FCE58E.3060200@nod.at>
Date: Thu, 31 Mar 2016 10:53:34 +0200
MIME-Version: 1.0
In-Reply-To: <56FCC2E6.5020206@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 31.03.2016 um 08:25 schrieb Wang Fangpeng:
> Hi, folks,
> 
> We did some performance test of writing data to a ubifs volume by dd. The block
> size of dd is 1MB.
> 
> When the volume has more than 20% free space, the speed of writing is about
> 1.4MB/s ~ 1.2MB/s.
> 
> However, when the free space is less and less, the speed decreases to about
> 83KB/s. We think the overhead is caused by GC, since GC tries to find a free
> space and move valid data to another place to get a free block.
> 
> Although we already have a kthread to collect freeable blocks, it doesn't
> touch blocks which have both valid and invalid nodes. My question is why don't
> we do such consolidation/defragmentation periodicly, so that the overhead
> could be decreased when there is not enough free space?

AFAIK UBIFS does this on demand to be friendly to the flash.
Otherwise it would move blocks around for nothing (if there is no writer).

Doing it periodically is doable but how often and when? Only when the system
is completely idle?
I'm not sure if there will be a huge performance gain. Basically you shift the
IO load to another location.

But you can give it a try. Add a new debugfs file to trigger an aggressive GC run.
Currently GC tries to produce as much space as we budget. You can change GC to
produce as much space as possible.

Thanks,
//richard
