Received: from web59203.mail.re1.yahoo.com ([66.196.101.29])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IvAF4-0001R4-VI
	for linux-mtd@lists.infradead.org; Thu, 22 Nov 2007 06:29:18 -0500
Date: Thu, 22 Nov 2007 03:29:05 -0800 (PST)
From: tike64 <tike64@yahoo.com>
Subject: Very slow nor flash write
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <497747.61534.qm@web59203.mail.re1.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear List,

I have an LH7A400 board and there intel 28F160B3T nor flash chip. I managed to configure Linux 2.6.18 to access the chip as an MTD device. However, the write access was very slow, about 40ms per word or 0.00005 MB/s ;-)

I traced the problem to inval_cache_and_wait_for_operation() in cfi_cmdset_0001.c. In the for-loop, if the write access haven't finished when checked for the first time, a long "msleep(sleep_time/1000);" is triggered. The sleep duration is very long because chip_op_time value is 50000. The value comes from "cfi->chips[i].word_write_time = 50000;" in cfi_cmdset_0001(). That is wrong, I think. I changed it to 200 and now the writing is as fast as expected.

Now, the question is: How this should be fixed *correctly*? The 200 is the maximum word program time for this particular chip. Maybe it should have different value for different chips.

--

Timo

--

Note: Not everyone will face this problem. If the CPU is slow enough, so that the chip have finished before the first status check, then the problem doesn't occur. Also, when I placed one printk at the start of the inval_cache_and_wait_for_operation() function, the problem went away.





      ____________________________________________________________________________________
Be a better sports nut!  Let your teams follow you 
with Yahoo Mobile. Try it now.  http://mobile.yahoo.com/sports;_ylt=At9_qDKvtAbMuh1G1SQtBI7ntAcJ
