Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Zw7r-0007LD-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 17:15:03 +0100
Message-ID: <2702075D4DE2B043BF5EB82E9CFAD45B0BD37B@mail1.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: RE: Memory leak problem with JFFS2 
Date: Wed, 31 Jul 2002 12:14:58 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

You have the right procedure to reproduce the problem ( vmstat ; while =
true
; do mount -t jffs2 mtd0 /mnt/spare ; ).  I can reproduce the problem =
using
this line on my system.

I updated my JFFS2 code with the lastest from CVS, and I am using =
kernel
2.4.19-rc2, and the problem is still there.  Do you think you could do =
the
same test under 2.4.19-rc2?

Thanks,

Fr=E9d=E9ric Giasson=20

|-----Original Message-----
|From: David Woodhouse [mailto:dwmw2@infradead.org]
|Sent: Wednesday, July 31, 2002 11:17 AM
|To: Frederic Giasson
|Cc: linux-mtd@lists.infradead.org
|Subject: Re: Memory leak problem with JFFS2=20
|
|
|
|fgiasson@mediatrix.com said:
|>  I took some time to track down the memory leak that happens after
|> umount. First I compiled JFFS2 as a module and loaded/unloaded it
|> doing a mount/umount in between.  No BUG occured, meaning=20
|that no slab
|> object is still allocated when I unload the module.  Then I
|> investigated around the kmalloc/kfree, but I found nothing.  I put
|> traces and counters each time a kmalloc / kfree was called, and the
|> number of kmalloc and kfree is balanced. Therefore, I can conclude
|> than the memory leak is not an allocated object still allocated at
|> umount time and is not a kmalloc without kfree neither. Do you have
|> any other idea about it?  This is not very likely to be the mount /
|> umount mechanism that could cause the leak, I tried mounting and
|> unmounting NFS and the memory usage before and after does=20
|not change.=20
|
|Can you remind me what you have to do to reproduce this?
|
|With 2.5.29, which contains the latest JFFS2 code from CVS...
|
|# vmstat ; while true ; do mount -t jffs2 mtd0 /mnt/spare ;=20
|sync ; umount /mnt/spare ; vmstat|tail -1 ; done
|   procs                      memory    swap          io    =20
|system         cpu
| r  b  w   swpd   free   buff  cache  si  so    bi    bo   in =20
|  cs  us  sy  id
| 0  0  0      0  81800      0  26244   0   0     2     5 1003 =20
|   8   2   3  95
| 1  0  0      0  81696      0  26244   0   0     2     5 1003 =20
|   8   2   3  95
| 1  0  0      0  81700      0  26244   0   0     2     5 1003 =20
|   9   2   3  95
| 1  0  0      0  81712      0  26244   0   0     2     5 1003 =20
|   9   2   3  95
| 1  0  0      0  81696      0  26244   0   0     2     5 1003 =20
|   9   2   3  95
| 2  0  0      0  81704      0  26244   0   0     2     5 1003 =20
|   9   2   3  95
| 2  0  0      0  81708      0  26248   0   0     2     5 1003 =20
|   9   2   3  95
| 2  0  0      0  81696      0  26248   0   0     2     5 1003 =20
|  10   2   3  95
| 2  0  0      0  81696      0  26248   0   0     2     5 1003 =20
|  10   2   3  95
| 2  0  0      0  81712      0  26248   0   0     2     5 1003 =20
|  10   2   3  95
| 2  0  1      0  81688      0  26248   0   0     2     5 1003 =20
|  10   2   3  95
| 2  0  1      0  81696      0  26248   0   0     2     5 1003 =20
|  10   2   3  95
| 2  0  0      0  81708      0  26248   0   0     2     5 1003 =20
|  10   2   3  95
| 2  0  0      0  81692      0  26248   0   0     2     5 1003 =20
|  10   2   3  95
| 2  0  0      0  81696      0  26248   0   0     2     5 1003 =20
|  10   2   3  95
| 2  0  0      0  81708      0  26248   0   0     2     5 1003 =20
|  10   2   3  95
| 2  0  0      0  81692      0  26248   0   0     2     5 1003 =20
|  10   2   3  95
| 2  0  0      0  81696      0  26248   0   0     2     5 1003 =20
|  11   2   3  95
| 2  0  0      0  81708      0  26248   0   0     2     5 1003 =20
|  11   2   3  95
| 2  0  0      0  81680      0  26248   0   0     2     5 1003 =20
|  11   2   3  95
| 2  0  0      0  81724      0  26248   0   0     2     5 1003 =20
|  11   2   3  95
| 2  0  0      0  81712      0  26248   0   0     2     5 1003 =20
|  11   2   3  95
| 2  0  0      0  81704      0  26248   0   0     2     5 1003 =20
|  11   2   3  95
| 2  0  0      0  81696      0  26248   0   0     2     5 1003 =20
|  11   2   3  95
| 2  0  1      0  81708      0  26248   0   0     2     5 1003 =20
|  11   2   3  95
| 2  0  0      0  81688      0  26248   0   0     2     5 1003 =20
|  11   2   3  95
| 2  0  0      0  81696      0  26248   0   0     2     5 1003 =20
|  11   2   3  95
| 2  0  0      0  81708      0  26248   0   0     2     5 1003 =20
|  12   2   3  95
| 2  0  0      0  81692      0  26248   0   0     2     5 1003 =20
|  12   2   3  95
| 2  0  0      0  81696      0  26248   0   0     2     5 1003 =20
|  12   2   3  95
| 2  0  0      0  81708      0  26248   0   0     2     5 1003 =20
|  12   2   3  95
| 2  0  0      0  81692      0  26248   0   0     2     5 1003 =20
|  12   2   3  95
| 2  0  0      0  81696      0  26248   0   0     2     5 1003 =20
|  12   2   3  95
| 2  0  0      0  81708      0  26248   0   0     2     5 1003 =20
|  12   2   3  95
|Interrupt
|
|> Between, we still don't know why doing a sync after an "rm" command
|> triggers the garbage collector.  Do you have any other clue=20
|about it?=20
|
|Not off-hand.=20
|
|--
|dwmw2
|
|
|
