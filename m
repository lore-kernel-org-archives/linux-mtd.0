Date: Thu, 22 Nov 2007 14:24:35 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: tike64 <tike64@yahoo.com>
Subject: Re: Very slow nor flash write
In-Reply-To: <497747.61534.qm@web59203.mail.re1.yahoo.com>
Message-ID: <Pine.LNX.4.64.0711221405160.11563@pentafluge.infradead.org>
References: <497747.61534.qm@web59203.mail.re1.yahoo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, nico@cam.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Timo

> I have an LH7A400 board and there intel 28F160B3T nor flash chip. I managed to configure Linux 2.6.18 to access the chip as an MTD device. However, the write access was very slow, about 40ms per word or 0.00005 MB/s ;-)
> 
> I traced the problem to inval_cache_and_wait_for_operation() in cfi_cmdset_0001.c. In the for-loop, if the write access haven't finished when checked for the first time, a long "msleep(sleep_time/1000);" is triggered. The sleep duration is very long because chip_op_time value is 50000. The value comes from "cfi->chips[i].word_write_time = 50000;" in cfi_cmdset_0001(). That is wrong, I think. I changed it to 200 and now the writing is as fast as expected.
> 
> Now, the question is: How this should be fixed *correctly*? The 200 is the maximum word program time for this particular chip. Maybe it should have different value for different chips.

It seems the problem really exists and needs to be solved. The default value of word programming timeo is defined improperly 50000usec for one word is too much - but it is not good to set it very low because inval_cache_and_wait function could return with timeo out error. The best thing would be to set default word programming time for the slowest case. I think 10KB/s would be worst enough case.

Thanks,
Alexey 
