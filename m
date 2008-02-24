Received: from gprs189-60.eurotel.cz ([160.218.189.60] helo=amd.ucw.cz)
	by pentafluge.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JTBDT-0001KQ-2l
	for linux-mtd@lists.infradead.org; Sun, 24 Feb 2008 07:24:08 +0000
Date: Sun, 24 Feb 2008 08:24:23 +0100
From: Pavel Machek <pavel@ucw.cz>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: jffs2: -ENOSPC when truncating file?!
Message-ID: <20080224072423.GF2202@elf.ucw.cz>
References: <20080223235742.GE2202@elf.ucw.cz>
	<1203813368.5771.174.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1203813368.5771.174.camel@shinybook.infradead.org>
Cc: linux-mtd@lists.infradead.org, kernel list <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun 2008-02-24 09:36:07, David Woodhouse wrote:
> 
> On Sun, 2008-02-24 at 00:57 +0100, Pavel Machek wrote:
> > Hi!
> > 
> > I'm trying to free space by truncating big file, and I get:
> > 
> > root@fic-gta01:~# ls -al gps.nmea 
> > -rw-r--r--    1 root     root      2332070 Feb 19 22:13 gps.nmea
> > root@fic-gta01:~# > gps.nmea 
> > -sh: cannot create gps.nmea: No space left on device
> > root@fic-gta01:~# rm gps.nmea
> > root@fic-gta01:~# > gps.nmea
> > root@fic-gta01:~# 
> 
> You need to write a log entry indicating the new length of the file.
> There is no space for new log entries.
> 
> There is a special case for removal -- 'rm gps.nmea' would work. Perhaps
> we should add a special case for truncation too, so that it can also use
> the extra pool of free space.

Yes, that would be nice. I somehow assumed that truncate can't fail
for -ENOSPC ... I was trying to actually free some space on the
filesystem...
								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
