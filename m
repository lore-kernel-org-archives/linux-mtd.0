Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alW44-00036Q-AA
 for linux-mtd@lists.infradead.org; Thu, 31 Mar 2016 06:26:47 +0000
To: <linux-mtd@lists.infradead.org>, <richard@nod.at>, <dedekind1@gmail.com>
From: Wang Fangpeng <wangfangpeng1@huawei.com>
Subject: Question: background GC on UBIFS
Message-ID: <56FCC2E6.5020206@huawei.com>
Date: Thu, 31 Mar 2016 14:25:42 +0800
MIME-Version: 1.0
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

Hi, folks,

We did some performance test of writing data to a ubifs volume by dd. The block
size of dd is 1MB.

When the volume has more than 20% free space, the speed of writing is about
1.4MB/s ~ 1.2MB/s.

However, when the free space is less and less, the speed decreases to about
83KB/s. We think the overhead is caused by GC, since GC tries to find a free
space and move valid data to another place to get a free block.

Although we already have a kthread to collect freeable blocks, it doesn't
touch blocks which have both valid and invalid nodes. My question is why don't
we do such consolidation/defragmentation periodicly, so that the overhead
could be decreased when there is not enough free space?

thanks.
