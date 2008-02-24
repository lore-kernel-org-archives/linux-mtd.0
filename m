Subject: Re: jffs2: -ENOSPC when truncating file?!
From: David Woodhouse <dwmw2@infradead.org>
To: Pavel Machek <pavel@ucw.cz>
In-Reply-To: <20080223235742.GE2202@elf.ucw.cz>
References: <20080223235742.GE2202@elf.ucw.cz>
Content-Type: text/plain
Date: Sun, 24 Feb 2008 09:36:07 +0900
Message-Id: <1203813368.5771.174.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, kernel list <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sun, 2008-02-24 at 00:57 +0100, Pavel Machek wrote:
> Hi!
> 
> I'm trying to free space by truncating big file, and I get:
> 
> root@fic-gta01:~# ls -al gps.nmea 
> -rw-r--r--    1 root     root      2332070 Feb 19 22:13 gps.nmea
> root@fic-gta01:~# > gps.nmea 
> -sh: cannot create gps.nmea: No space left on device
> root@fic-gta01:~# rm gps.nmea
> root@fic-gta01:~# > gps.nmea
> root@fic-gta01:~# 

You need to write a log entry indicating the new length of the file.
There is no space for new log entries.

There is a special case for removal -- 'rm gps.nmea' would work. Perhaps
we should add a special case for truncation too, so that it can also use
the extra pool of free space.

-- 
dwmw2
