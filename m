Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZvDx-0007BI-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 16:17:18 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <2702075D4DE2B043BF5EB82E9CFAD45B0BD37A@mail1.mediatrix.com> 
References: <2702075D4DE2B043BF5EB82E9CFAD45B0BD37A@mail1.mediatrix.com> 
To: Frederic Giasson <fgiasson@mediatrix.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Memory leak problem with JFFS2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 31 Jul 2002 16:17:16 +0100
Message-ID: <23196.1028128636@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

fgiasson@mediatrix.com said:
>  I took some time to track down the memory leak that happens after
> umount. First I compiled JFFS2 as a module and loaded/unloaded it
> doing a mount/umount in between.  No BUG occured, meaning that no slab
> object is still allocated when I unload the module.  Then I
> investigated around the kmalloc/kfree, but I found nothing.  I put
> traces and counters each time a kmalloc / kfree was called, and the
> number of kmalloc and kfree is balanced. Therefore, I can conclude
> than the memory leak is not an allocated object still allocated at
> umount time and is not a kmalloc without kfree neither. Do you have
> any other idea about it?  This is not very likely to be the mount /
> umount mechanism that could cause the leak, I tried mounting and
> unmounting NFS and the memory usage before and after does not change. 

Can you remind me what you have to do to reproduce this?

With 2.5.29, which contains the latest JFFS2 code from CVS...

# vmstat ; while true ; do mount -t jffs2 mtd0 /mnt/spare ; sync ; umount /mnt/spare ; vmstat|tail -1 ; done
   procs                      memory    swap          io     system         cpu
 r  b  w   swpd   free   buff  cache  si  so    bi    bo   in    cs  us  sy  id
 0  0  0      0  81800      0  26244   0   0     2     5 1003     8   2   3  95
 1  0  0      0  81696      0  26244   0   0     2     5 1003     8   2   3  95
 1  0  0      0  81700      0  26244   0   0     2     5 1003     9   2   3  95
 1  0  0      0  81712      0  26244   0   0     2     5 1003     9   2   3  95
 1  0  0      0  81696      0  26244   0   0     2     5 1003     9   2   3  95
 2  0  0      0  81704      0  26244   0   0     2     5 1003     9   2   3  95
 2  0  0      0  81708      0  26248   0   0     2     5 1003     9   2   3  95
 2  0  0      0  81696      0  26248   0   0     2     5 1003    10   2   3  95
 2  0  0      0  81696      0  26248   0   0     2     5 1003    10   2   3  95
 2  0  0      0  81712      0  26248   0   0     2     5 1003    10   2   3  95
 2  0  1      0  81688      0  26248   0   0     2     5 1003    10   2   3  95
 2  0  1      0  81696      0  26248   0   0     2     5 1003    10   2   3  95
 2  0  0      0  81708      0  26248   0   0     2     5 1003    10   2   3  95
 2  0  0      0  81692      0  26248   0   0     2     5 1003    10   2   3  95
 2  0  0      0  81696      0  26248   0   0     2     5 1003    10   2   3  95
 2  0  0      0  81708      0  26248   0   0     2     5 1003    10   2   3  95
 2  0  0      0  81692      0  26248   0   0     2     5 1003    10   2   3  95
 2  0  0      0  81696      0  26248   0   0     2     5 1003    11   2   3  95
 2  0  0      0  81708      0  26248   0   0     2     5 1003    11   2   3  95
 2  0  0      0  81680      0  26248   0   0     2     5 1003    11   2   3  95
 2  0  0      0  81724      0  26248   0   0     2     5 1003    11   2   3  95
 2  0  0      0  81712      0  26248   0   0     2     5 1003    11   2   3  95
 2  0  0      0  81704      0  26248   0   0     2     5 1003    11   2   3  95
 2  0  0      0  81696      0  26248   0   0     2     5 1003    11   2   3  95
 2  0  1      0  81708      0  26248   0   0     2     5 1003    11   2   3  95
 2  0  0      0  81688      0  26248   0   0     2     5 1003    11   2   3  95
 2  0  0      0  81696      0  26248   0   0     2     5 1003    11   2   3  95
 2  0  0      0  81708      0  26248   0   0     2     5 1003    12   2   3  95
 2  0  0      0  81692      0  26248   0   0     2     5 1003    12   2   3  95
 2  0  0      0  81696      0  26248   0   0     2     5 1003    12   2   3  95
 2  0  0      0  81708      0  26248   0   0     2     5 1003    12   2   3  95
 2  0  0      0  81692      0  26248   0   0     2     5 1003    12   2   3  95
 2  0  0      0  81696      0  26248   0   0     2     5 1003    12   2   3  95
 2  0  0      0  81708      0  26248   0   0     2     5 1003    12   2   3  95
Interrupt

> Between, we still don't know why doing a sync after an "rm" command
> triggers the garbage collector.  Do you have any other clue about it? 

Not off-hand. 

--
dwmw2
