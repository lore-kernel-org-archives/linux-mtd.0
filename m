Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DMBD7-0007HB-7D
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2005 16:45:14 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DMB8S-0002Sr-8t
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2005 22:40:30 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2005 22:40:24 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2005 22:40:24 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Thu, 14 Apr 2005 20:39:14 +0000 (UTC)
Message-ID: <loom.20050414T222445-494@post.gmane.org>
References: <loom.20050413T142519-107@post.gmane.org>
	<1113400225.23175.9.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: Re: mounting jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

> Believe me, if you'll write in 4K chunks, you'll effect much better
> JFFS2 performance. 

200 MByte file written on a 256 MByte NAND in 4096 byte chunks instead of 1024.
It is somewhat better (?) but still unusable. Mount time is still at 1m31s, 
but any operation after that including ls or touch are 10-14 minutes and
have inconsistent real time, sys is ~6m25s.
BTW, does it make difference if I run test on pristine, freshly
erased flash or after I created and deleted a few large files?

# time mount /mnt/flash/

real    1m31.304s
user    0m0.020s
sys     1m31.199s
# time touch /mnt/flash/test1

real    14m23.449s
user    0m0.010s
sys     6m24.856s
# umount /mnt/flash/
# time mount /mnt/flash/

real    1m31.306s
user    0m0.010s
sys     1m31.219s
# time touch /mnt/flash/test1

real    10m48.944s
user    0m0.000s
sys     6m25.156s
#
# umount /mnt/flash/
# time mount /mnt/flash/

real    1m31.300s
user    0m0.010s
sys     1m31.239s
# time touch /mnt/flash/test1

real    14m30.499s
user    0m0.000s
sys     6m24.746s
#

I will try next 10 x 20 MByte files but am afraid there is no
quick fix here.

Sergei Sharonov
