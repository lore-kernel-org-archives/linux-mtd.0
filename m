Received: from 207.88.121.47.ptr.us.xo.net ([207.88.121.47]
	helo=ba.realmsys.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ELUDR-00013u-Us
	for linux-mtd@lists.infradead.org; Fri, 30 Sep 2005 19:23:07 -0400
From: Peter Grayson <pgrayson@realmsys.com>
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
In-Reply-To: <loom.20050930T223859-922@post.gmane.org>
References: <433A640D.6030200@cetrtapot.si> <433BA402.3040703@inf.u-szeged.hu>
	<20050929093433.GB18741@wohnheim.fh-wedel.de>
	<433BB979.7010904@inf.u-szeged.hu> <433BBB19.9060905@yandex.ru>
	<1128010237.6926.10.camel@localhost.localdomain>
	<loom.20050929T193349-733@post.gmane.org>
	<1128053984.6926.59.camel@localhost.localdomain>
	<loom.20050930T223859-922@post.gmane.org>
Content-Type: text/plain
Date: Fri, 30 Sep 2005 17:22:59 -0600
Message-Id: <1128122579.6926.110.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-09-30 at 21:15 +0000, Sergei Sharonov wrote:
> Aha!!! Of course, CS reduced your time to first write down to seconds.
> Could you repeat the test after the un-clean unmount (e.g. power off without
> sync)? I bet the numbers will be very different. Probably you also need to 
> be writing to flash during the power off to force full scan on startup.

I'll add this to my list of "things to try for the list".

> Hmm.. I was getting a read throughput jffs2 -> samba network fs of about 
> 1.1 MB/s (180 MHz ARM9, linux 2.6.10, mtd 3/28/2005). I believe jffs2/mtd 
> was the bottleneck since the throughput was 7.25x higher when files were 
> comming from ext2/RAM. Looks like your hw controller is doing a good job.
> Not sure how overhead is split between mtd and jffs2.

The mtd layer does not really introduce any overhead; it accounts for
the time it takes to get bytes in and out of the hardware. Jffs2, on the
other hand, has a number of aspects that use RAM and cpu cycles. Also,
the choices jffs2 makes affects how often it has to access flash.

> Tricky, tricky, tricky ;-)
> Not everybody is that lucky to have a battery. Reminds me of a conversation
> with one "high reliability RTOS" vendor, you guess who.
> - Is your file system power fail safe?
> - Yes, of course. We do require that you use UPS though.
> 
> > However, the thing to
> > remember about centralized summary is that in the unclean shutdown
> > cases, the mount time is no worse than jffs2 without CS. So even if you
> > only expect the filesystem to be cleanly unmounted sometimes, CS can be
> > worth it.
> 
> As long as specification allows for an "occasional" 30 minutes startup time.

Touche.

> Your hw controller does sound very interesting.
> What is the hardware implementation : asic, fpga? Is it available as a 
> separate product (chip)?

This is a soft core in an fpga. My company may be willing to license its
use.
