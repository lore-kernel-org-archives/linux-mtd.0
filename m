Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFoGo-0000zg-O5
 for linux-mtd@lists.infradead.org; Wed, 22 Jun 2016 19:57:08 +0000
Subject: =?UTF-8?B?UmU6IOWbnuWkje+8mnViaWZzOnF1ZXN0aW9ucyBhYm91dCB0aGlzIGZp?=
 =?UTF-8?Q?lesystem?=
To: =?UTF-8?B?6L6J5bCR?= <wang502742203@qq.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
References: <tencent_47C8194435DAF0EA2221DA1E@qq.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <576AED77.2070803@nod.at>
Date: Wed, 22 Jun 2016 21:56:39 +0200
MIME-Version: 1.0
In-Reply-To: <tencent_47C8194435DAF0EA2221DA1E@qq.com>
Content-Type: text/plain; charset=gb18030
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 22.06.2016 um 17:26 schrieb »ÔÉÙ:
> Thank you for kind reply.
> 
> 1. As you said just now"there is only a background thread to do many things",  dose "many things" include both GC and synchronizing data?

I said GC can happen in many contexts. Also in the calling one.
To figure what the background thread exactly does see function ubifs_bg_thread().

> 2. If I write a file(1 KB) to ubifs mounted in 34MiB mtd, can i write 34,000 times or 34000/4 times(the real disk usage of a 1KB file is 4KB)£¿

The minimal file size on UBIFS is 4KiB. You can also not use all 34MiB, since UBIFS needs some LEBs for the journal, free space accounting,
master nodes, etc...

Thanks,
//richard
