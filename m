Received: from gprs189-60.eurotel.cz ([160.218.189.60] helo=amd.ucw.cz)
	by pentafluge.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JT4FX-0004CJ-CA
	for linux-mtd@lists.infradead.org; Sat, 23 Feb 2008 23:57:48 +0000
Date: Sun, 24 Feb 2008 00:57:42 +0100
From: Pavel Machek <pavel@ucw.cz>
To: kernel list <linux-kernel@vger.kernel.org>
Subject: jffs2: -ENOSPC when truncating file?!
Message-ID: <20080223235742.GE2202@elf.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

I'm trying to free space by truncating big file, and I get:

root@fic-gta01:~# ls -al gps.nmea 
-rw-r--r--    1 root     root      2332070 Feb 19 22:13 gps.nmea
root@fic-gta01:~# > gps.nmea 
-sh: cannot create gps.nmea: No space left on device
root@fic-gta01:~# rm gps.nmea
root@fic-gta01:~# > gps.nmea
root@fic-gta01:~# 

:-(

Kernel is not-so-ancient, on openmoko:

root@fic-gta01:~# uname -a
Linux fic-gta01 2.6.24 #1 PREEMPT Mon Feb 18 21:30:53 GMT 2008 armv4tl
unknown
root@fic-gta01:~# 


								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
