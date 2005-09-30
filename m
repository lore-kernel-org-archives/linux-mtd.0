Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ELSGJ-000894-8S
	for linux-mtd@lists.infradead.org; Fri, 30 Sep 2005 17:17:57 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1ELSEo-0001yH-C6
	for linux-mtd@lists.infradead.org; Fri, 30 Sep 2005 23:16:14 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 30 Sep 2005 23:16:14 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 30 Sep 2005 23:16:14 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Fri, 30 Sep 2005 21:15:53 +0000 (UTC)
Message-ID: <loom.20050930T223859-922@post.gmane.org>
References: <433A640D.6030200@cetrtapot.si> <433BA402.3040703@inf.u-szeged.hu>
	<20050929093433.GB18741@wohnheim.fh-wedel.de>
	<433BB979.7010904@inf.u-szeged.hu> <433BBB19.9060905@yandex.ru>
	<1128010237.6926.10.camel@localhost.localdomain>
	<loom.20050929T193349-733@post.gmane.org>
	<1128053984.6926.59.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter,

thanks for taking time to do the tests.

> Hope that covers what you wanted to see. For the record, I am using the
> head of mtd cvs with the centralized summary patch applied. EBS and CS
> are both enabled.

Aha!!! Of course, CS reduced your time to first write down to seconds.
Could you repeat the test after the un-clean unmount (e.g. power off without
sync)? I bet the numbers will be very different. Probably you also need to 
be writing to flash during the power off to force full scan on startup.

> > Good point.. Can you estimate speedup due to the hw controller?
> 
> We can get about 15 MB/s for raw reads and about 6 MB/s for raw writes.

Hmm.. I was getting a read throughput jffs2 -> samba network fs of about 
1.1 MB/s (180 MHz ARM9, linux 2.6.10, mtd 3/28/2005). I believe jffs2/mtd 
was the bottleneck since the throughput was 7.25x higher when files were 
comming from ext2/RAM. Looks like your hw controller is doing a good job.
Not sure how overhead is split between mtd and jffs2.

> By raw, I mean reading and writing via an mtd character device to/from a
> raw partition. I do not know how these numbers compare to other flash
> access methods; but bit-banging a flash part directly would have to be
> considerably slower and probably very dependent on the CPU speed. My
> device has a 384 MHz PowerPC 405 CPU, by the way.

That helps too ;-)

> > Most embedded systems cannot rely on proper shutdown. So, IMHO CS is of
> > limited use in this respect.
> 
> My device is usb powered, but has a small battery so that when the
> device looses bus power, it can shutdown cleanly. 

Tricky, tricky, tricky ;-)
Not everybody is that lucky to have a battery. Reminds me of a conversation
with one "high reliability RTOS" vendor, you guess who.
- Is your file system power fail safe?
- Yes, of course. We do require that you use UPS though.

> However, the thing to
> remember about centralized summary is that in the unclean shutdown
> cases, the mount time is no worse than jffs2 without CS. So even if you
> only expect the filesystem to be cleanly unmounted sometimes, CS can be
> worth it.

As long as specification allows for an "occasional" 30 minutes startup time.

Your hw controller does sound very interesting.
What is the hardware implementation : asic, fpga? Is it available as a 
separate product (chip)?

Sergei
