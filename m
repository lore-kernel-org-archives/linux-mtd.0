Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zeju-0007gH-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 May 2001 14:19:50 +0100
Received: from mailserver.arcom.co.uk ([194.200.159.162])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14zcLp-0006y1-00
	for linux-mtd@lists.infradead.org; Tue, 15 May 2001 11:46:50 +0100
From: "Alex Lennon" <ajlennon@arcom.co.uk>
To: "Eric W. Biederman" <ebiederman@lnxi.com>,
	"David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: CPU caching of flash regions.
Date: Tue, 15 May 2001 11:46:10 +0100
Message-ID: <NEBBKJHOALKOLCFPGELEMEPACKAA.ajlennon@arcom.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <m3vgn36gcw.fsf@DLT.linuxnetworx.com>
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

Eric,

> Actually, the board used for the offending profile is a board with paged
> access to the flash, so it's slightly slower than some others - but the
> overhead shouldn't be too high. And the cache benefit would be more
limited.

> What kind of chip is being used?

Two contiguous Intel Strataflash 28F640's giving 16Mb total

> What bus is it on?

ISA

> And how fast is it?

8Mhz

> Second. What kind of processor, and what kind of chipset are being used?

National Geode GX1 300Mhz with CS5530 support chipset

To generate some figures I knocked together code which reads the 16Mb from
the flash, paging as it goes. Nothing is done with the data. This takes
about 16s

With the hardcoded value of CONFIG_JFFS2_FS_DEBUG set to 2 in
fs/jffs2/nodelist.h
I get jffs2 root fs mount times in excess of 34s.

When I remove the debugging I get mount times of around 26s

Obviously the figures obtained from df need some massaging to take account
of compression
but I get:

/dev/root                14336      3760     10576  26% 	/
/dev/mtdblock1            1280       644       636  50% 	/var
/dev/ram0                 3963        26      3733   1% 		/var/tmp

So what does this mean ? Can I expect a fourfold increase in mount time with
a full f/s ?
Should I be comparing a 26s jffs2 mount to an idealistic 4s 4Mb flash read ?

Regards,

	Alex
