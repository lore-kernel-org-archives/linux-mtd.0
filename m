Received: from www.optixsoft.de ([213.187.73.226])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Mm3P-0003ro-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Dec 2002 09:24:19 +0000
Date: Fri, 13 Dec 2002 10:54:24 +0100 (MET)
From: Tobias Otto-Adamczak <toa@indakom.de>
To: <linux-mtd@lists.infradead.org>
cc: Jochen Schaeuble <psionic@psionic.de>
Subject: Re: slram and buffer cache
In-Reply-To: <20021212202814.GB5027@psionic.de>
Message-ID: <Pine.LNX.4.31.0212131038080.32069-100000@www.optixsoft.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Jochen Schaeuble, 2002-12-12, 21:28h:

> Hi,
> I haven't used mtdblock for a while now so I'm not absolutely sure if
> this is correct. The "cache_size" of the mtdblock driver is initialized
> with the erasesize specified in the slram driver (0x10000 if you haven't
> changed anything). If you want uncached operation you should set this
> value to
> (*curmtd)->mtdinfo->erasesize = 0x0; (slram.c line 180).
> I had no time to check this but from reading the source I think this is
> correct. Please let me know if this works for you. If so it might be a
> good idea to make this size configurable.

Thanks for your reply. I use the latest version of slram.c from
http://www.linux-mtd.infradead.org/ which you can look at
ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/mtd/drivers/mtd/devices/slram.c

Line 206 says already (*curmtd)->mtdinfo->erasesize = 0x0; I know that
other (older) versions of this file have the value 0x10000 here.

However I have added printk()s to slram_read/slram_write to see when
they are actually called and there is a lot of latency (several seconds)
between writing some bytes into a file and see some slram driver
activity. So there must be another point that I'm missing.

I tried to mount with -o sync and also tuned the bdflush parameters,
both helped a little bit to speed up the write process for cached
buffers, but I definitely want to get rid of the caching at all for my
BB-SRAM.

Any more ideas ?

Regards
Tobias
