Received: from gprs189-60.eurotel.cz ([160.218.189.60])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JWCPH-0000zZ-UN
	for linux-mtd@lists.infradead.org; Mon, 03 Mar 2008 15:16:49 +0000
Date: Mon, 3 Mar 2008 13:15:11 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Alexander Belyakov <abelyako@googlemail.com>
Subject: Re: jffs2: -ENOSPC when truncating file?!
Message-ID: <20080303121510.GD28369@elf.ucw.cz>
References: <20080223235742.GE2202@elf.ucw.cz>
	<fe810cf0802242348w625a7e7bj1a5476d6c79662@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe810cf0802242348w625a7e7bj1a5476d6c79662@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	=?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org, kernel list <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

> >  I'm trying to free space by truncating big file, and I get:
> >
> >  root@fic-gta01:~# ls -al gps.nmea
> >  -rw-r--r--    1 root     root      2332070 Feb 19 22:13 gps.nmea
> >  root@fic-gta01:~# > gps.nmea
> >  -sh: cannot create gps.nmea: No space left on device
> >  root@fic-gta01:~# rm gps.nmea
> >  root@fic-gta01:~# > gps.nmea
> >  root@fic-gta01:~#
> >
> >  :-(
> >
> >  Kernel is not-so-ancient, on openmoko:
> 
> Hi!
> 
> JFFS2 has known bug in GC leading to -ENOSPC upon file removal. Time
> ago I've sent a patch with detailed explanations of what is going on.
> Probably your case is the same.
> 
> Here is the patch
> http://lists.infradead.org/pipermail/linux-mtd/2007-December/020091.html
> (though infradead mailing list archive is missing most of messages
> from this thread)
> 
> And here are some details
> http://lists.infradead.org/pipermail/linux-mtd/2007-June/018756.html

Patch is here (I whitespace-damaged it, sorry], and I've seen no
discussion.. should it just be applied?
								Pavel

diff -uNr a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
--- a/fs/jffs2/wbuf.c	2007-05-25 01:22:47.000000000 +0400
+++ b/fs/jffs2/wbuf.c	2007-06-20 18:45:09.000000000 +0400
@@ -117,7 +117,7 @@

 		D1(printk(KERN_DEBUG "Removing eraseblock at 0x%08x
from erasable_pending_wbuf_list...\n", jeb->offset));
 		list_del(this);
-		if ((jiffies + (n++)) & 127) {
+		if (((jiffies + (n++)) & 127) &&
!list_empty(&c->erasable_list)) {
 			/* Most of the time, we just erase it immediately. Otherwise we
 			   spend ages scanning it on mount, etc. */
 			D1(printk(KERN_DEBUG "...and adding to
erase_pending_list\n"));



-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
