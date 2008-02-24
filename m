Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JTAp0-0006yk-Ji
	for linux-mtd@lists.infradead.org; Sun, 24 Feb 2008 06:58:50 +0000
Date: Sun, 24 Feb 2008 07:57:52 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: jffs2: -ENOSPC when truncating file?!
Message-ID: <20080224065751.GA31293@lazybastard.org>
References: <20080223235742.GE2202@elf.ucw.cz>
	<1203813368.5771.174.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1203813368.5771.174.camel@shinybook.infradead.org>
Cc: linux-mtd@lists.infradead.org, kernel list <linux-kernel@vger.kernel.org>,
	Pavel Machek <pavel@ucw.cz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 24 February 2008 09:36:07 +0900, David Woodhouse wrote:
> On Sun, 2008-02-24 at 00:57 +0100, Pavel Machek wrote:
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

Could a naïve implementation of this get exploited by doing a large
number of truncates that just shave single bytes off various files?

Looks like the safe way to do it would be to write out a replacement
node for the truncated node, if the special case ever triggers.

Jörn

-- 
"[One] doesn't need to know [...] how to cause a headache in order
to take an aspirin."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001
