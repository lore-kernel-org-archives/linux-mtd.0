Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1Dvyp9-0005p8-Tx
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2005 10:48:33 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Dvyoi-0002oi-S8
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2005 16:48:00 +0200
Received: from 212.130.19.66 ([212.130.19.66])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Jul 2005 16:48:00 +0200
Received: from martin by 212.130.19.66 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Jul 2005 16:48:00 +0200
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Date: Fri, 22 Jul 2005 16:47:21 +0200
Message-ID: <dbr0tp$87s$1@sea.gmane.org>
References: <dbl42b$hcn$1@sea.gmane.org>	<1121867130.12903.15.camel@localhost.localdomain>	<dblm4l$802$1@sea.gmane.org>	<1121869156.12903.19.camel@localhost.localdomain>	<dblne1$cgd$1@sea.gmane.org>
	<1121887042.20077.1.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <1121887042.20077.1.camel@localhost.localdomain>
Sender: news <news@sea.gmane.org>
Subject: Re: JFFS2 garbage collector blocking for minutes after mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

>>I'm not comfortable with profiling the kernel... It could be arranged, 
>>but I rather see if the a recent CVS snapshot does it for me... ;-)

> Profiling isn't hard or intrusive -- all you need to do is boot with
> something like 'profile=1' on the kernel command line, then
> read /proc/profile after the GC thread has finished doing its thing.
> 
> Then the readprofile tool will be able to tell you where the time was
> spent.

First of all, I patched my 2.4.20 kernel with CVS head from today 
(2005-07-22) - it took some time, but it surely seems to work...

That reduced the mount time of my "spoiled" flash from 8m45s 
(jffs2_gcd_mtd0) to some 45seconds! So that was a factor of ~10 in 
speed! That's more or less acceptable... (I really hope my patchin 
didn't spoil some other parts!)

Second, I tried running the profiling - *with* the new kernel/mtd 
source. The time consumers are - sorted by clock ticks:

47695	idled			384,63710
2997	nand_read_buf		62,43750
1122	nand_calculate_ecc	5,84380
677	__delay			33,85000
502	nand_do_read_ecc	0,26370

Right?!

BR,
  Martin
