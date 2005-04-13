Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DLiGe-00060p-RV
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2005 09:50:58 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
In-Reply-To: <loom.20050413T142519-107@post.gmane.org>
References: <loom.20050413T142519-107@post.gmane.org>
Content-Type: text/plain
Date: Wed, 13 Apr 2005 17:50:25 +0400
Message-Id: <1113400225.23175.9.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mounting jffs2
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-04-13 at 13:25 +0000, Sergei Sharonov wrote: 
> Hi,
> 
> It looks like there is a long delay before filesystem becomes available 
> after mount returns. Test setup: jffs2 on 256 MByte NAND chip, 2.6.10 linux
> with recent mtd snapshot. Filesystem contains one 200 MByte file written 
> and fsynced in 1 kByte chunks.
Believe me, if you'll write in 4K chunks, you'll effect much better
JFFS2 performance. 

> Checking ps it appears that gcd was the only 
> thing running (RWN).
It isn't bug, it is a feature. To facilitate faster mount JFFS2 defers a
lot of work to the GC thread and performs this work just after mount.
You may read filesystem but can't write. Any writer will be blocked - in
your case on 11m10.058s time interval.

> Mount and touch were run immediately one after another. I think it may be
> related to the long umount time problem that I reported before.
Measure the time of unmount just after mount. If if is also around
11m10.058s - this is a bug. Theoretically GC thread must forget its
deferred work and quit immediately.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
