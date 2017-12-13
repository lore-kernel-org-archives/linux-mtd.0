Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ePDFu-0007xK-IF
 for linux-mtd@lists.infradead.org; Wed, 13 Dec 2017 20:03:53 +0000
From: Richard Weinberger <richard@nod.at>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: UBIFS corruptions - update
Date: Wed, 13 Dec 2017 21:04:00 +0100
Message-ID: <7353031.mXKd9PTq7l@blindfold>
In-Reply-To: <8856ca52-8483-7e9d-fe43-cc7fa668517e@colorfullife.com>
References: <8856ca52-8483-7e9d-fe43-cc7fa668517e@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Manfred,

Am Mittwoch, 13. Dezember 2017, 20:29:54 CET schrieb Manfred Spraul:
> Hi Richard,
> 
> as promised I tried to add backtrace support to my mtdram modification.
> 
> I don't like the result, the workflow is way to complex (good old
> ksymoops, ...)
> 
> Just dump_stack(), and then retain the output from dmesg would be simple
> and more efficient.
> 
> Thus I have abandoned the patch.
> 
> 
> What I have are the results:
> 
> - chk_fs corruptions: With 4.15-rc2, the issue still exists.
> 
> The corruptions start when the background worker thread erases a page:
> 
> 1st instance:
> 
> https://sourceforge.net/projects/calculix-rpm/files/ubifs-2/11_xattr/image-3
> 754.bin/download
> 
> https://sourceforge.net/projects/calculix-rpm/files/ubifs-2/11_xattr/rec-sym
> s-3753.txt/download
> 
> 2nd instance:
> 
> https://sourceforge.net/projects/calculix-rpm/files/ubifs-2/11_xattr/image-5
> 311.bin/download
> 
> 
> - the garbage_collect_leb issue:
> 
> The issue happens during ubifs_tnc_end_commit(), called by sync().
> 
> I'm not sure about the root cause: Should ubifs_check_node() skip the
> index LEB? Or should the nodes never cross a page boundary?
> 
> https://sourceforge.net/projects/calculix-rpm/files/ubifs-2/11_xattr/image-1
> 67836.bin/download
> 
> https://sourceforge.net/projects/calculix-rpm/files/ubifs-2/11_xattr/rec-sym
> s-167837.txt/download
> 
> https://sourceforge.net/projects/calculix-rpm/files/ubifs-2/11_xattr/r-16783
> 6.txt/download
> 
> 
> Without xattr, the garbage_collect_leb issue did not happen, I tested
> around 40.000 images.
> 
> 
> @Richard: Is there something where I could support? I fear more data
> would just cause confusion.

A day with more than 24h would be a good start. ;-)

I was able to play with your replay program and found a problem in UBIFS.
So I confirm we do have a problem with xattrs. The problem is the way how 
UBIFS kills all inodes that represent xattrs when a file is unlinked.
With a small enough LEB size and many "perfectly" timed power-cuts we can end 
up with a situation where UBIFS forgets about the relationship between an 
inode and it's xattrs inodes. This will later confuse the free space 
accounting (the LEB property tree) and then cause UBIFS to unmap a wrong LEB.

While playing with your replay tool I've reworked also your flight recorder to 
operate directly in MTD core and the tracing ring buffer. 
I'll send patches soon. This way of power-cut testing is really nice, and I 
want this mainline and part of mtd-utils.

Thanks,
//richard
