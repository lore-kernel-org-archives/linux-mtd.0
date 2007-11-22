Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IvDjO-0005sh-JM
	for linux-mtd@lists.infradead.org; Thu, 22 Nov 2007 10:12:49 -0500
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([74.56.106.175]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0JRW00AN1Y8S0M60@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 22 Nov 2007 10:12:29 -0500 (EST)
Date: Thu, 22 Nov 2007 10:12:28 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: Very slow nor flash write
In-reply-to: <Pine.LNX.4.64.0711221405160.11563@pentafluge.infradead.org>
Message-id: <alpine.LFD.0.99999.0711221009490.19105@xanadu.home>
References: <497747.61534.qm@web59203.mail.re1.yahoo.com>
	<Pine.LNX.4.64.0711221405160.11563@pentafluge.infradead.org>
Cc: linux-mtd@lists.infradead.org, tike64 <tike64@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 22 Nov 2007, Alexey Korolev wrote:

> Hi Timo
> 
> > I have an LH7A400 board and there intel 28F160B3T nor flash chip. I managed to configure Linux 2.6.18 to access the chip as an MTD device. However, the write access was very slow, about 40ms per word or 0.00005 MB/s ;-)
> > 
> > I traced the problem to inval_cache_and_wait_for_operation() in cfi_cmdset_0001.c. In the for-loop, if the write access haven't finished when checked for the first time, a long "msleep(sleep_time/1000);" is triggered. The sleep duration is very long because chip_op_time value is 50000. The value comes from "cfi->chips[i].word_write_time = 50000;" in cfi_cmdset_0001(). That is wrong, I think. I changed it to 200 and now the writing is as fast as expected.
> > 
> > Now, the question is: How this should be fixed *correctly*? The 200 is the maximum word program time for this particular chip. Maybe it should have different value for different chips.
> 
> It seems the problem really exists and needs to be solved. The default 
> value of word programming timeo is defined improperly 50000usec for 
> one word is too much - but it is not good to set it very low because 
> inval_cache_and_wait function could return with timeo out error. The 
> best thing would be to set default word programming time for the 
> slowest case. I think 10KB/s would be worst enough case.

No.  You don't know if that is indeed the _absolute_ worst case, and 
doing so just moves the problem elsewhere.

Why not simply adding a fixup entry for this particular flash model to 
override word_write_time with the appropriate value instead?


Nicolas
