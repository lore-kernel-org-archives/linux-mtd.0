Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DLisj-0006QZ-J7
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2005 10:30:18 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DLimV-0004Fe-Iq
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2005 16:23:51 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2005 16:23:51 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2005 16:23:51 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Wed, 13 Apr 2005 14:22:15 +0000 (UTC)
Message-ID: <loom.20050413T160136-559@post.gmane.org>
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

Hi,

> Believe me, if you'll write in 4K chunks, you'll effect much better
> JFFS2 performance. 

I will try that. My log data is comming in 1 kB chunks, so in order to do
4 kB at a time I will have to implement some sort of <power fail safe>
buffering.

> It isn't bug, it is a feature. To facilitate faster mount JFFS2 defers a
> lot of work to the GC thread and performs this work just after mount.
> You may read filesystem but can't write. Any writer will be blocked - in
> your case on 11m10.058s time interval.

Hmm.. ls is not a writer but it is blocked as well.
 
> > Mount and touch were run immediately one after another. I think it may be
> > related to the long umount time problem that I reported before.
> Measure the time of unmount just after mount. If if is also around
> 11m10.058s - this is a bug. Theoretically GC thread must forget its
> deferred work and quit immediately.

Doesn't seem to be the case. Continuing the previous test:

# time mount /mnt/flash/

real    1m33.527s
user    0m0.010s
sys     1m33.471s
# time touch /mnt/flash/junk

real    11m26.228s
user    0m0.010s
sys     0m0.000s
#
#   <------------- previous post ends here ----------
#
# time umount /mnt/flash/

real    0m0.255s
user    0m0.010s
sys     0m0.240s
# time mount /mnt/flash/

real    1m33.517s
user    0m0.010s
sys     1m33.431s
# time umount /mnt/flash/

real    11m25.534s
user    0m0.000s
sys     0m0.250s
#
